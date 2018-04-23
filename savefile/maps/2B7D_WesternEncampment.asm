SECTION "Map_2B7D", ROM0[$B800]

Map_2B7D_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_2B7D_Blocks, Map_2B7D_TextPointers
    hdr_pointers_b      Map_2B7D_Script, Map_2B7D_Objects
    hdr_pointers_c      Map_2B7D_InitScript, Map_2B7D_RAMScript
    hdr_palette         $09
    hdr_music           MUSIC_CINNABAR, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2B7D_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 15, 4, $2B29
    hdr_warp            2, 7, 15, 4, $2B29
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_BLACKBELT, 2, 4, STAY, RIGHT, $01

Map_2B7D_RAMScript:
    rs_end

Map_2B7D_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_2B7D_TextPointers:
    dw Map_2B7D_TX1

Map_2B7D_InitScript:
    ret
Map_2B7D_Script:
    ret

Map_2B7D_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "You might already know this,"
    next "but I'll give you some"
    cont "advice regardless!"
    para "If you were to get an"
    next "important item for a quest,"
    cont "and you happened to toss"
    cont "it, then the quest might"
    cont "become impossible to finish."
    para "Be careful while managing"
    next "your inventory. Losing some"
    cont "items might be a real pain!"
    done

