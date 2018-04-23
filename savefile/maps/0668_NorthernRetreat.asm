SECTION "Map_0668", ROM0[$B800]

Map_0668_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_0668_Blocks, Map_0668_TextPointers
    hdr_pointers_b      Map_0668_Script, Map_0668_Objects
    hdr_pointers_c      Map_0668_InitScript, Map_0668_RAMScript
    hdr_palette         $02
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0668_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 4, 20, $062F
    hdr_warp            2, 7, 4, 20, $062F
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_COOK, 2, 4, STAY, RIGHT, $01

Map_0668_RAMScript:
    rs_end

Map_0668_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_0668_TextPointers:
    dw Map_0668_TX1

Map_0668_InitScript:
    ret
Map_0668_Script:
    ret

Map_0668_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Hello! How much of the"
    next "world do you think you've"
    cont "seen?"
    para "Let me quickly have a look"
    next "now..."
    para "... ... ... ..."
    next "... ... ... ..."
    para "So, "
    tx_buf Map_0668_CurrentUserBuffer
    text "..."
    next "You have seen "
    tx_buf Map_0668_PercentageCompleteBuffer
    text " unique"
    cont "places in this world."
    para "I will continue to keep"
    next "track of your record."
    para "Come back whenever you want"
    next "to see your progress!"
    done

Map_0668_CurrentUserBuffer:
    SUBST_CURRENT_USER
Map_0668_PercentageCompleteBuffer:
    SUBST_PERC_COMPLETE

