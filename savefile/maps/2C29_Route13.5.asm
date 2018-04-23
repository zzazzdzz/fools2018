SECTION "Map_2C29", ROM0[$B800]

Map_2C29_Header:
    hdr_tileset         0
    hdr_dimensions      15, 9
    hdr_pointers_a      Map_2C29_Blocks, Map_2C29_TextPointers
    hdr_pointers_b      Map_2C29_Script, Map_2C29_Objects
    hdr_pointers_c      Map_2C29_InitScript, Map_2C29_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $2D27, 8, 4
    hdr_connection      EAST,  $2B29, 1, 5
    
Map_2C29_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_LASS, 18, 10, STAY, NONE, $01
    hdr_object          SPRITE_BALDING_GUY, 13, 6, STAY, NONE, $02

Map_2C29_RAMScript:
    rs_fill_byte $31
    rs_fill_3 $c74e
    rs_fill_3 $c790
    rs_end

Map_2C29_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$1d,$1f,$1f,$1f,$1f,$1f,$1f,$1f,$1e,$31,$31,$31,$31
    db $0f,$0f,$65,$43,$43,$43,$43,$43,$43,$43,$64,$31,$0f,$0f,$0f
    db $0f,$0f,$65,$64,$1b,$77,$77,$1b,$77,$77,$77,$77,$0f,$0f,$0f
    db $0f,$0f,$65,$64,$1b,$1b,$77,$77,$77,$77,$77,$77,$0f,$0f,$0f
    db $31,$31,$31,$0f,$77,$77,$77,$77,$5f,$77,$77,$5f,$0f,$0f,$0f
    db $0f,$0f,$31,$31,$77,$77,$77,$5f,$77,$5f,$77,$5f,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$77,$77,$77,$77,$77,$77,$77,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_2C29_TextPointers:
    dw Map_2C29_TX1
    dw Map_2C29_TX2

Map_2C29_InitScript:
    ret
Map_2C29_Script:
    ret

Map_2C29_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I keep seeing routes like"
    next "this one, and I keep asking"
    cont "myself the question..."
    para "Who builds fences like this"
    next "and why?"
    para "It's like you need to whip"
    next "out the A-star algorithm to"
    cont "make it through this maze!"
    done

Map_2C29_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Psst... if you happen to"
    next "possess the ability to surf,"
    cont "here's a small hint for you."
    para "Just surf through the pond"
    next "above, and you won't need"
    cont "to deal with this annoying"
    cont "maze anymore."
    cont "Cool, huh?"
    done

