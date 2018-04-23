SECTION "Map_1671", ROM0[$B800]

Map_1671_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_1671_Blocks, Map_1671_TextPointers
    hdr_pointers_b      Map_1671_Script, Map_1671_Objects
    hdr_pointers_c      Map_1671_InitScript, Map_1671_RAMScript
    hdr_palette         $07
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1671_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 13, 12, $1631
    hdr_warp            2, 7, 13, 12, $1631
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 2, 4, STAY, RIGHT, $01

Map_1671_RAMScript:
    rs_end

Map_1671_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_1671_TextPointers:
    dw Map_1671_TX1

Map_1671_InitScript:
    ret
Map_1671_Script:
    ret

Map_1671_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Longer usernames with a lot"
    next "of distinct characters have"
    cont "better chances of winning"
    cont "at the Glitchland Lottery."
    para "That's why I renamed myself"
    next "to Abcdefghijklmno."
    para "My name now looks like"
    next "total garbage, but it's"
    cont "completely worth it!"
    done

