SECTION "Map_223A", ROM0[$B800]

Map_223A_Header:
    hdr_tileset         0
    hdr_dimensions      8, 6
    hdr_pointers_a      Map_223A_Blocks, Map_223A_TextPointers
    hdr_pointers_b      Map_223A_Script, Map_223A_Objects
    hdr_pointers_c      Map_223A_InitScript, Map_223A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $232D, 3, 1
    hdr_connection      WEST,  $4933, 16, 25
    hdr_connection      EAST,  $1D3B, 1, 13
    
Map_223A_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            4, 5, 6, 15, $2275
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_FAT_BALD_GUY, 9, 8, STAY, NONE, $01

Map_223A_RAMScript:
    rs_fill_byte $51
    rs_fill_3 $c712
    rs_fill_byte $31
    rs_fill_3 $c720
    rs_write_3 $c72e, $74, $0a, $74
    rs_write_term  $c739
    db $6c,$6c,$6c,$0a,$74,$0a,$ff
    rs_write_term  $c747
    db $7a,$7a,$7a,$6f,$6f,$6f,$ff
    rs_fill_byte $6f
    rs_fill_3 $c755
    rs_write_1 $c76d, $7a
    rs_write_1 $c77b, $7a
    rs_end

Map_223A_Blocks:
    db $51,$20,$0d,$0d,$21,$51,$51,$63
    db $31,$68,$7f,$7f,$69,$0a,$0a,$4d
    db $31,$37,$3a,$7d,$7e,$6c,$6c,$6c
    db $31,$47,$7a,$7a,$7a,$7a,$7a,$7a
    db $6f,$5b,$0a,$74,$7a,$74,$74,$6f
    db $0f,$52,$52,$0f,$7a,$0f,$0f,$0f

Map_223A_TextPointers:
    dw Map_223A_TX1

Map_223A_InitScript:
    ret
Map_223A_Script:
    ret

Map_223A_TX1:
    TX_ASM
    ld c, EVENT_RETURNED_EXPALL
    ld hl, Map_223A_After
    call CheckEventAndPrintHLIfCompleted
    ld b, $4b
    call IsItemInBag
    jr z, .nope
    ld hl, Map_223A_Triggered
    call PrintTextEnhanced
    ld a, $4b
    call RemoveItemFromBag
    ld bc, $9D20
    ld de, $CC27
    call CompleteEvent
    jp TextScriptEnd
.nope
    ld hl, Map_223A_Before
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_223A_Before:
    text "I dropped a very precious"
    next "item in the mansion..."
    para "Can you help me recover"
    next "it? I would go there"
    cont "by myself to find it, but"
    cont "it's too spooky in here!"
    done

Map_223A_Triggered:
    text "Yes! That's my precious"
    next "EXP. ALL!"
    para "Thank you! I would have"
    next "never recovered it"
    cont "without your help."
    tx_snd SFX_GET_KEY_ITEM
    wait
    
Map_223A_After:
    text "I use EXP. ALL to train"
    next "my best party member,"
    cont "Magikarp."
    para "It's so weak, it's almost"
    next "a kind of art."
    done

