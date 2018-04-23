SECTION "Map_3D20", ROM0[$B800]

Map_3D20_Header:
    hdr_tileset         0
    hdr_dimensions      6, 7
    hdr_pointers_a      Map_3D20_Blocks, Map_3D20_TextPointers
    hdr_pointers_b      Map_3D20_Script, Map_3D20_Objects
    hdr_pointers_c      Map_3D20_InitScript, Map_3D20_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $3920, 9, 20
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $3E31, 54, 7
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3D20_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            3, 5, 2, 7, $3D83
    hdr_sign_count      0
    hdr_object_count    0

Map_3D20_RAMScript:
    rs_write_1 $c6fb, $27
    rs_write_1 $c707, $27
    rs_fill_byte $23
    rs_fill_3 $c748
    rs_end

Map_3D20_Blocks:
    db $0f,$0f,$0f,$0f,$27,$0f
    db $0f,$0f,$0f,$0f,$27,$0f
    db $0f,$02,$09,$03,$27,$0f
    db $0f,$7a,$49,$23,$45,$0f
    db $0f,$0f,$27,$7a,$7a,$0f
    db $23,$23,$45,$7a,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f

Map_3D20_TextPointers:

Map_3D20_InitScript:
    ret
Map_3D20_Script:
    ret

