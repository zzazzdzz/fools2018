import sqlite3
import time
import threading
import datetime
import json

import config
import util

# *** Event type constants

EVT_REGISTERED = 1
EVT_MAPVISITED = 2
EVT_FLAGTRIGGERED = 3
EVT_GAVEBALLS = 4
EVT_LOTTERY = 5

# The original event server used psycopg2 here, connecting to a
# PostgreSQL database. After the source code release, to enhance
# portability, this was swapped with a SQLite backend.

# To use a different database backend (which is recommended if you
# want to run this server in production), simply swap out the
# 'sql' function below to fit your needs.

db = sqlite3.connect('db.sqlite3')
db.row_factory = sqlite3.Row

db_lock = threading.Lock()
def sql(query, params=()):
    ret = []
    with db_lock:
        cur = db.cursor()
        for i in cur.execute(query, params):
            ret.append(util.DotDict(i))
        db.commit()
    return ret
    
def get_user_data(username):
    result = sql("SELECT * FROM users WHERE username=?", (username,))
    if not result:
        return None
    return result[0]
    
def get_user_by_sessid(x):
    result = sql("SELECT * FROM users WHERE session=?", (x,))
    if not result:
        return None
    return result[0]
    
def push_event(uid, evt_id, evt_data):
    q = sql('''
        SELECT id FROM events WHERE event_type=? AND event_data=? AND user_id=?
    ''', (evt_id, evt_data, uid))
    if not q:
        result = sql('''
            INSERT INTO events (user_id, event_type, event_data, timestamp)
            VALUES (?, ?, ?, ?)
        ''', (uid, evt_id, evt_data, int(time.time())))
        recalculate_player_achievements(uid)
        return result
    else:
        return None
        
def get_all_events(uid, evt_id=None):
    q = sql('''
        SELECT * FROM events WHERE user_id=?
    ''', (uid,))
    out = {}
    for i in q:
        if i['event_type'] not in out:
            out[i['event_type']] = []
        out[i['event_type']].append({
            'event_data': i['event_data'],
            'timestamp': i['timestamp']
        })
    return out

def get_events(uid, evt_id):
    q = sql('''
        SELECT * FROM events WHERE user_id=? AND event_type=?
    ''', (uid, evt_id))
    out = []
    for i in q:
        out.append({
            'event_type': i['event_type'],
            'event_data': i['event_data'],
            'timestamp': i['timestamp']
        })
    return out
    
def get_varia(k, default="bepis"):
    result = sql('''
        SELECT value FROM varia WHERE key=?
    ''', (k.decode('ascii'),))
    if not result:
        return default
    return result[0]['value']
    
def set_varia(k, v):
    return sql("UPDATE varia SET value=? WHERE key=?", (v, k))
    
def format(user, data):
    # Trendy phrases
    def replace_key(q, k):
        tag = b'%' + k + b'%'
        if tag in q:
            q = q.replace(tag, bytes.ljust(util.to_enhanced_charset(get_varia(k)), len(tag)))
        return q
    data = replace_key(data, b"TRENDYPHRASE__")
    data = replace_key(data, b"TRENDYAUTHOR__")
    
    # Current username
    data = data.replace(
        b"%CURRENTUSER___%",
        bytes.ljust(util.to_enhanced_charset(user['username']), 16)
    )

    # Number of maps visited
    if b"%PERCCOMPLETE__%" in data:
        events = get_events(user['id'], EVT_MAPVISITED)
        data = data.replace(
            b"%PERCCOMPLETE__%",
            bytes.ljust(util.to_enhanced_charset(str(len(events))), 16)
        )
        
    # Hour modulo 3
    hour_mod3 = datetime.datetime.now().hour % 3
    data = data.replace(
        b"%HOURMODULO3___%",
        bytes.ljust(util.to_enhanced_charset(str(hour_mod3)), 16)
    )
    
    return data

def generate_event_bitfields(uid):
    events = get_all_events(uid)
    bitfield = [0] * 17
    if EVT_FLAGTRIGGERED in events:
        for i in events[EVT_FLAGTRIGGERED]:
            util.set_bit_in_bitfield(bitfield, i['event_data'])
    fly_flags = 0
    if EVT_MAPVISITED in events:
        for i in events[EVT_MAPVISITED]:
            if i['event_data'] in config.FLY_FLAGS:
                fly_flags |= (1 << config.FLY_FLAGS[i['event_data']])
    bitfield[16] = fly_flags
    return bitfield

def check_map_load_allowed(uid, mapid):
    restricted_maps = {
        0x318D: (0x1337, EVT_MAPVISITED),   # Cracker Cavern III
        0x318E: (100, EVT_FLAGTRIGGERED),   # Cracker Cavern IV
        0x318F: (101, EVT_FLAGTRIGGERED)    # Cracker Cavern V
    }
    if mapid not in restricted_maps.keys():
        return
    evt = sql('''
        SELECT * FROM events
        WHERE user_id=? AND event_data=? AND event_type=?
    ''', (uid, restricted_maps[mapid][0], restricted_maps[mapid][1]))
    if not evt:
        raise RuntimeError("prerequisites not met for map %.4x" % mapid)

def recalculate_player_achievements(uid):
    events = {k: [i['event_data'] for i in v] for k, v in get_all_events(uid).items()}
    achievements = {}
    pts = 0
    for key, prereq in config.ACHIEVEMENTS.items():
        ok = True
        for i in prereq:
            if i[0] not in events:
                ok = False
                continue
            if i[1] not in events[i[0]]:
                ok = False
        achievements[key] = ok
        if ok:
            pts += config.ACHIEVEMENT_POINTS[key]
    maps_visited = 0
    if EVT_MAPVISITED in events:
        maps_visited = len(events[EVT_MAPVISITED])
    achievements['exploration_lv1'] = maps_visited >= 20
    achievements['exploration_lv2'] = maps_visited >= 60
    achievements['exploration_lv3'] = maps_visited >= 110
    if achievements['exploration_lv1']: pts += 20
    if achievements['exploration_lv2']: pts += 30
    if achievements['exploration_lv3']: pts += 40
    sql('''
        UPDATE leaderboard SET points=?, achievements=? WHERE user_id=?
    ''', (pts, json.dumps(achievements), uid))

def load_player_inventory(uid):
    inventory = b'\x00' + (b'\xff' * 40)
    q = sql('SELECT inventory FROM users WHERE id=?', (uid,))
    if q:
        if q[0]['inventory'] is not None:
            inventory = q[0]['inventory']
    return list(inventory)
    
def save_player_inventory(uid, data):
    sql('UPDATE users SET inventory=? WHERE id=?', (bytes(data), uid))

def is_inventory_valid(data):
    data = data[0:41]
    if not data: return False
    if data[0] > 20: return False
    if 0xFF not in data: return False
    return True # todo: better error checking
