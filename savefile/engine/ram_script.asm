; === ram_script.asm
; A small "RAM-writer" scripting engine.

; RAM scripts are sequences of 16-bit words with the following format:
; CCCaaaaa aaaaaaaa
; C -> command ID, a -> target RAM address - 0xC000.
; Additional data may follow depending on the command.

; The commands:
; 0 - write one following byte to the target RAM address
; 1 - like 0, but with two bytes
; 2 - like 0, but with three bytes
; 3 - write an $FF terminated string to target RAM address
; 4 - fill two bytes at target RAM address with the set byte (see cmd 7)
; 5 - like 4, but with three bytes
; 6 - fill any number of bytes with the set byte (see cmd 7)
; 7 - set the fill value used for the commands 4 through 6

; RAM scripts are mostly used by map initialization routines, to draw
; connections on map borders.

RunRAMScript:
    ld a, [hli]
    cp $ff
    ret z
    ld c, a
    and $1f
    add $c0
    ld d, a
    ld a, c
    and $e0
    swap a
    rrca
    add a
    ld c, a
    ld b, 0
    ld a, [hli]
    ld e, a
    push hl
    ld hl, RAMScriptJumptable
    add hl, bc
    ld a, [hli]
    ld h, [hl]
    ld l, a
    jp hl
    
wRAMScriptFillByte:
    db 0
    
RAMScriptJumptable:
    dw RAMScriptWrite1
    dw RAMScriptWrite2
    dw RAMScriptWrite3
    dw RAMScriptWriteTerm
    dw RAMScriptFill2
    dw RAMScriptFill3
    dw RAMScriptFillLen
    dw RAMScriptFillSetByte
    
RAMScriptWrite1:
    pop hl
    ld a, [hli]
    ld [de], a
    jr RunRAMScript

RAMScriptWrite2:
    pop hl
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hli]
    ld [de], a
    jr RunRAMScript

RAMScriptWrite3:
    pop hl
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hli]
    ld [de], a
    inc de
    ld a, [hli]
    ld [de], a
    jr RunRAMScript
    
RAMScriptWriteTerm:
    pop hl
.loop
    ld a, [hli]
    cp $ff
    jr z, RunRAMScript
    ld [de], a
    inc de
    jr .loop
    
RAMScriptFill2:
    pop hl
    ld a, [wRAMScriptFillByte]
    ld [de], a
    inc de
    ld [de], a
    jr RunRAMScript

RAMScriptFill3:
    pop hl
    ld a, [wRAMScriptFillByte]
    ld [de], a
    inc de
    ld [de], a
    inc de
    ld [de], a
    jr RunRAMScript
    
RAMScriptFillLen:
    pop hl
    ld a, [hli]
    ld c, a
    ld a, [wRAMScriptFillByte]
.loop
    ld [de], a
    inc de
    dec c
    jr nz, .loop
    jr RunRAMScript
    
RAMScriptFillSetByte:
    pop hl
    ld a, e
    ld [wRAMScriptFillByte], a
    jr RunRAMScript
