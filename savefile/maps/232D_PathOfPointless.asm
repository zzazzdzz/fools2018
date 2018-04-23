SECTION "Map_232D", ROM0[$B800]

Map_232D_Header:
    hdr_tileset         0
    hdr_dimensions      5, 11
    hdr_pointers_a      Map_232D_Blocks, Map_232D_TextPointers
    hdr_pointers_b      Map_232D_Script, Map_232D_Objects
    hdr_pointers_c      Map_232D_InitScript, Map_232D_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $223A, 9, 10
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $2435, 18, 12
    hdr_connection      EAST,  $0000, 0, 0
    
Map_232D_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        7, 5, $02
    hdr_object_count    1
    hdr_object          SPRITE_YOUNG_BOY, 4, 4, STAY, NONE, $01

Map_232D_RAMScript:
    rs_write_3 $c6f6, $0f, $31, $0f
    rs_write_3 $c701, $0f, $31, $0f
    rs_fill_byte $7b
    rs_fill_3 $c761
    rs_fill_3 $c76c
    rs_end

Map_232D_Blocks:
    db $0f,$31,$0f,$0f,$0f
    db $0f,$31,$0a,$0a,$0f
    db $0f,$31,$31,$08,$0f
    db $0f,$0a,$0a,$0a,$0f
    db $0f,$66,$0f,$0f,$0f
    db $0f,$66,$0f,$0f,$0f
    db $0f,$66,$0f,$0f,$0f
    db $0f,$66,$0f,$0f,$0f
    db $90,$7b,$0f,$0f,$0f
    db $90,$7b,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f

Map_232D_TextPointers:
    dw Map_232D_TX1
    dw Map_232D_TX2

Map_232D_InitScript:
    ret
Map_232D_Script:
    ret

Map_232D_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I heard they've just started"
    next "building a road here."
    para "For now however, this path"
    next "really seems to serve"
    cont "no real purpose."
    done

Map_232D_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Western - Eastern"
    next "Glitchland Pass"
    para "In construction"
    done

