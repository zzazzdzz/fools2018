SECTION "Map_1C2C", ROM0[$B800]

Map_1C2C_Header:
    hdr_tileset         0
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_1C2C_Blocks, Map_1C2C_TextPointers
    hdr_pointers_b      Map_1C2C_Script, Map_1C2C_Objects
    hdr_pointers_c      Map_1C2C_InitScript, Map_1C2C_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $2725, 14, 16
    hdr_connection      SOUTH, $1D3B, 6, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $1B37, 1, 12
    
Map_1C2C_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 3, 1, STAY, DOWN, $02
    hdr_object          SPRITE_LAPRAS_GIVER, 2, 1, STAY, DOWN, $03
    hdr_object          SPRITE_WAITER, 1, 1, STAY, DOWN, $04

Map_1C2C_RAMScript:
    rs_write_3 $c6fa, $6d, $7a, $6e
    rs_write_3 $c707, $6d, $7a, $6e
    rs_fill_byte $6c
    rs_fill_3 $c733
    rs_fill_byte $7a
    rs_fill_3 $c740
    rs_fill_byte $6f
    rs_fill_3 $c74d
    rs_write_3 $c76f, $6d, $7a, $6e
    rs_write_3 $c77c, $6d, $7a, $6e
    rs_end

Map_1C2C_Blocks:
    db $62,$51,$6d,$7a,$6e,$51,$63
    db $4e,$0a,$0a,$7a,$0a,$0f,$4d
    db $4e,$0a,$7a,$7b,$7a,$0a,$6c
    db $4e,$0a,$7b,$01,$7b,$7a,$7a
    db $4e,$0a,$7a,$7b,$7a,$0a,$6f
    db $4e,$0a,$0a,$7a,$0a,$0f,$4d
    db $50,$52,$6d,$7a,$6e,$52,$4f

Map_1C2C_TextPointers:
    dw Map_1C2C_TX1
    dw Map_1C2C_TX2
    dw Map_1C2C_TX3
    dw Map_1C2C_TX4

Map_1C2C_InitScript:
    ret
Map_1C2C_Script:
    ret

Map_1C2C_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "redacted"
    done

Map_1C2C_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "We must save my family!"
    done

Map_1C2C_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Let me introduce you to"
    next "my crew. I call them"
    cont "'the crew', by the way."
    para "They are all NPCs I got"
    next "from various quests."
    para "They help you fight, but"
    next "as long as you don't finish"
    cont "the quests, they stay with"
    cont "you forever!"
    done

Map_1C2C_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "The bandits are coming!"
    done

