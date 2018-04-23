SECTION "Map_043A", ROM0[$B800]

Map_043A_Header:
    hdr_tileset         0
    hdr_dimensions      12, 9
    hdr_pointers_a      Map_043A_Blocks, Map_043A_TextPointers
    hdr_pointers_b      Map_043A_Script, Map_043A_Objects
    hdr_pointers_c      Map_043A_InitScript, Map_043A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0327, 1, 8
    
Map_043A_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      4
    hdr_signpost        3, 3, $03
    hdr_signpost        9, 14, $04
    hdr_signpost        4, 12, $05
    hdr_signpost        9, 5, $06
    hdr_object_count    2
    hdr_object          SPRITE_BRUNO, 8, 8, STAY, UP, $02
    hdr_object          SPRITE_DAISY, 19, 10, STAY, NONE, $01

Map_043A_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c787
    rs_fill_byte $31
    rs_fill_3 $c799
    rs_fill_byte $0a
    rs_fill_3 $c7ab
    rs_end

Map_043A_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$1d,$1f,$1f,$1e,$0b,$0b,$0b,$7a,$0f,$0f,$0f
    db $0f,$65,$54,$43,$2d,$1e,$0b,$7a,$7a,$7a,$0f,$0f
    db $0f,$65,$54,$43,$43,$2d,$1e,$0f,$74,$7a,$0f,$0f
    db $0f,$65,$54,$54,$54,$54,$64,$0f,$0a,$7a,$0f,$0f
    db $0f,$65,$78,$78,$78,$54,$64,$0b,$0a,$74,$0a,$0a
    db $0f,$65,$43,$43,$64,$0a,$74,$0a,$31,$31,$31,$31
    db $0f,$65,$43,$43,$64,$0b,$0b,$0a,$74,$0a,$0a,$0a
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_043A_TextPointers:
    dw Map_043A_TX1
    dw Map_043A_TX2
    dw Map_043A_TX_FoundNuclearThing
    dw Map_043A_TX_FoundNuclearThing
    dw Map_043A_TX_FoundNuclearThing
    dw Map_043A_TX_FoundNuclearThing

Map_043A_InitScript:
    ret
Map_043A_Script:
    ret
    
Map_043A_NuclearThingFlag:
    db 0

Map_043A_TX1:
    db 8
    jp EnhancedTextOnly
    text "I once went to Eastern"
    next "Glitchland and tried to get"
    cont "through the Lost Woods."
    para "It was awful. I perpetually"
    next "kept losing my way."
    para "Could it be the reason why"
    next "they called this area"
    cont "'Lost Woods'?"
    done
    
Map_043A_TX2:
    db 8
    ld c, EVENT_MICROSCOPIC_NUCLEAR_THINGS
    call TestEventFlag
    jr c, .questFinished
    ld a, [Map_043A_NuclearThingFlag]
    cp $04
    jr z, .questComplete
    ld hl, Map_043A_TX_QuestIntro
    call PrintTextEnhanced
    jp TextScriptEnd
.questComplete
    ld hl, Map_043A_TX_QuestComplete
    call PrintTextEnhanced
    ld bc, $734a
    ld de, $cf0d
    call CompleteEvent
    jp TextScriptEnd
.questFinished
    ld hl, Map_043A_TX_QuestFinished
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_043A_TX_QuestIntro:
    text "Oh hey, could you perhaps"
    next "help me out?"
    para "I had some microscopic"
    next "nuclear things in my"
    cont "back pocket, and I dropped"
    cont "them..."
    para "All of them probably fell"
    next "in the water."
    para "Could you help me in my"
    next "search? There's 4 of them"
    cont "to find in the waters."
    done
    
Map_043A_TX_QuestComplete:
    text "Yes! You found all of my"
    next "microscopic nuclear things!"
    cont "Thank you!"
    wait
    
Map_043A_TX_QuestFinished:
    text "It's good to have all of"
    next "my microscopic nuclear"
    cont "things back again."
    done

Map_043A_TX_FoundNuclearThing:
    db 8
    ld hl, Map_043A_NuclearThingFlag
    inc [hl]
    ld hl, Map_043A_TX_NuclearThingGone
    ldh a, [$8c]
    ld c, a
    ld a, PREDEF_ReplaceTextPointer
    call PredefCmd
    ld hl, .textbox
.textbox
    jp EnhancedTextOnly
    text "You found a microscopic"
    next "nuclear thing."
    para "You put it in your back"
    next "pocket."
    para "You feel warmth. That's"
    next "probably because of all"
    cont "of the fusion... or fission."
    done

Map_043A_TX_NuclearThingGone:
    db 8
    jp EnhancedTextOnly
    text "Nothing to be found here"
    next "anymore..."
    done

