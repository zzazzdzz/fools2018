SECTION "Map_4B3A", ROM0[$B800]

Map_4B3A_Header:
    hdr_tileset         0
    hdr_dimensions      7, 6
    hdr_pointers_a      Map_4B3A_Blocks, Map_4B3A_TextPointers
    hdr_pointers_b      Map_4B3A_Script, Map_4B3A_Objects
    hdr_pointers_c      Map_4B3A_InitScript, Map_4B3A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $4A34, 17, 7
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4B3A_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_ROCKET, 4, 2, STAY, DOWN, $01

Map_4B3A_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c736
    rs_fill_byte $31
    rs_fill_3 $c743
    rs_fill_byte $6f
    rs_fill_3 $c750
    rs_end

Map_4B3A_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$6c,$7a,$0f,$6c,$0f,$0f
    db $0f,$96,$97,$6c,$31,$6c,$0f
    db $0a,$74,$74,$7a,$31,$7a,$0f
    db $31,$31,$31,$31,$31,$7a,$0f
    db $6f,$6f,$6f,$6f,$6f,$6f,$0f

Map_4B3A_TextPointers:
    dw Map_4B3A_TX1

Map_4B3A_InitScript:
    ret
Map_4B3A_Script:
    ret

Map_4B3A_TX1:
    TX_ASM
    ld hl, Map_4B32_Event
    ld c, EVENT_HIDDEN_RETREAT
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_4B32_Event
    call PrintTextEnhanced
    ld bc, $ff39
    ld de, $c195
    call CompleteEvent
    jp TextScriptEnd
    
Map_4B32_Event:
    text "Sssh, how did you know"
    next "I was hiding here?"
    para "I was behind all of these"
    next "corrupted tiles, how did"
    cont "you see me?"
    para "What, you mean there's an"
    next "overhead view?"
    cont "But that's cheating!"
    para "Please don't tell anyone"
    next "I'm here, kay-o?"
    wait

