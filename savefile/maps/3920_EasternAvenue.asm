SECTION "Map_3920", ROM0[$B800]

Map_3920_Header:
    hdr_tileset         0
    hdr_dimensions      10, 11
    hdr_pointers_a      Map_3920_Blocks, Map_3920_TextPointers
    hdr_pointers_b      Map_3920_Script, Map_3920_Objects
    hdr_pointers_c      Map_3920_InitScript, Map_3920_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $3420, 9, 12
    hdr_connection      SOUTH, $3D20, 8, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $3A3E, 1, 8
    
Map_3920_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_ROCKER, 10, 15, STAY, NONE, $01
    hdr_object          SPRITE_DAISY, 7, 5, STAY, NONE, $02

Map_3920_RAMScript:
    rs_write_2 $c6ff, $7a, $27
    rs_write_2 $c70f, $7a, $27
    rs_fill_byte $7a
    rs_fill_3 $c765
    rs_fill_byte $23
    rs_fill_3 $c775
    rs_fill_byte $7a
    rs_fill_3 $c785
    rs_write_2 $c7cf, $27, $7a
    rs_write_2 $c7df, $27, $7a
    rs_end

Map_3920_Blocks:
    db $0f,$0f,$0f,$0f,$7a,$27,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$7a,$27,$7a,$0f,$0f,$0f
    db $0f,$0f,$7a,$7a,$7a,$27,$7a,$0b,$0b,$0f
    db $0f,$0f,$49,$23,$23,$45,$7a,$5d,$0b,$0f
    db $0f,$0f,$27,$7a,$7a,$7a,$7a,$27,$7a,$7a
    db $0f,$0f,$27,$7a,$0f,$0f,$7a,$26,$23,$23
    db $0f,$0f,$27,$7a,$7a,$7a,$7a,$27,$7a,$7a
    db $0f,$0f,$44,$23,$48,$7a,$7a,$5e,$0b,$0f
    db $0f,$0f,$7a,$7a,$27,$7a,$0b,$0b,$0b,$0f
    db $0f,$0f,$0f,$0f,$27,$7a,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$27,$7a,$0f,$0f,$0f,$0f

Map_3920_TextPointers:
    dw Map_3920_TX1
    dw Map_3920_TX2

Map_3920_InitScript:
    ret
Map_3920_Script:
    ret

Map_3920_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "An aspiring level designer"
    next "lives just south from there."
    para "Recently, I saw him work on"
    next "his newest creation."
    cont "I wonder how he's doing?"
    done

Map_3920_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I haven't lost any Pokémon"
    next "battle in my lifetime!"
    para "I also haven't won any, but"
    next "that's less important!"
    done

