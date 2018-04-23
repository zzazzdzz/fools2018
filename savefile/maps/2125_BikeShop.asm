SECTION "Map_2125", ROM0[$B800]

Map_2125_Header:
    hdr_tileset         0
    hdr_dimensions      6, 5
    hdr_pointers_a      Map_2125_Blocks, Map_2125_TextPointers
    hdr_pointers_b      Map_2125_Script, Map_2125_Objects
    hdr_pointers_c      Map_2125_InitScript, Map_2125_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $1D3B, 12, 12
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2125_Objects:
    hdr_border          $0b
    hdr_warp_count      1
    hdr_warp            6, 5, 3, 7, $2174
    hdr_sign_count      1
    hdr_signpost        9, 7, $01
    hdr_object_count    0

Map_2125_RAMScript:
    rs_fill_byte $31
    rs_fill_3 $c724
    rs_end

Map_2125_Blocks:
    db $62,$51,$51,$51,$51,$63
    db $4e,$74,$0c,$0d,$0e,$4d
    db $31,$31,$10,$3a,$00,$4d
    db $4e,$31,$31,$31,$08,$4d
    db $50,$52,$52,$52,$52,$4f

Map_2125_TextPointers:
    dw Map_2125_TX1

Map_2125_InitScript:
    ret
Map_2125_Script:
    ret

Map_2125_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "You can slide freely"
    next "everywhere!"
    para "GLITCHLAND BIKE SHOP"
    done

