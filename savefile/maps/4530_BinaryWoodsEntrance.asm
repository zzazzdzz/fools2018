SECTION "Map_4530", ROM0[$B800]

Map_4530_Header:
    hdr_tileset         0
    hdr_dimensions      9, 9
    hdr_pointers_a      Map_4530_Blocks, Map_4530_TextPointers
    hdr_pointers_b      Map_4530_Script, Map_4530_Objects
    hdr_pointers_c      Map_4530_InitScript, Map_4530_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $423A, 6, 18
    hdr_connection      SOUTH, $472B, 5, 1
    hdr_connection      WEST,  $4585, 31, 26
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4530_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 4, 9, STAY, DOWN, $02
    hdr_object          SPRITE_FISHER2, 10, 6, STAY, NONE, $01

Map_4530_RAMScript:
    rs_write_term  $c6fa
    db $18,$64,$7a,$7a,$27,$7a,$7a,$65,$19,$ff
    rs_write_term  $c709
    db $18,$64,$7a,$7a,$27,$7a,$7a,$65,$19,$ff
    rs_fill_byte $0f
    rs_fill_3 $c742
    rs_fill_3 $c751
    rs_fill_byte $23
    rs_fill_3 $c760
    rs_fill_byte $0f
    rs_fill_3 $c76f
    rs_fill_3 $c77e
    rs_write_term  $c79f
    db $0f,$0f,$7a,$27,$0b,$0b,$65,$ff
    rs_write_1 $c7a7, $19
    rs_write_term  $c7ae
    db $0f,$0f,$7a,$27,$0b,$0b,$65,$ff
    rs_write_1 $c7b6, $19
    rs_end

Map_4530_Blocks:
    db $18,$64,$7a,$7a,$27,$7a,$7a,$65,$19
    db $18,$64,$0f,$7a,$27,$7a,$74,$65,$19
    db $18,$64,$0f,$7a,$27,$7a,$0f,$65,$19
    db $0f,$2d,$1e,$7a,$27,$7a,$0f,$65,$19
    db $0f,$0f,$7a,$7a,$27,$74,$0f,$65,$19
    db $23,$23,$23,$23,$22,$7a,$0f,$65,$19
    db $0f,$7a,$7a,$7a,$27,$0f,$1d,$2e,$19
    db $0f,$0f,$74,$49,$45,$0b,$65,$43,$19
    db $0f,$0f,$7a,$27,$0b,$0b,$65,$43,$19

Map_4530_TextPointers:
    dw Map_4530_TX1
    dw Map_4530_TX2

Map_4530_InitScript:
    ret
Map_4530_Script:
    ret

Map_4530_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "The volume of this world"
    next "is estimated to be around"
    cont "200 kilobytes in total."
    para "That doesn't help me much."
    next "Are these metric kilobytes"
    cont "or imperial kilobytes?"
    done

Map_4530_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I think I've seen some"
    next "trees in the Binary Woods"
    cont "that were colored red"
    cont "and black."
    para "Very interesting, huh?"
    next "Exploring this world is"
    cont "a heap of fun!"
    done
