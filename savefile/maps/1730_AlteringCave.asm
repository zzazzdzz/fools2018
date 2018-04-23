SECTION "Map_1730", ROM0[$B800]

Map_1730_Header:
    hdr_tileset         17
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_1730_Blocks, Map_1730_TextPointers
    hdr_pointers_b      Map_1730_Script, Map_1730_Objects
    hdr_pointers_c      Map_1730_InitScript, Map_1730_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $1720, 6, 6
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1730_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            9, 13, 6, 6, $1720
    hdr_warp            8, 13, 6, 6, $1720
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_BIKE_SHOP_GUY, 6, 4, STAY, NONE, $01

Map_1730_RAMScript:
    rs_end

Map_1730_Blocks:
    db $2c,$1d,$1d,$1d,$2b,$19,$19
    db $1a,$01,$01,$01,$1c,$1d,$2b
    db $1a,$01,$01,$01,$01,$01,$18
    db $19,$15,$16,$01,$01,$01,$18
    db $19,$19,$1a,$01,$01,$14,$19
    db $19,$19,$19,$16,$01,$18,$19
    db $19,$19,$19,$1a,$24,$18,$19

Map_1730_TextPointers:
    dw Map_1730_TX1
    
Map_1730_InitScript:
    ret
Map_1730_Script:
    ret

Map_1730_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "A rare fossil is said"
    next "to appear in the Altering"
    cont "Cave, but I don't seem"
    cont "to be able to find it..."
    done

