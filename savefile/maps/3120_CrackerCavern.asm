SECTION "Map_3120", ROM0[$B800]

Map_3120_Header:
    hdr_tileset         0
    hdr_dimensions      7, 9
    hdr_pointers_a      Map_3120_Blocks, Map_3120_TextPointers
    hdr_pointers_b      Map_3120_Script, Map_3120_Objects
    hdr_pointers_c      Map_3120_InitScript, Map_3120_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $302C, 8, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3120_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            6, 5, 3, 3, $318B
    hdr_sign_count      0
    hdr_object_count    0

Map_3120_RAMScript:
    rs_write_3 $c789, $6d, $31, $6e
    rs_write_3 $c796, $6d, $31, $6e
    rs_end

Map_3120_Blocks:
    db $0f,$28,$2c,$2c,$2c,$29,$0f
    db $0f,$28,$2c,$2c,$2c,$29,$0f
    db $0f,$24,$57,$06,$57,$25,$0f
    db $0f,$9a,$bf,$ec,$b1,$a1,$0f
    db $0f,$7a,$9a,$b3,$96,$7a,$0f
    db $0f,$7a,$7a,$31,$7a,$7a,$0f
    db $0f,$6d,$7a,$31,$7a,$6e,$0f
    db $0f,$0f,$7a,$31,$7a,$0f,$0f
    db $0f,$0f,$6d,$31,$6e,$0f,$0f

Map_3120_TextPointers:

Map_3120_InitScript:
    xor a
    ld [MapScriptGeneralPurpose], a
    ret
Map_3120_Script:
    ret
