SECTION "Map_4585", ROM0[$B800]

Map_4585_Header:
    hdr_tileset         3
    hdr_dimensions      16, 16
    hdr_pointers_a      Map_4585_Blocks, Map_4585_TextPointers
    hdr_pointers_b      Map_4585_Script, Map_4585_Objects
    hdr_pointers_c      Map_4585_InitScript, Map_4585_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4585_Objects:
    hdr_border          $03
    hdr_warp_count      4
    hdr_warp            9, 31, 7, 1, $4528
    hdr_warp            8, 31, 6, 1, $4528
    hdr_warp            31, 27, 1, 11, $4530
    hdr_warp            31, 26, 1, 10, $4530
    hdr_sign_count      1
    hdr_signpost        15, 15, $05
    hdr_object_count    4
    hdr_object          SPRITE_BLACKBELT, 2, 24, STAY, NONE, $04
    hdr_object          SPRITE_LAPRAS_GIVER, 2, 9, STAY, NONE, $03
    hdr_object          SPRITE_GAMBLER, 17, 4, STAY, NONE, $02
    hdr_object          SPRITE_OLD_MEDIUM_WOMAN, 26, 24, STAY, DOWN, $01

Map_4585_RAMScript:
    rs_end

Map_4585_Blocks:
    db $02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02
    db $02,$1b,$1b,$02,$01,$01,$02,$39,$39,$01,$01,$01,$01,$01,$01,$02
    db $02,$01,$01,$02,$01,$01,$02,$62,$1b,$1b,$01,$01,$01,$01,$01,$02
    db $02,$01,$01,$02,$01,$01,$02,$02,$02,$02,$02,$5c,$52,$1b,$01,$02
    db $02,$01,$01,$02,$01,$01,$01,$01,$1b,$1b,$1b,$5a,$5b,$1b,$62,$02
    db $02,$01,$62,$02,$1b,$01,$01,$01,$01,$01,$01,$5a,$5b,$1b,$39,$02
    db $02,$01,$39,$39,$1b,$1b,$02,$02,$02,$02,$01,$01,$02,$1b,$01,$02
    db $02,$01,$01,$1b,$1b,$1b,$02,$33,$1b,$1b,$01,$01,$02,$1b,$01,$02
    db $02,$02,$02,$02,$1b,$01,$02,$1b,$1b,$01,$01,$01,$02,$01,$01,$02
    db $02,$62,$1b,$01,$01,$5c,$51,$52,$1b,$02,$02,$02,$02,$01,$01,$02
    db $02,$1b,$01,$01,$01,$5a,$2d,$5b,$01,$02,$39,$39,$01,$01,$01,$02
    db $02,$01,$01,$02,$02,$5a,$2d,$5b,$01,$02,$1b,$01,$01,$01,$01,$02
    db $02,$01,$01,$01,$01,$5a,$2d,$5b,$01,$02,$01,$01,$02,$01,$01,$02
    db $02,$01,$29,$1b,$2e,$01,$02,$62,$01,$01,$01,$01,$02,$2c,$1b,$57
    db $02,$01,$01,$01,$29,$01,$02,$39,$1b,$01,$01,$01,$02,$01,$01,$02
    db $02,$02,$02,$02,$59,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02,$02

Map_4585_TextPointers:
    dw Map_4585_TX1
    dw Map_4585_TX2
    dw Map_4585_TX3
    dw Map_4585_TX4
    dw Map_4585_TX5

Map_4585_InitScript:
    ret
Map_4585_Script:
    ret

Map_4585_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "IT IS SAID THERE IS A"
    next "SPIRIT IN THE FOREST."
    cont "DON'T SERVE THE DEVIL."
    done

Map_4585_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "The forest is a lot easier"
    next "to get through if you have"
    cont "the ability to surf."
    done

Map_4585_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "I bet if we had wild"
    next "encounters here, there"
    cont "would be tons of Bug-type"
    cont "Pokémon in this forest!"
    done
    
Map_4585_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "What? You tell me that"
    next "the exit is only a few"
    cont "meters away from me?"
    para "I've been lost here for"
    next "a week straight, and now"
    cont "you tell me?"
    done

Map_4585_TX5:
    TX_ASM
    jp EnhancedTextOnly
    text "Please respect nature!"
    para "Do not make any trees"
    next "imbalanced, or they'll"
    cont "be harder to traverse."
    para "Be careful with the roots."
    next "Removing them could cause"
    cont "trees to split in half."
    para "Hope you enjoy your stay"
    next "at the Binary Woods."
    done

