SECTION "Map_3420", ROM0[$B800]

Map_3420_Header:
    hdr_tileset         0
    hdr_dimensions      10, 7
    hdr_pointers_a      Map_3420_Blocks, Map_3420_TextPointers
    hdr_pointers_b      Map_3420_Script, Map_3420_Objects
    hdr_pointers_c      Map_3420_InitScript, Map_3420_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $3336, 10, 26
    hdr_connection      SOUTH, $3920, 10, 1
    hdr_connection      WEST,  $353C, 10, 7
    hdr_connection      EAST,  $3828, 1, 9
    
Map_3420_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            15, 3, 2, 7, $3482
    hdr_sign_count      1
    hdr_signpost        15, 5, $02
    hdr_object_count    1
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 11, 8, WALK, NONE, $01

Map_3420_RAMScript:
    rs_write_2 $c6ff, $7a, $27
    rs_write_2 $c70f, $74, $27
    rs_fill_byte $23
    rs_fill_3 $c748
    rs_write_3 $c758, $7a, $74, $7a
    rs_fill_byte $7a
    rs_fill_3 $c765
    rs_fill_byte $23
    rs_fill_3 $c775
    rs_write_1 $c78f, $27
    rs_write_1 $c79f, $27
    rs_end

Map_3420_Blocks:
    db $0f,$0f,$0f,$0f,$7a,$27,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$74,$27,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$7a,$49,$45,$7a,$7a,$0f,$0f
    db $0f,$0f,$7a,$7a,$27,$7a,$74,$7a,$0f,$0f
    db $0f,$0f,$74,$7a,$26,$23,$23,$48,$7a,$7a
    db $0f,$0f,$0f,$0f,$27,$7a,$74,$44,$23,$23
    db $0f,$0f,$0f,$0f,$27,$0f,$0f,$0f,$0f,$0f

Map_3420_TextPointers:
    dw Map_3420_TX1
    dw Map_3420_TX2

Map_3420_InitScript:
    ret
Map_3420_Script:
    ret

Map_3420_TX1:
    TX_ASM
    ld b, $45
    call IsItemInBag
    jr nz, .questFinished
    ld hl, Map_3420_Intro
    call PrintTextEnhanced
    ld bc, $4501
    call GiveItem
    jp TextScriptEnd
.questFinished
    ld hl, Map_3420_Done
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_3420_Intro:
    text "To play at the slots, you'll"
    next "need the Coin Case."
    para "In fact, I think I have a"
    next "spare."
    cont "Here you go!"
    tx_snd SFX_GET_KEY_ITEM
    done

Map_3420_Done:
    text "Use the Coin Case to play"
    next "at the slots and win big!"
    done

Map_3420_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "redacted"
    done
