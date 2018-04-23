SECTION "Map_4788", ROM0[$B800]

Map_4788_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_4788_Blocks, Map_4788_TextPointers
    hdr_pointers_b      Map_4788_Script, Map_4788_Objects
    hdr_pointers_c      Map_4788_InitScript, Map_4788_RAMScript
    hdr_palette         $0A
    hdr_music           MUSIC_SS_ANNE, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4788_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 13, 10, $472B
    hdr_warp            2, 7, 13, 10, $472B
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_HIKER, 2, 4, STAY, RIGHT, $01

Map_4788_RAMScript:
    rs_end

Map_4788_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_4788_TextPointers:
    dw Map_4788_TX1

Map_4788_InitScript:
    ret
Map_4788_Script:
    ret

Map_4788_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I recently saw a guy, who"
    next "cried for several hours"
    cont "over a fainted Pokémon."
    para "I asked him what's wrong,"
    next "and he explained he was"
    cont "doing a Nuzlocke challenge."
    para "I have no idea what it"
    next "means. Each day, people"
    cont "are discovering so many"
    cont "new ways to enjoy the old"
    cont "Pokémon games."
    para "It's really hard to keep"
    next "track of every single trend."
    done

