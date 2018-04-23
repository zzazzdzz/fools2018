SECTION "Map_106D", ROM0[$B800]

Map_106D_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_106D_Blocks, Map_106D_TextPointers
    hdr_pointers_b      Map_106D_Script, Map_106D_Objects
    hdr_pointers_c      Map_106D_InitScript, Map_106D_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_CELADON, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_106D_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 3, 8, $103B
    hdr_warp            2, 7, 3, 8, $103B
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GAMBLER, 2, 4, STAY, RIGHT, $01

Map_106D_RAMScript:
    rs_end

Map_106D_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_106D_TextPointers:
    dw Map_106D_TX1

Map_106D_InitScript:
    ret
Map_106D_Script:
    ret

Map_106D_TX1:
    TX_ASM
    ld hl, Map_106D_Intro
    call PrintTextEnhanced
.choose
    ld hl, Map_106D_Choose
    call PrintTextEnhanced
    ld de, Map_106D_MenuText
    ld bc, $050d
    call PrintChoiceMenu
    and a
    jr z, .quit
    add a
    ld b, 0
    ld c, a
    ld hl, Map_106D_TextTable
    add hl, bc
    ld a, [hli]
    ld h, [hl]
    ld l, a
    call PrintTextEnhanced
    jr .choose
.quit
    ld hl, Map_106D_Quit
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_106D_TextTable:
    dw 1337 ; dummy
    dw Map_106D_NorthernEdge
    dw Map_106D_WesternEdge
    dw Map_106D_EasternEdge
    dw Map_106D_SouthernEdge
    
Map_106D_MenuText:
    db $82,$a0,$ad,$a2,$a4,$ab,$4f
    db $8d,$ae,$b1,$b3,$a7,$a4,$b1,$ad,$7f,$84,$a3,$a6,$a4,$4f
    db $96,$a4,$b2,$b3,$a4,$b1,$ad,$7f,$84,$a3,$a6,$a4,$4f
    db $84,$a0,$b2,$b3,$a4,$b1,$ad,$7f,$84,$a3,$a6,$a4,$4f
    db $92,$ae,$b4,$b3,$a7,$a4,$b1,$ad,$7f,$84,$a3,$a6,$a4
    db $50
    
Map_106D_Intro:
    text "Hello, young traveler!"
    para "Back in the day, I used"
    next "to be a lot like you."
    para "But now, I'm too old, and"
    next "my enthusiasm is long gone."
    para "All that remains is my"
    next "knowledge."
    wait

Map_106D_Choose:
    text "Do you want me to explain"
    next "anything to you?"
    done
    
Map_106D_NorthernEdge:
    text "At the Northern Edge you"
    next "will find an item that"
    cont "allows you to surf."
    para "It's relatively easy to get,"
    next "there are no prerequisites."
    cont "Just go grab it!"
    wait
    
Map_106D_WesternEdge:
    text "At the Western Edge you'll"
    next "get an item that allows"
    cont "you to freely teleport to"
    cont "any town you've visited."
    para "It's the equivalent of the"
    next "move 'Fly' in other regions."
    para "To go there however, you'll"
    next "need to make it through the"
    cont "Dark Cave, which without"
    cont "lighting it, might be a bit"
    cont "difficult."
    wait
    
Map_106D_EasternEdge:
    text "At the Eastern Edge lies the"
    next "strangest items of them all."
    para "It does not have a single"
    next "purpose. It can do a lot of"
    cont "different things."
    para "It all depends on where you'll"
    next "try to use it."
    para "For example, in caves, it will"
    next "act like the move 'Flash',"
    cont "lighting up the area."
    para "To reach it, you'll have to"
    next "go through the Lost Woods,"
    cont "but if you ask the locals,"
    cont "you can easily make it."
    wait
    
Map_106D_SouthernEdge:
    text "At the Southern Edge you'll"
    next "find an item that is able to"
    cont "remove corrupted tiles from"
    cont "the map."
    para "This could open up new places"
    next "and passages for you to"
    cont "investigate and explore."
    para "It's probably the easiest one"
    next "to get. No prerequisites."
    cont "Just point A to point B."
    wait

Map_106D_Quit:
    text "I understand."
    next "Come again."
    done

