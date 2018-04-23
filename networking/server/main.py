import os
import json
import base64
import random
import re
import urllib.parse

import wsgiref.util

import router
import request
import storage
import util
import config

config.SERVER_MOTD = util.create_textbox_data(b'''
    Welcome to Glitchland!
    
    The event has ended.
    The game can be played.
    
    However, leaderboard scores
    will not be updated.
''')

if len(config.SERVER_MOTD) > 120:
    raise RuntimeError("motd too long [was %i bytes]" % len(config.SERVER_MOTD))

rt = router.Router()

HEADERS_CORS = [
    ('Access-Control-Allow-Origin', '*'),
    ('Access-Control-Allow-Methods', 'POST, GET, OPTIONS')
]
HEADERS_HTML = [
    ('Content-Type', 'text/html')
]
HEADERS_TEXT = [
    ('Content-Type', 'text/plain')
]
HEADERS_JSON = [
    ('Content-Type', 'application/json')
]

@rt.route("^/", ["OPTIONS"])
def appPreflightRequest(environ, start_response):
    start_response('200 OK', HEADERS_CORS)
    return []

@rt.route(r"^/favicon.ico")
def favicon(environ, start_response):
    start_response('404 Not Found', HEADERS_HTML)
    return [b'']

@rt.route("^/$")
def appWebRoot(environ, start_response):
    start_response('200 OK', HEADERS_HTML + HEADERS_CORS)
    html = '''
        <h1>TheZZAZZGlitch's April Fools Event 2018 - backend server</h1>
        <p>You're not supposed to be here. Be careful. People will think you're... up to something.</p>
    '''
    return [bytes(html, 'utf-8')]
    
@rt.route("^/req/[0-f]+$", ["POST"])
def appBackendRequest(environ, start_response):
    session_key = environ['PATH_INFO'].split('/')[-1]
    data_len = int(environ.get('CONTENT_LENGTH', 0))
    data = environ['wsgi.input'].read(data_len)

    data = base64.b64decode(data.decode('ascii'))
    result = request.handle(data, session_key)

    start_response('200 OK', HEADERS_TEXT + HEADERS_CORS)
    return [base64.b64encode(bytes(result))]

@rt.route("^/api/register$", ["POST"])
def appApiRegister(environ, start_response):
    data_len = int(environ.get('CONTENT_LENGTH', 0))
    data = urllib.parse.parse_qs(environ['wsgi.input'].read(data_len).decode('utf-8'),
        keep_blank_values=True)

    user = storage.get_user_data(data['username'][0])
    if user:
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 2, 'message': 'Username already exists.'})]
    if not (data['username'][0].strip() and data['password'][0].strip()):
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 3, 'message': 'This field must not be empty.'})]
    if not re.match('^[A-Za-z0-9]{1,15}$', data['username'][0]):
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 4, 'message': 'Invalid username.'})]
    if len(data['message'][0]) > 120:
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 5, 'message': 'Message too long.'})]
    
    storage.sql('''
        INSERT INTO users (username, password, message, fun) VALUES (?, ?, ?, ?)
    ''', (
        data['username'][0],
        util.password_hash(data['password'][0]),
        data['message'][0],
        random.randrange(0,255)
    ))
    
    user = storage.get_user_data(data['username'][0])
    storage.push_event(user.id, storage.EVT_REGISTERED, 0)

    storage.sql('''
        INSERT INTO leaderboard (user_id, points, achievements) VALUES (?, 0, '{}')
    ''', (user['id'],))
    
    key = util.new_session_key()
    storage.sql('''
        UPDATE users SET session=? WHERE id=?
    ''', (key, user['id']))
    
    start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
    return [util.json_bytes({'error': 0, 'message': 'OK'})]
    
@rt.route("^/api/message$", ["POST"])
def appApiChangeMessage(environ, start_response):
    data_len = int(environ.get('CONTENT_LENGTH', 0))
    data = urllib.parse.parse_qs(environ['wsgi.input'].read(data_len).decode('utf-8'), keep_blank_values=True)

    if len(data['message'][0]) > 120:
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 2, 'message': 'Message too long.'})]
    
    storage.sql('''
        UPDATE users SET message=? WHERE session=?
    ''', (data['message'][0], data['sessid'][0]))
    
    start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
    return [util.json_bytes({'error': 0, 'message': 'OK'})]
    
@rt.route("^/api/login$", ["POST"])
def appApiLogin(environ, start_response):
    data_len = int(environ.get('CONTENT_LENGTH', 0))
    data = urllib.parse.parse_qs(environ['wsgi.input'].read(data_len).decode('utf-8'), keep_blank_values=True)
    
    user = storage.sql('''
        SELECT * FROM users WHERE username=? AND password=?
    ''', (data['username'][0], util.password_hash(data['password'][0])))
    
    if not user:
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 1, 'message': 'Invalid username and/or password.'})]
    user = user[0]
    
    key = util.new_session_key()
    storage.sql('''
        UPDATE users SET session=? WHERE id=?
    ''', (key, user['id']))
    
    start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
    return [util.json_bytes({'error': 0, 'sessid': key})]
    
@rt.route("^/api/relogin$", ["POST"])
def appApiRelogin(environ, start_response):
    data_len = int(environ.get('CONTENT_LENGTH', 0))
    data = urllib.parse.parse_qs(environ['wsgi.input'].read(data_len).decode('utf-8'), keep_blank_values=True)
    
    user = storage.sql('''
        SELECT * FROM users WHERE username=? AND password=?
    ''', (data['username'][0], util.password_hash(data['password'][0])))
    
    if not user:
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 1, 'message': 'Invalid username and/or password.'})]
    user = user[0]
    
    start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
    return [util.json_bytes({'error': 0, 'sessid': user['session']})]
    
@rt.route("^/api/scoreboard")
def appApiScoreboard(environ, start_response):
    leaderboard = storage.sql('''
        SELECT username, points FROM leaderboard
        LEFT OUTER JOIN users ON leaderboard.user_id = users.id
        WHERE username <> 'TheZZAZZGlitch'
        ORDER BY points DESC
    ''')
    start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
    return [util.json_bytes({'error': 0, 'data': leaderboard})]
    
@rt.route(r"^/api/user/[A-Za-z0-9]+")
def appApiUserData(environ, start_response):
    username = environ['PATH_INFO'].split('/')[-1].split('?')[0]

    user = storage.sql('''
        SELECT * FROM users WHERE username=?
    ''', (username,))
    if not user:
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 1, 'message': 'No such user.'})]

    storage.recalculate_player_achievements(user[0]['id'])
    data = storage.sql('''
        SELECT username, points, achievements, users.id AS id FROM users
        LEFT OUTER JOIN leaderboard ON leaderboard.user_id = users.id
        WHERE username = ?
    ''', (username,))

    if not data:
        start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
        return [util.json_bytes({'error': 1, 'message': 'No such user.'})]

    data = data[0]
    data['achievements'] = json.loads(data['achievements'])
    start_response('200 OK', HEADERS_JSON + HEADERS_CORS)
    return [util.json_bytes({'error': 0, 'data': data})]

if __name__ == "__main__":
    import wsgiref.simple_server
    httpd = wsgiref.simple_server.make_server('127.0.0.1', 12709, rt)
    httpd.serve_forever()
