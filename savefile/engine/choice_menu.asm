; === choice_menu.asm
; Functions that aid in creating option choice menus.

; Create and display a new choice menu.
; bc -> textbox dimensions
; hl -> menu text
; Selected option index is saved to A upon completion.

_PrintChoiceMenu:
    push bc
    push de
    call SaveScreenTilesToBuffer1
    pop de
    pop bc
    call ChoiceMenuHandler
    push af
    call LoadScreenTilesFromBuffer1
    pop af
    ret

ChoiceMenuHandler:
    push bc
    push de
    push bc
    ld de, -20
    ld hl, $c48f
    inc b
    inc c
    inc c
.calcHeight
    add hl, de
    dec b
    jr nz, .calcHeight
.calcWidth
    dec hl
    dec c
    jr nz, .calcWidth
    pop bc
    inc c
    push hl
    call TextBoxBorder
    pop hl
    ld de, 22
    add hl, de
    pop de
    push hl
    call _PutString
    pop hl
    dec hl
    pop bc
    call UpdateSpritesSafeguarded
    ; fall through to ChoiceMenuLoop
    
ChoiceMenuLoop:
    ld c, 0
.inputLoop
    ld de, 20
    push hl
    push bc
    xor a
.cursorDraw
    push af
    cp c
    ld a, $ed
    jr z, .cursorOn
    ld a, $7f
.cursorOn
    ld [hl], a
    add hl, de
    pop af
    inc a
    cp b
    jr nz, .cursorDraw
.inputdecision
    pop bc
    pop hl
    call WaitNonzeroInput
    ld d, a
    bit 6, a
    jr z, .notU
    ld a, c
    and a
    jr z, .notU
    call PlayOptionChangeSound
    dec c
.notU
    ld a, d
    bit 7, a
    jr z, .notD
    ld a, c
    inc a
    cp b
    jr z, .notD
    call PlayOptionChangeSound
    inc c
.notD
    ld a, d
    bit 0, a
    jr z, .notA
    ld a, c
    jp PlayOptionSelectSound
.notA
    jr .inputLoop
