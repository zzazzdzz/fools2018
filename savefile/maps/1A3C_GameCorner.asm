SECTION "Map_1A3C", ROM0[$B800]

Map_1A3C_Header:
    hdr_tileset         0
    hdr_dimensions      6, 5
    hdr_pointers_a      Map_1A3C_Blocks, Map_1A3C_TextPointers
    hdr_pointers_b      Map_1A3C_Script, Map_1A3C_Objects
    hdr_pointers_c      Map_1A3C_InitScript, Map_1A3C_RAMScript
    hdr_palette         $07
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $1631, 2, 4
    
Map_1A3C_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            3, 3, 2, 9, $1A73
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GYM_HELPER, 6, 6, STAY, NONE, $01

Map_1A3C_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c721
    rs_fill_byte $31
    rs_fill_3 $c72d
    rs_fill_byte $52
    rs_fill_3 $c739
    rs_end

Map_1A3C_Blocks:
    db $0f,$20,$0d,$21,$0f,$0f
    db $0f,$7c,$7d,$7e,$0a,$0a
    db $0f,$31,$31,$31,$31,$31
    db $0f,$52,$52,$52,$52,$52
    db $0f,$0f,$0f,$0f,$0f,$0f

Map_1A3C_TextPointers:
    dw Map_1A3C_TX1

Map_1A3C_InitScript:
    ret
Map_1A3C_Script:
    ret

Map_1A3C_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "My luck really sucks."
    next "I never seem to win at the"
    cont "Game Corner."
    para "There's so much luck"
    next "involved here, it really"
    cont "annoys me."
    para "If I wanted to play a fully"
    next "random game, I'd rather"
    cont "play Hearthstone!"
    done

