import threading
import base64
import json
import urllib
import urllib.parse
import urllib.request

lock = threading.Lock()

success = False
result = []

sessid = "NONE"

server_addr = "http://127.0.0.1:12709"

def sendToBackendThreadProc(request):
    global success, result
    try:
        req = urllib.request.urlopen(server_addr + "/req/" + sessid, base64.b64encode(bytes(request)))
        if req.getcode() != 200:
            raise RuntimeError("non-zero request status code")
        success = True
        result = list(base64.b64decode(req.read()))
    except:
        success = False
        result = []
    finally:
        lock.release()

def sendToBackend(request):
    global success, result
    lock.acquire()
    success = False
    result = []
    t = threading.Thread(target=sendToBackendThreadProc, args=(request,))
    t.start()
    
def login(username, password):
    data = urllib.parse.urlencode({
        'username': username,
        'password': password
    })
    req = urllib.request.urlopen(server_addr + "/api/relogin", bytes(data, 'utf-8'))
    return json.loads(req.read().decode('utf-8'))
