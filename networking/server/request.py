import binascii

import handlers
import logger

def checksum(data):
    checksum_h = 0x5a
    checksum_l = 0xa5
    for i in data:
        checksum_h ^= i
        checksum_l = (checksum_l + i) % 256
    return (checksum_h, checksum_l)

'''
    REQUEST FRAME
    u16 content_length
    u16 checksum
    u8 request_code
    u8[] request_data
'''

def handle(request, sessid):
    logger.log("REQ:  " + binascii.hexlify(bytearray(request)).decode('ascii'))
    req_code = request[4]

    checksum_h, checksum_l = checksum(request[5:])
    if checksum_h != request[3] or checksum_l != request[2]:
        raise RuntimeError("invalid checksum in data; %.2x%.2x != %.2x%.2x"
            % (checksum_h, checksum_l, request[3], request[2]))

    req_result = handlers.HANDLERS[req_code](list(request[5:]), sessid)
    checksum_h, checksum_l = checksum(req_result)
    content_length = len(req_result) + 5
    length_h = content_length // 256
    length_l = content_length % 256

    out = [length_l, length_h, checksum_l, checksum_h, req_code] + req_result
    logger.log("RESP: " + binascii.hexlify(bytearray(out)).decode('ascii'))

    return out
