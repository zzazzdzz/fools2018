SECTION "Map_4A34", ROM0[$B800]

Map_4A34_Header:
    hdr_tileset         0
    hdr_dimensions      11, 11
    hdr_pointers_a      Map_4A34_Blocks, Map_4A34_TextPointers
    hdr_pointers_b      Map_4A34_Script, Map_4A34_Objects
    hdr_pointers_c      Map_4A34_InitScript, Map_4A34_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $4C21, 5, 1
    hdr_connection      WEST,  $472B, 16, 12
    hdr_connection      EAST,  $4B3A, 1, 8
    
Map_4A34_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      4
    hdr_signpost        9, 7, $02
    hdr_signpost        17, 10, $03
    hdr_signpost        17, 8, $04
    hdr_signpost        17, 6, $05
    hdr_object_count    1
    hdr_object          SPRITE_FISHER2, 11, 13, STAY, NONE, $01

Map_4A34_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c74e
    rs_fill_byte $31
    rs_fill_3 $c75f
    rs_fill_byte $6f
    rs_fill_3 $c770
    rs_write_3 $c7df, $0a, $31, $7a
    rs_write_3 $c7f0, $0a, $31, $7a
    rs_end

Map_4A34_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$6c,$6c,$6c,$7a,$0a,$0a,$0f,$0f
    db $0a,$74,$74,$7a,$79,$7a,$7a,$0a,$53,$0f,$0f
    db $31,$31,$31,$31,$31,$31,$7a,$0a,$53,$0f,$0f
    db $6f,$6f,$0a,$7a,$7a,$31,$31,$7a,$53,$0f,$0f
    db $0f,$0f,$0f,$6f,$74,$7a,$31,$74,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$6d,$7a,$31,$7a,$6e,$0f,$0f
    db $0f,$0f,$0f,$0f,$6d,$74,$31,$31,$6e,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$6d,$7a,$31,$6e,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0a,$31,$7a,$0f,$0f

Map_4A34_TextPointers:
    dw Map_4A34_TX1
    dw Map_4A34_TX2
    dw Map_4A34_TX3
    dw Map_4A34_TX3
    dw Map_4A34_TX3

Map_4A34_InitScript:
    ret
Map_4A34_Script:
    ret
    
Map_4A34_SecretCount:
    db 0

Map_4A34_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Hi, I'm yet another"
    next "useless NPC to talk to."
    done

Map_4A34_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Welcome to Yet Another"
    next "Route!"
    para "It leads to a Yet Another"
    next "Cave, which in turn leads"
    cont "to a Yet Another Pathway."
    done

Map_4A34_TX3:
    TX_ASM
    ld hl, Map_4A34_Clicked
    call PrintTextEnhanced
    ld hl, Map_4A34_SecretCount
    inc [hl]
    ld hl, Map_4A34_TX4
    ldh a, [$8c]
    ld c, a
    ld a, PREDEF_ReplaceTextPointer
    call PredefCmd
    ld a, [Map_4A34_SecretCount]
    cp 3
    jr z, .triggered
    jp TextScriptEnd
.triggered
    ld hl, Map_4A34_SecretOpenRAMScript
    call RunRAMScript
    ld b, b_RedrawMapView
    ld hl, RedrawMapView
    call Bankswitch
    ld hl, Map_4A34_Opened
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_4A34_SecretOpenRAMScript:
    rs_fill_byte $0a
    rs_fill_2 $c749
    rs_fill_3 $c74b
    rs_end
    
Map_4A34_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "Nothing wrong here."
    done

Map_4A34_Clicked:
    text "Hey, a secret switch!"
    next "Let's press it!"
    tx_snd SFX_SWITCH
    done
    
Map_4A34_Opened:
    text "...??"
    tx_snd SFX_GO_INSIDE
    done
