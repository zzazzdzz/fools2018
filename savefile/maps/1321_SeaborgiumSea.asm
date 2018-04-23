SECTION "Map_1321", ROM0[$B800]

Map_1321_Header:
    hdr_tileset         0
    hdr_dimensions      12, 11
    hdr_pointers_a      Map_1321_Blocks, Map_1321_TextPointers
    hdr_pointers_b      Map_1321_Script, Map_1321_Objects
    hdr_pointers_c      Map_1321_InitScript, Map_1321_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $113D, 23, 1
    hdr_connection      WEST,  $1432, 10, 4
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1321_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_DAISY, 17, 4, STAY, NONE, $01
    hdr_object          SPRITE_FISHER, 5, 15, STAY, RIGHT, $02
    hdr_object          SPRITE_SWIMMER, 7, 6, STAY, NONE, $03

Map_1321_RAMScript:
    rs_fill_byte $6b
    rs_fill_3 $c71e
    rs_fill_byte $0a
    rs_fill_3 $c730
    rs_fill_3 $c742
    rs_fill_byte $1f
    rs_fill_3 $c754
    rs_fill_byte $6b
    rs_fill_3 $c766
    rs_fill_3 $c7bd
    rs_write_3 $c7cf, $74, $0a, $0a
    rs_fill_byte $0a
    rs_fill_3 $c7e1
    rs_write_term  $c7ef
    db $19,$64,$0a,$0a,$74,$0a,$0a,$ff
    rs_write_term  $c801
    db $19,$64,$0a,$0a,$0a,$0a,$0a,$ff
    rs_end

Map_1321_Blocks:
    db $6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b
    db $0a,$65,$43,$43,$19,$43,$43,$43,$43,$43,$43,$19
    db $74,$65,$43,$43,$19,$43,$64,$7a,$7a,$7a,$65,$19
    db $1f,$2e,$43,$43,$19,$43,$2d,$1e,$7a,$1d,$2e,$19
    db $17,$43,$43,$43,$43,$43,$43,$2d,$1f,$2e,$43,$19
    db $19,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$19
    db $19,$43,$54,$43,$43,$43,$43,$43,$43,$43,$43,$19
    db $19,$43,$54,$43,$43,$43,$43,$18,$43,$43,$43,$19
    db $19,$43,$54,$54,$54,$43,$43,$18,$43,$43,$43,$19
    db $19,$43,$78,$78,$78,$43,$43,$18,$43,$64,$74,$0f
    db $19,$6b,$6b,$6b,$6b,$6b,$6b,$14,$6b,$64,$0a,$0f

Map_1321_TextPointers:
    dw Map_1321_TX1
    dw Map_1321_TX2
    dw Map_1321_TX3

Map_1321_InitScript:
    ret
Map_1321_Script:
    ret

Map_1321_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Wow, you need a surfboard"
    next "item to swim?"
    para "You and your fancy items"
    next "nowadays..."
    para "I would just learn to swim"
    next "by myself."
    done

Map_1321_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "The merchant in the house"
    next "ahead sold me a beautiful"
    cont "gold NUGGET for $8000!"
    para "I'm sure that I'll be"
    next "able to sell it for a lot"
    cont "more in a Pokémon Mart!"
    done

Map_1321_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "The library in Southern"
    next "Glitchland has books on"
    cont "pretty much any topic."
    para "For example, I recently"
    next "read the book 'Green"
    cont "Bacon and Eggs'."
    para "It was great! It answered"
    next "all my questions about"
    cont "coelacanth paleobiology."
    done

