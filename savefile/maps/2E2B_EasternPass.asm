SECTION "Map_2E2B", ROM0[$B800]

Map_2E2B_Header:
    hdr_tileset         0
    hdr_dimensions      10, 12
    hdr_pointers_a      Map_2E2B_Blocks, Map_2E2B_TextPointers
    hdr_pointers_b      Map_2E2B_Script, Map_2E2B_Objects
    hdr_pointers_c      Map_2E2B_InitScript, Map_2E2B_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0110, 18, 10
    hdr_connection      EAST,  $2F38, 1, 5
    
Map_2E2B_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 4, 16, WALK, UP_DOWN, $01
    hdr_object          SPRITE_LITTLE_GIRL, 14, 15, STAY, NONE, $02
    hdr_object          SPRITE_FAT_BALD_GUY, 5, 7, STAY, NONE, $03

Map_2E2B_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c728
    rs_fill_byte $7b
    rs_fill_3 $c738
    rs_fill_byte $6f
    rs_fill_3 $c748
    rs_fill_byte $6c
    rs_fill_3 $c7a5
    rs_fill_byte $7b
    rs_fill_3 $c7b5
    rs_fill_byte $52
    rs_fill_3 $c7c5
    rs_end

Map_2E2B_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0a,$6c,$6c,$6c,$6c,$0b,$0b,$0b,$0b,$0f
    db $7b,$7b,$7b,$7b,$0a,$6f,$4c,$74,$6e,$0f
    db $6f,$0a,$0a,$7b,$6e,$0f,$0f,$6f,$6e,$0f
    db $0f,$6d,$74,$7b,$0a,$74,$36,$0f,$0a,$0f
    db $0f,$0f,$0a,$7b,$7b,$7b,$0a,$0a,$6e,$0f
    db $0f,$0f,$6d,$74,$0a,$7b,$74,$6e,$0f,$0f
    db $0f,$0b,$0b,$0a,$74,$7b,$74,$6e,$0f,$0f
    db $0f,$0b,$0b,$74,$0a,$7b,$0a,$0a,$6c,$6c
    db $0f,$0b,$0f,$4c,$0a,$7b,$7b,$7b,$7b,$7b
    db $0f,$0b,$0f,$0f,$52,$52,$52,$52,$52,$52
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_2E2B_TextPointers:
    dw Map_2E2B_TX1
    dw Map_2E2B_TX2
    dw Map_2E2B_TX3

Map_2E2B_InitScript:
    ret
Map_2E2B_Script:
    ret

Map_2E2B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Be vewwy, vewwy quiet."
    next "I'm hunting Pokémon!"
    done

Map_2E2B_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I have a device in my"
    next "pocket that allows me to"
    cont "access pretty much all"
    cont "knowledge there is in the"
    cont "world."
    para "And I use it to watch"
    next "funny cat videos."
    para "That's mobile phones"
    next "for you!"
    done

Map_2E2B_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Glitchland is so big, it's"
    next "really easy to get lost."
    para "Thankfully, using the RESET"
    next "option in the Start menu"
    cont "will always put you back"
    cont "at Central Square!"
    done

