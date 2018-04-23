SECTION "Map_3E31", ROM0[$B800]

Map_3E31_Header:
    hdr_tileset         0
    hdr_dimensions      28, 7
    hdr_pointers_a      Map_3E31_Blocks, Map_3E31_TextPointers
    hdr_pointers_b      Map_3E31_Script, Map_3E31_Objects
    hdr_pointers_c      Map_3E31_InitScript, Map_3E31_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_SAFARI_ZONE, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $3D20, 1, 10
    
Map_3E31_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            32, 3, 8, 11, $3E90
    hdr_sign_count      4
    hdr_signpost        9, 9, $02
    hdr_signpost        35, 5, $03
    hdr_signpost        49, 3, $04
    hdr_signpost        45, 7, $05
    hdr_object_count    1
    hdr_object          SPRITE_YOUNG_BOY, 3, 9, STAY, NONE, $01

Map_3E31_RAMScript:
    rs_fill_byte $31
    rs_fill_3 $c7d3
    rs_end

Map_3E31_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$30,$09,$09,$09,$09,$09,$03,$28,$2c,$2c,$2c,$2c,$29,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$40,$58,$0a,$0a,$0a,$0a,$0a,$43,$43,$43,$43,$24,$57,$57,$70,$57,$25,$54,$27,$27,$27,$27,$08,$78,$78,$0f
    db $0f,$0f,$40,$4a,$10,$7d,$7d,$00,$0a,$0a,$23,$23,$48,$0f,$0f,$0f,$ec,$08,$31,$54,$27,$27,$78,$78,$78,$43,$43,$0f
    db $0f,$0f,$0a,$7b,$7b,$4d,$2f,$2f,$2f,$78,$78,$78,$27,$74,$74,$74,$74,$31,$54,$54,$27,$27,$08,$31,$55,$55,$31,$31
    db $0f,$0a,$0a,$7b,$79,$4d,$0a,$0a,$0a,$58,$74,$74,$27,$74,$74,$74,$31,$31,$77,$77,$27,$27,$55,$55,$55,$55,$31,$0f
    db $0f,$23,$23,$23,$23,$4d,$0a,$0a,$59,$0a,$74,$74,$27,$74,$77,$77,$77,$77,$0f,$0f,$27,$27,$55,$61,$61,$61,$61,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$52,$52,$52,$52,$52,$30,$09,$09,$09,$09,$09,$09,$09,$09,$09,$03,$0f,$0f,$0f

Map_3E31_TextPointers:
    dw Map_3E31_TX1
    dw Map_3E31_TX2
    dw Map_3E31_TX3
    dw Map_3E31_TX4
    dw Map_3E31_TX5

Map_3E31_InitScript:
    ret
Map_3E31_Script:
    ret

Map_3E31_TX1:
    TX_ASM
    ld hl, Map_3E31_Event
    ld c, EVENT_DESIGNERS_CREATION
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_3E31_Event
    call PrintTextEnhanced
    ld bc, $af0f
    ld de, $d100
    call CompleteEvent
    jp TextScriptEnd
    
Map_3E31_Event:
    text "You like this map?"
    para "I put a lot of effort"
    next "into it!"
    para "Thank you for being"
    next "a beta tester!"
    wait

Map_3E31_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Congraturation"
    para "This story is"
    next "happy end"
    cont "____ - Matthew"
    done

Map_3E31_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "You can go left,"
    next "or go into cave."
    para "Isn't it just a"
    next "genius design?"
    cont "____ - Matthew"
    done

Map_3E31_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "This is the"
    next "wrong way."
    para "You should go"
    next "left!"
    cont "____ - Matthew"
    done

Map_3E31_TX5:
    TX_ASM
    jp EnhancedTextOnly
    text "Welcome to this"
    next "great map!"
    para "It's the best map"
    next "you evar played."
    para "You will see it,"
    next "play!"
    cont "____ - Matthew"
    done

