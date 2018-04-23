SECTION "Map_0F3B", ROM0[$B800]

Map_0F3B_Header:
    hdr_tileset         0
    hdr_dimensions      7, 13
    hdr_pointers_a      Map_0F3B_Blocks, Map_0F3B_TextPointers
    hdr_pointers_b      Map_0F3B_Script, Map_0F3B_Objects
    hdr_pointers_c      Map_0F3B_InitScript, Map_0F3B_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0E3C, 12, 14
    hdr_connection      SOUTH, $103B, 8, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0F3B_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    4
    hdr_object          SPRITE_BALDING_GUY, 9, 21, STAY, NONE, $01
    hdr_object          SPRITE_GYM_HELPER, 7, 15, STAY, NONE, $02
    hdr_object          SPRITE_GIRL, 9, 9, STAY, NONE, $03
    hdr_object          SPRITE_OLD_PERSON, 5, 5, STAY, NONE, $04

Map_0F3B_RAMScript:
    rs_write_term  $c6fa
    db $74,$55,$55,$7a,$ff
    rs_write_term  $c707
    db $7a,$55,$55,$74,$ff
    rs_write_term  $c7bd
    db $7a,$55,$55,$74,$ff
    rs_write_term  $c7ca
    db $74,$55,$55,$7a,$ff
    rs_end

Map_0F3B_Blocks:
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$0f,$7a,$55,$55,$74,$0f
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$0f,$7a,$55,$55,$74,$0f
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$0f,$7a,$55,$55,$74,$0f
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$0f,$7a,$55,$55,$74,$0f
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$0f,$7a,$55,$55,$74,$0f
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$0f,$7a,$55,$55,$74,$0f
    db $0f,$0f,$74,$55,$55,$7a,$0f

Map_0F3B_TextPointers:
    dw Map_0F3B_TX1
    dw Map_0F3B_TX2
    dw Map_0F3B_TX3
    dw Map_0F3B_TX4

Map_0F3B_InitScript:
    ret
Map_0F3B_Script:
    ret

Map_0F3B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Wow, can you believe it?"
    next "I went to the Lottery"
    cont "Corner and tried my luck."
    para "I got a triple match."
    next "Isn't that amazing?"
    done

Map_0F3B_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "The living space."
    next "The poverty line."
    cont "The life cycle."
    para "In the field of light"
    next "industry."
    para "The science of"
    next "yyiyasiyahiyahiyyahiyyahiya."
    para "And the law of"
    next "the lyiriyah."
    done

Map_0F3B_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "What's a star?"
    para "Can you touch it?"
    next "Can you eat it?"
    cont "Can you kill it?"
    para "Are you a star?"
    done

Map_0F3B_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "I came from a faraway land"
    next "called Johto."
    para "I was hoping to see some"
    next "new species of Pokémon here."
    para "Man, what a disappointment."
    done

