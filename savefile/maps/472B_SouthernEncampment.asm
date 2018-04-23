SECTION "Map_472B", ROM0[$B800]

Map_472B_Header:
    hdr_tileset         0
    hdr_dimensions      9, 11
    hdr_pointers_a      Map_472B_Blocks, Map_472B_TextPointers
    hdr_pointers_b      Map_472B_Script, Map_472B_Objects
    hdr_pointers_c      Map_472B_InitScript, Map_472B_RAMScript
    hdr_palette         $0A
    hdr_music           MUSIC_SS_ANNE, AUDIO_1
    hdr_connection      NORTH, $4530, 6, 16
    hdr_connection      SOUTH, $482B, 6, 4
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $4A34, 1, 8
    
Map_472B_Objects:
    hdr_border          $0f
    hdr_warp_count      3
    hdr_warp            13, 9, 2, 7, $4788
    hdr_warp            10, 11, 2, 7, $4787
    hdr_warp            9, 5, 2, 7, $4786
    hdr_sign_count      1
    hdr_signpost        13, 7, $02
    hdr_object_count    1
    hdr_object          SPRITE_LAPRAS_GIVER, 6, 10, STAY, NONE, $01

Map_472B_RAMScript:
    rs_write_1 $c6fc, $31
    rs_write_1 $c70b, $31
    rs_fill_byte $31
    rs_fill_3 $c77b
    rs_write_3 $c7bf, $7b, $74, $7b
    rs_write_3 $c7ce, $74, $7b, $74
    rs_end

Map_472B_Blocks:
    db $0f,$0f,$31,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$31,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$31,$0a,$02,$09,$03,$74,$0f
    db $0f,$0f,$31,$31,$31,$31,$08,$0a,$0f
    db $0f,$0f,$31,$74,$0c,$0e,$02,$03,$0f
    db $0f,$0f,$31,$74,$10,$12,$0a,$74,$0f
    db $0f,$0f,$31,$31,$31,$31,$31,$31,$31
    db $0f,$0f,$1d,$1f,$1e,$0f,$0f,$0f,$0f
    db $0f,$0f,$65,$43,$64,$0f,$0f,$0f,$0f
    db $0f,$0f,$7b,$74,$7b,$0f,$0f,$0f,$0f
    db $0f,$0f,$74,$7b,$74,$0f,$0f,$0f,$0f

Map_472B_TextPointers:
    dw Map_472B_TX1
    dw Map_472B_TX2

Map_472B_InitScript:
    ret
Map_472B_Script:
    ret

Map_472B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I see a lot of suspicious"
    next "people around these areas."
    para "I think there's some"
    next "criminal activity here, but"
    cont "I can't prove it yet."
    done

Map_472B_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Want to feel refreshed"
    next "and newly born?"
    para "Want to experience your"
    next "life anew?"
    para "Southern Glitchland's"
    next "Spirit Relasing Therapy"
    para "Refresh your mind and"
    next "body, experience a new"
    cont "life."
    done
