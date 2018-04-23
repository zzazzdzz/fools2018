SECTION "Map_0E6C", ROM0[$B800]

Map_0E6C_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_0E6C_Blocks, Map_0E6C_TextPointers
    hdr_pointers_b      Map_0E6C_Script, Map_0E6C_Objects
    hdr_pointers_c      Map_0E6C_InitScript, Map_0E6C_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0E6C_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 7, 6, $0E3C
    hdr_warp            2, 7, 7, 6, $0E3C
    hdr_sign_count      0
    hdr_object_count    4
    hdr_object          SPRITE_SLOWBRO, 6, 6, WALK, UP_DOWN, $04
    hdr_object          SPRITE_BUG_CATCHER, 2, 4, STAY, RIGHT, $03
    hdr_object          SPRITE_LAPRAS_GIVER, 5, 3, STAY, LEFT, $02
    hdr_object          SPRITE_HIKER, 2, 3, STAY, RIGHT, $01

Map_0E6C_RAMScript:
    rs_end

Map_0E6C_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_0E6C_TextPointers:
    dw Map_0E6C_TX1
    dw Map_0E6C_TX2
    dw Map_0E6C_TX3
    dw Map_0E6C_TX4

Map_0E6C_InitScript:
    ret
Map_0E6C_Script:
    ret

Map_0E6C_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "You guys know how"
    next ""
    tx_buf Map_0E6C_TrendyPhraseTextBuffer
    text " is"
    cont "the best thing ever, right?"
    done

Map_0E6C_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Just recently I got into"
    next ""
    tx_buf Map_0E6C_TrendyPhraseTextBuffer
    text ", and"
    cont "I lost 10 pounds without"
    cont "ever having to do anything."
    para "Doctors hate me!"
    next "All of that, just because"
    cont "of "
    tx_buf Map_0E6C_TrendyPhraseTextBuffer
    text "!"
    done

Map_0E6C_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "I tell my kids about"
    next ""
    tx_buf Map_0E6C_TrendyPhraseTextBuffer
    text " all"
    cont "the time!"
    para "I also buy them lots of"
    next "merchandise related to"
    cont ""
    tx_buf Map_0E6C_TrendyPhraseTextBuffer
    text "."
    para "This makes both me and them"
    next "incredibly happy!"
    done

Map_0E6C_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "A Rhydon."
    next "Apparently Pokémon like"
    cont ""
    tx_buf Map_0E6C_TrendyPhraseTextBuffer
    text " too!"
    done

Map_0E6C_TrendyPhraseTextBuffer:
    SUBST_TRENDY_PHRASE

