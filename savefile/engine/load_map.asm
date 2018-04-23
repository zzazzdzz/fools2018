; === load_map.asm
; The map loader.

; Begin loading a new map.

ReceiveMap:
    ld a, PREDEF_PreserveMusicRegisters
    call PredefCmd
    ld c, $20
    ld a, $a3
    call PlayMusic
    coord hl, 0, 0
    ld bc, $0212
    call TextBoxBorder
    coord hl, 1, 1
    ld de, SyncingText
    call PutString
    ld c, 2
    call DelayFrames
.constructSyncReq
    ; Construct a sync request.
    ; Start by setting the content length
    ld hl, StandardSerialBuffer
    ld [hl], 43 + 5
    inc hl
    ld [hl], 0
    ld hl, StandardSerialBuffer + 4
    ld [hl], 3
    ld d, h
    ld e, l
    inc de
    ; Then copy inventory data
    ld hl, $d31c
    ld bc, 41
    call CopyData
    ; Set target map ID
    ld hl, StandardSerialBuffer + 41 + 5
    ld a, [MapWarpTargetIDL]
    ld [hli], a
    ld a, [MapWarpTargetIDH]
    ld [hl], a
    ; Calculate the checksum and send out the request
    ld hl, StandardSerialBuffer
    call FixSerialChecksum
    ld d, h
    ld e, l
    call SerialRequest
    jr c, ReceiveMapFailure
    ; The response contains new event flags + inventory data
    ld hl, StandardSerialBuffer + 20 + 5
    ld de, EventFlagsBitfield
    ld bc, 16
    call CopyData
    ld hl, StandardSerialBuffer + 37 + 5
    ld de, $d31c
    ld bc, 41
    call CopyData
    ; Update fly flags
    ld a, [StandardSerialBuffer + 36 + 5]
    ld [PlayerFlyFlags], a
    ; Update the fun value
    ld a, [StandardSerialBuffer + 78 + 5]
    ld [PlayerFunValue], a
    ; Print the map name
    coord hl, 0, 0
    ld bc, $0212
    call TextBoxBorder
    coord hl, 1, 1
    ld de, LoadingMapText
    call PutString
    coord hl, 1, 1
    ld de, StandardSerialBuffer + 5
    call PutString
    ld c, 2
    call DelayFrames
.constructMapReq
    ; Construct a map request
    ; Set the content length
    ld hl, StandardSerialBuffer
    ld [hl], 2 + 5
    inc hl
    ld [hl], 0
    ; Set command ID 4 (load map)
    ld hl, StandardSerialBuffer + 4
    ld [hl], 4
    inc hl
    ; Set the map ID
    ld a, [MapWarpTargetIDH]
    ld [hli], a
    ld a, [MapWarpTargetIDL]
    ld [hl], a
    ld hl, StandardSerialBuffer
    ; Fix checksum and send out
    call FixSerialChecksum
    ld de, CurrentMapData - 5
    call SerialRequest
    jr c, ReceiveMapFailure
    ; Load the map once it's received
    jp LoadCurrentMap
    
ReceiveMapFailure:
    ld a, $fe
    ld [PreservedMapMusicBank], a
    ld hl, MapLoadFailedText
    call PrintTextEnhanced
    ld de, RetryChoiceText
    ld bc, $0105
    call PrintChoiceMenu
    jp ReceiveMap
    
; Take the target map X and Y positions, and convert them to
; block X/Y + current block pointer for use by the game.
    
PrepareXYPositions:
    ld hl, $c6e8
    ld a, [MapWarpTargetX]
    rrca
    and $7f
    ld c, a
    ld b, 0
    add hl, bc
    inc hl
    ld a, [MapWarpTargetY]
    rrca
    and $7f
    inc a
    ld d, a
    ld a, [$d368]
    add 6
    ld c, a
.yLoop
    add hl, bc
    dec d
    jr nz, .yLoop
.yLoopEnd
    ld a, l
    ld [$d35e], a
    ld a, h
    ld [$d35f], a
    ld a, [MapWarpTargetX]
    ld [$d361], a
    and 1
    ld [$d363], a
    ld a, [MapWarpTargetY]
    ld [$d360], a
    and 1
    ld [$d362], a
    ret

; The main map loading subroutine.

LoadCurrentMap:
    ; Make the music transitions continuous. This makes map loading
    ; wait times a lot more pleasant, since the music doesn't restart
    ; each time a new map is loaded
    call PlayCurrentMapMusic
    ld a, PREDEF_RestoreMusicRegisters
    call PredefCmd
    ld a, [$d35a]
    ld b, a
    ld a, [$d35b]
    ld c, a
    ld a, [PreservedMapMusicID]
    cp b
    jr nz, .resetMapMusic
    ld a, [PreservedMapMusicBank]
    cp c
    jr nz, .resetMapMusic
    ld a, $00
    ld [PreservedMapMusicBank], a
    jr .noResetMapMusic
