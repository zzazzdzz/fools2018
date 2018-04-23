SECTION "Map_1B37", ROM0[$B800]

Map_1B37_Header:
    hdr_tileset         0
    hdr_dimensions      15, 9
    hdr_pointers_a      Map_1B37_Blocks, Map_1B37_TextPointers
    hdr_pointers_b      Map_1B37_Script, Map_1B37_Objects
    hdr_pointers_c      Map_1B37_InitScript, Map_1B37_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $1C2C, 12, 7
    hdr_connection      EAST,  $0110, 1, 9
    
Map_1B37_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_GAMBLER, 5, 12, WALK, NONE, $01
    hdr_object          SPRITE_LITTLE_GIRL, 14, 11, WALK, NONE, $02
    hdr_object          SPRITE_SAILOR, 24, 11, WALK, NONE, $03

Map_1B37_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c790
    rs_fill_3 $c7a5
    rs_fill_len $c7b7, 6
    rs_fill_3 $c7cc
    rs_end

Map_1B37_Blocks:
    db $2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c
    db $2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c
    db $57,$57,$57,$2a,$2c,$2c,$2c,$2c,$2c,$2b,$57,$57,$57,$57,$57
    db $0f,$0f,$0f,$24,$57,$2a,$2c,$2c,$2c,$29,$0b,$0b,$0f,$0f,$0f
    db $0f,$0f,$0f,$0b,$0b,$24,$57,$57,$57,$25,$0b,$0b,$0f,$0f,$0f
    db $0a,$0a,$0a,$0a,$0a,$0a,$74,$74,$0a,$0a,$0a,$0a,$0a,$0f,$0f
    db $0a,$0a,$0a,$0a,$0a,$0a,$6f,$6f,$0a,$0a,$0a,$0a,$0a,$0a,$0a
    db $0a,$6f,$6f,$6f,$0f,$0f,$0f,$0f,$0f,$0f,$6f,$6f,$0a,$0a,$0a
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_1B37_TextPointers:
    dw Map_1B37_TX1
    dw Map_1B37_TX2
    dw Map_1B37_TX3

Map_1B37_InitScript:
    ret
Map_1B37_Script:
    ret

Map_1B37_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Western Glitchland is"
    next "famous for having a lot"
    cont "of mysterious places open"
    cont "for exploration."
    para "Many explorers come here"
    next "in hopes of finding treasure!"
    done

Map_1B37_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I went to the Dark Cave."
    next "Unsurprisingly, it was"
    cont "really dark in there..."
    para "But I heard some item"
    next "might be able to light up"
    cont "the cave."
    done

Map_1B37_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Some time ago, I saw a"
    next "very suspicious guy going"
    cont "down this road."
    para "He kept walking around,"
    next "talking to people and"
    cont "rearranging his items for"
    cont "several hours."
    para "Then, he stood right"
    next "where I am, and viewed"
    cont "his Pokédex."
    para "I couldn't believe it."
    next "He then started flying"
    cont "through walls, his bag was"
    cont "filled with Master Balls,"
    cont "and smooth jazz played"
    cont "from the clouds."
    para "To this day, I have no"
    next "idea what happened..."
    done

