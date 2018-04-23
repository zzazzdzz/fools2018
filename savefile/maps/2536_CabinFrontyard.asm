SECTION "Map_2536", ROM0[$B800]

Map_2536_Header:
    hdr_tileset         0
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_2536_Blocks, Map_2536_TextPointers
    hdr_pointers_b      Map_2536_Script, Map_2536_Objects
    hdr_pointers_c      Map_2536_InitScript, Map_2536_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $2435, 5, 14
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2536_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        9, 9, $01
    hdr_object_count    0

Map_2536_RAMScript:
    rs_write_1 $c6f8, $31
    rs_write_1 $c704, $31
    rs_end

Map_2536_Blocks:
    db $0f,$31,$0f,$0f,$0f,$0f
    db $0f,$31,$6c,$6c,$6c,$36
    db $0f,$31,$31,$31,$31,$6e
    db $0f,$6f,$6f,$0a,$31,$6e
    db $0f,$0f,$0f,$6d,$08,$6e
    db $0f,$0f,$0f,$0f,$6f,$0f

Map_2536_TextPointers:
    dw Map_2536_TX1
    dw Map_2536_TX1

Map_2536_InitScript:
    ret
Map_2536_Script:
    ret

Map_2536_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "A detailed map of Glitchland"
    next "is crudely drawn here."
    para "Yet, some things are off..."
    next "Certain locations are in"
    cont "different places, and some"
    cont "don't exist at all..."
    done
