; === text_engine.asm
; Variable Width Font text engine functions.

; Buffers to store uncommited tile data

WorkingBlocks:
WorkingBlock1:
    db 0,0,0,0,0,0,0,0
WorkingBlock2:
    db 0,0,0,0,0,0,0,0

; Several helper variables

CurrentX:
    db 0
CurrentVRAMIndex:
    db 0
CurrentTilemapPosition:
    db 0
ParentBufferAddress:
    dw 0
CharAddConstant:
    db 0

; Reinitialize the engine's state to a fresh one.

ClearState:
    xor a
    ld hl, WorkingBlocks
    ld bc, $0010
    call FillMemory
    xor a
    ld [CurrentTilemapPosition], a
    ld [CurrentVRAMIndex], a
    ld [CurrentX], a
    ret

; Wait for a button press while blinking the arrow.

WaitButtonPress:
    push hl
    coord hl, 18, 16
    ld [hl], $ee
    push hl
    call ManualTextScroll
    pop hl
    ld [hl], $7f
    pop hl
    ret
    
; PrintText, but with this custom text engine.
; Text data is read from the caller's SRAM bank.
    
_PrintTextEnhanced:
    push hl
    xor a
    ld [CharAddConstant], a
    ld a, 1
    ld [wTextBoxID], a
    call DisplayTextBoxID
    call UpdateSpritesSafeguarded
    call Delay3
    call ClearState
    pop hl
EnhancedTextCommandProcessor:
    call ReadFromSavedSRAM
    inc hl
    and a
    jp z, RotateBlocks
    cp $f1
    jp z, EnhancedTextCommandF1
    cp $f2
    jp z, EnhancedTextCommandF2
    cp $f3
    jp z, EnhancedTextCommandF3
    cp $f4
    jp z, EnhancedTextCommandF4
    cp $f5
    jp z, EnhancedTextCommandF5
    cp $f6
    jp z, EnhancedTextCommandF6
    cp $f7
    jp z, EnhancedTextCommandF7
    cp $f8
    jp z, EnhancedTextCommandF8
    push hl
    call TextEngineSingleChar
    pop hl
    jr EnhancedTextCommandProcessor

; Text command 0xF1
; Go to the next line, scroll the text up

EnhancedTextCommandF1:
    push hl
    call RotateBlocks
    call WaitButtonPress
    call ScrollTextUpOneLine
    call ScrollTextUpOneLine
    ld a, 18
    ld [CurrentTilemapPosition], a
    xor a
    ld [CurrentX], a
    pop hl
    jp EnhancedTextCommandProcessor

; Text command 0xF2
; Go to the next line, without scrolling

EnhancedTextCommandF2:
    push hl
    call RotateBlocks ; Force update
    ld a, 18
    ld [CurrentTilemapPosition], a
    xor a
    ld [CurrentX], a
    pop hl
    jp EnhancedTextCommandProcessor

; Text command 0xF3
; Start a new paragraph

EnhancedTextCommandF3:
    push hl
    call RotateBlocks ; Force update
    call WaitButtonPress
    call ClearState
    coord hl, 1, 13
    ld bc, $0412
    call ClearScreenArea
    ld c, 20
    call DelayFrames
    pop hl
    jp EnhancedTextCommandProcessor

; Text command 0xF4
; Wait for a button press

EnhancedTextCommandF4:
    push hl
    call RotateBlocks ; Force update
    call WaitButtonPress
    pop hl
    jp EnhancedTextCommandProcessor

; Text command 0xF5
; Start reading text from a buffer

EnhancedTextCommandF5:
    ld a, h
    ld [ParentBufferAddress], a
    ld a, l
    ld [ParentBufferAddress+1], a
    call ReadFromSavedSRAM
    ld b, a
    inc hl
    call ReadFromSavedSRAM
    ld h, a
    ld l, b
    jp EnhancedTextCommandProcessor

; Text command 0xF6
; Stop reading text from a buffer

EnhancedTextCommandF6:
    ld a, [ParentBufferAddress]
    ld h, a
    ld a, [ParentBufferAddress+1]
    ld l, a
    inc hl
    inc hl
    jp EnhancedTextCommandProcessor
    
; Text command 0xF7
; Change font offset
    
EnhancedTextCommandF7:
    call ReadFromSavedSRAM
    ld [CharAddConstant], a
    inc hl
    jp EnhancedTextCommandProcessor

; Text command 0xF8
; Play sound effect

