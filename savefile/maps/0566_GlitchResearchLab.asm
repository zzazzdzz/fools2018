SECTION "Map_0566", ROM0[$B800]

Map_0566_Header:
    hdr_tileset         5
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_0566_Blocks, Map_0566_TextPointers
    hdr_pointers_b      Map_0566_Script, Map_0566_Objects
    hdr_pointers_c      Map_0566_InitScript, Map_0566_RAMScript
    hdr_palette         $00
    hdr_music           MUSIC_OAKS_LAB, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0566_Objects:
    hdr_border          $03
    hdr_warp_count      1
    hdr_warp            2, 4, 14, 6, $0565
    hdr_sign_count      1
    hdr_signpost        0, 5, $03
    hdr_object_count    2
    hdr_object          SPRITE_OAK_AIDE, 5, 10, STAY, RIGHT, $02
    hdr_object          SPRITE_GIRL, 5, 6, STAY, RIGHT, $01

Map_0566_RAMScript:
    rs_end

Map_0566_Blocks:
    db $03,$03,$03,$03,$03,$03
    db $03,$68,$65,$67,$68,$74
    db $65,$70,$6b,$99,$74,$7a
    db $6b,$55,$05,$05,$78,$a3
    db $46,$05,$05,$c0,$74,$d0
    db $03,$03,$05,$05,$05,$78

Map_0566_TextPointers:
    dw Map_0566_TX1
    dw Map_0566_TX2
    dw Map_0566_TX3

Map_0566_InitScript:
    ret
Map_0566_Script:
    ret

Map_0566_TX1:
    TX_ASM
    ld a, [$c742]
    cp $c0
    jr z, .before
    ld hl, Map_0566_After
    call PrintTextEnhanced
    ld c, EVENT_GLITCH_LAB
    call TestEventFlag
    jp c, TextScriptEnd
    ld bc, $5C90
    ld de, $DEA1
    call CompleteEvent
    jp TextScriptEnd
.before
    ld hl, Map_0566_Before
    call PrintTextEnhanced
    jp TextScriptEnd

Map_0566_Before:
    text "An experiment of ours has"
    next "gone wrong, and we've"
    cont "caused map corruption in"
    cont "several locations in"
    cont "Glitchland."
    para "Please, if you're able, help"
    next "us clean this mess up!"
    para "And if someone asks, we don't"
    next "have anything to do with it!"
    done

Map_0566_After:
    text "Wow, it suddenly looks so"
    next "much better!"
    para "Thank you! Now we can"
    next "continue our dangerous"
    cont "experiments!"
    wait

Map_0566_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Although our experiment went"
    next "a little out of hand, we're"
    cont "collecting a lot of research"
    cont "just from this incident!"
    done

Map_0566_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "Hey, what's that?"
    para "April Fools event 2019:"
    next "Overview?"
    para "Better not read it. We all"
    next "hate spoilers, right?"
    done

