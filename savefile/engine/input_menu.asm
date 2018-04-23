; === input_menu.asm
; Functions that aid in creating text input menus.

; Create and display a new text input menu.
; c -> maximum length of text
; Text is saved to wInputMenuBuffer upon completion.

_PrintInputMenu:
    push bc
    call SaveScreenTilesToBuffer1
    pop bc
    call InputMenuHandler
    jp LoadScreenTilesFromBuffer1
    
InputMenuHandler:
    push bc
    coord hl, 0, 6
    ld bc, $0412
    call TextBoxBorder
    coord hl, 0, 3
    ld bc, $0112
    call TextBoxBorder
    coord hl, 1, 7
    ld de, InputMenuTilemap
    call PutStringSameBank
    call UpdateSpritesSafeguarded
    ld bc, $0004
    ld de, InputMenuTiles
    ld hl, $8bc0
    call CopyVideoData
    pop bc
    push bc
    ld hl, $c3f1
    push hl
    ld [hl], $bf
    inc hl
    dec c
.printBlanks
    ld [hl], $be
    dec c
    inc hl
    jr nz, .printBlanks
    ld bc, $1048
    ld d, $ff
.inputMenuLoop
    halt
.inputLoopRelease
    call InputMenuHandleCursor
    ldh a, [$f5]
    and d
    jr nz, .inputLoopRelease
.inputLoopPress
    call InputMenuHandleCursor
    ldh a, [$f5]
    and a
    jr z, .inputLoopPress
    ld d, a
    bit 6, a
    jr z, .notU
    ld a, c
    cp $48
    jr nz, .loopU
    ld a, $68
.loopU
    sub 8
    ld c, a
.notU
    ld a, d
    bit 7, a
    jr z, .notD
    ld a, c
    cp $60
    jr nz, .loopD
    ld a, $40
.loopD
    add 8
    ld c, a
.notD
    ld a, d
    bit 4, a
    jr z, .notR
    ld a, b
    cp $98
    jr nz, .loopR
    ld a, $08
.loopR
    add 8
    ld b, a
.notR
    ld a, d
    bit 5, a
    jr z, .notL
    ld a, b
    cp $10
    jr nz, .loopL
    ld a, $a0
.loopL
    sub 8
    ld b, a
.notL
    ld a, d
    bit 0, a
    jr z, .notA
    ld a, b
    cp $98
    jr nz, .justPutchar
    ld a, c
    cp $60
    jp z, InputMenuCopyToBufAndExit
.justPutchar
    pop hl
    call InputMenuPutChar
    push hl
.notA
    ld a, d
    bit 1, a
    jr z, .notB
    pop hl
    call InputMenuDelChar
    push hl
.notB
    ld a, d
    bit 3, a
    jr z, .notStart
    ld bc, $9860
.notStart
    jr .inputMenuLoop
    
InputMenuPutChar:
    push de
    push hl
    push bc
    ld a, b
    REPT 3
        scf
        ccf
        rrca
    ENDR
    ld d, a
    ld a, c
    REPT 3
        scf
        ccf
        rrca
    ENDR
    ld e, a
    ld hl, $c3a0
    ld bc, 20
    dec e
    dec e
    dec d
.calcY
    add hl, bc
    dec e
    jr nz, .calcY
.calcX
    inc hl
    dec d
    jr nz, .calcX
    ld a, [hl]
    pop bc
    pop hl
    pop de
    ld [hli], a
    ld a, [hl]
    cp $be
    jr nz, .finalChar
    ld [hl], $bf
    ret
.finalChar
    dec hl
    ret
    
InputMenuDelChar:
    ld a, [hl]
    cp $bf
    jr nz, .lastChar
    ld [hl], $be
    dec hl
    ld a, [hl]
    cp $7c
    jr nz, .lastChar
    inc hl
.lastChar
    ld [hl], $bf
    ret
    
InputMenuCopyToBufAndExit:
    pop hl
    pop bc
    ld hl, $c3f1
    ld de, $d0e0
.copy
    ld a, [hli]
    cp $bf
    jr z, .terminate
    ld [de], a
    inc de
    dec c
    jr nz, .copy
.terminate
    ld a, $50
    ld [de], a
    ret
    
InputMenuHandleCursor:
    ld hl, $c39c
    ld [hl], c
    inc hl
    ld [hl], b
    inc hl
    ld [hl], $bd
    inc hl
    ld a, [wIgnoreInputCounter]
    and $0f
    cp $08
    jr nc, .blink
    ld [hl], 0
    ret
.blink
    ld [hl], $80
    ret
    
InputMenuTiles:
    db $F0,$F0,$80,$80,$E0,$E0,$9C,$9C,$F2,$F2,$12,$12,$12,$12,$1C,$1C
    db $00,$fe,$00,$fe,$00,$fe,$00,$fe,$00,$fe,$00,$fe,$00,$fe,$00,$fe
    db $00,$00,$00,$00,$00,$00,$00,$00,$00,$00,$7E,$7e,$7e,$7E,$00,$00
    db $00,$00,$00,$00,$00,$00,$00,$00,$7E,$7E,$7E,$7E,$00,$00,$00,$00
    
InputMenuTilemap:
    db $80,$81,$82,$83,$84,$85,$86,$87,$88,$89,$8a,$8b,$8c,$8d,$8e,$8f,$90,$91,$4f
    db $92,$93,$94,$95,$96,$97,$98,$99,$f6,$f7,$f8,$f9,$fa,$fb,$fc,$fd,$fe,$ff,$4f
    db $a0,$a1,$a2,$a3,$a4,$a5,$a6,$a7,$a8,$a9,$aa,$ab,$ac,$ad,$ae,$af,$b0,$b1,$4f
    db $b2,$b3,$b4,$b5,$b6,$b7,$b8,$b9,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$7f,$bc,$50
