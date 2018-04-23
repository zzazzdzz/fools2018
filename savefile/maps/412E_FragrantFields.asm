SECTION "Map_412E", ROM0[$B800]

Map_412E_Header:
    hdr_tileset         0
    hdr_dimensions      14, 8
    hdr_pointers_a      Map_412E_Blocks, Map_412E_TextPointers
    hdr_pointers_b      Map_412E_Script, Map_412E_Objects
    hdr_pointers_c      Map_412E_InitScript, Map_412E_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $4026, 1, 5
    
Map_412E_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_BIKE_SHOP_GUY, 13, 8, STAY, NONE, $02
    hdr_object          SPRITE_BUG_CATCHER, 5, 5, STAY, NONE, $01

Map_412E_RAMScript:
    rs_fill_byte $6b
    rs_fill_3 $c735
    rs_fill_byte $43
    rs_fill_3 $c749
    rs_fill_3 $c75d
    rs_fill_byte $54
    rs_fill_3 $c771
    rs_fill_3 $c785
    rs_fill_byte $78
    rs_fill_3 $c799
    rs_fill_byte $43
    rs_fill_3 $c7ad
    rs_fill_byte $6b
    rs_fill_3 $c7c1
    rs_end

Map_412E_Blocks:
    db $6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b
    db $4e,$7a,$74,$7a,$74,$7a,$74,$7a,$7a,$43,$43,$43,$43,$43
    db $4e,$74,$0a,$74,$7a,$74,$7a,$74,$7a,$43,$43,$43,$43,$43
    db $4e,$7a,$74,$7a,$74,$7a,$74,$7a,$7a,$54,$54,$54,$54,$54
    db $4e,$74,$7a,$74,$7a,$74,$7a,$74,$7a,$54,$54,$54,$54,$54
    db $4e,$7a,$74,$7a,$74,$7a,$74,$7a,$7a,$78,$78,$78,$78,$78
    db $50,$52,$52,$52,$52,$52,$52,$52,$52,$43,$43,$43,$43,$43
    db $43,$43,$43,$43,$43,$43,$43,$43,$19,$6b,$6b,$6b,$6b,$6b

Map_412E_TextPointers:
    dw Map_412E_TX1
    dw Map_412E_TX2

Map_412E_InitScript:
    ret
Map_412E_Script:
    ret

Map_412E_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I'm actually happy that"
    next "the bridge has broken"
    cont "down."
    para "Thanks to this, not many"
    next "people come here."
    para "I can stay here alone and"
    next "relax. Endulge myself in"
    cont "the beautiful flower scent."
    done

Map_412E_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Many secrets in Glitchland"
    next "are hidden behind small"
    cont "ponds and lakes."
    para "Whenever you see a body"
    next "of water, take the time to"
    cont "surf across it."
    done

