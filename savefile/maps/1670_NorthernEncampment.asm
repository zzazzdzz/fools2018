SECTION "Map_1670", ROM0[$B800]

Map_1670_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_1670_Blocks, Map_1670_TextPointers
    hdr_pointers_b      Map_1670_Script, Map_1670_Objects
    hdr_pointers_c      Map_1670_InitScript, Map_1670_RAMScript
    hdr_palette         $07
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1670_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 5, 8, $1631
    hdr_warp            2, 7, 5, 8, $1631
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_LORELEI, 2, 4, STAY, RIGHT, $01

Map_1670_RAMScript:
    rs_end

Map_1670_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_1670_TextPointers:
    dw Map_1670_TX1

Map_1670_InitScript:
    ld hl, StandardSerialBuffer
    ld a, $50
    ld bc, 4
    call FillMemory
    ld hl, StandardSerialBuffer
    ld de, PlayerFunValue
    ld bc, $4103
    call PrintNumber
    ld hl, StandardSerialBuffer
    ld a, PREDEF_CharsetStandardToEnhanced
    call PredefCmd
    ld de, Map_1670_FunValueBuffer
    ld hl, StandardSerialBuffer
    ld bc, 4
    call CopyData
Map_1670_Script:
    ret

Map_1670_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Let me see..."
    next "Your aura..."
    para "I think it has a grade of"
    next ""
    tx_buf Map_1670_FunValueBuffer
    text " points."
    para "That's really impressive..."
    done

Map_1670_FunValueBuffer:
    db $50,$50,$50,$50
    

