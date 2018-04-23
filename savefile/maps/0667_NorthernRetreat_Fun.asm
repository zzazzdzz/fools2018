SECTION "Map_0667_Fun", ROM0[$B800]

Map_0667_Fun_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_0667_Fun_Blocks, Map_0667_Fun_TextPointers
    hdr_pointers_b      Map_0667_Fun_Script, Map_0667_Fun_Objects
    hdr_pointers_c      Map_0667_Fun_InitScript, Map_0667_Fun_RAMScript
    hdr_palette         $02
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0667_Fun_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            2, 7, 11, 20, $062F
    hdr_warp            3, 7, 11, 20, $062F
    hdr_sign_count      0
    hdr_object_count    4
    hdr_object          SPRITE_LASS, 5, 4, STAY, LEFT, $03
    hdr_object          SPRITE_FOULARD_WOMAN, 5, 3, STAY, LEFT, $04
    hdr_object          SPRITE_CLEFAIRY, 7, 4, WALK, UP_DOWN, $02
    hdr_object          SPRITE_HIKER, 2, 4, STAY, RIGHT, $01

Map_0667_Fun_RAMScript:
    rs_end

Map_0667_Fun_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_0667_Fun_TextPointers:
    dw Map_0667_Fun_TX1
    dw Map_0667_Fun_TX2
    dw Map_0667_Fun_TX3
    dw Map_0667_Fun_TX4

Map_0667_Fun_InitScript:
    ret
Map_0667_Fun_Script:
    ret

Map_0667_Fun_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Giving nicknames to your"
    next "Pokémon is very important."
    para "It promotes forming strong"
    next "emotional bonds with the"
    cont "Pokémon you catch."
    para "That's why I give a name"
    next "to every Pokémon I have!"
    para "Oh, I have guests, too."
    next "You can join in!"
    done

Map_0667_Fun_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "It's a Clefairy!"
    para "It also has a name tag."
    next "Its name is 'POOPBUTT'."
    done

Map_0667_Fun_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "I saw a guy walking in"
    next "that pointless path in"
    cont "Western Glitchland."
    para "He's a strange person."
    next "It's as if you took all"
    cont "of the Internet's memes"
    cont "about introverts and stuck"
    cont "them all to one human being."
    done

Map_0667_Fun_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "I feel sorry for the guy"
    next "who lives in that abandoned"
    cont "cabin in Western Glitchland."
    para "All alone, away from the"
    next "civilization."
    para "I bet if he had any friends,"
    next "they wouldn't even bother to"
    cont "come so far to meet him."
    cont "What a loser."
    para "I also heard him playing the"
    next "GSC Lucky Channel theme"
    cont "every two months or so."
    cont "I wonder what he's up to?"
    done
