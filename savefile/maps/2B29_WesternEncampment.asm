SECTION "Map_2B29", ROM0[$B800]

Map_2B29_Header:
    hdr_tileset         0
    hdr_dimensions      10, 8
    hdr_pointers_a      Map_2B29_Blocks, Map_2B29_TextPointers
    hdr_pointers_b      Map_2B29_Script, Map_2B29_Objects
    hdr_pointers_c      Map_2B29_InitScript, Map_2B29_RAMScript
    hdr_palette         $09
    hdr_music           MUSIC_CINNABAR, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $2C29, 28, 3
    hdr_connection      EAST,  $2731, 1, 20
    
Map_2B29_Objects:
    hdr_border          $0f
    hdr_warp_count      4
    hdr_warp            15, 3, 2, 7, $2B7D
    hdr_warp            5, 3, 2, 7, $2B7C
    hdr_warp            4, 11, 3, 9, $2B7E
    hdr_warp            3, 11, 2, 9, $2B7E
    hdr_sign_count      2
    hdr_signpost        10, 8, $04
    hdr_signpost        9, 11, $03
    hdr_object_count    2
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 9, 8, STAY, RIGHT, $01
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 7, 13, WALK, LEFT_RIGHT, $02

Map_2B29_RAMScript:
    rs_fill_byte $31
    rs_fill_3 $c738
    rs_fill_3 $c785
    rs_end

Map_2B29_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$02,$09,$03,$0f,$0f,$02,$03,$0f
    db $31,$31,$31,$31,$31,$31,$31,$31,$31,$0f
    db $0f,$20,$0d,$21,$0a,$74,$31,$0f,$0f,$0f
    db $0f,$68,$7f,$69,$74,$40,$31,$0f,$0f,$0f
    db $0f,$7c,$3a,$7e,$79,$74,$31,$0f,$0f,$0f
    db $0f,$31,$31,$31,$31,$31,$31,$31,$31,$31
    db $0f,$1c,$1c,$1c,$1c,$1c,$0f,$0f,$0f,$0f

Map_2B29_TextPointers:
    dw Map_2B29_TX1
    dw Map_2B29_TX2
    dw Map_2B29_TX3
    dw Map_2B29_TX4

Map_2B29_InitScript:
    ret
Map_2B29_Script:
    ret

Map_2B29_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "The inscription on this"
    next "pillar says:"
    cont "'Never give up'."
    para "I think it's interesting"
    next "how the ancients share"
    cont "their vast knowledge and"
    cont "experiences with us."
    para "This is why I decided"
    next "to become an explorer."
    done

Map_2B29_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "This town is the home to all"
    next "explorers, both amateur and"
    cont "professional."
    para "It's no wonder."
    next "Western Glitchland is filled"
    cont "with places to explore!"
    done

Map_2B29_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "GLITCHLAND EXPLORER"
    next "SINDICATE"
    done

Map_2B29_TX4:
    TX_ASM
    jp EnhancedTextOnly
    tx_braille
    text "LETTUCE"
    done

