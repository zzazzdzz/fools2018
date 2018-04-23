SECTION "Map_0669", ROM0[$B800]

Map_0669_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_0669_Blocks, Map_0669_TextPointers
    hdr_pointers_b      Map_0669_Script, Map_0669_Objects
    hdr_pointers_c      Map_0669_InitScript, Map_0669_RAMScript
    hdr_palette         $02
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0669_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 3, 8, $062F
    hdr_warp            2, 7, 3, 8, $062F
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_BLACKBELT, 2, 4, STAY, RIGHT, $01

Map_0669_RAMScript:
    rs_end

Map_0669_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_0669_TextPointers:
    dw Map_0669_TX1

Map_0669_InitScript:
    ret
Map_0669_Script:
    ret

Map_0669_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Northern Glitchland is very"
    next "special, in that it has two"
    cont "towns."
    para "Each other district of"
    next "Glitchland has one."
    para "Of course, the Western"
    next "district has Deliria, but"
    cont "that doesn't qualify as a"
    cont "town for me."
    done

