SECTION "Map_2478", ROM0[$B800]

Map_2478_Header:
    hdr_tileset         8
    hdr_dimensions      5, 4
    hdr_pointers_a      Map_2478_Blocks, Map_2478_TextPointers
    hdr_pointers_b      Map_2478_Script, Map_2478_Objects
    hdr_pointers_c      Map_2478_InitScript, Map_2478_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2478_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 5, 8, $2435
    hdr_warp            2, 7, 5, 8, $2435
    hdr_sign_count      4
    hdr_signpost        5, 3, $01
    hdr_signpost        5, 4, $01
    hdr_signpost        5, 0, $02
    hdr_signpost        0, 1, $03
    hdr_object_count    0

Map_2478_RAMScript:
    rs_end

Map_2478_Blocks:
    db $10,$11,$0e,$08,$09
    db $0f,$0f,$14,$1d,$0f
    db $1e,$0f,$18,$19,$1e
    db $06,$0b,$0f,$0f,$07

Map_2478_TextPointers:
    dw Map_2478_TX1
    dw Map_2478_TX2
    dw Map_2478_TX3

Map_2478_InitScript:
    ret
Map_2478_Script:
    ld hl, Map_2478_TilesetSetCoords
    call ArePlayerCoordsInArray
    jr c, .tilesetSet
    ld hl, Map_2478_TilesetUnsetCoords
    call ArePlayerCoordsInArray
    jr c, .tilesetUnset
    ret
.tilesetSet
    ld a, $ff
    ld [$d366], a
    ret
.tilesetUnset
    ld a, 8
    ld [$d366], a
    ret
    
Map_2478_TilesetSetCoords:
    db 2, 0, 1, 5, $ff
Map_2478_TilesetUnsetCoords:
    db 2, 1, 3, 0, 1, 4, 1, 6, 2, 5, $ff

Map_2478_TX1:
    TX_ASM
    ld hl, Map_2478_DiaryIntro
    call PrintTextEnhanced
    call .yesno
    and a
    jr nz, .finish
    ld hl, Map_2478_Diary1
    call PrintTextEnhanced
    call .yesno
    and a
    jr nz, .finish
    ld hl, Map_2478_Diary2
    call PrintTextEnhanced
    call .yesno
    and a
    jr nz, .finish
    ld hl, Map_2478_Diary3
    call PrintTextEnhanced
    jp TextScriptEnd
.finish
    ld hl, Map_2478_DiaryNope
    call PrintTextEnhanced
    jp TextScriptEnd
.yesno
    ld de, YesNoBoxset
    ld bc, $0203
    jp PrintChoiceMenu
    
Map_2478_DiaryIntro:
    text "A diary."
    next "Want to peek inside?"
    done

Map_2478_Diary1:
    text "You are a horrible person..."
    para "23rd of February, 2018"
    para "The day I eagerly awaited"
    next "for many months has finally"
    cont "come."
    para "Just who exactly are these"
    next "people I wanted to see for"
    cont "so long?"
    para "Are they the missing piece of"
    next "the puzzle I've been trying"
    cont "to solve since long ago?"
    para "That's for me to find out."
    next "Today."
    para "Continue reading?"
    done
    
Map_2478_Diary2:
    text "2nd of March, 2018"
    para "Looking back at that fateful"
    next "day, exactly one week ago..."
    para "What did I exactly expect"
    next "to accomplish?"
    para "No matter what I do and how"
    next "much I try, I'm not going"
    cont "anywhere."
    para "When so many people are so"
    next "much better than you in"
    cont "every way, you're forced to"
    cont "forever stay on the side of"
    cont "things..."
    para "Continue reading?"
    done
    
Map_2478_Diary3:
    text "9th of March, 2018"
    para "And here I am, in front of"
    next "a blank piece of paper."
    para "This is the one and only true"
    next "friend I'll ever have."
    para "One that understands, and"
    next "one that cares."
    para "When an artist feels down, an"
    next "artist creates."
    para "A painter has his canvas."
    next "A composer writes music."
    para "And what do I want to do?"
    next "I want to create worlds."
    para "The rest of the pages are"
    next "blank..."
    done
    
Map_2478_DiaryNope:
    text "You decide not to read..."
    done

Map_2478_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "A sketch is hanging on the"
    next "wall."
    para "A dark, shadowy figure is"
    next "standing in front of a long,"
    cont "unlit hallway."
    para "Written below the image:"
    next "JUST WHO THE FUCK ARE YOU."
    done

Map_2478_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "It's a PC. Someone left it"
    next "turned on."
    para "Several windows are opened."
    next "There's the BGB debugger,"
    cont "command prompt, and a Web"
    cont "browser."
    para "The browser is opened on a"
    next "Facebook group conversation"
    cont "with two other people."
    para "The last message is a four"
    next "leaf clover emoji, one day"
    cont "ago."
    done
