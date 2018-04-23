SECTION "Map_3A3E", ROM0[$B800]

Map_3A3E_Header:
    hdr_tileset         0
    hdr_dimensions      14, 8
    hdr_pointers_a      Map_3A3E_Blocks, Map_3A3E_TextPointers
    hdr_pointers_b      Map_3A3E_Script, Map_3A3E_Objects
    hdr_pointers_c      Map_3A3E_InitScript, Map_3A3E_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $3920, 18, 11
    hdr_connection      EAST,  $3B22, 1, 7
    
Map_3A3E_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_ERIKA, 20, 4, WALK, NONE, $01
    hdr_object          SPRITE_SAILOR, 15, 10, WALK, NONE, $02
    hdr_object          SPRITE_HIKER, 10, 5, WALK, NONE, $03

Map_3A3E_RAMScript:
    rs_fill_byte $55
    rs_fill_3 $c760
    rs_fill_len $c771, 6
    rs_fill_3 $c785
    rs_end

Map_3A3E_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$6c,$6c,$6c,$55,$55,$55,$55,$55,$55,$55,$6c,$0f,$0f
    db $0f,$74,$74,$55,$0b,$0b,$0b,$5d,$0b,$0b,$0b,$55,$6c,$0f
    db $55,$55,$55,$55,$0b,$0b,$0b,$27,$0b,$0b,$0b,$55,$55,$55
    db $55,$55,$55,$55,$0b,$0b,$0b,$27,$0b,$0b,$0b,$55,$55,$55
    db $0f,$74,$74,$55,$0b,$0b,$0b,$5e,$0b,$0b,$0b,$55,$6f,$0f
    db $0f,$6f,$6f,$6f,$55,$55,$55,$55,$55,$55,$55,$6f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_3A3E_TextPointers:
    dw Map_3A3E_TX1
    dw Map_3A3E_TX2
    dw Map_3A3E_TX3

Map_3A3E_InitScript:
    ld a, 4
    ld [Map5FScriptIndex], a
    xor a
    ld [MapScriptGeneralPurpose], a
    ret
Map_3A3E_Script:
    ret

Map_3A3E_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I'm not sure why these guys"
    next "guys hate the grass here"
    cont "so much..."
    done

Map_3A3E_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "The very mysterious 5F item"
    next "changes its behavior,"
    cont "depending on your location."
    para "You should try using it"
    next "whenever possible."
    para "You'll never know what it"
    next "can do!"
    done
    
Map_3A3E_TX3:
    TX_ASM
    call Map_3A3E_TestForGrass
    jr c, .nope
    ld hl, Map_3A3E_After
    ld c, EVENT_GRASSLANDS
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_3A3E_After
    call PrintTextEnhanced
    ld bc, $de10
    ld de, $2964
    call CompleteEvent
    jp TextScriptEnd
.nope
    ld hl, Map_3A3E_Before
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_3A3E_TestForGrass:
    ld hl, $c6e8
    ld bc, $0200
.loop
    ld a, [hli]
    cp $0b
    jr z, .grassFound
    dec bc
    ld a, c
    or b
    jr nz, .loop
    scf
    ccf
    ret
.grassFound
    scf
    ret

Map_3A3E_Before:
    text "We're trying to cut all the" 
    next "grass here."
    para "Could you perhaps help us"
    next "out?"
    para "Once you're done, just talk"
    next "to me, and I'll grant you"
    cont "an achievement or somethin'."
    done

Map_3A3E_After:
    text "Did you really cut all the"
    next "grass here?"
    para "Thank you for your"
    next "cooperation."
    wait

