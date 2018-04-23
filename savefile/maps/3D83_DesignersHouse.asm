SECTION "Map_3D83", ROM0[$B800]

Map_3D83_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_3D83_Blocks, Map_3D83_TextPointers
    hdr_pointers_b      Map_3D83_Script, Map_3D83_Objects
    hdr_pointers_c      Map_3D83_InitScript, Map_3D83_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3D83_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 3, 6, $3D20
    hdr_warp            2, 7, 3, 6, $3D20
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_YOUNG_BOY, 2, 4, STAY, RIGHT, $01

Map_3D83_RAMScript:
    rs_end

Map_3D83_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_3D83_TextPointers:
    dw Map_3D83_TX1

Map_3D83_InitScript:
    ret
Map_3D83_Script:
    ret

Map_3D83_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Hi, I'm Matthew!"
    next "The genius level designer!"
    para "Game design is my passion!"
    para "I created a great new map"
    next "for you to enjoy. Could you"
    cont "help me in beta testing?"
    para "Just go to the west from here,"
    next "and you'll be impressed!"
    done

