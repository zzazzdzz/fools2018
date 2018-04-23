SECTION "Map_066A", ROM0[$B800]

Map_066A_Header:
    hdr_tileset         9
    hdr_dimensions      7, 5
    hdr_pointers_a      Map_066A_Blocks, Map_066A_TextPointers
    hdr_pointers_b      Map_066A_Script, Map_066A_Objects
    hdr_pointers_c      Map_066A_InitScript, Map_066A_RAMScript
    hdr_palette         $02
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_066A_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 9, 10, 14, $062F
    hdr_warp            2, 9, 10, 14, $062F
    hdr_sign_count      6
    hdr_signpost        6, 1, $04
    hdr_signpost        6, 2, $04
    hdr_signpost        5, 2, $04
    hdr_signpost        4, 2, $04
    hdr_signpost        4, 1, $04
    hdr_signpost        10, 5, $03
    hdr_object_count    2
    hdr_object          SPRITE_BIKE_SHOP_GUY, 6, 5, STAY, NONE, $02
    hdr_object          SPRITE_OAK_AIDE, 1, 3, STAY, NONE, $01

Map_066A_RAMScript:
    rs_end

Map_066A_Blocks:
    db $4d,$5e,$3d,$3e,$4d,$4d,$4d
    db $00,$00,$3f,$4b,$00,$00,$00
    db $3a,$00,$00,$00,$58,$59,$5a
    db $00,$00,$00,$00,$00,$00,$00
    db $3a,$0b,$00,$0a,$0a,$0a,$0a

Map_066A_TextPointers:
    dw Map_066A_TX1
    dw Map_066A_TX2
    dw Map_066A_TX3
    dw Map_066A_TX4

Map_066A_InitScript:
    ret
Map_066A_Script:
    ret

Map_066A_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "The Glitch Research Lab"
    next "is mostly responsible for"
    cont "the idea of creating a"
    cont "glitch museum."
    done

Map_066A_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Welcome to Glitchland's one"
    next "and only Glitch Museum!"
    para "We've built it just recently,"
    next "so we don't have too many"
    cont "exhibits yet."
    para "But soon, we will be getting"
    next "more. You should visit us"
    cont "later and see!"
    done

Map_066A_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "The bones of the Aerodactyl"
    next "Fossil Missingno.,"
    cont "circa 1995."
    para "The only exhibit in this"
    next "museum so far. Quite boring."
    done

Map_066A_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "A space shuttle."
    para "It has nothing to do with"
    next "glitches, but it looks cool!"
    done