.resetMapMusic
    ld a, $ff
    ld [PreservedMapMusicBank], a
.noResetMapMusic
    ; Black out the palette so the screen data isn't shown while
    ; it is updated
    call PalAllBlack
    ; Jump in the middle of LoadMapHeader, forcing it to load
    ; map data straight from RAM
    ld hl, CurrentMapData
    call $0dda
    ; Once the header is loaded, load everything else
    call LoadTileBlockMap
    call PrepareXYPositions
    call DisableLCD
    call LoadTilesetTilePatternData
    call LoadCurrentMusicIDToRAM
    ld a, [PreservedMapMusicBank]
    cp $ff
    call z, PlayCurrentMapMusic
    ; Reset a bunch of RAM to safe values
    xor a
    ld [Map5FScriptIndex], a
    ld [$cfc4], a
    ld [$d118], a
    ld [$d119], a
    ld [$d886], a
    ld [$d8a3], a
    ld [$cfc3], a
    ld a, $04
    ld [$d3a7], a
    ld a, $66
    ld [$d35d], a
    call InitMapSprites
    call EnableLCD
    ; Execute the map's RAM script
    ld hl, CurrentMapData + 16
    ld a, [hld]
    ld [$d364], a
    dec hl
    ld a, [hli]
    ld h, [hl]
    ld l, a
    call RunRAMScript
    ; Execute the map's init subroutine
    ld hl, CurrentMapData + 12
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ld de, .return1
    push de
    jp hl
.return1
    ; Repoint the map script to the default one
    ; (DefaultMapScript will call the map's own script too)
    ld a, [$d36d]
    ld [MapScriptPtr], a
    ld a, [$d36e]
    ld [MapScriptPtr+1], a
    ld hl, DefaultMapScript
    ld a, l
    ld [$d36d], a
    ld a, h
    ld [$d36e], a
    ; Redraw the map view by jumping in the middle of the routine
    ; that handles using Cut. This does all of the preparations needed
    ; for the overworld loop to run smoothly
    ld b, b_UsedCut
    ld hl, $6e69
    call Bankswitch
    ld hl, .return2
    push hl
    push af
    ld a, $90
    ldh [$b0], a
    ; Jumping to even more desynced addresses. This lands in the middle
    ; of the CloseTextDisplay subroutine, which will handle unloading the
    ; font and reloading sprite tiles
    jp $28e8
.return2
    call LoadGBPal
    ; Initialize RAM needed for the 3F/4F/5F items to work.
    ld hl, PreparationRAMScript
    call RunRAMScript
    ; Stop surfing if on land
    ld a, [$d6ff]
    and $01
    jr nz, .skipClearingState
    ld hl, $d730
	set 7, [hl]
	xor a
	ld [$d6ff], a
	call LoadWalkingPlayerSpriteGraphics
.skipClearingState
    ; Save the current map's music IDs
    ld a, [$d35a]
    ld [PreservedMapMusicID], a
    ld a, [$d35b]
    ld [PreservedMapMusicBank], a
    ; Completely eradicate the game's stack and jump to the
    ; overworld loop, so the player appears on the new map as if
    ; nothing ever happened
    ld sp, $dfff
    ld a, $3c
    ld [$c104], a
    jp OverworldLoop
    
; The RAM script that initializes RAM values needed for 3F/4F/5F
; items to do their thing
    
PreparationRAMScript:
    ; Repoint 5F to ItemUse5F
    rs_write_term $d059
    nop
    jp ItemUse5F
    db $ff
    ; Repoint 4F to ItemUse4F
    rs_write_term $da64
    jp ItemUse4F
    db $ff
    ; Repoint 3F to ItemUse3F
    rs_write_term $cac2
    jp ItemUse3F
    db $ff
    ; Make the meta map script for Route 16 Gate start loading
    ; a new map.
    rs_write_term $d65f
    db $1E ; Map script ID
    db $00 ; NOP for good measure
    jp StartLoadingMap
    db $ff
    rs_end
    
MapLoadFailedText:
    text "A communication error"
    next "has occured."
    para "Check your connection,"
    next "then press A to retry."
    done
    
SyncingText:
    db $7f,$7f,$7f,$7f,$7f,$92,$98,$8d,$82,$88,$8d,$86,$e7,$4f
    db $7f,$7f,$8f,$ab,$a4,$a0,$b2,$a4,$7f,$b6,$a0,$a8,$b3,$e8,$e8,$e8,$50
LoadingMapText:
    db $4f
    db $7f,$7f,$7f,$7f,$8b,$8e,$80,$83,$88,$8d,$86,$7f,$8c,$80,$8f,$e8,$e8,$e8,$50
RetryChoiceText:
    db $91,$a4,$b3,$b1,$b8,$50
