SECTION "Map_1F79", ROM0[$B800]

Map_1F79_Header:
    hdr_tileset         8
    hdr_dimensions      1, 1
    hdr_pointers_a      Map_1F79_Blocks, Map_1F79_TextPointers
    hdr_pointers_b      Map_1F79_Script, Map_1F79_Objects
    hdr_pointers_c      Map_1F79_InitScript, Map_1F79_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1F79_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            1, 1, 14, 6, $1F3A
    hdr_warp            0, 1, 14, 6, $1F3A
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_ROCKER, 1, 0, STAY, NONE, $01

Map_1F79_RAMScript:
    rs_end

Map_1F79_Blocks:
    db $0b

Map_1F79_TextPointers:
    dw Map_1F79_TX1

Map_1F79_InitScript:
Map_1F79_Script:
    xor a
    ld [$c04e], a
    ld [$c04f], a
    ld [$c06e], a
    ld [$c06f], a
    dec a
    ld [$c056], a
    ld [$c057], a
    ret

Map_1F79_TX1:
    TX_ASM
    jp EnhancedTextOnly
    tx_deliria
    text "i like my house"
    next "so spacious!!"
    done

