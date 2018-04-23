# util.py

def translateCharset(text, chrA, chrB, terminator):
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
    b",?\"-.:() ~$'/0123456789"
])

CHARSET_ENHANCED = bytes(range(0, 256))

CHARSET_STANDARD = b''.join([
    b"\x00",
    b"\x80\x81\x82\x83\x84\x85\x86\x87\x88\x89\x8a\x8b\x8c\x8d\x8e\x8f\x90\x91",
    b"\x92\x93\x94\x95\x96\x97\x98\x99\xa0\xa1\xa2\xa3\xa4\xa5\xa6\xa7\xa8\xa9",
    b"\xaa\xab\xac\xad\xae\xaf\xb0\xb1\xb2\xb3\xb4\xb5\xb6\xb7\xb8\xb9\xe7\xf4",
    b"\xe6\x00\xe3\xe8\x9c\x9a\x9b\x7f\x01\xf0\xe0\xf3\xf6\xf7\xf8\xf9\xfa\xfb",
    b"\xfc\xfd\xfe\xff"
])

def toEnhancedCharset(text):
    return translateCharset(text, CHARSET_ASCII, CHARSET_ENHANCED, 0x00)
def fromEnhancedCharset(text):
    return translateCharset(text, CHARSET_ENHANCED, CHARSET_ASCII, 0x00)
def toStandardCharset(text):
    return translateCharset(text, CHARSET_ASCII, CHARSET_STANDARD, 0x00)
def fromStandardCharset(text):
    return translateCharset(text, CHARSET_STANDARD, CHARSET_ASCII, 0x50)

class DotDict(dict):
    __getattr__ = dict.get
    __setattr__ = dict.__setitem__
    __delattr__ = dict.__delitem__
    
def setBitInArray(arr, n):
    byteno = n // 8
    bitno = n % 8
    arr[byteno] |= (1 << bitno)
