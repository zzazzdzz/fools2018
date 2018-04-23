SECTION "Map_1E33", ROM0[$B800]

Map_1E33_Header:
    hdr_tileset         0
    hdr_dimensions      12, 11
    hdr_pointers_a      Map_1E33_Blocks, Map_1E33_TextPointers
    hdr_pointers_b      Map_1E33_Script, Map_1E33_Objects
    hdr_pointers_c      Map_1E33_InitScript, Map_1E33_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $1D3B, 7, 24
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $1F3A, 1, 7
    
Map_1E33_Objects:
    hdr_border          $0b
    hdr_warp_count      1
    hdr_warp            16, 13, 5, 19, $1E92
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_GUARD, 13, 4, STAY, DOWN, $02
    hdr_object          SPRITE_LASS, 2, 3, WALK, UP_DOWN, $01

Map_1E33_RAMScript:
    rs_write_3 $c6ff, $6d, $7a, $6e
    rs_write_3 $c711, $6d, $7a, $6e
    rs_fill_byte $51
    rs_fill_3 $c72d
    rs_fill_byte $52
    rs_fill_3 $c73f
    rs_fill_byte $0b
    rs_fill_3 $c751
    rs_fill_byte $7a
    rs_fill_3 $c763
    rs_fill_byte $0b
    rs_fill_3 $c775
    rs_end

Map_1E33_Blocks:
    db $62,$51,$6d,$7a,$6e,$20,$0d,$21,$51,$51,$51,$51
    db $4e,$0a,$6d,$7a,$6e,$37,$7d,$7e,$52,$52,$52,$52
    db $4e,$0a,$0a,$7a,$0a,$0a,$0a,$0b,$0b,$0b,$0b,$0b
    db $50,$52,$52,$7a,$7a,$7a,$7a,$7a,$7a,$7a,$7a,$7a
    db $3e,$3f,$3f,$3b,$1d,$1e,$0b,$0b,$0b,$0b,$0b,$0b
    db $28,$2c,$2c,$29,$65,$64,$3e,$3f,$3f,$3f,$3f,$3b
    db $28,$2c,$2c,$29,$65,$64,$24,$57,$06,$2a,$2c,$29
    db $28,$2c,$2c,$29,$65,$2d,$1e,$31,$31,$28,$2c,$29
    db $28,$2c,$2c,$29,$65,$43,$2d,$1f,$1e,$28,$2c,$29
    db $28,$2c,$2c,$2c,$3f,$3f,$3f,$3f,$3f,$2c,$2c,$29
    db $28,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$29

Map_1E33_TextPointers:
    dw Map_1E33_TX1
    dw Map_1E33_TX2

Map_1E33_InitScript:
    xor a
    ld [MapScriptGeneralPurpose], a
    ret
Map_1E33_Script:
    ld a, [$d361]
    cp 13
    jr z, .permit
    cp 14
    jr z, .ign
    ret
.permit
    ld a, [MapScriptGeneralPurpose]
    and a
    ret nz
    call ScriptEventInOverworld
    ret nz
    call OpenTextboxInOverworld
    ld c, EVENT_GOT_GLITCHLAND_PERMIT
    call TestEventFlag
    jr c, .hasPermit
    ld hl, Map_1E33_NoPermitText
    call PrintTextEnhanced
    call CloseTextboxInOverworld
    ld a, D_LEFT
    ld [$ccd3], a
    ld a, 1
    ld [$cd38], a
    jp StartSimulatingJoypadStates
.hasPermit
    ld hl, Map_1E33_HasPermitText
    call PrintTextEnhanced
    call CloseTextboxInOverworld
.ign
    ld a, 1
    ld [MapScriptGeneralPurpose], a
    ret

Map_1E33_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I wanted to visit my"
    next "friends in Deliria, but"
    cont "I don't have a permit..."
    para "However, I heard some"
    next "shady guy in Northern"
    cont "Glitchland is giving out"
    cont "forged permits."
    para "I think this might be"
    next "my only chance to see"
    cont "my friends again..."
    done

Map_1E33_TX2:
    TX_ASM
    jp EnhancedTextOnly
Map_1E33_NoPermitText:
    text "I'm sorry, but Deliria"
    next "is only accessible for"
    cont "people with a special"
    cont "permit."
    wait

Map_1E33_HasPermitText:
    text "Oh, you have a permit!"
    next "Let me see."
    para "Alright! Everything's good."
    next "You can enter Deliria now."
    cont "Glory to Arstotzka!"
    tx_snd SFX_GET_KEY_ITEM
    wait
    
