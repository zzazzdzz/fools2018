SECTION "Map_2435", ROM0[$B800]

Map_2435_Header:
    hdr_tileset         0
    hdr_dimensions      10, 8
    hdr_pointers_a      Map_2435_Blocks, Map_2435_TextPointers
    hdr_pointers_b      Map_2435_Script, Map_2435_Objects
    hdr_pointers_c      Map_2435_InitScript, Map_2435_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $2536, 3, 1
    hdr_connection      WEST,  $2632, 10, 6
    hdr_connection      EAST,  $232D, 2, 18
    
Map_2435_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            5, 7, 3, 7, $2478
    hdr_sign_count      0
    hdr_object_count    0

Map_2435_RAMScript:
    rs_fill_byte $31
    rs_fill_3 $c738
    rs_fill_3 $c785
    rs_write_1 $c79d, $31
    rs_write_1 $c7ad, $31
    rs_end

Map_2435_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$6c,$6c,$6c,$6c,$36,$0f,$0f,$0f,$0f
    db $31,$31,$38,$39,$31,$6e,$0f,$0f,$0f,$0f
    db $0f,$74,$3c,$3d,$31,$74,$6c,$36,$0f,$0f
    db $0f,$6d,$31,$31,$31,$31,$31,$0a,$6c,$0f
    db $0f,$6d,$31,$0a,$6f,$74,$31,$74,$0a,$0f
    db $0f,$6d,$31,$6e,$0f,$6d,$31,$31,$31,$31
    db $0f,$0f,$31,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_2435_TextPointers:

Map_2435_InitScript:
    ret
Map_2435_Script:
    ret

