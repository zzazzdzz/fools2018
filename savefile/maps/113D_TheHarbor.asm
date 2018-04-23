SECTION "Map_113D", ROM0[$B800]

Map_113D_Header:
    hdr_tileset         0
    hdr_dimensions      14, 12
    hdr_pointers_a      Map_113D_Blocks, Map_113D_TextPointers
    hdr_pointers_b      Map_113D_Script, Map_113D_Objects
    hdr_pointers_c      Map_113D_InitScript, Map_113D_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $1321, 21, 20
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0E3C, 14, 5
    hdr_connection      EAST,  $123D, 1, 8
    
Map_113D_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            21, 9, 2, 7, $116E
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_ROCKER, 17, 11, STAY, DOWN, $01
    hdr_object          SPRITE_FOULARD_WOMAN, 8, 4, STAY, LEFT, $02
    hdr_object          SPRITE_GENTLEMAN, 13, 17, WALK, LEFT_RIGHT, $03

Map_113D_RAMScript:
    rs_fill_byte $0a
    rs_fill_2 $c70a
    rs_fill_2 $c71e
    rs_fill_byte $51
    rs_fill_3 $c7c4
    rs_write_term  $c7d5
    db $51,$51,$51,$23,$23,$23,$ff
    rs_write_term  $c7e9
    db $23,$23,$23,$52,$52,$52,$ff
    rs_fill_byte $52
    rs_fill_3 $c7fd
    rs_end

Map_113D_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0a,$0a,$0f
    db $0f,$1d,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1e,$0f
    db $0f,$65,$54,$43,$54,$54,$54,$54,$43,$43,$43,$43,$64,$0f
    db $0f,$65,$78,$43,$78,$54,$78,$78,$43,$43,$43,$43,$64,$0f
    db $0f,$65,$43,$43,$43,$54,$43,$43,$43,$43,$02,$03,$64,$0f
    db $0f,$65,$54,$54,$54,$54,$54,$54,$54,$54,$54,$54,$64,$0f
    db $0f,$65,$54,$78,$78,$78,$78,$78,$78,$78,$78,$54,$64,$0f
    db $0f,$65,$54,$43,$43,$43,$43,$43,$43,$43,$43,$54,$64,$0f
    db $51,$51,$0a,$51,$51,$51,$51,$51,$51,$51,$51,$0a,$51,$51
    db $23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23,$23
    db $52,$52,$52,$52,$52,$52,$52,$52,$52,$52,$52,$52,$52,$52
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_113D_TextPointers:
    dw Map_113D_TX1
    dw Map_113D_TX2
    dw Map_113D_TX3

Map_113D_InitScript:
    ret
Map_113D_Script:
    ret

Map_113D_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "PROf NOG is high regard."
    next "I get many amaze when"
    cont "he do science..."
    para "So smart and hansome!!"
    para "Please don.t tell I love him."
    next "I embarris."
    done

Map_113D_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Some days, you just look"
    next "out onto the pond, and"
    cont "think to yourself..."
    para "My God... why is that"
    next "Pokémon Ball moving on"
    cont "its own?"
    para "WHY IS IT MOVING ON"
    next "ITS OWN?!"
    done

Map_113D_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Many foreigners from other"
    next "regions come to visit"
    cont "Northern Glitchland."
    para "We mostly get people from"
    next "Vietnam, not sure why."
    para "There's even someone"
    next "claiming to be from the"
    cont "JANTO region."
    done

