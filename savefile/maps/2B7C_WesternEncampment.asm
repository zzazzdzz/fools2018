SECTION "Map_2B7C", ROM0[$B800]

Map_2B7C_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_2B7C_Blocks, Map_2B7C_TextPointers
    hdr_pointers_b      Map_2B7C_Script, Map_2B7C_Objects
    hdr_pointers_c      Map_2B7C_InitScript, Map_2B7C_RAMScript
    hdr_palette         $09
    hdr_music           MUSIC_CINNABAR, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2B7C_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 5, 4, $2B29
    hdr_warp            2, 7, 5, 4, $2B29
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GENTLEMAN, 2, 4, STAY, RIGHT, $01

Map_2B7C_RAMScript:
    rs_end

Map_2B7C_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_2B7C_TextPointers:
    dw Map_2B7C_TX1

Map_2B7C_InitScript:
    ret
Map_2B7C_Script:
    ret

Map_2B7C_TX1:
    TX_ASM
    ld hl, Map_2B7C_Intro
    call PrintTextEnhanced
    ld de, Map_2B7C_Choice
    ld bc, $0210
    call PrintChoiceMenu
    and a
    jr nz, .refused
    ld b, $04
    call IsItemInBag
    jr z, .noBalls
    ld hl, Map_2B7C_GiveBall
    call PrintTextEnhanced
    ld hl, SerialGaveBallsStruct
    call CompleteEventSerial
    ld a, [StandardSerialBuffer+5]
    add "0"
    ld [Map_2B7C_BallsCountBuffer], a
    ld a, $04
    call RemoveItemFromBag
    ld hl, Map_2B7C_GiveBall2
    call PrintTextEnhanced
    jp TextScriptEnd
.noBalls
    ld hl, Map_2B7C_NoBalls
    call PrintTextEnhanced
    jp TextScriptEnd
.refused
    ld hl, Map_2B7C_Refused
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_2B7C_Choice:
    db $86,$a8,$b5,$a4,$7f,$a0,$7f,$8f,$ae,$aa,$ba,$7f,$81,$a0,$ab,$ab,$4f
    db $8c,$a4,$a7
    db $50
    
Map_2B7C_Intro:
    text "Hey! You know what I really"
    next "like?"
    para "Balls! I like Poké Balls of"
    next "all kinds!"
    para "You can pretty much say that"
    next "I'm a sucker for balls!"
    para "So, do you happen to have"
    next "any balls for me?"
    done

Map_2B7C_GiveBall:
    text "Hmm, yes! That's a Poké Ball"
    next "alright!"
    para "Oh yeah... The taste..."
    next "The smell... The texture..."
    wait
    
Map_2B7C_GiveBall2:
    text "So far, you've given me a"
    next "total of "
    tx_buf Map_2B7C_BallsCountBuffer
    text " Balls."
    para "Thank you!"
    next "If you were to find any more"
    cont "Balls for me, please bring"
    cont "them over!"
    done

Map_2B7C_NoBalls:
    text "Sir, I'm afraid you don't"
    next "have enough Balls."
    cont "Poké Balls, that is."
    para "Once you get some, please"
    next "come bring them over!"
    done

Map_2B7C_Refused:
    text "No? What a bummer."
    next "Please come back once you"
    cont "have some balls to spare."
    done

Map_2B7C_BallsCountBuffer:
    text "X"
    tx_buf_end

