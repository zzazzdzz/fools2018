SECTION "Map_2276", ROM0[$B800]

Map_2276_Header:
    hdr_tileset         22
    hdr_dimensions      12, 8
    hdr_pointers_a      Map_2276_Blocks, Map_2276_TextPointers
    hdr_pointers_b      Map_2276_Script, Map_2276_Objects
    hdr_pointers_c      Map_2276_InitScript, Map_2276_RAMScript
    hdr_palette         $08
    hdr_music           MUSIC_CINNABAR_MANSION, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2276_Objects:
    hdr_border          $2e
    hdr_warp_count      2
    hdr_warp            3, 12, 2, 9, $2277
    hdr_warp            2, 9, 3, 2, $2275
    hdr_sign_count      1
    hdr_signpost        17, 13, $01
    hdr_object_count    0

Map_2276_RAMScript:
    rs_end

Map_2276_Blocks:
    db $3c,$3d,$3d,$3d,$3d,$3e,$3d,$3d,$3d,$3d,$3d,$3e
    db $44,$0d,$0e,$19,$19,$71,$26,$13,$1b,$1b,$15,$46
    db $44,$7b,$0e,$31,$06,$35,$35,$39,$03,$27,$17,$46
    db $50,$37,$0e,$0e,$06,$13,$0e,$1b,$1b,$1b,$19,$46
    db $44,$21,$0e,$0e,$0e,$0e,$0e,$0c,$03,$02,$1b,$5d
    db $50,$49,$49,$49,$58,$2d,$57,$51,$0e,$39,$17,$5d
    db $44,$6e,$0e,$1d,$1d,$1d,$1d,$46,$45,$29,$0e,$46
    db $48,$49,$49,$49,$49,$49,$49,$4a,$49,$49,$49,$4a

Map_2276_TextPointers:
    dw Map_2276_TX1

Map_2276_InitScript:
    ret
Map_2276_Script:
    ld hl, Map_2276_ReturnCoords
    call ArePlayerCoordsInArray
    jr nc, .skipClr
    ld a, $0e
    ld [$c780], a
.skipClr
    ld a, [$cd38]
    and a
    jr nz, .spinning
    xor a
	ld [$cd6b], a
    ld hl, $d735
	res 7, [hl]
    ld hl, $d6ff
    res 0, [hl]
    ld a, [$d360]
	ld b, a
	ld a, [$d361]
	ld c, a
    ld hl, Map_2276_ArrowTileMovement
	call DecodeArrowMovementRLE
	cp $ff
	ret z
    ld hl, $d735
	set 7, [hl]
    ld hl, $d6ff
    set 0, [hl]
	call StartSimulatingJoypadStates
	ld a, SFX_ARROW_TILES
	call PlaySound
    ld a, $ff
	ld [$cd6b], a
    ret
.spinning
    ld hl, LoadSpinnerArrowTiles
    ld b, b_LoadSpinnerArrowTiles
    jp Bankswitch
    
Map_2276_ReturnCoords:
    db 12, 3, $ff

Map_2276_TX1:
    TX_ASM
    ld a, $0e
    ld [$c780], a
    ld hl, .txt
    call PrintTextEnhanced
    jp TextScriptEnd
.txt
    text "A secret switch."
    para "You pressed it."
    tx_snd SFX_SWITCH
    done

Map_2276_ArrowTileMovement:
    arrow_tile 12, 3,  .movementR2
    arrow_tile 16, 3,  .movementL2
    arrow_tile 18, 3,  .movementL2L2
    arrow_tile 17, 4,  .movementR3U2
    arrow_tile 19, 4,  .movementR1U2
    arrow_tile 20, 4,  .movementU2
    arrow_tile 16, 5,  .movementR2U2L4
    arrow_tile 18, 5,  .movementU2L4
    arrow_tile 14, 7,  .movementL4
    arrow_tile 16, 7,  .movementL2L4
    arrow_tile 18, 7,  .movementL8
    arrow_tile 17, 8,  .movementR2D4
    arrow_tile 19, 8,  .movementD4
    arrow_tile 16, 9,  .movementR2U2L8
    arrow_tile 18, 9,  .movementU2L8
    arrow_tile 20, 9,  .movementL2U2L8
    arrow_tile 20, 10, .movementU1L2U2L8
    db $ff
.movementR2
    db D_RIGHT, 2
    db $ff
.movementL2L2
    db D_LEFT, 2
.movementL2
    db D_LEFT, 2
    db $ff
.movementU2
    db D_UP, 2
    db $ff
.movementR2U2L4
    db D_LEFT, 4
    db D_UP, 2
    db D_RIGHT, 2
    db $ff
.movementU2L4
    db D_LEFT, 4
    db D_UP, 2
    db $ff
.movementR3U2
    db D_UP, 2
    db D_RIGHT, 3
    db $ff
.movementR1U2
    db D_UP, 2
    db D_RIGHT, 1
    db $ff
.movementR2U2L8
    db D_LEFT, 8
    db D_UP, 2
    db D_RIGHT, 2
    db $ff
.movementU2L8
    db D_LEFT, 8
    db D_UP, 2
    db $ff
.movementL8
    db D_LEFT, 8
    db $ff
.movementL2L4
    db D_LEFT, 2
.movementL4
    db D_LEFT, 4
    db $ff
.movementR2D4
    db D_DOWN, 4
    db D_RIGHT, 2
    db $ff
.movementD4
    db D_DOWN, 4
    db $ff
.movementU1L2U2L8
    db D_LEFT, 8
    db D_UP, 2
    db D_LEFT, 2
    db D_UP, 1
    db $ff
.movementL2U2L8
    db D_LEFT, 8
    db D_UP, 2
    db D_LEFT, 2
    db $ff

