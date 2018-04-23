SECTION "Map_4D3A", ROM0[$B800]

Map_4D3A_Header:
    hdr_tileset         0
    hdr_dimensions      8, 14
    hdr_pointers_a      Map_4D3A_Blocks, Map_4D3A_TextPointers
    hdr_pointers_b      Map_4D3A_Script, Map_4D3A_Objects
    hdr_pointers_c      Map_4D3A_InitScript, Map_4D3A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $4F21, 5, 1
    hdr_connection      WEST,  $4C21, 20, 13
    hdr_connection      EAST,  $4E22, 4, 11
    
Map_4D3A_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        5, 5, $03
    hdr_object_count    1
    hdr_object          SPRITE_GAMBLER, 11, 21, STAY, NONE, $02

Map_4D3A_RAMScript:
    rs_fill_byte $6c
    rs_fill_3 $c720
    rs_fill_byte $31
    rs_fill_3 $c72e
    rs_fill_byte $6f
    rs_fill_3 $c73c
    rs_fill_byte $1f
    rs_fill_3 $c755
    rs_fill_byte $43
    rs_fill_3 $c763
    rs_fill_3 $c771
    rs_fill_3 $c77f
    rs_write_3 $c7dc, $6d, $31, $6e
    rs_write_3 $c7ea, $6d, $31, $6e
    rs_end

Map_4D3A_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $6c,$6c,$6c,$36,$0f,$0f,$0f,$0f
    db $31,$31,$08,$0a,$0f,$0f,$0f,$0f
    db $6f,$4c,$31,$31,$6e,$0f,$0f,$0f
    db $0f,$6d,$0a,$31,$6e,$0f,$1d,$1f
    db $0f,$0f,$0a,$31,$0a,$6e,$65,$43
    db $0f,$0f,$6d,$31,$31,$0a,$65,$43
    db $0f,$0f,$6d,$0a,$31,$0a,$0f,$65
    db $0f,$0f,$6d,$0a,$31,$0a,$6e,$0f
    db $0f,$0f,$0f,$0a,$31,$0a,$6e,$0f
    db $0f,$0f,$0f,$0a,$31,$0a,$6e,$0f
    db $0f,$0f,$0f,$6d,$31,$0a,$0f,$0f
    db $0f,$0f,$0f,$6d,$31,$6e,$0f,$0f
    db $0f,$0f,$0f,$6d,$31,$6e,$0f,$0f

Map_4D3A_TextPointers:
    dw Map_4D3A_TX1
    dw Map_4D3A_TX2
    dw Map_4D3A_TX3

Map_4D3A_InitScript:
    ret
Map_4D3A_Script:
    ret

Map_4D3A_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "redacted" ; auto-generated stub

Map_4D3A_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Yes! I was successfully"
    next "able to visit all four edges"
    cont "and acquire all the items!"
    para "Now this world shouldn't"
    next "have any secrets for me!"
    done

Map_4D3A_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Welcome to Yet Another"
    next "Pathway!"
    para "Just go down to arrive"
    next "at the Southern Edge."
    para "We hope you enjoyed this"
    next "series of completely"
    cont "useless, uninspired routes!"
    done

