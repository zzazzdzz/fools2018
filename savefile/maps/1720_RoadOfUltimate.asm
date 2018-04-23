SECTION "Map_1720", ROM0[$B800]

Map_1720_Header:
    hdr_tileset         0
    hdr_dimensions      20, 7
    hdr_pointers_a      Map_1720_Blocks, Map_1720_TextPointers
    hdr_pointers_b      Map_1720_Script, Map_1720_Objects
    hdr_pointers_c      Map_1720_InitScript, Map_1720_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $1631, 20, 4
    hdr_connection      EAST,  $182A, 1, 19
    
Map_1720_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            6, 5, 8, 13, $1730
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_OLD_MEDIUM_WOMAN, 30, 8, STAY, NONE, $01
    hdr_object          SPRITE_LASS, 17, 7, STAY, NONE, $02
    hdr_object          SPRITE_YOUNG_BOY, 6, 10, STAY, NONE, $03

    hdr_warp            6, 5, 8, 13, $1730
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_OLD_MEDIUM_WOMAN, 30, 8, STAY, NONE, $01
    hdr_object          SPRITE_LASS, 17, 7, STAY, NONE, $02
    hdr_object          SPRITE_YOUNG_BOY, 6, 10, STAY, NONE, $03

Map_1720_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c767
    rs_fill_3 $c781
    rs_fill_3 $c79e
    rs_fill_3 $c7b8
    rs_end

Map_1720_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$3e,$3f,$3f,$3b,$1d,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1e,$0b,$0b,$0b,$0a,$0a,$0a
    db $0f,$24,$57,$06,$25,$0b,$0b,$65,$43,$43,$43,$43,$64,$74,$74,$0a,$0a,$0a,$0a,$0a
    db $0f,$0b,$0a,$0a,$0a,$0a,$0a,$51,$51,$51,$51,$51,$51,$0a,$0a,$0a,$0a,$0a,$0a,$0f
    db $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$0b,$0b,$3e,$3b,$0f
    db $0a,$0a,$0a,$74,$74,$0a,$1d,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1e,$0b,$28,$29,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$24,$25,$0f

Map_1720_TextPointers:
    dw Map_1720_TX1
    dw Map_1720_TX2
    dw Map_1720_TX3

Map_1720_InitScript:
    ld a, [Map_1720_HourModuloBuf]
    sub "0"
    add $30
    ld [$d3b5], a
    ret
Map_1720_Script:
    ret

Map_1720_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I once went to the"
    next "Altering Cave, but there"
    cont "was nothing interesting"
    cont "inside."
    para "I returned after a few hours,"
    next "and the inside looked"
    cont "completely different!"
    para "However, I still didn't"
    next "find anything of interest"
    cont "there..."
    done

Map_1720_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Do you know Lost Woods?"
    para "I remember there was a"
    next "very similar puzzle in"
    cont "'The Legend of Zelda'."
    para "Maybe the solution from"
    next "that game would work"
    cont "here too?"
    para "Except replacing west with"
    next "east, since you come from"
    cont "the west."
    para "I need to try it!"
    done

Map_1720_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "TRAINED ON THE ROAD"
    next "OF ULTIMATE."
    done

Map_1720_HourModuloBuf:
    SUBST_HOUR_MODULO3

