SECTION "Map_4C21", ROM0[$B800]

Map_4C21_Header:
    hdr_tileset         0
    hdr_dimensions      11, 9
    hdr_pointers_a      Map_4C21_Blocks, Map_4C21_TextPointers
    hdr_pointers_b      Map_4C21_Script, Map_4C21_Objects
    hdr_pointers_c      Map_4C21_InitScript, Map_4C21_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $4A34, 14, 20
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $4D3A, 1, 5
    
Map_4C21_Objects:
    hdr_border          $0f
    hdr_warp_count      2
    hdr_warp            16, 11, 15, 14, $4C93
    hdr_warp            10, 7, 3, 14, $4C93
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_YOUNG_BOY, 8, 11, STAY, NONE, $01

Map_4C21_RAMScript:
    rs_write_3 $c6fd, $0a, $7b, $0a
    rs_write_3 $c70e, $0a, $7b, $0a
    rs_fill_byte $7b
    rs_fill_3 $c78f
    rs_fill_byte $0a
    rs_fill_3 $c7a0
    rs_end

Map_4C21_Blocks:
    db $0f,$0a,$7b,$0a,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$74,$7b,$74,$0f,$3e,$3f,$3b,$0f,$0f,$0f
    db $0f,$74,$7b,$74,$3e,$2c,$2c,$2c,$3b,$0f,$0f
    db $0f,$6d,$7b,$0a,$24,$06,$2a,$2c,$29,$0f,$0f
    db $0f,$6d,$7b,$7b,$7b,$7b,$24,$2a,$29,$0f,$0f
    db $0f,$0f,$0a,$0a,$0a,$0a,$0f,$24,$70,$0f,$0f
    db $0f,$0f,$6d,$74,$74,$0a,$0f,$6d,$7b,$7b,$7b
    db $0f,$0f,$0f,$0f,$0a,$6e,$0f,$0f,$0b,$0b,$0a
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_4C21_TextPointers:
    dw Map_4C21_TX1

Map_4C21_InitScript:
    ret
Map_4C21_Script:
    ret

Map_4C21_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "The cave here is completely"
    next "pointless."
    para "Just like this whole route."
    done
