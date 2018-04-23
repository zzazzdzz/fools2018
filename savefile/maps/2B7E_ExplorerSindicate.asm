SECTION "Map_2B7E", ROM0[$B800]

Map_2B7E_Header:
    hdr_tileset         9
    hdr_dimensions      8, 5
    hdr_pointers_a      Map_2B7E_Blocks, Map_2B7E_TextPointers
    hdr_pointers_b      Map_2B7E_Script, Map_2B7E_Objects
    hdr_pointers_c      Map_2B7E_InitScript, Map_2B7E_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_CINNABAR, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2B7E_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 9, 4, 12, $2B29
    hdr_warp            2, 9, 3, 12, $2B29
    hdr_sign_count      0
    hdr_object_count    5
    hdr_object          SPRITE_PAPER_SHEET, 12, 6, STAY, DOWN, $05
    hdr_object          SPRITE_FISHER2, 10, 2, STAY, NONE, $04
    hdr_object          SPRITE_OAK_AIDE, 12, 7, STAY, UP, $03
    hdr_object          SPRITE_HIKER, 6, 6, WALK, NONE, $02
    hdr_object          SPRITE_BLACK_HAIR_BOY_1, 3, 2, STAY, DOWN, $01

Map_2B7E_RAMScript:
    rs_end

Map_2B7E_Blocks:
    db $2f,$03,$03,$03,$2e,$4d,$4d,$4d
    db $51,$51,$54,$4d,$4d,$42,$00,$00
    db $00,$04,$00,$00,$00,$00,$00,$00
    db $00,$04,$00,$00,$00,$00,$00,$00
    db $3a,$04,$00,$00,$00,$00,$00,$63

Map_2B7E_TextPointers:
    dw Map_2B7E_TX1
    dw Map_2B7E_TX2
    dw Map_2B7E_TX3
    dw Map_2B7E_TX4
    dw Map_2B7E_TX5

Map_2B7E_InitScript:
    ret
Map_2B7E_Script:
    ret

Map_2B7E_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Welcome to the Glitchland"
    next "Explorer Sindicate."
    para "We're uniting all adventurers"
    next "dedicated to exploration."
    cont "Please enjoy your stay."
    done

Map_2B7E_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Have you heard about the"
    next "Altering Cave?"
    para "It cycles between three"
    next "different appearances every"
    cont "hour or so."
    para "I'm sure there's some secret"
    next "hidden there."
    cont "I should investigate more."
    done

Map_2B7E_TX3:
    TX_ASM
    ld c, EVENT_RETURNED_FOSSILS
    ld hl, Map_2B7E_FossilAfter
    call CheckEventAndPrintHLIfCompleted
    ld b, $29
    call IsItemInBag
    jr z, .doesNotHave
    ld b, $2a
    call IsItemInBag
    jr z, .doesNotHave
    ld b, $1f
    call IsItemInBag
    jr z, .doesNotHave
    ld hl, Map_2B7E_FossilGot
    call PrintTextEnhanced
    ld a, $29
    call RemoveItemFromBag
    ld a, $2a
    call RemoveItemFromBag
    ld a, $1f
    call RemoveItemFromBag
    ld bc, $2F0F
    ld de, $4105
    call CompleteEvent
    jp TextScriptEnd
.doesNotHave
    ld hl, Map_2B7E_FossilBefore
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_2B7E_FossilBefore:
    text "Hiya! I'm collecting"
    next "Pokémon Fossils."
    para "I'm looking for all of"
    next "them: the Dome Fossil, the"
    cont "Old Amber, and of course,"
    cont "the Great Lord Helix."
    para "If you happen to have"
    next "all three of them, please"
    cont "return them to me for"
    cont "analysis."
    done
    
Map_2B7E_FossilGot:
    text "Wow, you got all of the"
    next "fossils?"
    para "That's wonderful! Finally"
    next "I'll be able to start my"
    cont "research!"
    para "Thank you for all of your"
    next "hard work!"
    tx_snd SFX_GET_KEY_ITEM
    done
    
Map_2B7E_FossilAfter:
    text "I'm testing the effects"
    next "of fossils on this Oddish"
    cont "right here."
    done

Map_2B7E_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "Reading books is a sure way"
    next "to increase your knowledge."
    para "For example, did you know"
    next "that Lost Woods have four"
    cont "distinct secret areas,"
    cont "accessible by walking in"
    cont "certain patterns?"
    para "I heard that going south,"
    next "east twice, then north, will"
    cont "reveal one of the secret"
    cont "areas."
    done

Map_2B7E_TX5:
    TX_ASM
    jp EnhancedTextOnly
    text "Wow, what a wonderful"
    next "Pokémon!"
    para "Is this scientist using it"
    next "for his experiments?"
    done

