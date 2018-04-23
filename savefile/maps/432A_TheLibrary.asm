SECTION "Map_432A", ROM0[$B800]

Map_432A_Header:
    hdr_tileset         0
    hdr_dimensions      9, 6
    hdr_pointers_a      Map_432A_Blocks, Map_432A_TextPointers
    hdr_pointers_b      Map_432A_Script, Map_432A_Objects
    hdr_pointers_c      Map_432A_InitScript, Map_432A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $423A, 16, 10
    hdr_connection      EAST,  $0000, 0, 0
    
Map_432A_Objects:
    hdr_border          $43
    hdr_warp_count      1
    hdr_warp            12, 5, 6, 9, $4384
    hdr_sign_count      0
    hdr_object_count    0

Map_432A_RAMScript:
    rs_fill_byte $6b
    rs_fill_3 $c724
    rs_fill_byte $54
    rs_fill_3 $c742
    rs_fill_byte $78
    rs_fill_3 $c751
    rs_fill_byte $6b
    rs_fill_3 $c760
    rs_end

Map_432A_Blocks:
    db $6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b
    db $18,$43,$43,$43,$74,$20,$0d,$21,$19
    db $43,$43,$43,$43,$52,$37,$3a,$7e,$19
    db $54,$54,$54,$54,$0a,$0a,$0a,$0a,$19
    db $78,$78,$78,$78,$78,$78,$78,$78,$19
    db $6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$15

Map_432A_TextPointers:

Map_432A_InitScript:
    ret
Map_432A_Script:
    ret

