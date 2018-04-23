import random
import math
import os
import time

import util
import config
import storage

'''
    [request_code = 0x01, HELLO]
    CLIENT
    u8[4] :asciiCharset ins = 'HELO'
    SERVER
    u8[4] :asciiCharset outs = 'EHLO'
    u8 motd_length
    u8[motd_length] :specialCharset motd
    u8[2] random
'''

def requestHandlerHello(request, sessid):
    if bytes(request[0:4]) != b"HELX":
        raise RuntimeError("old version detected")
    req_result = [69, 72, 76, 79] # EHLO
    req_result += [len(config.SERVER_MOTD)]
    req_result += list(config.SERVER_MOTD)
    req_result += [random.randrange(0, 255), random.randrange(0, 255)]
    return req_result

'''
    [request_code = 0x02, USER_REGISTER]
    CLIENT
    u8[10] :standardCharset characterCode
    
    This request code is unused, but remains implemented for back-compat.
'''

def requestHandlerRegister(request, sessid):
    return [0xff]
    
'''
    [request_code = 0x03, SYNC_READ_MAP_NAME]
    CLIENT
    u8[41] itemsStruct
    u8[2] requestedMap
    SERVER
    u8[20] :standardCharset requestedMapName
    u8[16] eventFlags
    u8 flyFlags
    u8[41] itemsStruct
    u8 funValue
'''

