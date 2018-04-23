SECTION "Map_0667", ROM0[$B800]

Map_0667_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_0667_Blocks, Map_0667_TextPointers
    hdr_pointers_b      Map_0667_Script, Map_0667_Objects
    hdr_pointers_c      Map_0667_InitScript, Map_0667_RAMScript
    hdr_palette         $02
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0667_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            2, 7, 11, 20, $062F
    hdr_warp            3, 7, 11, 20, $062F
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_CLEFAIRY, 6, 3, WALK, UP_DOWN, $02
    hdr_object          SPRITE_HIKER, 2, 4, STAY, RIGHT, $01

Map_0667_RAMScript:
    rs_end

Map_0667_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_0667_TextPointers:
    dw Map_0667_TX1
    dw Map_0667_TX2

Map_0667_InitScript:
    ret
Map_0667_Script:
    ret

Map_0667_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Giving nicknames to your"
    next "Pokémon is very important."
    para "It promotes forming strong"
    next "emotional bonds with the"
    cont "Pokémon you catch."
    para "That's why I give a name"
    next "to every Pokémon I have!"
    done

Map_0667_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "It's a Clefairy!"
    para "It also has a name tag."
    next "Its name is 'POOPBUTT'."
    done

