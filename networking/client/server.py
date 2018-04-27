import os
import sys
import struct
import time
import random

import util
import request
import gui
import threading

import socket
import socketserver

class States():
    WAIT_HANDSHAKE = 1
    RECEIVE_LENGTH = 2
    RECEIVE_DATA = 3
    HANDLE_REQUEST = 4
    WAIT_FOR_BACKEND = 5
    SEND_RESPONSE = 6
    
def BGBPacket(a, b, c, d, time):
    return struct.pack('<BBBBI', a, b, c, d, time)

class BGBLinkCableServer(socketserver.BaseRequestHandler):
    def receiveBGBPacket(self, conn):
        data = b''
        while 1:
            try:
                data += conn.recv(8 - len(data))
            except:
                return None
            if len(data) == 0:
                return None
            if len(data) >= 8:
                break
        a, b, c, d, t = struct.unpack('<BBBBI', data)
        return {'a': a, 'b': b, 'c': c, 'd': d, 'time': t}
        
    def sendBGBPacket(self, conn, packet):
        conn.send(packet)
        
    def sendBGBPacketIfNotSent(self, conn, environ, packet):
        if environ.response_sent: return
        self.sendBGBPacket(conn, packet)
        environ.response_sent = True
        
    def calculateChecksum(self, data):
        checksum_h = 0x5a
        checksum_l = 0xa5
        for i in data:
            checksum_h ^= i
            checksum_l = (checksum_l + i) % 256
        return (checksum_h, checksum_l)
        
    def dataReceived(self, conn, environ, data):
        outbyte = 0xff
        now = time.time()
        if now - environ.last_active > 2:
            environ.state = States.WAIT_HANDSHAKE
            environ.handshake_counter = 0
            environ.request_buffer = []
        environ.last_active = now
        if environ.state == States.WAIT_HANDSHAKE:
            gui.updateStatus("Waiting for requests...")
            handshake_in = [0xda, 0xcf, 0xeb]
            handshake_out = [0xa5, 0x5a, 0x0a]
            if handshake_in[environ.handshake_counter] == data:
                outbyte = handshake_out[environ.handshake_counter]
                environ.handshake_counter += 1
                if environ.handshake_counter >= len(handshake_in):
                    environ.handshake_counter = 0
                    environ.state = States.RECEIVE_LENGTH
            else:
                outbyte = 0
                environ.handshake_counter = 0
        elif environ.state == States.RECEIVE_LENGTH:
            gui.updateStatus("Constructing the request...")
            environ.request_buffer.append(data)
            if len(environ.request_buffer) >= 2:
                environ.content_length = struct.unpack('<H', bytes(environ.request_buffer[0:2]))[0]
                environ.state = States.RECEIVE_DATA
                if environ.content_length > 256*5:
                    raise RuntimeError("that's a very long request...")
            outbyte = 0xcc
        elif environ.state == States.RECEIVE_DATA:
            environ.request_buffer.append(data)
            if len(environ.request_buffer) >= environ.content_length:
                environ.state = States.HANDLE_REQUEST
            outbyte = 0xcc
        elif environ.state == States.HANDLE_REQUEST:
            if data != 0x55:
                environ.state = States.WAIT_HANDSHAKE
            else:
                request.sendToBackend(environ.request_buffer)
                environ.state = States.WAIT_FOR_BACKEND
            outbyte = 0x66
        elif environ.state == States.WAIT_FOR_BACKEND:
            gui.updateStatus("Performing the request...")
            if data != 0x55:
                environ.state = States.WAIT_HANDSHAKE
            if request.lock.locked():
                outbyte = 0x66
            else:
                if not request.success:
                    outbyte = 0xff
                else:
                    environ.request_buffer = request.result
                    environ.state = States.SEND_RESPONSE
                    outbyte = 0x33
        elif environ.state == States.SEND_RESPONSE:
            gui.updateStatus("Sending response...")
            outbyte = environ.request_buffer[0]
            environ.request_buffer = environ.request_buffer[1:]
            if len(environ.request_buffer) <= 0 or data != 0xcc:
                environ.state = States.WAIT_HANDSHAKE
        self.sendBGBPacketIfNotSent(conn, environ, BGBPacket(105, outbyte, 0x80, 0, 0))

    def updateTimestamp(self, environ):
        delta = time.time() - environ.session_started_t
        delta = int(delta * 2**21)
        delta %= 2**31
        return delta

    def handle(self):
        gui.updateStatus("Waiting for requests...")
        conn = self.request
        conn.setblocking(1)
        timestamp = 0
        self.sendBGBPacket(conn, BGBPacket(1, 1, 4, 0, 0))
        self.sendBGBPacket(conn, BGBPacket(108, 1, 0, 0, 0))
        counter = 0
        environment = util.DotDict({
            'handshake_counter': 0,
            'content_length': 0,
            'response_sent': False,
            'request_buffer': [],
            'state': States.WAIT_HANDSHAKE,
            'last_active': time.time(),
            'session_started_t': time.time()
        })
        while 1:
            p = self.receiveBGBPacket(conn)
            if p is not None:
                if p['a'] == 106 or p['a'] == 108:
                    timestamp = self.updateTimestamp(environment)
                    self.sendBGBPacket(conn, BGBPacket(106, 0, 0, 0, timestamp))
                if p['a'] == 104:
                    environment.response_sent = False
                    self.dataReceived(conn, environment, p['b'])

def serverThread():
    server = socketserver.ThreadingTCPServer(('127.0.0.1', 8765), BGBLinkCableServer)
    server.serve_forever()
	
def start():
    threading.Thread(target=serverThread).start()