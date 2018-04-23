SECTION "Map_2F80", ROM0[$B800]

Map_2F80_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_2F80_Blocks, Map_2F80_TextPointers
    hdr_pointers_b      Map_2F80_Script, Map_2F80_Objects
    hdr_pointers_c      Map_2F80_InitScript, Map_2F80_RAMScript
    hdr_palette         $01
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2F80_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 15, 10, $2F38
    hdr_warp            2, 7, 15, 10, $2F38
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_LITTLE_GIRL, 2, 4, STAY, RIGHT, $01

Map_2F80_RAMScript:
    rs_end

Map_2F80_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_2F80_TextPointers:
    dw Map_2F80_TX1

Map_2F80_InitScript:
    ret
Map_2F80_Script:
    ret

Map_2F80_TX1:
    TX_ASM
    ld c, EVENT_GOT_LOST_WOODS_HINT
    call TestEventFlag
    jr c, .hint
    ld hl, Map_2F80_Intro
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    and a
    jr nz, .nope
    ld hl, Map_2F80_Question
    call PrintTextEnhanced
    ld bc, $0003
    call PrintInputMenu
    ld hl, InputMenuBuffer
    ld a, [hli]
    cp $fb
    jr nz, .wrong
    ld a, [hli]
    cp $f6
    jr nz, .wrong
    ld a, [hli]
    cp $f6
    jr nz, .wrong
    ld hl, Map_2F80_Correct
    call PrintTextEnhanced
    ld bc, $4f50
    ld de, $cac9
    call CompleteEvent
    
.hint
    ld hl, Map_2F80_Hint
    call PrintTextEnhanced
    jp TextScriptEnd
.nope
    ld hl, Map_2F80_Nope
    call PrintTextEnhanced
    jp TextScriptEnd
.wrong
    ld hl, Map_2F80_Incorrect
    call PrintTextEnhanced
    jp TextScriptEnd

Map_2F80_Intro:
    text "Could you help me with"
    next "my math homework?"
    para "If you do, I'll tell you"
    next "a secret about the Lost"
    cont "Woods."
    para "So, how about it?"
    done
    
Map_2F80_Nope:
    text "What? Okay then..."
    done

Map_2F80_Question:
    text "OK, so here's the exercise"
    next "I have."
    para "Train A and Train B began"
    next "traveling towards each"
    cont "other from opposite ends"
    cont "of a 500-mile long track."
    para "If Train A traveled at 35"
    next "miles per hour, and Train B"
    cont "traveled at 25 miles per"
    cont "hour, how long until the"
    cont "two trains meet each other?"
    para "Give me a number, in"
    next "minutes."
    done

Map_2F80_Correct:
    text "Hmm, let me see..."
    next "Oh wow, that makes sense!"
    para "I think that is the correct"
    next "answer! Thank you!"
    wait
    
Map_2F80_Incorrect:
    text "Hmm, let me see..."
    next "No, that doesn't look right."
    para "You must have made an error"
    next "somewhere."
    done
    
Map_2F80_Hint:
    text "About the Lost Woods..."
    next "You can get to the Eastern"
    cont "Edge from there."
    cont "And it's pretty easy too!"
    para "To do that, just go east"
    next "3 times, then go north!"
    done

