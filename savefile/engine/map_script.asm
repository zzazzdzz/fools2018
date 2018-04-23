; === map_script.asm
; The default overworld map script.
; Handles map connections, anti-cheat, and calling the original
; map script.

; Generate an array of all coordinates surrounding the position in
; DE, and write it to StandardSerialBuffer.

GenerateDECoordArray:
    push de
    ld hl, StandardSerialBuffer
    dec d
    dec e
    ldi_hl_de
    inc e
    ldi_hl_de
    inc e
    ldi_hl_de
    inc d
    ldi_hl_de
    dec e
    ldi_hl_de
    dec e
    ldi_hl_de
    inc d
    ldi_hl_de
    inc e
    ldi_hl_de
    inc e
    ldi_hl_de
    ld [hl], $ff
    pop de
    ret

; The main map script handler.

HandleCurrentMapScript:
    ld a, [$c45c]
    cp $14
	jr z, .noCollision
	cp $32
	jr z, .noCollision
	cp $48
	jr z, .noCollision
    cp $37
	jr z, .noCollision
    cp $27
	jr z, .noCollision
    cp $24
	jr z, .noCollision
    cp $1d
	jr z, .noCollision
    cp $2c
	jr z, .noCollision
    cp $0d
	jr z, .noCollision
    cp $36
	jr z, .noCollision
    ld c, a
    call IsTilePassable
    jp c, CheatingAttempt
.noCollision
    ld a, $66
    ld [$d35d], a
    ld hl, $d368
    ld a, [hld]
    add a
    dec a
    ld b, a
    ld a, [hl]
    add a
    dec a
    ld c, a
    ld a, [$d366]
    and a
    jr nz, .skipBorderChecks
    ld l, $61
    ld d, 0
    ld a, [hld]
    and a
    jr z, WesternBorder
    cp b
    jr z, EasternBorder
    ld a, [hl]
    and a
    jr z, NorthernBorder
    cp c
    jr z, SouthernBorder
.skipBorderChecks
    ld hl, $d3ad
    ld a, [hli]
    and a
    jr z, .runOriginalMapScript
    ld c, a
.checkWarps
    ld a, [hli]
    ld e, a
    ld a, [hli]
    ld d, a
    inc hl
    inc hl
    push hl
    push bc
    call GenerateDECoordArray
    ld hl, StandardSerialBuffer
    call ArePlayerCoordsInArray
    pop bc
    pop hl
    jr c, .warpInFront
.warpNotInFront
    dec c
    jr nz, .checkWarps
.runOriginalMapScript
    ld hl, MapScriptPtr
    ld a, [hli]
    ld h, [hl]
    ld l, a
    jp hl
.warpInFront
    inc hl
    ld a, [hli]
    ld [MapWarpTargetX], a
    ld a, [hli]
    ld [MapWarpTargetY], a
    ld a, [hl]
    ld [MapWarpTargetIDL], a
    jr .runOriginalMapScript

; Map connection handlers.

EasternBorder:
    inc d
WesternBorder:
    inc d
SouthernBorder:
    inc d
NorthernBorder:
    inc d
MapConnectionProcedure:
    call ScriptEventInOverworld
    ret nz
    push de
    call MapChangeConfirmationDialog
    pop de
    and a
    jr z, MapConnectionLoad
    ld c, d
    ld hl, DirectionToJoypadLookup
    ld b, 0
    add hl, bc
    ld a, [hl]
    ld hl, $ccd3
    ld [hl], a
    ld a, 1
    ld [$cd38], a
    jp StartSimulatingJoypadStates

DirectionToJoypadLookup:
    db 0
    db %10000000
    db %01000000
    db %00010000
    db %00100000

; Load the actual connected map.

MapConnectionLoad:
    ld hl, CurrentMapData + 19
.connectionLoadLoop
    ld a, [hli]
    cp d
    jr z, .correctConnection
    inc hl
    inc hl
    inc hl
    inc hl
    jr .connectionLoadLoop
.correctConnection
    ld a, [hli]
    ld [MapWarpTargetIDH], a
    ld a, [hli]
    ld [MapWarpTargetIDL], a
    ld a, [hli]
    ld [MapWarpTargetX], a
    ld a, [hli]
    ld [MapWarpTargetY], a
    jp _StartLoadingMap

; Display the confirmation dialog while switching maps.

MapChangeConfirmationDialog:
    call OpenTextboxInOverworld
    ld hl, MapChangeQuestionText
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    push af
    call CloseTextboxInOverworld
    pop af
    ret
    
MapChangeQuestionText:
    text "About to load a new map."
    next "Are you sure?"
    done

; Note - this generic Yes/No boxset is also used in several other
; functions, not just this one confirmation dialog.

YesNoBoxset:
    db $98,$a4,$b2,$4f,$8d,$ae,$50 ; Yes/No
