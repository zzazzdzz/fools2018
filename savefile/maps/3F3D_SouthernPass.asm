SECTION "Map_3F3D", ROM0[$B800]

Map_3F3D_Header:
    hdr_tileset         0
    hdr_dimensions      10, 14
    hdr_pointers_a      Map_3F3D_Blocks, Map_3F3D_TextPointers
    hdr_pointers_b      Map_3F3D_Script, Map_3F3D_Objects
    hdr_pointers_c      Map_3F3D_InitScript, Map_3F3D_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $0110, 9, 18
    hdr_connection      SOUTH, $423A, 8, 1
    hdr_connection      WEST,  $4026, 20, 6
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3F3D_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_FISHER, 9, 18, STAY, RIGHT, $03
    hdr_object          SPRITE_GAMBLER, 12, 3, STAY, LEFT, $02
    hdr_object          SPRITE_DAISY, 9, 11, STAY, RIGHT, $01

Map_3F3D_RAMScript:
    rs_write_1 $c6ff, $54
    rs_write_1 $c70f, $54
    rs_fill_byte $54
    rs_fill_3 $c788
    rs_fill_byte $78
    rs_fill_3 $c798
    rs_write_1 $c801, $54
    rs_write_1 $c811, $54
    rs_end

Map_3F3D_Blocks:
    db $18,$43,$43,$43,$54,$43,$43,$43,$43,$19
    db $18,$43,$43,$43,$54,$43,$54,$54,$43,$19
    db $18,$43,$43,$43,$54,$43,$78,$54,$43,$19
    db $18,$54,$54,$54,$54,$54,$54,$54,$43,$19
    db $18,$78,$78,$54,$78,$78,$78,$54,$43,$19
    db $18,$43,$43,$54,$54,$43,$43,$54,$43,$19
    db $43,$43,$43,$78,$78,$43,$43,$54,$43,$19
    db $54,$54,$54,$54,$54,$54,$54,$54,$43,$19
    db $78,$78,$78,$78,$54,$78,$78,$54,$43,$19
    db $18,$43,$43,$43,$54,$43,$43,$78,$43,$19
    db $18,$43,$54,$54,$54,$54,$54,$43,$43,$19
    db $18,$43,$54,$78,$78,$78,$54,$43,$43,$19
    db $18,$43,$78,$43,$43,$43,$54,$43,$43,$19
    db $18,$43,$43,$43,$43,$43,$54,$43,$43,$19

Map_3F3D_TextPointers:
    dw Map_3F3D_TX1
    dw Map_3F3D_TX2
    dw Map_3F3D_TX3

Map_3F3D_InitScript:
    ret
Map_3F3D_Script:
    ret

Map_3F3D_TX1:
    TX_ASM
    ld c, EVENT_DUNSPARCE_SURVEY
    ld hl, Map_3F3D_Done
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_3F3D_Survey
    call PrintTextEnhanced
    ld de, Map_3F3D_Choice
    ld bc, $0609
    call PrintChoiceMenu
    cp 5
    jr z, .choseDunsparce
    ld hl, Map_3F3D_Meh
    call PrintTextEnhanced
    jp TextScriptEnd
.choseDunsparce
    ld hl, Map_3F3D_Yay
    call PrintTextEnhanced
    ld bc, $3101
    call GiveItem
    ld bc, $b27c
    ld de, $8876
    call CompleteEvent
    jp TextScriptEnd
    
Map_3F3D_Survey:
    text "Hey, you!"
    next "I'm doing a survey about"
    cont "most loved Pokémon species"
    cont "in Glitchland."
    para "Please tell me..."
    next "Out of these six, which one"
    cont "do you like the most?"
    done
    
Map_3F3D_Meh:
    text "Is that true? I expected"
    next "a completely different"
    cont "answer..."
    para "Maybe you should vote"
    next "differently next time."
    done
    
Map_3F3D_Yay:
    text "Oh yes, that's the answer"
    next "I wanted to see!"
    para "Please accept this Nugget as"
    next "my token of appreciation."
    tx_snd SFX_GET_ITEM_1
    done
    
Map_3F3D_Done:
    text "Dunsparce is the best!"
    next "Even YOU said so!"
    done
    
Map_3F3D_Choice:
    db $8c,$a4,$b6,$b3,$b6,$ae,$4f
    db $82,$a4,$ab,$a4,$a1,$a8,$4f
    db $86,$b1,$ae,$b4,$a3,$ae,$ad,$4f
    db $83,$a8,$a0,$ab,$a6,$a0,$4f
    db $91,$a4,$b2,$a7,$a8,$b1,$a0,$ac,$4f
    db $83,$b4,$ad,$b2,$af,$a0,$b1,$a2,$a4,$50

Map_3F3D_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "The Glitchland Library"
    next "should be not too far ahead."
    para "I'm quite a bookworm, so I"
    next "visit it often."
    done

Map_3F3D_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Every time you complete"
    next "a quest, your progress"
    cont "is saved."
    para "An achievement is granted"
    next "for every finished quest."
    para "This makes me wonder"
    next "whether someone will"
    cont "obtain all of the"
    cont "achievements one day."
    done

