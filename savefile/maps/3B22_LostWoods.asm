SECTION "Map_3B22", ROM0[$B800]

Map_3B22_Header:
    hdr_tileset         0
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_3B22_Blocks, Map_3B22_TextPointers
    hdr_pointers_b      Map_3B22_Script, Map_3B22_Objects
    hdr_pointers_c      Map_3B22_InitScript, Map_3B22_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
.northConnection
    hdr_connection      NORTH, $3B22, 7, 12
.southConnection
    hdr_connection      SOUTH, $3B22, 7, 1
.westConnection
    hdr_connection      WEST,  $3A3E, 26, 8
.eastConnection
    hdr_connection      EAST,  $3B22, 1, 7
    
Map_3B22_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        7, 7, $03
    hdr_object_count    2
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 9, 10, STAY, UP, $01
    hdr_object          SPRITE_BIKE_SHOP_GUY, 4, 5, STAY, NONE, $02

Map_3B22_RAMScript:
    rs_write_1 $c6fb, $7a
    rs_write_1 $c708, $7a
    rs_fill_byte $7a
    rs_fill_3 $c736
    rs_fill_3 $c740
    rs_write_1 $c770, $7a
    rs_write_1 $c77d, $7a
    rs_end

Map_3B22_Blocks:
    db $0f,$0f,$0f,$7a,$0f,$0f,$0f
    db $0f,$62,$51,$7a,$51,$63,$0f
    db $0f,$4e,$7a,$7a,$7a,$4d,$0f
    db $7a,$7a,$7a,$79,$7a,$7a,$7a
    db $0f,$4e,$7a,$7a,$7a,$4d,$0f
    db $0f,$50,$52,$7a,$52,$4f,$0f
    db $0f,$0f,$0f,$7a,$0f,$0f,$0f

Map_3B22_TextPointers:
    dw Map_3B22_TX1
    dw Map_3B22_TX2
    dw Map_3B22_TX3

Map_3B22_InitScript:
    ld a, 255
    ld [$d13a], a
    call Map_3B22_DetermineCurrectDirection
    ld a, [MapScriptGeneralPurpose]
    rlca
    rlca
    and %11111100
    or b
    ld [MapScriptGeneralPurpose], a
    call Map_3B22_SearchAndReplaceMapConnections
    ret
Map_3B22_Script:
    ld a, [$d13a]
    cp 255-100
    ret nc
    ld de, Map_3B22_Header.southConnection
    ld hl, Map_3B22_ConnectionSubC
    ld bc, 5
    call CopyData
    ld a, $ff
    ld [$d13a], a
    ret
    
Map_3B22_DetermineCurrectDirection:
    ld a, [$d361]
    cp 1
    jr z, .east
    ld a, [$d360]
    cp 1
    jr z, .south
    cp 12
    jr z, .north
    ret
.east
    ld b, 1
    ret
.south
    ld b, 2
    ret
.north
    ld b, 3
    ret
    
Map_3B22_SearchAndReplaceMapConnections:
    ld a, [MapScriptGeneralPurpose]
    and %00111111
    cp %00110110
    jr z, .pathNES
    cp %00100101
    jr z, .pathSEE
    cp %00010101
    jr z, .pathEEE
    ret
.pathNES
    ld de, Map_3B22_Header.eastConnection
    ld hl, Map_3B22_ConnectionSubA
    ld bc, 5
    jp CopyData
.pathSEE
    ld de, Map_3B22_Header.northConnection
    ld hl, Map_3B22_ConnectionSubB
    ld bc, 5
    jp CopyData
.pathEEE
    ld de, Map_3B22_Header.northConnection
    ld hl, Map_3B22_ConnectionEasternEdge
    ld bc, 5
    jp CopyData
    
Map_3B22_ConnectionSubA:
    hdr_connection_q    EAST,  $3B30, 7, 12
Map_3B22_ConnectionSubB:
    hdr_connection_q    NORTH, $3B31, 7, 12
Map_3B22_ConnectionSubC:
    hdr_connection_q    SOUTH, $3B32, 7, 12
Map_3B22_ConnectionEasternEdge:
    hdr_connection_q    NORTH, $3C36, 1, 3

Map_3B22_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "If you ever get lost, going"
    next "to the west is a sure way"
    cont "to get out."
    done

Map_3B22_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I heard one of the residents"
    next "of the Eastern Encampment"
    cont "knows how to get to the"
    cont "Eastern Edge from here."
    done

Map_3B22_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Lost Woods"
    para "Warning: you may get lost"
    next "here. Proceed with caution."
    done

