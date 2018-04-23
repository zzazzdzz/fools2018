SECTION "Map_4786", ROM0[$B800]

Map_4786_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_4786_Blocks, Map_4786_TextPointers
    hdr_pointers_b      Map_4786_Script, Map_4786_Objects
    hdr_pointers_c      Map_4786_InitScript, Map_4786_RAMScript
    hdr_palette         $0A
    hdr_music           MUSIC_SS_ANNE, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4786_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 9, 6, $472B
    hdr_warp            2, 7, 9, 6, $472B
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_DAISY, 5, 3, STAY, LEFT, $02
    hdr_object          SPRITE_GYM_HELPER, 2, 4, STAY, RIGHT, $01

Map_4786_RAMScript:
    rs_end

Map_4786_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_4786_TextPointers:
    dw Map_4786_TX1
    dw Map_4786_TX2

Map_4786_InitScript:
    ret
Map_4786_Script:
    ret

Map_4786_TX1:
    TX_ASM
    ld hl, Map_4786_Question
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    and a
    jr nz, .nope
    ld hl, Map_4786_Therapy
    call PrintTextEnhanced
    call BlackScreenWithVRAMCopy
    ld a, MUSIC_LAVENDER + 1
    call PlaySound
    ld c, 60
    call DelayFrames
    ld hl, Map_4786_Therapy2
    call PrintTextEnhanced
    ld a, $a0
    ld [$c116], a
    ld [$c126], a
    call UpdateSprites
    ld c, 60
    call DelayFrames
    ld hl, Map_4786_Therapy3
    call PrintTextEnhanced
    ld hl, $cfc8
    ld [hl], 7
    dec hl
    ld [hl], 7
    dec hl
    ld [hl], $ff
    ld c, 60
    call DelayFrames
    ld hl, SerialChangeFunValueStruct
    call CompleteEventSerial
    ld a, $2b
    ld [MapWarpTargetIDL], a
    ld a, $47
    ld [MapWarpTargetIDH], a
    ld a, 9
    ld [MapWarpTargetX], a
    ld a, 6
    ld [MapWarpTargetY], a
    jp StartLoadingMap
.nope
    ld hl, Map_4786_Nope
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_4786_Question:
    text "Welcome..."
    next "Do you want to try our"
    cont "Spirit Releasing Therapy?"
    done
    
Map_4786_Nope:
    text "I understand."
    next "Come again..."
    done

Map_4786_Therapy:
    text "Okay..."
    next "Let us begin..."
    wait

Map_4786_Therapy2:
    text "As the man begins chanting"
    next "some kind of spell, the"
    cont "reality slowly starts to"
    cont "peel away..."
    wait
    
Map_4786_Therapy3:
    text "You feel your soul leaving"
    next "your body, and entering a"
    cont "new one..."
    para "You wake up, feeling newly"
    next "born."
    wait

Map_4786_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "We, the adepts of the"
    next "Spirit Releasing Therapy,"
    cont "believe in something called"
    cont "'Fun Values'."
    para "Apparently, some things in"
    next "Glitchland may be different"
    cont "for every person."
    para "People might say different"
    next "things, or appear in"
    cont "different locations."
    para "All of this is determined"
    next "by a single number, chosen"
    cont "for you when you first come"
    cont "to this world."
    para "But here, we can change that"
    next "number, so maybe you can"
    cont "discover something new."
    para "At least, that's the theory."
    next "We don't know if that's"
    cont "really the truth..."
    done

