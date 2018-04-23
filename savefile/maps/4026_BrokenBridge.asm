SECTION "Map_4026", ROM0[$B800]

Map_4026_Header:
    hdr_tileset         0
    hdr_dimensions      11, 6
    hdr_pointers_a      Map_4026_Blocks, Map_4026_TextPointers
    hdr_pointers_b      Map_4026_Script, Map_4026_Objects
    hdr_pointers_c      Map_4026_InitScript, Map_4026_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $412E, 26, 7
    hdr_connection      EAST,  $3F3D, 1, 15
    
Map_4026_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_MR_MASTERBALL, 14, 5, STAY, LEFT, $01

Map_4026_RAMScript:
    rs_fill_byte $6b
    rs_fill_3 $c71b
    rs_fill_3 $c729
    rs_fill_byte $54
    rs_fill_3 $c73d
    rs_fill_len $c74b, 6
    rs_write_term  $c75c
    db $54,$54,$54,$78,$78,$78,$ff
    rs_write_term  $c76d
    db $78,$78,$78,$6b,$6b,$6b,$ff
    rs_fill_byte $6b
    rs_fill_3 $c77e
    rs_end

Map_4026_Blocks:
    db $6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b
    db $43,$43,$43,$43,$43,$43,$43,$43,$43,$43,$43
    db $54,$54,$54,$54,$43,$54,$43,$54,$54,$54,$54
    db $54,$54,$78,$54,$54,$78,$43,$78,$54,$54,$54
    db $78,$78,$43,$78,$78,$43,$43,$43,$78,$78,$78
    db $6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b,$6b

Map_4026_TextPointers:
    dw Map_4026_TX1

Map_4026_InitScript:
    ret
Map_4026_Script:
    ret

Map_4026_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I'm sorry, it looks like"
    next "the bridge here is out"
    cont "of service."
    para "If only there was a way"
    next "to go across water..."
    done

