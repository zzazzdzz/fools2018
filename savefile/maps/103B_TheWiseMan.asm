SECTION "Map_103B", ROM0[$B800]

Map_103B_Header:
    hdr_tileset         0
    hdr_dimensions      7, 6
    hdr_pointers_a      Map_103B_Blocks, Map_103B_TextPointers
    hdr_pointers_b      Map_103B_Script, Map_103B_Objects
    hdr_pointers_c      Map_103B_InitScript, Map_103B_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0F3B, 8, 24
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_103B_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            3, 7, 2, 7, $106D
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 9, 5, STAY, NONE, $01

Map_103B_RAMScript:
    rs_write_term  $c6fa
    db $74,$55,$55,$7a,$ff
    rs_write_term  $c707
    db $7a,$55,$55,$74,$ff
    rs_end

Map_103B_Blocks:
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$0f,$7a,$55,$55,$74,$0f
    db $0f,$0f,$74,$55,$55,$7a,$0f
    db $0f,$02,$09,$03,$55,$74,$0f
    db $0f,$55,$55,$55,$55,$7a,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_103B_TextPointers:
    dw Map_103B_TX1

Map_103B_InitScript:
    ret
Map_103B_Script:
    ret

Map_103B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "The man living in this"
    next "house seems to know a lot"
    cont "about this world."
    para "He gave me a lot of"
    next "useful hints about what"
    cont "to do next!"
    done

