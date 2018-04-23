SECTION "Map_0D3E", ROM0[$B800]

Map_0D3E_Header:
    hdr_tileset         0
    hdr_dimensions      15, 12
    hdr_pointers_a      Map_0D3E_Blocks, Map_0D3E_TextPointers
    hdr_pointers_b      Map_0D3E_Script, Map_0D3E_Objects
    hdr_pointers_c      Map_0D3E_InitScript, Map_0D3E_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $152D, 11, 36
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0734, 12, 5
    hdr_connection      EAST,  $0E3C, 1, 8
    
Map_0D3E_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    4
    hdr_object          SPRITE_HIKER, 24, 16, STAY, DOWN, $01
    hdr_object          SPRITE_GAMBLER, 6, 20, STAY, NONE, $03
    hdr_object          SPRITE_BRUNETTE_GIRL, 17, 7, STAY, NONE, $02
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 8, 11, STAY, NONE, $04

Map_0D3E_RAMScript:
    rs_write_3 $c70b, $0a, $27, $0a
    rs_write_3 $c720, $0a, $27, $0a
    rs_fill_byte $6c
    rs_fill_3 $c766
    rs_fill_byte $23
    rs_fill_3 $c77b
    rs_fill_byte $6f
    rs_fill_3 $c790
    rs_fill_byte $6c
    rs_fill_3 $c7e1
    rs_fill_byte $23
    rs_fill_3 $c7f6
    rs_fill_byte $0a
    rs_fill_3 $c80b
    rs_end

Map_0D3E_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0a,$27,$0a,$0f
    db $0f,$0f,$0f,$0f,$0f,$6c,$6c,$6c,$6c,$6c,$0a,$0a,$27,$74,$0f
    db $0f,$0f,$0f,$0f,$0f,$0a,$49,$23,$23,$23,$23,$23,$45,$0a,$0f
    db $6c,$6c,$6c,$0a,$0a,$74,$27,$74,$0a,$74,$0a,$6f,$6f,$6f,$0f
    db $23,$23,$23,$23,$23,$23,$22,$0a,$6f,$0f,$0f,$0f,$0f,$0f,$0f
    db $6f,$6f,$0a,$0a,$74,$0a,$27,$6e,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$6f,$0a,$74,$27,$0a,$74,$6c,$6c,$6c,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0a,$26,$23,$23,$23,$48,$0a,$0f,$0f,$0f
    db $0f,$6c,$6c,$6c,$0a,$74,$27,$0a,$6f,$0a,$27,$0a,$74,$6c,$6c
    db $0f,$74,$49,$23,$23,$23,$45,$74,$0f,$74,$44,$23,$23,$23,$23
    db $0f,$0a,$5e,$0a,$74,$0a,$6f,$6f,$0f,$6f,$6f,$6f,$0a,$74,$0a
    db $0f,$6f,$6f,$6f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_0D3E_TextPointers:
    dw Map_0D3E_TX1
    dw Map_0D3E_TX2
    dw Map_0D3E_TX3
    dw Map_0D3E_TX4

Map_0D3E_InitScript:
    ret
Map_0D3E_Script:
    ret

Map_0D3E_TX1:
    TX_ASM
    ld hl, Map_0D3E_NameQuestion
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    ld hl, Map_0D3E_TX_Yes
    and a
    jr z, .yes
    ld hl, Map_0D3E_TX_No
.yes
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_0D3E_NameQuestion:
    text "What's your name?"
    done
    
Map_0D3E_TX_Yes:
    text "Yes? That's a really"
    next "funny name!"
    done
Map_0D3E_TX_No:
    text "No? Come on..."
    next "You must have a name!"
    done

Map_0D3E_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Are you heading for the"
    next "Northern Edge?"
    para "I heard there's a super"
    next "rare item there!"
    done

Map_0D3E_TX3:
    TX_ASM
    ld c, EVENT_GOT_THIRD_POKEBALL
    ld hl, Map_0D3E_AlreadyGotText
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_0D3E_GiveBallText
    call PrintTextEnhanced
    ld bc, $0401
    call GiveItem
    ld bc, $081c
    ld de, $d447
    call CompleteEvent
    jp TextScriptEnd
    
Map_0D3E_GiveBallText:
    text "I found this Poké Ball lying"
    next "on the ground."
    para "Since there are no wild"
    next "encounters in Glitchland,"
    cont "it's completely useless"
    cont "for me..."
    para "You can have it. Maybe you'll"
    next "find a better use for it."
    tx_snd SFX_GET_ITEM_1
    done
Map_0D3E_AlreadyGotText:
    text "I already gave you a Poké"
    next "Ball, you greedy pig!"
    done

Map_0D3E_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "I once had a girlfriend."
    next "But then, she decided to"
    cont "put pineapple on my pizza."
    para "We're not together anymore."
    done

