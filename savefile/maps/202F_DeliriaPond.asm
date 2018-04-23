SECTION "Map_202F", ROM0[$B800]

Map_202F_Header:
    hdr_tileset         0
    hdr_dimensions      10, 10
    hdr_pointers_a      Map_202F_Blocks, Map_202F_TextPointers
    hdr_pointers_b      Map_202F_Script, Map_202F_Objects
    hdr_pointers_c      Map_202F_InitScript, Map_202F_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $1F3A, 18, 16
    hdr_connection      EAST,  $0000, 0, 0
    
Map_202F_Objects:
    hdr_border          $0b
    hdr_warp_count      0
    hdr_sign_count      2
    hdr_signpost        17, 15, $06
    hdr_signpost        3, 11, $07
    hdr_object_count    5
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 13, 2, STAY, NONE, $01
    hdr_object          SPRITE_MART_GUY, 3, 12, STAY, UP, $02
    hdr_object          SPRITE_BIKE_SHOP_GUY, 12, 16, STAY, NONE, $03
    hdr_object          SPRITE_SWIMMER, 14, 6, STAY, NONE, $04
    hdr_object          SPRITE_FOULARD_WOMAN, 8, 9, STAY, NONE, $05

Map_202F_RAMScript:
    rs_fill_byte $6c
    rs_fill_3 $c778
    rs_fill_byte $7a
    rs_fill_3 $c788
    rs_fill_byte $6f
    rs_fill_3 $c798
    rs_end

Map_202F_Blocks:
    db $62,$51,$51,$51,$51,$51,$51,$51,$51,$63
    db $4e,$1d,$1f,$1e,$6f,$6f,$6f,$6f,$6f,$4d
    db $4e,$65,$43,$2d,$1f,$1f,$1f,$1f,$1e,$4d
    db $4e,$65,$43,$43,$43,$43,$43,$43,$64,$4d
    db $4e,$65,$43,$43,$54,$43,$43,$43,$64,$4d
    db $4e,$79,$65,$43,$78,$43,$43,$43,$64,$4d
    db $6c,$0a,$6c,$65,$43,$43,$64,$6c,$6c,$4d
    db $7a,$7a,$7a,$6c,$6c,$6c,$6c,$7a,$79,$4d
    db $6f,$0a,$7a,$7a,$7a,$7a,$7a,$7a,$0a,$4d
    db $50,$52,$52,$52,$52,$52,$52,$52,$52,$4f

Map_202F_TextPointers:
    dw Map_202F_TX1
    dw Map_202F_TX2
    dw Map_202F_TX3
    dw Map_202F_TX4
    dw Map_202F_TX5
    dw Map_202F_TX6
    dw Map_202F_TX7

Map_202F_InitScript:
Map_202F_Script:
    xor a
    ld [$c04e], a
    ld [$c04f], a
    ld [$c06e], a
    ld [$c06f], a
    dec a
    ld [$c056], a
    ld [$c057], a
    ret

Map_202F_TX1:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "heyaya !"
    next "you are new here !"
    para "can i be ur"
    next "friend ???"
    cont "please !!"
    done

Map_202F_TX2:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "i watch after"
    next "my pokeman !!!"
    para "its right in"
    next "front of me !"
    done

Map_202F_TX3:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "i feel very"
    next "weird .."
    para "oh nos .."
    next "am i gregnant?"
    done

Map_202F_TX4:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "please help !!!"
    para "how to return"
    next "to land ??"
    done

Map_202F_TX5:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "please help !!!"
    next "how do i swim?"
    para "i swim here,"
    next "then i forget"
    cont "how to swim .."
    done

Map_202F_TX6:
    TX_ASM
    jp EnhancedTextOnly
    text "An empty sign."
    para "Literally nothing's"
    next "written on it."
    done

Map_202F_TX7:
    TX_ASM
    jp EnhancedTextOnly
    text "A signpost."
    para "The person in front keeps"
    next "hugging it, so it's"
    cont "impossible to read..."
    done

