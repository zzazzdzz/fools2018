SECTION "Map_423A", ROM0[$B800]

Map_423A_Header:
    hdr_tileset         0
    hdr_dimensions      9, 10
    hdr_pointers_a      Map_423A_Blocks, Map_423A_TextPointers
    hdr_pointers_b      Map_423A_Script, Map_423A_Objects
    hdr_pointers_c      Map_423A_InitScript, Map_423A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $3F3D, 12, 26
    hdr_connection      SOUTH, $4530, 8, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $432A, 1, 6
    
Map_423A_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_FISHER2, 8, 12, STAY, UP, $02
    hdr_object          SPRITE_SAILOR, 13, 6, STAY, RIGHT, $01

Map_423A_RAMScript:
    rs_fill_byte $54
    rs_fill_2 $c6fd
    rs_fill_2 $c70c
    rs_fill_3 $c76c
    rs_fill_byte $78
    rs_fill_3 $c77b
    rs_fill_byte $54
    rs_fill_2 $c7b0
    rs_fill_2 $c7bf
    rs_end

Map_423A_Blocks:
    db $18,$43,$43,$54,$54,$43,$43,$43,$19
    db $18,$43,$43,$54,$54,$43,$43,$43,$19
    db $18,$43,$43,$54,$54,$54,$54,$43,$19
    db $18,$43,$43,$54,$54,$54,$54,$43,$19
    db $18,$43,$43,$78,$78,$54,$54,$43,$43
    db $18,$43,$43,$43,$43,$54,$54,$54,$54
    db $18,$43,$54,$54,$54,$54,$54,$78,$78
    db $18,$43,$54,$54,$54,$54,$54,$43,$19
    db $18,$43,$54,$54,$78,$78,$78,$43,$19
    db $18,$43,$54,$54,$43,$43,$43,$43,$19

Map_423A_TextPointers:
    dw Map_423A_TX1
    dw Map_423A_TX2

Map_423A_InitScript:
    ret
Map_423A_Script:
    ret

Map_423A_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "This place has so much"
    next "water, I rate it 7.8/10."
    para "The only thing missing here"
    next "are the trumpets."
    done

Map_423A_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "FISHING! FISHING!"
    next "WIN! WIN!"
    para "THAT IS THE RALATIONSHIP"
    next "BETWEEN ELF AND I"
    done