EnhancedTextCommandF8:
    call ReadFromSavedSRAM
    push hl
    push af
    call RotateBlocks ; Force update
    pop af
    call PlaySound
    call WaitForSoundToFinish
    pop hl
    inc hl
    jp EnhancedTextCommandProcessor

; Rotate the tile buffers into VRAM.
; WorkingBlock1 gets copied into the current VRAM tile.
; WorkingBlock2 gets shifted to WorkingBlock1.
; WorkingBlock2 is blanked out.
; CurrentVRAMIndex and CurrentTilemapPosition are updated accordingly.

RotateBlocks:
    ld a, [CurrentVRAMIndex]
    ld bc, $0010
    ld hl, $8c00
    and a
    jr z, .skipMult
.mult
    add hl, bc
    dec a
    jr nz, .mult
.skipMult
    ld de, WorkingBlocks
    call CopyWorkingBlocks
    ld hl, WorkingBlock2
    ld de, WorkingBlock1
    ld bc, $0008
    call CopyData
    ld hl, WorkingBlock2
    ld bc, $0008
    xor a
    call FillMemory
    ld hl, CurrentTilemapPosition
    ld a, [hl]
    inc [hl]
    ld hl, TilemapPositions
    ld c, a
    ld b, 0
    add hl, bc
    ld l, [hl]
    ld h, $c4
    push hl
    ld hl, CurrentVRAMIndex
    ld b, [hl]
    ld a, b
    inc a
    sub 18*2
    jr nc, .overflow
    add 18*2
.overflow
    ld [hl], a
    ld a, b
    pop hl
    add $c0
    ld [hl], a
    ret
    
; Tile indices used for the text display.
    
TilemapPositions:
    db $b9,$ba,$bb,$bc,$bd,$be,$bf,$c0,$c1,$c2,$c3,$c4,$c5,$c6,$c7,$c8,$c9,$ca
    db $e1,$e2,$e3,$e4,$e5,$e6,$e7,$e8,$e9,$ea,$eb,$ec,$ed,$ee,$ef,$f0,$f1,$f2

; Taking the X position in A, load the corresponding working block.

LoadCorrectBlock:
    cp $08
    ld hl, WorkingBlock2
    jr nc, .block2
    ld hl, WorkingBlock1
.block2
    ret

; Return a byte with the A'th bit set in D

GetPixelBit:
    push hl
    push bc
    and $07
    ld hl, BitLookup
    ld b, 0
    ld c, a
    add hl, bc
    ld d, [hl]
    pop bc
    pop hl
    ret

BitLookup:
    db $80,$40,$20,$10,$08,$04,$02,$01
    
; Handle a single character in the text stream

TextEngineSingleChar:
    ; Do not add font offset to whitespace
    ld c, a
    cp $3e
    jr z, .noAdd
    cp $3f
    jr z, .noAdd
    ld a, [CharAddConstant]
    add c
    ld c, a
.noAdd
    ; Get the character definition
    ld b, 0
    ld hl, CharList
    add hl, bc
    add hl, bc
    ld a, [hli]
    ld h, [hl]
    ld l, a
.readXY
    ; Read and draw the pixels in the character definition
    ld a, [hli]
    cp $ff
    jr z, .finished
    push hl
    push af
    ld a, [CurrentX]
    ld b, a
    pop af
    push af
    swap a
    and $0f
    add b
    call LoadCorrectBlock
    call GetPixelBit
    pop af
    and $0f
    ld c, a
    ld b, 0
    add hl, bc
    ld a, d
    or [hl]
    ld [hl], a
    pop hl
    jr .readXY
.finished
    ld b, [hl]
    ld a, [CurrentX]
    add b
    inc a
    ld [CurrentX], a
    cp $08
    jr c, .noRotation
    call RotateBlocks
.noRotation
    ld a, [CurrentX]
    and $07
    ld [CurrentX], a
    ret
    
; Copy exactly two 1bpp tiles from DE to HL.
; This is essentially CopyVideoDataDouble, but doesn't clobber BC.
    
CopyWorkingBlocks:
    ld a, e
    ldh [$cc], a
    ld a, d
    ldh [$cd], a
    ld a, l
    ldh [$ce], a
    ld a, h
    ldh [$cf], a
    ld a, 2
    ldh [$cb], a
.waitCopy:
    ldh a, [$cb]
    and a
    jr nz, .waitCopy
    ret

; Character definitions.

CharList:
    include "includes/charset.asm"
