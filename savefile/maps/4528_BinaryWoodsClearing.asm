SECTION "Map_4528", ROM0[$B800]

Map_4528_Header:
    hdr_tileset         0
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_4528_Blocks, Map_4528_TextPointers
    hdr_pointers_b      Map_4528_Script, Map_4528_Objects
    hdr_pointers_c      Map_4528_InitScript, Map_4528_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $4585, 9, 31
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4528_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_MEDIUM, 6, 7, STAY, NONE, $01

Map_4528_RAMScript:
    rs_write_3 $c6fa, $7a, $55, $7a
    rs_write_3 $c707, $7a, $55, $74
    rs_end

Map_4528_Blocks:
    db $0f,$0f,$7a,$55,$7a,$0f,$0f
    db $0f,$0f,$74,$55,$7a,$0f,$0f
    db $0f,$7a,$7a,$55,$74,$7a,$0f
    db $0f,$74,$7a,$55,$7a,$7a,$0f
    db $0f,$7a,$7a,$55,$7a,$7a,$0f
    db $0f,$7a,$7a,$55,$7a,$74,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_4528_TextPointers:
    dw Map_4528_TX1

Map_4528_InitScript:
    ret
Map_4528_Script:
    ret

Map_4528_TX1:
    TX_ASM
    ld hl, Map_4528_Event
    ld c, EVENT_BINARY_WOODS_MEDIUM
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_4528_Event
    call PrintTextEnhanced
    ld bc, $5da1
    ld de, $2fa5
    call CompleteEvent
    jp TextScriptEnd
    
Map_4528_Event:
    text "Hello. You must be very"
    next "strong to have come all"
    cont "the way here..."
    para "I come here to meditate"
    next "and unify with the nature."
    para "People are scared of nature."
    next "Natural disasters, harsh"
    cont "weather, dangerous species"
    cont "of animals."
    para "But I... I want to become"
    next "one with the nature, the"
    cont "mother of all things."
    para "Thank you for coming here."
    next "You're a fun conversation"
    cont "partner."
    wait
