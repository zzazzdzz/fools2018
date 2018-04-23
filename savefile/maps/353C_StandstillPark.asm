SECTION "Map_353C", ROM0[$B800]

Map_353C_Header:
    hdr_tileset         0
    hdr_dimensions      6, 7
    hdr_pointers_a      Map_353C_Blocks, Map_353C_TextPointers
    hdr_pointers_b      Map_353C_Script, Map_353C_Objects
    hdr_pointers_c      Map_353C_InitScript, Map_353C_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $3724, 18, 10
    hdr_connection      SOUTH, $3621, 18, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $3420, 1, 7
    
Map_353C_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_ROCKER, 6, 5, STAY, NONE, $01

Map_353C_RAMScript:
    rs_write_1 $c6f8, $7a
    rs_write_1 $c704, $7a
    rs_fill_byte $23
    rs_fill_3 $c739
    rs_fill_byte $7a
    rs_fill_3 $c745
    rs_write_1 $c765, $7a
    rs_write_1 $c771, $7a
    rs_end

Map_353C_Blocks:
    db $0f,$5d,$0f,$0f,$51,$63
    db $0f,$27,$74,$0f,$74,$4d
    db $0f,$27,$7a,$7a,$7a,$4d
    db $0f,$26,$23,$23,$23,$23
    db $0f,$27,$74,$7a,$7a,$7a
    db $0f,$44,$48,$74,$0f,$0f
    db $0f,$0f,$5e,$0f,$0f,$0f

Map_353C_TextPointers:
    dw Map_353C_TX1

Map_353C_InitScript:
    ret
Map_353C_Script:
    ret

Map_353C_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "The legends say that the"
    next "Road of Progression will"
    cont "change its appearance,"
    cont "depending on how long"
    cont "you've been playing."
    para "The same goes for the"
    next "Road of Regression."
    done
