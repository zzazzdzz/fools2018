SECTION "Map_0932", ROM0[$B800]

Map_0932_Header:
    hdr_tileset         0
    hdr_dimensions      7, 10
    hdr_pointers_a      Map_0932_Blocks, Map_0932_TextPointers
    hdr_pointers_b      Map_0932_Script, Map_0932_Objects
    hdr_pointers_c      Map_0932_InitScript, Map_0932_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0B2D, 7, 8
    hdr_connection      SOUTH, $0A32, 7, 1
    hdr_connection      WEST,  $0C2C, 8, 5
    hdr_connection      EAST,  $0824, 1, 3
    
Map_0932_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            3, 9, 2, 7, $096B
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_LASS, 5, 14, STAY, NONE, $01
    hdr_object          SPRITE_GUARD, 8, 5, STAY, NONE, $02

Map_0932_RAMScript:
    rs_write_1 $c6fb, $0a
    rs_write_1 $c708, $0a
    rs_fill_byte $0a
    rs_fill_3 $c733
    rs_fill_byte $01
    rs_fill_3 $c740
    rs_fill_byte $0a
    rs_fill_len $c74d, 6
    rs_fill_byte $01
    rs_fill_3 $c75d
    rs_fill_byte $52
    rs_fill_3 $c76a
    rs_write_1 $c797, $01
    rs_write_1 $c7a4, $01
    rs_end

Map_0932_Blocks:
    db $0f,$0f,$0f,$0a,$0f,$0f,$0f
    db $0f,$51,$51,$0a,$51,$51,$0f
    db $0f,$0a,$0a,$0a,$0a,$0a,$0a
    db $0f,$38,$39,$01,$01,$01,$01
    db $0f,$3c,$3d,$0a,$0a,$0a,$0a
    db $0a,$0a,$0a,$0a,$0a,$0b,$0f
    db $01,$01,$01,$01,$0a,$0b,$0f
    db $52,$41,$0a,$01,$0a,$0b,$0f
    db $0f,$50,$52,$01,$52,$0b,$0f
    db $0f,$0f,$0f,$01,$0f,$0f,$0f

Map_0932_TextPointers:
    dw Map_0932_TX1
    dw Map_0932_TX2

Map_0932_InitScript:
    ret
Map_0932_Script:
    ret

Map_0932_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Here lives the Worried"
    next "Explorer."
    para "Why such a name? Because"
    next "he's worried, and he's also"
    cont "an explorer!"
    done

Map_0932_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "There's a rumor about a"
    next "giant cave system hidden"
    cont "somewhere in this area."
    para "The explorer here has"
    next "been searching for it for"
    cont "quite a while, but never"
    cont "found it."
    done

