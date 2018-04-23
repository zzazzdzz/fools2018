SECTION "Map_3336", ROM0[$B800]

Map_3336_Header:
    hdr_tileset         0
    hdr_dimensions      8, 14
    hdr_pointers_a      Map_3336_Blocks, Map_3336_TextPointers
    hdr_pointers_b      Map_3336_Script, Map_3336_Objects
    hdr_pointers_c      Map_3336_InitScript, Map_3336_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $2F38, 7, 14
    hdr_connection      SOUTH, $3420, 10, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3336_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_ERIKA, 5, 22, STAY, NONE, $01
    hdr_object          SPRITE_BRUNETTE_GIRL, 6, 7, STAY, NONE, $02

Map_3336_RAMScript:
    rs_write_term  $c6f9
    db $19,$0a,$27,$0a,$0a,$0a,$0a,$18,$ff
    rs_write_term  $c707
    db $19,$0a,$27,$0a,$0a,$74,$0a,$18,$ff
    rs_write_term  $c7d9
    db $19,$0a,$0a,$0a,$0a,$27,$0a,$18,$ff
    rs_write_term  $c7e7
    db $19,$0a,$74,$0a,$0a,$27,$0a,$18,$ff
    rs_end

Map_3336_Blocks:
    db $19,$0a,$27,$0a,$0a,$0a,$0a,$18
    db $19,$6d,$27,$0a,$0a,$74,$6e,$18
    db $19,$0f,$27,$0b,$0b,$0a,$0f,$18
    db $19,$0f,$44,$23,$48,$6e,$0f,$18
    db $19,$0f,$6d,$0b,$27,$6e,$0f,$18
    db $19,$0f,$6d,$0b,$27,$6e,$0f,$18
    db $19,$0f,$6d,$0b,$27,$74,$0f,$18
    db $19,$0f,$0a,$0b,$27,$0b,$6e,$18
    db $19,$6d,$0a,$49,$45,$0b,$6e,$18
    db $19,$6d,$0b,$27,$0b,$0a,$6e,$18
    db $19,$6d,$74,$27,$0a,$74,$6e,$18
    db $19,$6d,$0b,$27,$0b,$0a,$6e,$18
    db $19,$6d,$0b,$44,$23,$48,$0b,$18
    db $19,$0a,$0a,$74,$0a,$27,$0a,$18

Map_3336_TextPointers:
    dw Map_3336_TX1
    dw Map_3336_TX3

Map_3336_InitScript:
    ret
Map_3336_Script:
    ret

Map_3336_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I really wish Pokémon games"
    next "had three save files."
    para "One for my Charmander, one"
    next "for my Squirtle, and one"
    cont "for my second Charmander."
    done

Map_3336_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "TM compatibility does not"
    next "make sense sometimes."
    para "Did you know that Diglett"
    next "can learn Cut?"
    para "Like, what is it cutting"
    next "with? Its nose?"
    para "Come to think of it..."
    next "Do Diglett have feet?"
    para "Now I won't be able to sleep"
    next "until I know the truth!"
    done

