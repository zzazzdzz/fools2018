SECTION "Map_4384", ROM0[$B800]

Map_4384_Header:
    hdr_tileset         19
    hdr_dimensions      7, 5
    hdr_pointers_a      Map_4384_Blocks, Map_4384_TextPointers
    hdr_pointers_b      Map_4384_Script, Map_4384_Objects
    hdr_pointers_c      Map_4384_InitScript, Map_4384_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_CELADON, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4384_Objects:
    hdr_border          $0f
    hdr_warp_count      2
    hdr_warp            7, 9, 12, 6, $432A
    hdr_warp            6, 9, 12, 6, $432A
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_ERIKA, 12, 3, STAY, NONE, $03
    hdr_object          SPRITE_GUARD, 3, 2, STAY, UP, $02
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 2, 6, STAY, NONE, $01

Map_4384_RAMScript:
    rs_end

Map_4384_Blocks:
    db $11,$11,$11,$32,$11,$11,$11
    db $07,$07,$07,$07,$07,$07,$07
    db $11,$11,$11,$07,$11,$11,$11
    db $07,$07,$07,$07,$07,$07,$07
    db $36,$10,$07,$3e,$07,$10,$36

Map_4384_TextPointers:
    dw Map_4384_TX1
    dw Map_4384_TX2
    dw Map_4384_TX3

Map_4384_InitScript:
    ret
Map_4384_Script:
    ret

Map_4384_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Sssh! Be quiet!"
    next "This is a library!"
    done

Map_4384_TX2:
    TX_ASM
    ld hl, .txt
    call PrintTextEnhanced
    ld a, PREDEF_ShowMapOfGlitchland
    call PredefCmd
    jp TextScriptEnd
.txt
    text "Look at that! It's the"
    next "entire map of Glitchland!"
    para "I had no idea that this"
    next "world is so big!"
    done

Map_4384_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "I have a book that is long"
    next "overdue... I think by about"
    cont "6 years now."
    para "But here's the thing. As long"
    next "as I never return it, I'll"
    cont "never need to pay any fines!"
    para "I'm so evil, I think I might"
    next "join Team Rocket!"
    para "Stealing Pokémon as well as"
    next "books? Sign me right up!"
    done

