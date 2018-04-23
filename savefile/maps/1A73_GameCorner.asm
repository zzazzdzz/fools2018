SECTION "Map_1A73", ROM0[$B800]

Map_1A73_Header:
    hdr_tileset         18
    hdr_dimensions      7, 5
    hdr_pointers_a      Map_1A73_Blocks, Map_1A73_TextPointers
    hdr_pointers_b      Map_1A73_Script, Map_1A73_Objects
    hdr_pointers_c      Map_1A73_InitScript, Map_1A73_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_GAME_CORNER, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1A73_Objects:
    hdr_border          $0f
    hdr_warp_count      2
    hdr_warp            2, 9, 3, 4, $1A3C
    hdr_warp            1, 9, 3, 4, $1A3C
    hdr_sign_count      7
    hdr_signpost        7, 7, $05
    hdr_signpost        7, 5, $05
    hdr_signpost        7, 4, $05
    hdr_signpost        6, 7, $05
    hdr_signpost        6, 6, $05
    hdr_signpost        6, 4, $05
    hdr_signpost        11, 0, $06
    hdr_object_count    4
    hdr_object          SPRITE_LASS, 12, 7, STAY, UP, $04
    hdr_object          SPRITE_FISHER2, 8, 6, STAY, LEFT, $03
    hdr_object          SPRITE_LAPRAS_GIVER, 5, 5, STAY, RIGHT, $02
    hdr_object          SPRITE_MR_FUJI, 1, 2, STAY, DOWN, $01

Map_1A73_RAMScript:
    rs_end

Map_1A73_Blocks:
    db $0a,$0a,$0a,$1b,$1b,$34,$2a
    db $2f,$33,$20,$3a,$20,$20,$20
    db $20,$20,$21,$39,$1f,$20,$2d
    db $20,$20,$21,$38,$1f,$20,$31
    db $28,$29,$20,$20,$20,$20,$20

Map_1A73_TextPointers:
    dw Map_1A73_TX1
    dw Map_1A73_TX2
    dw Map_1A73_TX3
    dw Map_1A73_TX4
    dw Map_1A73_TX5
    dw Map_1A73_TX6

Map_1A73_InitScript:
    ld hl, $d5a3
    ld [hl], $05
    inc hl
    ld [hl], $00
    ret
Map_1A73_Script:
    ret

Map_1A73_TX1:
    TX_ASM
    ld hl, Map_1A73_LotteryIntro
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    and a
    jr z, .lottery
    ld hl, Map_1A73_LotteryNope
    call PrintTextEnhanced
    jp TextScriptEnd
.lottery
    ld hl, Map_1A73_LotteryBegin
    call PrintTextEnhanced
    ld hl, SerialCheckLotteryStruct
    call CompleteEventSerial
    ld hl, Map_1A73_LotteryInfo
    call PrintTextEnhanced
    ld a, [StandardSerialBuffer+5]
    and a
    jr z, .noMatch
    ld hl, Map_1A73_LotteryWin
    call PrintTextEnhanced
    jp TextScriptEnd
.noMatch
    ld hl, Map_1A73_LotteryLose
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_1A73_LotteryIntro:
    text "Welcome to the Glitchland"
    next "Game Corner!"
    para "Here, you can play the"
    next "Glitchland Lottery."
    para "Every day, on 0, 3, 6, 9,"
    next "12, 15, 18, 21 o'clock UTC,"
    cont "we choose 5 random letters."
    para "The more of them happen"
    next "to appear in your username,"
    cont "the bigger the reward!"
    para "Would you like to try?"
    done
    
Map_1A73_LotteryNope:
    text "Understandable."
    next "Have a great day."
    done
    
Map_1A73_LotteryBegin:
    text "OK, so let's see how many"
    next "you got."
    wait
    
Map_1A73_LotteryInfo:
    text "So let's see. The lucky"
    next "letters right now are:"
    cont ""
    tx_buf StandardSerialBuffer+6
    text "."
    wait
    
Map_1A73_LotteryLose:
    text "We're sorry."
    next "You didn't get a match..."
    done

Map_1A73_LotteryWin:
    text "Congradnafio! Your username,"
    next ""
    tx_buf Map_1A73_CurrentUserBuffer
    text ","
    cont "got a "
    tx_buf StandardSerialBuffer+26
    text " match!"
    tx_snd SFX_GET_KEY_ITEM
    para "We have already honored"
    next "your success with a unique"
    cont "achievement!"
    para "Thanks for participating."
    next "See you soon!"
    done

Map_1A73_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I lost again?"
    next "How is it possible!"
    para "I'm never lucky!"
    next "Kappa PJSalt!"
    done

Map_1A73_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "We're so grateful that the"
    next "underage gambling"
    cont "restrictions didn't make"
    cont "their way through to"
    cont "Glitchland!"
    para "Otherwise, we'd be stuck"
    next "playing Voltorb Flip!"
    done

Map_1A73_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "What? The path here was"
    next "blocked?"
    para "I sat here for two days"
    next "straight and I didn't even"
    cont "notice it!"
    para "When you have fun, you"
    next "lose track of time!"
    done

Map_1A73_TX5:
    TX_ASM
    ld hl, PromptUserToPlaySlots
    ld b, b_PromptUserToPlaySlots
    call Bankswitch
    call OpenTextboxInOverworld
    ld a, [$d5a3]
    cp $10
    jr c, .noThousand
    ld hl, Map_1A73_SlotThousand
    call PrintTextEnhanced
    ld bc, $8C25
    ld de, $1640
    call CompleteEvent
    jp TextScriptEnd
.noThousand
    ld hl, Map_1A73_SlotFun
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_1A73_SlotFun:
    text "Yeah!"
    next "That was a lot of fun!"
    done
    
Map_1A73_SlotThousand:
    text "Wow! You won 1000 coins!"
    next "That's hugely impressive!"
    wait
    
Map_1A73_TX6:
    TX_ASM
    jp EnhancedTextOnly
    text "Hey! There's switch behind"
    next "that poster..."
    para "No, just kidding."
    next "Nothing wrong here."
    done

Map_1A73_CurrentUserBuffer:
    SUBST_CURRENT_USER

