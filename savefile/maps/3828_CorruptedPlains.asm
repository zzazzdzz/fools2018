SECTION "Map_3828", ROM0[$B800]

Map_3828_Header:
    hdr_tileset         0
    hdr_dimensions      14, 9
    hdr_pointers_a      Map_3828_Blocks, Map_3828_TextPointers
    hdr_pointers_b      Map_3828_Script, Map_3828_Objects
    hdr_pointers_c      Map_3828_InitScript, Map_3828_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $3420, 18, 10
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3828_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_SAILOR, 16, 9, STAY, NONE, $01
    hdr_object          SPRITE_LITTLE_GIRL, 7, 7, STAY, NONE, $02

Map_3828_RAMScript:
    rs_fill_byte $55
    rs_fill_3 $c774
    rs_fill_byte $0a
    rs_fill_3 $c788
    rs_end

Map_3828_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0b,$0b,$0f,$0f,$0b,$0b,$0b,$0f,$0f,$0f
    db $0f,$0f,$0b,$0b,$9f,$0a,$a5,$0b,$9a,$0a,$0a,$0b,$0f,$0f
    db $0f,$0b,$0b,$0a,$0a,$af,$ab,$c4,$0a,$96,$a3,$0b,$0b,$0f
    db $55,$55,$55,$55,$55,$55,$55,$55,$55,$55,$bf,$0a,$0b,$0f
    db $0a,$0a,$0a,$0a,$0a,$0a,$9a,$8a,$96,$85,$0a,$0a,$0b,$0f
    db $0f,$0f,$0f,$0b,$95,$9b,$0a,$c2,$0a,$0b,$0b,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0b,$0b,$0b,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_3828_TextPointers:
    dw Map_3828_TX1
    dw Map_3828_TX2

Map_3828_InitScript:
    ret
Map_3828_Script:
    ret

Map_3828_TX1: 
    TX_ASM
    jp EnhancedTextOnly
    text "1 ERROR."
    done

Map_3828_TX2:
    TX_ASM
    ld c, EVENT_CORRUPTED_PLAINS
    ld hl, Map_3828_After
    call CheckEventAndPrintHLIfCompleted
    ld a, [$c769]
    cp $ab
    jr z, .nope
    ld hl, Map_3828_After
    call PrintTextEnhanced
    ld bc, $FEF0
    ld de, $A169
    call CompleteEvent
    jp TextScriptEnd
.nope
    ld hl, Map_3828_Before
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_3828_Before:
    text "This once beautiful area"
    next "turned into a corrupted"
    cont "wasteland..."
    para "I don't know what"
    next "happened!"
    para "Can you please help us"
    next "cleanse the corruption?"
    done

Map_3828_After:
    text "Oh my! This is so much"
    next "better!"
    para "Thank you for your help!"
    wait

