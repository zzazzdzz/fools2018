SECTION "Map_1631", ROM0[$B800]

Map_1631_Header:
    hdr_tileset         0
    hdr_dimensions      11, 10
    hdr_pointers_a      Map_1631_Blocks, Map_1631_TextPointers
    hdr_pointers_b      Map_1631_Script, Map_1631_Objects
    hdr_pointers_c      Map_1631_InitScript, Map_1631_RAMScript
    hdr_palette         $07
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $152D, 7, 1
    hdr_connection      WEST,  $1A3C, 10, 5
    hdr_connection      EAST,  $1720, 1, 9
    
Map_1631_Objects:
    hdr_border          $0f
    hdr_warp_count      3
    hdr_warp            5, 7, 2, 7, $1670
    hdr_warp            13, 11, 2, 7, $1671
    hdr_warp            5, 15, 2, 7, $1672
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_FISHER2, 12, 4, WALK, ALL, $02
    hdr_object          SPRITE_GIRL, 10, 13, WALK, ALL, $01

Map_1631_RAMScript:
    rs_fill_byte $55
    rs_fill_3 $c72c
    rs_fill_len $c73a, 6
    rs_fill_3 $c74b
    rs_fill_3 $c7cf
    rs_fill_3 $c7e0
    rs_end

Map_1631_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $90,$97,$80,$0a,$74,$0a,$74,$4d,$55,$55,$55
    db $bf,$0a,$0a,$74,$0a,$74,$0a,$4d,$5d,$55,$55
    db $0f,$5d,$02,$09,$03,$52,$52,$4f,$27,$55,$0f
    db $0f,$26,$23,$23,$23,$23,$23,$23,$22,$55,$0f
    db $0f,$27,$55,$55,$55,$55,$02,$03,$27,$55,$0f
    db $0f,$27,$20,$21,$55,$55,$55,$55,$27,$55,$0f
    db $0f,$27,$7c,$7e,$55,$55,$55,$55,$27,$55,$0f
    db $0f,$44,$23,$23,$23,$23,$23,$23,$22,$55,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$55,$5e,$55,$0f

Map_1631_TextPointers:
    dw Map_1631_TX1
    dw Map_1631_TX2

Map_1631_InitScript:
    ret
Map_1631_Script:
    ret

Map_1631_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Oh, don't tell me you"
    next "don't have a BIKE yet?"
    para "The Cycling Shop in"
    next "Western Glitchland is"
    cont "where you should go!"
    done

Map_1631_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Technology is incredible!"
    para "By extending the link"
    next "cable technology to the"
    cont "Internet, you can stream"
    cont "dank memes directly to"
    cont "your Gameboy system."
    para "The power of science is"
    next "staggering!"
    done

