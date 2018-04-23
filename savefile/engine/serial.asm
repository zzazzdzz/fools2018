; === serial.asm
; Routines for handling serial connections.

; Exchange serial data, at a fixed rate of one byte per frame.

SerialShiftByteSafe:
    ldh [rSB], a
    ld a, $81
    ldh [hSerialConnectionStatus], a
    ldh [rSC], a
    call DelayFrame
    ldh a, [hSerialReceiveData]
    ret
    
; Exchange serial data, as fast as possible.
    
SerialShiftByte:
    ldh [rSB], a
    xor a
    ldh [hSerialReceivedNewData], a
    ld a, $81
    ldh [hSerialConnectionStatus], a
    ldh [rSC], a
.wait
    ldh a, [hSerialReceivedNewData]
    dec a
    jr nz, .wait
    ldh a, [hSerialReceiveData]
    ret

; Take a packet in HL, send it out and write the response to DE.
; Set carry if a transmission error occured. Reset on success.

; A very simple transmission protocol is employed to send out and receive
; requests. Note that the protocol here was designed to be implementable
; in real hardware if anyone so desires.
; So if you're hardcore, you could set up an Arduino or something, make it
; act like a server and play Glitchland in real hardware!

SerialTransmitBlock:
    xor a
    ldh [hSerialReceiveData], a
    ldh [hSerialSendData], a
    ; Perform a very simple handshake.
    ; The client has to send out {0xDA, 0xCF, 0xEB}.
    ; The server has to respond with {0xA5, 0x5A, 0x0A}.
    ; If anything doesn't match, the transmission is deemed failed.
    ld a, $da
    call SerialShiftByteSafe
    cp $a5
    jr nz, .error
    ld a, $cf
    call SerialShiftByteSafe
    cp $5a
    jr nz, .error
    ld a, $eb
    call SerialShiftByteSafe
    cp $0a
    jr nz, .error
    ; Start sending out data from HL with maximum speed, byte by byte.
    ; The packet starts with the content length, so the receiving end
    ; knows exactly how much data to expect.
    ld c, [hl]
    inc hl
    ld b, [hl]
    dec hl
.sendData
    ; Send out the actual data. The server MUST respond with the byte
    ; 0xCC if the incoming byte was accepted. Otherwise, the transmission
    ; is deemed failed.
    ld a, [hli]
    call SerialShiftByte
    cp $cc
    jr nz, .error
    dec bc
    ld a, c
    or b
    jr nz, .sendData
.waitRequest
    ; Wait until the request is finished. The server can take an arbitrary
    ; amount of time to process the request. If the server isn't yet ready
    ; to serve the response, a value of 0x66 MUST be sent back.
    ; If the server is ready, a value of 0x33 MUST be sent back.
    call DelayFrame
    ld a, $55
    call SerialShiftByte
    cp $66
    jr z, .waitRequest
    cp $33
    jr nz, .error
    ; Receive data to DE, byte by byte.
    ; When receiving from the server, the client SHOULD send out a value of
    ; 0xCC, to allow error handling for server implementations.
    ld h, d
    ld l, e
    ld a, $cc
    call SerialShiftByte
    ld [hli], a
    ld c, a
    ld a, $cc
    call SerialShiftByte
    ld [hli], a
    ld b, a
    ; A simple error handling precaution - don't allow receiving packets
    ; with size exceeding 0x700. There's obviously not enough space to fit
    ; packets this big in the allocated space.
    cp 7
    jr nc, .error
.receiveData
    ld a, $cc
    call SerialShiftByte
    ld [hli], a
    dec bc
    ld a, c
    or b
    jr nz, .receiveData
    ; Verify the checksum, error out if it doesn't match.
    ld h, d
    ld l, e
    call VerifySerialChecksum
    jr c, .error
    scf
    ccf
    ret
.error:
    scf
    ret
    
; Shows the "Transmitting..." textbox on the screen.
    
ShowTransmitMessage:
    ld a, 1
	ld [wTextBoxID], a
	call DisplayTextBoxID
    coord hl, 1, 14
    ld de, TransmitMessage
    jp PutStringSameBank
TransmitMessage:
    db $93,$b1,$a0,$ad,$b2,$ac,$a8,$b3,$b3,$a8,$ad,$a6,$e8,$e8,$e8,$4f,$4f
    db $7f,$7f,$81,$7f,$81,$b4,$b3,$b3,$ae,$ad,$9c,$7f,$82,$a0,$ad,$a2,$a4,$ab,$50

; Calculate the serial checksum from the packet in HL.
; Return the checksum in DE.

CalcSerialChecksum:
    push hl
    push bc
    ld c, [hl]
    inc hl
    ld b, [hl]
    REPT 4
        inc hl
    ENDR
    REPT 5
        dec bc
    ENDR
    ld de, $5aa5
.loop
    ld a, [hl]
    xor d
    ld d, a
    ld a, [hli]
    add e
    ld e, a
    dec bc
    ld a, c
    or b
    jr nz, .loop
.finished
    pop bc
    pop hl
    ret

; Given a block of data in HL, fix its checksum in place.

FixSerialChecksum:
    push hl
    call CalcSerialChecksum
    inc hl
    inc hl
    ld [hl], e
    inc hl
    ld [hl], d
    pop hl
    ret

; Given a block of data in HL, verify its checksum.
; Carry is set if the checksum does not match.

VerifySerialChecksum:
    call CalcSerialChecksum
    inc hl
    inc hl
    ld c, [hl]
    inc hl
    ld a, [hl]
    cp d
    jr nz, .incorrect
    ld a, c
    cp e
    jr nz, .incorrect
    scf
    ccf
    ret
.incorrect
    scf
    ret
