; === utils.asm
; Utility subroutines from SRAM2.
; Mostly functions related to text processing and user input.

; Given a music pointer array in HL, play the music there.

_PlayMusicFromRAM:
    ld bc, $0008
    ld de, $C006
    call CopyData
    ld a, $00
    ld bc, $0004
    ld hl, $C016
    call FillMemory
    ld a, $01
    ld bc, $0004
    ld hl, $C0B6
    call FillMemory
    ld a, $e0
    ld bc, $0004
    ld hl, $C026
    jp FillMemory
    
; Wait until the A button is fully pressed and fully released.

_WaitAPress:
    push af
.waitA_release
    ldh a, [$f5]
    bit 0, a
    jr nz, .waitA_release
.waitA_press
    ldh a, [$f5]
    bit 0, a
    jr z, .waitA_press
    pop af
    ret
    
; Set all sprite animation counters to 00.
    
SpriteClearAnimCounters:
    ld hl, $c107
    ld bc, $0010 - 1
.loop
    xor a
    ldi [hl], a
    ld [hl], a
    add hl, bc
    ld a, l
    cp $f7
    jr nz, .loop
    ret
    
; UpdateSprites, but it preserves all of the registers.
; It also keeps all sprite animation counters at 00.
    
UpdateSpritesSafeguarded:
    push af
    push bc
    push de
    push hl
    call SpriteClearAnimCounters
    call UpdateSprites
    call SpriteClearAnimCounters
    pop hl
    pop de
    pop bc
    pop af
    ret

; Utility sound routines, used in the user input menus.
   
PlayOptionChangeSound:
    push af
    ld a, $13
    call PlaySound
    pop af
    ret
PlayOptionSelectSound:
    push af
    ld a, $90
    call PlaySound
    pop af
    ret

; Wait until any button is pressed.

WaitNonzeroInput:
    ldh a, [$f5]
    and a
    jr nz, WaitNonzeroInput
.nonzero
    ldh a, [$f5]
    and a
    jr z, .nonzero
    ret

; Place vanilla text on the screen, terminated by $50.
; Lines are separated with $4F.
; Data is read from the caller's SRAM bank.

_PutString:
    push bc
    push hl
    ld bc, 20
.printchr
    ld a, [de]
    push hl
    ld h, d
    ld l, e
    call ReadFromSavedSRAM
    pop hl
    inc de
    cp $50
    jr z, .finished
    cp $4f
    jr z, .nextline
    ld [hli], a
    jr .printchr
.nextline
    pop hl
    add hl, bc
    push hl
    jr .printchr
.finished
    pop hl
    pop bc
    ret
    
; Same as PutString, but data is read from the current SRAM bank instead,
; as opposed to the parent one.
    
PutStringSameBank:
    ld a, [SavedSRAMBank]
    push af
    ld a, [CurrentSRAMBank]
    ld [SavedSRAMBank], a
    call _PutString
    pop af
    ld [SavedSRAMBank], a
    ret

; Functions that aid in creating option choice menus.

include "engine/choice_menu.asm"

; Functions that aid in creating text input menus.

include "engine/input_menu.asm"

; Execute a command from a list of predefined commands.

_PredefCmd:
    ; Again, clever self modifying code is used to make a dynamic
    ; subroutine call while preserving all registers
    push af
    push hl
    push bc
    ld hl, PredefCmdPointers
    add a
    ld c, a
    ld b, 0
    add hl, bc
    ld a, [hli]
    ld h, [hl]
    ld [PredefCmdCall+1], a
    ld a, h
    ld [PredefCmdCall+2], a
    pop bc
    pop hl
    pop af
PredefCmdCall:
    jp $1234
    
PredefCmdPointers:
    dw PutStringSameBank
    dw CharsetEnhancedToStandard
    dw CharsetStandardToEnhanced
    dw ReplaceTextPointer
    dw StringLen
    dw HandleCrackMe
    dw ShowMapOfGlitchland
    dw PreserveMusicRegisters
    dw RestoreMusicRegisters
    
