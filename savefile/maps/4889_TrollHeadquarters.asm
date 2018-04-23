SECTION "Map_4889", ROM0[$B800]

Map_4889_Header:
    hdr_tileset         16
    hdr_dimensions      8, 6
    hdr_pointers_a      Map_4889_Blocks, Map_4889_TextPointers
    hdr_pointers_b      Map_4889_Script, Map_4889_Objects
    hdr_pointers_c      Map_4889_InitScript, Map_4889_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON1, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4889_Objects:
    hdr_border          $0d
    hdr_warp_count      2
    hdr_warp            11, 11, 12, 6, $482B
    hdr_warp            10, 11, 11, 6, $482B
    hdr_sign_count      3
    hdr_signpost        13, 6, $05
    hdr_signpost        8, 2, $04
    hdr_signpost        4, 2, $03
    hdr_object_count    2
    hdr_object          SPRITE_ROCKET, 9, 5, STAY, NONE, $02
    hdr_object          SPRITE_ROCKET, 3, 3, STAY, UP, $01

Map_4889_RAMScript:
    rs_end

Map_4889_Blocks:
    db $21,$22,$22,$22,$22,$22,$22,$29
    db $24,$01,$02,$01,$02,$10,$11,$2a
    db $24,$0e,$0e,$0e,$0e,$14,$15,$2a
    db $25,$26,$26,$2b,$0e,$18,$38,$2a
    db $0d,$0d,$0d,$0d,$0e,$0e,$0e,$2a
    db $0d,$0d,$0d,$0d,$30,$0c,$2c,$2e

Map_4889_TextPointers:
    dw Map_4889_TX1
    dw Map_4889_TX2
    dw Map_4889_TX3
    dw Map_4889_TX4
    dw Map_4889_TX3

Map_4889_InitScript:
    ret
Map_4889_Script:
    ret

Map_4889_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I have demonetized about"
    next "800 videos so far."
    cont "My boss will be so proud!"
    para "This is much easier than"
    next "trying to steal Pokémon!"
    done

Map_4889_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Hey, what's a kid doing"
    next "here?"
    para "We're not doing anything"
    next "shady!"
    cont "Please get out!"
    done

Map_4889_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "It's an administration"
    next "panel of some sort."
    para "On the left, a list of"
    next "YouTube videos is cleanly"
    cont "displayed."
    para "And on the right, there's"
    next "just one giant button:"
    cont "'Demonetize'."
    done

Map_4889_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "A document titled '200"
    next "universal reasons for"
    cont "demonetization' is opened"
    cont "on the screen."
    done