def requestHandlerSyncAndPrepareMap(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")
    
    map_id = request[41] + request[42] * 256
    map_name = "MYSTERY ZONE"
    if os.path.isfile(util.get_map_filename(map_id)):
        if map_id in config.MAP_NAMES:
            map_name = config.MAP_NAMES[map_id]
        else:
            map_name = "bepis"
    else:
        map_id = 0xFFFF
    map_name = bytes.ljust(util.to_standard_charset(map_name) + b'\x50', 20)
        
    storage.check_map_load_allowed(user['id'], map_id)
        
    inventory = request[0:41]
    if storage.is_inventory_valid(inventory):
        storage.save_player_inventory(user['id'], inventory)
    else:
        inventory = storage.load_player_inventory(user['id'])
    
    storage.push_event(user['id'], storage.EVT_MAPVISITED, map_id)
    
    bitfields = storage.generate_event_bitfields(user['id'])
    
    return list(map_name) + bitfields + inventory + [user['fun']]
    
'''
    [request_code = 0x04, LOAD_MAP]
    CLIENT
    u8[2] requestedMap
    SERVER
    u8[...] mapData
'''

def requestHandlerDownloadMap(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    map_id = request[0] * 256 + request[1]
    map_file = util.get_map_filename(map_id)
    if not os.path.isfile(map_file):
        map_file = config.MAP_PATH + "/Map_Unexistent.bin"
        
    if map_id in config.FUN_MAPS:
        if config.FUN_MAPS[map_id](user['fun']):
            map_file = map_file.replace(".bin", "_Fun.bin")
        
    storage.check_map_load_allowed(user['id'], map_id)

    with open(map_file, 'rb') as fp:
        map_data = fp.read()
    map_data = storage.format(user, map_data)

    return list(map_data)
    
'''
    [request_code = 0x05, TRIGGER_EVENT]
    CLIENT
    u32 eventId
    SERVER
    u8 bitNo [=0: error]
    u8[2] random
'''

def requestHandlerTriggerEvent(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    evt = request[0]
    evt += request[1] * 256
    evt += request[2] * 256 * 256
    evt += request[3] * 256 * 256 * 256

    result = 0
    if evt in config.EVENT_FLAGS:
        result = config.EVENT_FLAGS[evt]
        storage.push_event(user['id'], storage.EVT_FLAGTRIGGERED, result)
        
    inventory = request[4:]
    if storage.is_inventory_valid(inventory):
        storage.save_player_inventory(user['id'], inventory)
        
    return [result, random.randrange(0, 255), random.randrange(0, 255)]

'''
    [request_code = 0x06, TRENDY_PHRASE]
    CLIENT
    u8[16] :specialCharset phrase
    SERVER
    u8[2] random
'''

def requestHandlerTrendyPhrase(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    phrase = util.from_enhanced_charset(bytes(request))
    if len(phrase) < 3 or len(phrase) >= 16:
        raise RuntimeError("not a valid trendy phrase")
    storage.set_varia("TRENDYPHRASE__", phrase)
    storage.set_varia("TRENDYAUTHOR__", user['username'])

    return [random.randrange(0, 255), random.randrange(0, 255)]

'''
    [request_code = 0x07, LOTTERY]
    CLIENT
    u8 dummy = 0xFF
    SERVER
    u8 matchCount
    u8[20] :specialCharset letterString
    u8[10] :specialCharset matchTypeString
    u8 random
'''

_lottery_seed = 0

def requestHandlerLottery(request, sessid):
    global _lottery_seed
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    seed = (int(time.time()) - 1521849600) // (60 * 60 * 3)
    seed *= 8
    seed += 11
    _lottery_seed = seed
    def rnd():
        global _lottery_seed
        _lottery_seed += 1
        x = math.sin(_lottery_seed) * 10000
        return x - math.floor(x)

    alpha = list('ABCDEFGHIJKLMNOPQRSTUVWXYZ')
    random.shuffle(alpha, rnd)
    alpha = alpha[0:5]

    matches = [1 if x in user['username'].upper() else 0 for x in alpha]
    letter_str = bytes.ljust(util.to_enhanced_charset(', '.join(alpha)), 20)
    match_count = sum(matches)
    type_str = bytes.ljust(util.to_enhanced_charset(
        ['bepis', 'single', 'double', 'triple', 'quadruple', 'quintuple'][match_count]
    ), 10)

    for i in range(1, match_count+1):
        storage.push_event(user['id'], storage.EVT_LOTTERY, i)

    return b''.join(
        bytes([match_count]),
        letter_str,
        type_str,
        bytes([random.randrange(0, 255)])
    )

'''
    [request_code = 0x08, GAVE_BALLS]
    CLIENT
    u8 dummy = 0xFF
    SERVER
    u8 totalBallsGiven
    u8[2] random
'''

def requestHandlerBalls(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    series = len(storage.get_events(user['id'], storage.EVT_GAVEBALLS)) + 1
    if series > 9:
        raise RuntimeError("this is quite a lot of balls")
    storage.push_event(user['id'], storage.EVT_GAVEBALLS, series)

    return [series, random.randrange(0, 255), random.randrange(0, 255)]
    
'''
    [request_code = 0x09, CRACKME]
    CLIENT
    u8[16] :specialCharset password
    SERVER
    u8 success
    u8[2] random
'''

def requestHandlerCrackme(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    password = util.from_standard_charset(bytes(request))
    success_byte = 0
    if password == b'6830672995':
        storage.push_event(user['id'], storage.EVT_FLAGTRIGGERED, 100)
        success_byte = 1

    return [success_byte, random.randrange(0, 255), random.randrange(0, 255)]

'''
    [request_code = 0x0A, CHANGE_FUN_VALUE]
    CLIENT
    u8 dummy = 0xFF
    SERVER
    u8[2] random
'''

def requestHandlerChangeFunValue(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    storage.sql('UPDATE users SET fun=? WHERE id=?', (random.randrange(0, 255), user['id']))

    return [random.randrange(0, 255), random.randrange(0, 255)]

'''
    [request_code = 0x77, CRACKER_CAVERN_CHALLENGE]
    CLIENT
    u8 challenge[3] = 0x13, 0x37, 0xCC
    SERVER
    u8[] greeting
'''

def requestCrackerCavernChallenge(request, sessid):
    user = storage.get_user_by_sessid(sessid)
    if not user:
        raise RuntimeError("invalid session key")

    out = b"This is not the message I'm looking for..."
    if request[0] == 0x13 and request[1] == 0x37 and request[2] == 0xcc:
        storage.push_event(user['id'], storage.EVT_FLAGTRIGGERED, 101)
        out = b"Congratulations, you completed the challenge!"

    return list(out)

# *** Request dispatch table

HANDLERS = {
    0x01: requestHandlerHello,
    0x02: requestHandlerRegister,
    0x03: requestHandlerSyncAndPrepareMap,
    0x04: requestHandlerDownloadMap,
    0x05: requestHandlerTriggerEvent,
    0x06: requestHandlerTrendyPhrase,
    0x07: requestHandlerLottery,
    0x08: requestHandlerBalls,
    0x09: requestHandlerCrackme,
    0x0A: requestHandlerChangeFunValue,
    0x77: requestCrackerCavernChallenge
}
