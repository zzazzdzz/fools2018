SECTION "Map_2F81", ROM0[$B800]

Map_2F81_Header:
    hdr_tileset         19
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_2F81_Blocks, Map_2F81_TextPointers
    hdr_pointers_b      Map_2F81_Script, Map_2F81_Objects
    hdr_pointers_c      Map_2F81_InitScript, Map_2F81_RAMScript
    hdr_palette         $01
    hdr_music           MUSIC_CELADON, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2F81_Objects:
    hdr_border          $0f
    hdr_warp_count      2
    hdr_warp            5, 7, 14, 4, $2F38
    hdr_warp            4, 7, 14, 4, $2F38
    hdr_sign_count      3
    hdr_signpost        5, 1, $05
    hdr_signpost        1, 4, $04
    hdr_signpost        1, 1, $03
    hdr_object_count    2
    hdr_object          SPRITE_BUG_CATCHER, 0, 5, STAY, UP, $02
    hdr_object          SPRITE_BRUNETTE_GIRL, 3, 3, STAY, NONE, $01

Map_2F81_RAMScript:
    rs_end

Map_2F81_Blocks:
    db $0e,$05,$0e,$24
    db $23,$0b,$23,$0b
    db $0a,$0b,$0b,$0b
    db $0b,$0b,$41,$0b

Map_2F81_TextPointers:
    dw Map_2F81_TX1
    dw Map_2F81_TX2
    dw Map_2F81_TX3
    dw Map_2F81_TX4
    dw Map_2F81_TX5

Map_2F81_InitScript:
    ret
Map_2F81_Script:
    ret

Map_2F81_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "We? We're just a humble"
    next "game studio."
    para "We're working on our launch"
    next "title: Gears of Halo, Theft"
    cont "Auto 5."
    para "We were also designated by"
    next "Valve to help in the"
    cont "production and development"
    cont "of Half-Life 3."
    done

Map_2F81_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "In our studio, we value"
    next "simplicity and ease of use."
    para "That's why we program all"
    next "of our games in Assembly."
    para "It is the simplest of"
    next "programming languages,"
    cont "no complicated constructs,"
    cont "just processor instructions."
    para "I think our launch title"
    next "should be ready in about"
    cont "5 or 6 years."
    done

Map_2F81_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Someone was browsing xkcd"
    next "instead of working..."
    done

Map_2F81_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "It's the game program!"
    next "Messing with it could bug"
    cont "out the game!"
    done

Map_2F81_TX5:
    TX_ASM
    jp EnhancedTextOnly
    text "Build failed: 3964 errors,"
    next "1516 warnings."
    para "That's what it says on the"
    next "screen."
    done

