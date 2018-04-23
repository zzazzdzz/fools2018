SECTION "Map_4E22", ROM0[$B800]

Map_4E22_Header:
    hdr_tileset         0
    hdr_dimensions      8, 8
    hdr_pointers_a      Map_4E22_Blocks, Map_4E22_TextPointers
    hdr_pointers_b      Map_4E22_Script, Map_4E22_Objects
    hdr_pointers_c      Map_4E22_InitScript, Map_4E22_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $4D3A, 11, 13
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4E22_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        9, 5, $01
    hdr_object_count    0

Map_4E22_RAMScript:
    rs_fill_byte $1f
    rs_fill_3 $c758
    rs_fill_byte $43
    rs_fill_3 $c766
    rs_end

Map_4E22_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$51,$51,$51,$51,$0f
    db $0f,$0f,$0a,$0a,$08,$0a,$0a,$0f
    db $0f,$6d,$0a,$0a,$31,$0a,$6e,$0f
    db $0f,$6d,$0a,$31,$31,$0a,$0f,$0f
    db $1f,$1e,$0a,$31,$0a,$6e,$0f,$0f
    db $43,$64,$0a,$0a,$0a,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_4E22_TextPointers:
    dw Map_4E22_TX1

Map_4E22_InitScript:
    ret
Map_4E22_Script:
    ret

Map_4E22_TX1:
    TX_ASM
    ld hl, Map_4E22_Event
    ld c, EVENT_YET_ANOTHER_SECRET
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_4E22_Event
    call PrintTextEnhanced
    ld bc, $D1F0
    ld de, $A339
    call CompleteEvent
    jp TextScriptEnd

Map_4E22_Event:
    text "Conglatulation."
    next "You've found yet another"
    cont "secret! You should be"
    cont "proud of yourself."
    para "Here, have this yet"
    next "another achievement to"
    cont "commemorate your success."
    wait
