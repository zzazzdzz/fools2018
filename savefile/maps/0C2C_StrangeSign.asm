SECTION "Map_0C2C", ROM0[$B800]

Map_0C2C_Header:
    hdr_tileset         0
    hdr_dimensions      5, 5
    hdr_pointers_a      Map_0C2C_Blocks, Map_0C2C_TextPointers
    hdr_pointers_b      Map_0C2C_Script, Map_0C2C_Objects
    hdr_pointers_c      Map_0C2C_InitScript, Map_0C2C_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0932, 1, 12
    
Map_0C2C_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        3, 5, $01
    hdr_object_count    0

Map_0C2C_RAMScript:
    rs_fill_byte $51
    rs_fill_3 $c71c
    rs_fill_byte $31
    rs_fill_3 $c727
    rs_fill_byte $52
    rs_fill_3 $c732
    rs_end

Map_0C2C_Blocks:
    db $0f,$0f,$0f,$0f,$0f
    db $62,$51,$51,$51,$51
    db $4e,$08,$31,$31,$31
    db $50,$52,$52,$52,$52
    db $0f,$0f,$0f,$0f,$0f

Map_0C2C_TextPointers:
    dw Map_0C2C_TX1

Map_0C2C_InitScript:
    ld a, 1
    ld [Map5FScriptIndex], a
    ret
Map_0C2C_Script:
    ret

Map_0C2C_TX1:
    TX_ASM
    jp EnhancedTextOnly
    tx_braille
    text "USE_THE_FIFTH"
    next "FLOOR_ITEM"
    done

