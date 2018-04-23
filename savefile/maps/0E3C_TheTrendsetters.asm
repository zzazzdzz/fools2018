SECTION "Map_0E3C", ROM0[$B800]

Map_0E3C_Header:
    hdr_tileset         0
    hdr_dimensions      8, 8
    hdr_pointers_a      Map_0E3C_Blocks, Map_0E3C_TextPointers
    hdr_pointers_b      Map_0E3C_Script, Map_0E3C_Objects
    hdr_pointers_c      Map_0E3C_InitScript, Map_0E3C_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $1432, 5, 8
    hdr_connection      SOUTH, $0F3B, 7, 1
    hdr_connection      WEST,  $0D3E, 28, 18
    hdr_connection      EAST,  $113D, 1, 18
    
Map_0E3C_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            7, 5, 2, 7, $0E6C
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIRL, 10, 9, STAY, NONE, $01

Map_0E3C_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c70a
    rs_fill_byte $6c
    rs_fill_3 $c72b
    rs_write_term  $c739
    db $23,$23,$23,$6c,$6c,$6c,$ff
    rs_write_term  $c747
    db $0a,$0a,$0a,$23,$23,$23,$ff
    rs_fill_byte $6f
    rs_fill_3 $c758
    rs_write_3 $c78a, $6d, $27, $6e
    rs_write_3 $c798, $6d, $27, $6e
    rs_end

Map_0E3C_Blocks:
    db $0f,$0f,$0f,$07,$07,$07,$0f,$0f
    db $0f,$0f,$0f,$7a,$7a,$7a,$6c,$6c
    db $0f,$0f,$0f,$02,$03,$7a,$49,$23
    db $6c,$6c,$6c,$7a,$7a,$7a,$27,$0a
    db $23,$23,$23,$23,$23,$23,$22,$6e
    db $6f,$6f,$6f,$6f,$6f,$4c,$27,$6e
    db $0f,$0f,$0f,$0f,$0f,$6d,$27,$6e
    db $0f,$0f,$0f,$0f,$0f,$6d,$27,$6e

Map_0E3C_TextPointers:
    dw Map_0E3C_TX1

Map_0E3C_InitScript:
    ret
Map_0E3C_Script:
    ret

Map_0E3C_TX1:
    TX_ASM
    ld hl, Map_0E3C_TX_TrendyPhraseIntro
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    and a
    jr nz, Map_0E3C_SetNewTrendyPhrase
    ld hl, Map_0E3C_TX_TrendyPhraseOutro
    call PrintTextEnhanced
    jp TextScriptEnd
     
Map_0E3C_SetNewTrendyPhrase:
    ld hl, Map_0E3C_TX_NewPhrase
    call PrintTextEnhanced
    ld bc, $000f
    call PrintInputMenu
    ld hl, InputMenuBuffer
    ld a, PREDEF_StrLen
    call PredefCmd
    ld a, c
    cp $03
    jr c, .tooShort
    ld a, PREDEF_CharsetStandardToEnhanced
    call PredefCmd
    ld hl, InputMenuBuffer
    ld bc, 16
    ld de, Map_0E3C_TrendyPhraseTextBuffer
    call CopyData
    ld bc, 16
    ld hl, Map_0E3C_CurrentUserBuffer
    ld de, Map_0E3C_TrendyPhraseAuthorBuffer
    call CopyData
    ld bc, 16
    ld hl, Map_0E3C_TrendyPhraseTextBuffer
    ld de, SerialTrendyPhraseStruct.buf
    call CopyData
    ld hl, SerialTrendyPhraseStruct
    call CompleteEventSerial
    jp TextScriptEnd
.tooShort
    ld hl, Map_0E3C_TX_PhraseTooShort
    call PrintTextEnhanced
    jp TextScriptEnd
   
Map_0E3C_TX_TrendyPhraseIntro:
    text "Our family adores"
    next "everything that is hip"
    cont "and trendy these days."
    para "Right now, we live by"
    next "the words spoken by a"
    cont "traveller I met, called"
    cont ""
    tx_buf Map_0E3C_TrendyPhraseAuthorBuffer
    text "."
    para "This person told me:"
    next "'"
    tx_buf Map_0E3C_TrendyPhraseTextBuffer
    text "'."
    para "And then, my life has"
    next "completely changed."
    para "Wherever you're from,"
    next "'"
    tx_buf Map_0E3C_TrendyPhraseTextBuffer
    text "' is"
    cont "the best thing ever, am I"
    cont "right?"
    done
    
Map_0E3C_TX_TrendyPhraseOutro:
    text "Yes, I knew it all along!"
    next "'"
    tx_buf Map_0E3C_TrendyPhraseTextBuffer
    text "' is"
    cont "really a big deal right now!"
    done

Map_0E3C_TX_NewPhrase:
    text "What? You're saying that"
    next "there's a new trend?"
    para "Please tell me more!"
    next "What's 'in' right now?"
    done

Map_0E3C_TX_PhraseTooShort:
    text "I'm sorry, this phrase is"
    next "a bit too short."
    done

Map_0E3C_TrendyPhraseTextBuffer:
    SUBST_TRENDY_PHRASE
Map_0E3C_TrendyPhraseAuthorBuffer:
    SUBST_TRENDY_AUTHOR
Map_0E3C_CurrentUserBuffer:
    SUBST_CURRENT_USER

