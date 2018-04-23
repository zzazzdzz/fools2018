SECTION "Map_1731", ROM0[$B800]

Map_1731_Header:
    hdr_tileset         17
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_1731_Blocks, Map_1731_TextPointers
    hdr_pointers_b      Map_1731_Script, Map_1731_Objects
    hdr_pointers_c      Map_1731_InitScript, Map_1731_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $1720, 6, 6
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1731_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            9, 13, 6, 6, $1720
    hdr_warp            8, 13, 6, 6, $1720
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_BIKE_SHOP_GUY, 7, 5, STAY, NONE, $01

Map_1731_RAMScript:
    rs_end

Map_1731_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$1d,$2b
    db $1a,$01,$01,$05,$05,$7d,$18
    db $1a,$01,$14,$15,$16,$12,$18
    db $1a,$01,$18,$2c,$1e,$01,$18
    db $1a,$01,$66,$1e,$01,$01,$18
    db $1a,$01,$01,$01,$01,$14,$19
    db $19,$15,$15,$16,$24,$18,$19

Map_1731_TextPointers:
    dw Map_1731_TX1
    
Map_1731_InitScript:
    ret
Map_1731_Script:
    ret

Map_1731_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I'm looking for rare Pokémon"
    next "fossils, but I still can't"
    cont "find anything here."
    para "There must be something in"
    next "this cave, I'm sure of it!"
    done

