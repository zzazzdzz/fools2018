SECTION "Map_1432", ROM0[$B800]

Map_1432_Header:
    hdr_tileset         0
    hdr_dimensions      6, 5
    hdr_pointers_a      Map_1432_Blocks, Map_1432_TextPointers
    hdr_pointers_b      Map_1432_Script, Map_1432_Objects
    hdr_pointers_c      Map_1432_InitScript, Map_1432_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0E3C, 9, 2
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $1321, 1, 4
    
Map_1432_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            3, 3, 1, 5, $146F
    hdr_sign_count      0
    hdr_object_count    0

Map_1432_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c721
    rs_fill_3 $c72d
    rs_fill_byte $7a
    rs_fill_3 $c74c
    rs_fill_3 $c758
    rs_end

Map_1432_Blocks:
    db $0f,$20,$21,$0f,$0f,$0f
    db $0f,$7c,$7e,$74,$0a,$0a
    db $0f,$0a,$74,$0a,$74,$0a
    db $0f,$07,$07,$07,$0f,$0f
    db $0f,$7a,$7a,$7a,$0f,$0f

Map_1432_TextPointers:

Map_1432_InitScript:
    ret
Map_1432_Script:
    ret

