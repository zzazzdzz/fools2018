SECTION "Map_4933", ROM0[$B800]

Map_4933_Header:
    hdr_tileset         0
    hdr_dimensions      9, 14
    hdr_pointers_a      Map_4933_Blocks, Map_4933_TextPointers
    hdr_pointers_b      Map_4933_Script, Map_4933_Objects
    hdr_pointers_c      Map_4933_InitScript, Map_4933_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $2731, 8, 22
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $223A, 1, 6
    
Map_4933_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        15, 13, $03
    hdr_object_count    2
    hdr_object          SPRITE_GIRL, 8, 4, STAY, NONE, $01
    hdr_object          SPRITE_BLACKBELT, 4, 20, STAY, NONE, $02

Map_4933_RAMScript:
    rs_write_1 $c6fb, $31
    rs_write_1 $c70a, $31
    rs_fill_byte $0a
    rs_fill_3 $c7d5
    rs_end

Map_4933_Blocks:
    db $0f,$31,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$31,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$31,$47,$0a,$74,$0f,$0f,$0f,$0f
    db $0f,$31,$0f,$0f,$07,$0f,$0f,$0f,$0f
    db $0f,$5c,$0f,$0f,$0a,$52,$52,$74,$0f
    db $0f,$31,$31,$47,$0a,$0f,$0f,$07,$0f
    db $0f,$0f,$0f,$0f,$07,$0f,$0f,$08,$0f
    db $0f,$0f,$51,$51,$74,$0a,$46,$31,$0f
    db $0f,$0f,$07,$0f,$0f,$0a,$0f,$0f,$0f
    db $0f,$0f,$31,$0f,$0f,$07,$0f,$0f,$0f
    db $0f,$0f,$31,$47,$0a,$0a,$51,$0f,$0f
    db $0f,$0f,$0f,$0f,$74,$0f,$07,$0f,$0f
    db $0f,$0f,$0f,$0f,$0a,$59,$0a,$0a,$0a
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_4933_TextPointers:
    dw Map_4933_TX1
    dw Map_4933_TX2
    dw Map_4933_TX3

Map_4933_InitScript:
    ret
Map_4933_Script:
    ret

Map_4933_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I need to be very careful"
    next "about my decisions here."
    para "Once I jump, there's no"
    next "return."
    para "But at least, this path"
    next "makes it a lot easier to"
    cont "return back after crossing"
    cont "the Dark Cave."
    done

Map_4933_TX2:
    TX_ASM
    ld c, EVENT_GOT_FIFTH_POKEBALL
    ld hl, Map_4933_BallsAfter
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_4933_BallsBefore
    call PrintTextEnhanced
    ld bc, $0401
    call GiveItem
    ld bc, $a029
    ld de, $5868
    call CompleteEvent
    jp TextScriptEnd
    
Map_4933_BallsBefore:
    text "Hi! Do you have any"
    next "Poké Balls?"
    para "You can never have enough"
    next "Poké Balls! Take this!"
    tx_snd SFX_GET_ITEM_1
    wait
    
Map_4933_BallsAfter:
    text "How is my Poké Ball?"
    next "Do you treat it well?"
    done

Map_4933_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "This sign only has a"
    next "poorly drawn trollface"
    cont "on it."
    para "Maybe someone was hoping"
    next "that some poor, innocent"
    cont "person would miss this"
    cont "sign, come all the way"
    cont "back through the Dark Cave,"
    cont "and go back here, just to"
    cont "read this useless sign?"
    done

