SECTION "Map_1F3A", ROM0[$B800]

Map_1F3A_Header:
    hdr_tileset         0
    hdr_dimensions      10, 10
    hdr_pointers_a      Map_1F3A_Blocks, Map_1F3A_TextPointers
    hdr_pointers_b      Map_1F3A_Script, Map_1F3A_Objects
    hdr_pointers_c      Map_1F3A_InitScript, Map_1F3A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $1E33, 22, 7
    hdr_connection      EAST,  $202F, 1, 14
    
Map_1F3A_Objects:
    hdr_border          $0b
    hdr_warp_count      2
    hdr_warp            14, 5, 1, 1, $1F79
    hdr_warp            5, 3, 2, 7, $1F7A
    hdr_sign_count      0
    hdr_object_count    6
    hdr_object          SPRITE_BIRD, 17, 17, STAY, NONE, $01
    hdr_object          SPRITE_GAMBLER, 8, 9, STAY, NONE, $02
    hdr_object          SPRITE_LORELEI, 18, 10, STAY, NONE, $03
    hdr_object          SPRITE_LITTLE_GIRL, 11, 15, STAY, RIGHT, $04
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 7, 16, STAY, UP, $05
    hdr_object          SPRITE_AGATHA, 6, 6, STAY, NONE, $06

Map_1F3A_RAMScript:
    rs_fill_byte $6c
    rs_fill_3 $c738
    rs_fill_byte $7a
    rs_fill_3 $c748
    rs_fill_byte $6f
    rs_fill_3 $c758
    rs_fill_byte $51
    rs_fill_3 $c795
    rs_fill_byte $7a
    rs_fill_3 $c7a5
    rs_fill_byte $52
    rs_fill_3 $c7b5
    rs_end

Map_1F3A_Blocks:
    db $62,$51,$51,$51,$51,$51,$51,$51,$51,$63
    db $4e,$0a,$02,$03,$74,$20,$0d,$0d,$21,$4d
    db $6c,$0a,$7a,$7a,$0a,$37,$7d,$3a,$7e,$4d
    db $7a,$7a,$7a,$7a,$7a,$7a,$7a,$7a,$7a,$4d
    db $6f,$0a,$7a,$0a,$74,$1d,$1f,$1e,$7a,$4d
    db $4e,$0a,$7a,$52,$52,$65,$43,$64,$7a,$4d
    db $4e,$74,$7a,$20,$0e,$65,$43,$64,$7a,$4d
    db $4e,$74,$7a,$37,$00,$0a,$20,$21,$7a,$53
    db $4e,$0a,$7a,$7a,$7a,$7a,$7a,$7a,$7a,$7a
    db $50,$52,$52,$52,$52,$52,$52,$52,$52,$52

Map_1F3A_TextPointers:
    dw Map_1F3A_TX1
    dw Map_1F3A_TX2
    dw Map_1F3A_TX3
    dw Map_1F3A_TX4
    dw Map_1F3A_TX5
    dw Map_1F3A_TX6

Map_1F3A_InitScript:
Map_1F3A_Script:
    xor a
    ld [$c04e], a
    ld [$c04f], a
    ld [$c06e], a
    ld [$c06f], a
    dec a
    ld [$c056], a
    ld [$c057], a
    ret

Map_1F3A_TX1:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "heyooaa!"
    next "i is a bird"
    para "i will eat you !!"
    next "uwawawawa"
    done

Map_1F3A_TX2:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "i like Deliria"
    next "so nice people.."
    cont "it is very good!"
    para "who are you?"
    next "u visiting ???"
    done

Map_1F3A_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Partly cloudy, with a low"
    next "around 36."
    para "Northeast wind 8 to 10 mph."
    next "Chance of precipitation"
    cont "is 40 percent."
    para "Little or no snow"
    next "accumulation expected."
    done

Map_1F3A_TX4:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "heyooo"
    next "i build a roof !"
    para "oh noo...."
    next "i forget the house"
    done

Map_1F3A_TX5:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "look"
    next "i build a house !"
    para "oh nos"
    next "i forget the door ..."
    done

Map_1F3A_TX6:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "hayaa !!"
    next "welcome to..."
    para "BEST TOWN"
    next "DELIRIA !!!"
    done

