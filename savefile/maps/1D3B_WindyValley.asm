SECTION "Map_1D3B", ROM0[$B800]

Map_1D3B_Header:
    hdr_tileset         0
    hdr_dimensions      7, 13
    hdr_pointers_a      Map_1D3B_Blocks, Map_1D3B_TextPointers
    hdr_pointers_b      Map_1D3B_Script, Map_1D3B_Objects
    hdr_pointers_c      Map_1D3B_InitScript, Map_1D3B_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $1C2C, 6, 12
    hdr_connection      SOUTH, $1E33, 7, 1
    hdr_connection      WEST,  $223A, 14, 7
    hdr_connection      EAST,  $2125, 1, 5
    
Map_1D3B_Objects:
    hdr_border          $0b
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_DAISY, 6, 19, WALK, NONE, $01
    hdr_object          SPRITE_BRUNETTE_GIRL, 4, 5, WALK, NONE, $03

Map_1D3B_RAMScript:
    rs_write_3 $c6fa, $6d, $7a, $6e
    rs_write_3 $c707, $6d, $7a, $6e
    rs_fill_byte $6c
    rs_fill_3 $c750
    rs_write_term  $c75a
    db $6c,$6c,$6c,$7a,$7a,$7a,$ff
    rs_write_term  $c767
    db $7a,$7a,$7a,$6f,$6f,$6f,$ff
    rs_fill_byte $6f
    rs_fill_3 $c774
    rs_write_3 $c7bd, $6d, $7a, $6e
    rs_write_3 $c7ca, $6d, $7a, $6e
    rs_end

Map_1D3B_Blocks:
    db $62,$51,$6d,$7a,$6e,$51,$63
    db $4e,$0a,$0a,$7a,$0a,$0a,$4d
    db $4e,$7a,$7a,$7a,$7a,$7a,$4d
    db $4e,$7a,$49,$23,$48,$7a,$4d
    db $4e,$7a,$27,$55,$27,$7a,$4d
    db $6c,$7a,$44,$23,$45,$7a,$6c
    db $7a,$7a,$7a,$7a,$7a,$7a,$7a
    db $6f,$7a,$49,$23,$48,$7a,$6f
    db $4e,$7a,$27,$55,$27,$7a,$4d
    db $4e,$7a,$44,$23,$45,$7a,$4d
    db $4e,$7a,$7a,$7a,$7a,$7a,$4d
    db $4e,$0a,$0a,$7a,$0a,$0a,$4d
    db $50,$52,$6d,$7a,$6e,$52,$4f

Map_1D3B_TextPointers:
    dw Map_1D3B_TX1
    dw Map_1D3B_TX2
    dw Map_1D3B_TX3

Map_1D3B_InitScript:
    ret
Map_1D3B_Script:
    ret

Map_1D3B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Look, this translation"
    next "software allows me to"
    cont "easily speak multiple"
    cont "languages!"
    para "Estás usando este software"
    next "de traducción de forma"
    cont "incorrecta."
    para "Por favor, consulta el"
    next "manual."
    done

Map_1D3B_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "redacted"
    done

Map_1D3B_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Wow, this place is truly"
    next "beautiful!"
    para "Quick? Where is my"
    next "potato-quality camera?"
    para "I need to post this on"
    next "the Web!"
    done

