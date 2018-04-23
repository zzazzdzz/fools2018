SECTION "Map_0734", ROM0[$B800]

Map_0734_Header:
    hdr_tileset         0
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_0734_Blocks, Map_0734_TextPointers
    hdr_pointers_b      Map_0734_Script, Map_0734_Objects
    hdr_pointers_c      Map_0734_InitScript, Map_0734_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $062F, 16, 1
    hdr_connection      WEST,  $0824, 22, 7
    hdr_connection      EAST,  $0D3E, 1, 9
    
Map_0734_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 4, 3, STAY, DOWN, $01
    hdr_object          SPRITE_ERIKA, 3, 3, STAY, DOWN, $02

Map_0734_RAMScript:
    rs_fill_byte $51
    rs_fill_3 $c71c
    rs_write_term  $c726
    db $51,$51,$51,$31,$31,$31,$ff
    rs_write_term  $c733
    db $31,$31,$31,$0a,$0a,$0a,$ff
    rs_fill_byte $0a
    rs_fill_3 $c740
    rs_write_3 $c76f, $4e, $31, $4d
    rs_write_3 $c77c, $4e, $31, $4d
    rs_end

Map_0734_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $51,$51,$51,$51,$51,$51,$51
    db $31,$31,$31,$31,$31,$31,$31
    db $0a,$0a,$0a,$31,$0a,$0a,$0a
    db $0f,$0f,$4e,$31,$4d,$0f,$0f
    db $0f,$0f,$4e,$31,$4d,$0f,$0f
    db $0f,$0f,$4e,$31,$4d,$0f,$0f

Map_0734_TextPointers:
    dw Map_0734_TX1
    dw Map_0734_TX2

Map_0734_InitScript:
    ret
Map_0734_Script:
    ret

Map_0734_TX1:
    db 8
    jp EnhancedTextOnly
    text "TO LET THE MONSTER"
    next "BECOMES STRONGER,"
    cont "THE COACH MUST BE"
    cont "STRONGER."
    para "IF ONLY SO, THE MONSTER"
    next "MUST BE STRONGER."
    done

Map_0734_TX2:
    db 8
    jp EnhancedTextOnly
    text "I'm sorry for my boyfriend."
    next "He's from Vietnam."
    done

