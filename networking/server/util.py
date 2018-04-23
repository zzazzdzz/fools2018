# util.py

import json
import hashlib
import binascii
import os

import config

def translate_charset(text, chrA, chrB, terminator):
    if isinstance(text, str):
        text = bytes(text, 'ascii')
    res = []
    for i in text:
        if i == terminator:
            break
        if i not in chrA:
            continue
        res.append(chrB[chrA.index(i)])
    return bytes(res)
    
CHARSET_ASCII = b''.join([
    b"_ABCDEFGHIJKLMNOPQRSTUVWXYZ",
    b"abcdefghijklmnopqrstuvwxyz!",
    b",?\"-.:() ~$'/0123456789%"
])

CHARSET_ENHANCED = bytes(range(0, 256))

CHARSET_STANDARD = b''.join([
    b"\x00",
    b"\x80\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f\x90\x91",
    b"\x92\x93\x94\x95\x96\x97\x98\x99\xa0\xa1\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9",
    b"\xaa\xab\xac\xad\xae\xaf\xb0\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xe7\xf4",
    b"\xe6\x00\xe3\xe8\x9c\x9a\x9b\x7f\x01\xf0\xe0\xf3\xf6\xf7\xf8\xf9\xfa\xfb",
    b"\xfc\xfd\xfe\xff\xba"
])

def to_enhanced_charset(text):
    return translate_charset(text, CHARSET_ASCII, CHARSET_ENHANCED, 0x00) + b'\xf6'
def from_enhanced_charset(text):
    return translate_charset(text, CHARSET_ENHANCED, CHARSET_ASCII, 0xf6)
def to_standard_charset(text):
    return translate_charset(text, CHARSET_ASCII, CHARSET_STANDARD, 0x00) + b'\x50'
def from_standard_charset(text):
    return translate_charset(text, CHARSET_STANDARD, CHARSET_ASCII, 0x50)
def to_enhanced_charset_unterminated(text):
    return translate_charset(text, CHARSET_ASCII, CHARSET_ENHANCED, 0x00)

class DotDict(dict):
    __getattr__ = dict.get
    __setattr__ = dict.__setitem__
    __delattr__ = dict.__delitem__

def json_bytes(x):
    return bytes(json.dumps(x), 'utf-8')
    
def password_hash(x):
    return hashlib.sha256(bytes(x, 'utf-8') + config.PASSWORD_SALT).hexdigest()
    
def new_session_key():
    return binascii.hexlify(os.urandom(64)).decode('ascii')

def get_map_filename(map_id):
    return config.MAP_PATH + "/Map_%.4X.bin" % map_id
    
def set_bit_in_bitfield(arr, bit):
    byte_no = bit // 8
    bit_no = bit % 8
    arr[byte_no] |= (1 << bit_no)

def create_textbox_data(x):
    x = b'\n'.join(i.strip() for i in x.split(b'\n')).strip()
    paragraphs = x.split(b'\n\n')
    result = []
    for paragraph in paragraphs:
        lines = paragraph.split(b"\n")
        subresult = []
        for line in lines:
            line = to_enhanced_charset_unterminated(line)
            subresult.append(line)
        result.append(subresult[0] + b'\xf2' + b'\xf1'.join(subresult[1:]))
    return b'\xf3'.join(result) + b'\xf4\x00'
