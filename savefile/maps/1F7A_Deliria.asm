SECTION "Map_1F7A", ROM0[$B800]

Map_1F7A_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_1F7A_Blocks, Map_1F7A_TextPointers
    hdr_pointers_b      Map_1F7A_Script, Map_1F7A_Objects
    hdr_pointers_c      Map_1F7A_InitScript, Map_1F7A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1F7A_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 5, 4, $1F3A
    hdr_warp            2, 7, 5, 4, $1F3A
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_GUARD, 5, 3, STAY, LEFT, $02
    hdr_object          SPRITE_GUARD, 2, 4, STAY, RIGHT, $01

Map_1F7A_RAMScript:
    rs_end

Map_1F7A_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_1F7A_TextPointers:
    dw Map_1F7A_TX1
    dw Map_1F7A_TX2

Map_1F7A_InitScript:
    ret
Map_1F7A_Script:
    ret

Map_1F7A_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Hello. We're in charge of"
    next "controlling and monitoring"
    cont "the behavior of Deliria's"
    cont "inhabitants."
    para "If you spend just a few"
    next "minutes with them, you'll"
    cont "understand that they can't"
    cont "be left unattended."
    done

Map_1F7A_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Because of the mediocre"
    next "living conditions in this"
    cont "area, many people try to"
    cont "escape from Deliria."
    para "I'm responsible for"
    next "preventing just that."
    done

