SECTION "Map_0565", ROM0[$B800]

Map_0565_Header:
    hdr_tileset         5
    hdr_dimensions      8, 6
    hdr_pointers_a      Map_0565_Blocks, Map_0565_TextPointers
    hdr_pointers_b      Map_0565_Script, Map_0565_Objects
    hdr_pointers_c      Map_0565_InitScript, Map_0565_RAMScript
    hdr_palette         $00
    hdr_music           MUSIC_OAKS_LAB, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0565_Objects:
    hdr_border          $03
    hdr_warp_count      3
    hdr_warp            14, 6, 2, 4, $0566
    hdr_warp            5, 11, 10, 6, $0523
    hdr_warp            4, 11, 10, 6, $0523
    hdr_sign_count      3
    hdr_signpost        4, 1, $07
    hdr_signpost        0, 5, $06
    hdr_signpost        8, 1, $06
    hdr_object_count    5
    hdr_object          SPRITE_OAK_AIDE, 9, 2, STAY, UP, $05
    hdr_object          SPRITE_GIRL, 5, 2, STAY, RIGHT, $04
    hdr_object          SPRITE_OAK_AIDE, 11, 9, STAY, UP, $03
    hdr_object          SPRITE_OAK_AIDE, 8, 7, STAY, DOWN, $02
    hdr_object          SPRITE_SAILOR, 2, 6, STAY, UP, $01

Map_0565_RAMScript:
    rs_end

Map_0565_Blocks:
    db $03,$03,$65,$67,$65,$68,$68,$03
    db $03,$03,$6b,$05,$6b,$27,$05,$03
    db $65,$68,$05,$05,$68,$68,$68,$68
    db $6b,$05,$05,$05,$05,$05,$05,$70
    db $46,$05,$05,$05,$57,$41,$68,$55
    db $03,$05,$04,$05,$05,$05,$05,$05

Map_0565_TextPointers:
    dw Map_0565_TX1
    dw Map_0565_TX2
    dw Map_0565_TX3
    dw Map_0565_TX4
    dw Map_0565_TX5
    dw Map_0565_TX6
    dw Map_0565_TX7

Map_0565_InitScript:
    ret
Map_0565_Script:
    ret

Map_0565_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Welcome to our Glitch"
    next "Research Lab!"
    cont "Feel free to look around."
    done

Map_0565_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I'm trying to investigate"
    next "the inner workings of the"
    cont "arrow tiles."
    para "I placed the arrow tile"
    next "in our lab's map data, but"
    cont "it doesn't work as expected."
    para "Maybe we need to change the"
    next "map script too?"
    para "I'll have to look in the"
    next "disassembly and find out!"
    done

Map_0565_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "According to my research,"
    next "arrow tiles in the map data"
    cont "are purely decorative."
    para "It's the map script that"
    next "does all the work!"
    done

Map_0565_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "I'm working as an assistant"
    next "here."
    para "Right now, I'm helping to"
    next "analyze the Oak's Lab"
    cont "Tilemap Corruption Glitch."
    done

Map_0565_TX5:
    TX_ASM
    jp EnhancedTextOnly
    text "Hmm... let's see, the Oak's"
    next "Lab Tilemap Corruption..."
    para "Aha, here's the problem!"
    next "Too many objects!"
    para "You know what they say."
    next "All objects..."
    cont "...object objects!"
    done

Map_0565_TX6:
    TX_ASM
    jp EnhancedTextOnly
    text "The pokered disassembly's"
    next "main.asm file is displayed"
    cont "on the monitor."
    done

Map_0565_TX7:
    TX_ASM
    jp EnhancedTextOnly
    text "The BGB emulator is running"
    next "with the debugger open."
    para "Hey, what's it debugging?"
    next "It's a game, but it looks"
    cont "exactly like this world!"
    done

