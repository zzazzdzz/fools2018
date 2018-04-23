SECTION "Map_2F81_Fun", ROM0[$B800]

Map_2F81_Fun_Header:
    hdr_tileset         19
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_2F81_Fun_Blocks, Map_2F81_Fun_TextPointers
    hdr_pointers_b      Map_2F81_Fun_Script, Map_2F81_Fun_Objects
    hdr_pointers_c      Map_2F81_Fun_InitScript, Map_2F81_Fun_RAMScript
    hdr_palette         $01
    hdr_music           MUSIC_CELADON, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2F81_Fun_Objects:
    hdr_border          $0f
    hdr_warp_count      2
    hdr_warp            5, 7, 14, 4, $2F38
    hdr_warp            4, 7, 14, 4, $2F38
    hdr_sign_count      3
    hdr_signpost        5, 1, $05
    hdr_signpost        1, 4, $04
    hdr_signpost        1, 1, $03
    hdr_object_count    2
    hdr_object          SPRITE_BUG_CATCHER, 0, 5, STAY, UP, $02
    hdr_object          SPRITE_BRUNETTE_GIRL, 3, 3, STAY, NONE, $01

Map_2F81_Fun_RAMScript:
    rs_end

Map_2F81_Fun_Blocks:
    db $0e,$05,$0e,$24
    db $23,$0b,$23,$0b
    db $0a,$0b,$0b,$0b
    db $0b,$0b,$41,$0b

Map_2F81_Fun_TextPointers:
    dw Map_2F81_Fun_TX1
    dw Map_2F81_Fun_TX2
    dw Map_2F81_Fun_TX3
    dw Map_2F81_Fun_TX4
    dw Map_2F81_Fun_TX5

Map_2F81_Fun_InitScript:
    ret
Map_2F81_Fun_Script:
    ret

Map_2F81_Fun_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "We? We're just a humble"
    next "game studio."
    para "We're working on many"
    next "different things, but today,"
    cont "it's our day off."
    para "TheZZAZZGlitch just released"
    next "his April Fools event."
    para "We need to disassemble it"
    next "and laugh at the quality"
    cont "of the code!"
    done

Map_2F81_Fun_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "The code behind this event"
    next "is so stupid!"
    para "Why would you clear the"
    next "carry flag by chaining the"
    cont "SCF instruction with CCF?"
    para "You can just AND A to clear"
    next "it. It's not rocket science!"
    cont "And it takes one byte less!"
    para "Obviously when it takes less"
    next "bytes, then it's better!"
    done

Map_2F81_Fun_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "A conversation thread is"
    next "displayed on the monitor."
    cont "Several users are arguing"
    cont "about something."
    para "And then there's a GIF of"
    next "a... llama eating popcorn."
    para "This single image, snuck"
    next "in the middle of this"
    cont "argument, got 30 likes."
    para "How a single GIF image like"
    next "this amuses so many people?"
    para "That doesn't make any sense."
    next "Welcome to Fidei."
    done

Map_2F81_Fun_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "It's the game program!"
    next "Messing with it could bug"
    cont "out the game!"
    para "Oh wait, the game is"
    next "already buggy as hell."
    done

Map_2F81_Fun_TX5:
    TX_ASM
    jp EnhancedTextOnly
    text "The disassembly of the event"
    next "SAV file is displayed on"
    cont "the screen."
    para "Almost every line has some"
    next "sort of comment attached."
    para "Most of the comments just"
    next "read 'NotLikeThis'."
    done