; Convert the 'enhanced charset' (used by this game's text engine)
; to the 'standard charset' (used by the stock game).

CharsetEnhancedToStandard:
    ld de, CharsetEnhanced
    ld bc, CharsetStandard
    ld a, $f6
    ld [ConvertCharsetsTerminator+1], a
    ld a, $50
    ld [ConvertCharsetsFinish+1], a
    jr ConvertCharsetsInPlace
    
; Same conversion, but in reverse.
    
CharsetStandardToEnhanced:
    ld de, CharsetStandard
    ld bc, CharsetEnhanced
    ld a, $50
    ld [ConvertCharsetsTerminator+1], a
    ld a, $f6
    ld [ConvertCharsetsFinish+1], a
    ; Fall through to ConvertCharsetsInPlace

; Perform the actual charset conversion.
; Conversion is done in place.
; de -> source charset
; bc -> target charset
; hl -> converted string

ConvertCharsetsInPlace:
    ld a, [hl]
ConvertCharsetsTerminator:
    cp $50
    jr z, ConvertCharsetsFinish
    push hl
    push bc
    push de
    ld h, d
    ld l, e
    call CharsetSearch
    ld a, b
    pop de
    pop bc
    pop hl
    push hl
    push bc
    ld h, b
    ld l, c
    ld b, 0
    ld c, a
    add hl, bc
    ld a, [hl]
    pop bc
    pop hl
    ld [hli], a
    jr ConvertCharsetsInPlace
ConvertCharsetsFinish:
    ld [hl], $50
    ret

; Find the value A in an $FF terminated array and return the index in C.

CharsetSearch:
    ld c, a
    ld b, -1
.loop
    inc b
    ld a, [hli]
    cp c
    jr nz, .loop
.finish
    ret
    
CharsetEnhanced:
    db $01,$02,$03,$04,$05,$06,$07,$08,$09,$0a,$0b,$0c,$0d,$0e,$0f,$10,$11,$12
    db $13,$14,$15,$16,$17,$18,$19,$1a,$1b,$1c,$1d,$1e,$1f,$20,$21,$22,$23,$24
    db $25,$26,$27,$28,$29,$2a,$2b,$2c,$2d,$2e,$2f,$30,$31,$32,$33,$34,$35,$36
    db $37,$38,$39,$3a,$3b,$3c,$3d,$3e,$3f,$40,$41,$42,$43,$44,$45,$46,$47,$48
    db $49,$4a,$4b,$4c
CharsetStandard:
    db $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$8c,$8d,$8e,$8f,$90,$91
    db $92,$93,$94,$95,$96,$97,$98,$99,$a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9
    db $aa,$ab,$ac,$ad,$ae,$af,$b0,$b1,$b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9,$e7,$f4
    db $e6,$00,$e3,$e8,$9c,$9a,$9b,$7f,$01,$f0,$e0,$f3,$f6,$f7,$f8,$f9,$fa,$fb
    db $fc,$fd,$fe,$ff

; A utility function to make an interactive serial transfer.
; That is, send out a packet while displaying the 'Transmitting' message
; and allow cancelling the transmission with the B Button.

_SerialInteractiveTransfer:
    call ShowTransmitMessage
    ld c, $20
    ld a, $a3
    call PlayMusic
    ld c, 8
    call DelayFrames
.attemptConnect
    ldh a, [$f5]
    and $02
    jr nz, .connectionFailed
    xor a
    ld [SerialIsInteractive], a
    ld hl, StandardSerialBuffer
    ld de, StandardSerialBuffer
    call SerialTransmitBlock
    jr c, .connectionFailed
    xor a
    ld [SerialIsInteractive], a
    ld a, 1
    ret
.connectionFailed
    ld a, $fe
    ld [PreservedMapMusicBank], a
    xor a
    ld [SerialIsInteractive], a
    ret
    
; Replace the textbox ID in register C with a new pointer in HL.
; Since this is supposed to be called from map scripts, all writes
; are made to the caller's SRAM bank.
    
ReplaceTextPointer:
    push hl
    ld hl, $d36b
    ld e, [hl]
    inc hl
    ld d, [hl]
    ld h, d
    ld l, e
    ld a, c
    dec a
    add a
    ld c, a
    ld b, 0
    add hl, bc
    pop de
    ld a, e
    call WriteToSavedSRAM
    inc hl
    ld a, d
    jp WriteToSavedSRAM
    
; Given a standard charset string in HL, calculate its length.
; Result is returned in C.
    
StringLen:
    push hl
    ld c, 0
.loop
    ld a, [hli]
    cp $50
    jr z, .finish
    inc c
    jr .loop
.finish
    pop hl
    ret
    
; A theoretical function that was supposed to show a map of Glitchland.
; During early development, there was an idea that a full map of the
; world should be viewable in-game, like a Town Map.
; However, the approaching deadline forced me to scrap the idea.

; And all that remained of the idea... is a single return instruction.

ShowMapOfGlitchland:
    ret

; Save the sound RAM ($C000-$C100) to $CAD0. Used to preserve music
; between maps.

PreserveMusicRegisters:
    push hl
    push de
    push bc
    ; We want to make sure the sound data doesn't update while we're
    ; copying it. So interrupts are disabled during the operation.
    di
    ld hl, $c000
    ld de, $cad0
    ld bc, 256
    call CopyData
    ei
    pop bc
    pop de
    pop hl
    ret

; Restore the sound RAM, as saved by PreserveMusicRegisters.

RestoreMusicRegisters:
    push hl
    push de
    push bc
    di
    ld hl, $cad0
    ld de, $c000
    ld bc, 256
    call CopyData
    ei
    pop bc
    pop de
    pop hl
    ret
