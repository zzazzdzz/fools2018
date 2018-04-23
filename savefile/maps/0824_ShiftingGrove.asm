SECTION "Map_0824", ROM0[$B800]

Map_0824_Header:
    hdr_tileset         0
    hdr_dimensions      12, 7
    hdr_pointers_a      Map_0824_Blocks, Map_0824_TextPointers
    hdr_pointers_b      Map_0824_Script, Map_0824_Objects
    hdr_pointers_c      Map_0824_InitScript, Map_0824_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0932, 12, 7
    hdr_connection      EAST,  $0734, 1, 5
    
Map_0824_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      3
    hdr_signpost        19, 4, $04
    hdr_signpost        21, 2, $05
    hdr_signpost        19, 2, $06
    hdr_object_count    3
    hdr_object          SPRITE_GIRL, 7, 2, WALK, LEFT_RIGHT, $01
    hdr_object          SPRITE_LORELEI, 4, 8, STAY, NONE, $02
    hdr_object          SPRITE_GAMBLER, 18, 9, STAY, NONE, $03

Map_0824_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c730
    rs_fill_byte $07
    rs_fill_3 $c742
    rs_fill_byte $55
    rs_fill_3 $c751
    rs_fill_byte $31
    rs_fill_3 $c763
    rs_fill_byte $55
    rs_fill_3 $c775
    rs_fill_3 $c787
    rs_end

Map_0824_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0a,$0a,$0a,$0a,$0a,$0a,$0a,$0a,$59,$53,$53,$0f
    db $07,$07,$2f,$07,$52,$52,$52,$07,$5b,$53,$55,$55
    db $6d,$55,$55,$55,$0f,$6c,$0f,$55,$55,$55,$31,$31
    db $6d,$55,$55,$55,$0f,$0f,$6c,$55,$31,$31,$31,$55
    db $6d,$55,$55,$55,$6c,$0f,$0f,$55,$55,$55,$55,$55
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_0824_TextPointers:
    dw Map_0824_TX1
    dw Map_0824_TX2
    dw Map_0824_TX3
    dw Map_0824_TX4
    dw Map_0824_TX4
    dw Map_0824_TX4

Map_0824_InitScript:
    xor a
    ld [MapScriptGeneralPurpose], a
    ret
Map_0824_Script:
    ret

Map_0824_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Do you know any... 'weird'"
    next "people, by chance?"
    para "You know, someone who's"
    next "just... not like everyone"
    cont "else?"
    para "Authorities in Glitchland"
    next "are really harsh against"
    cont "everyone who even slightly"
    cont "deviates from the social"
    cont "norm."
    para "All people like this are"
    next "forced to live in a single"
    cont "district in Western"
    cont "Glitchland, called Deliria."
    done

Map_0824_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Ledges. You have to jump."
    next "And once you do, there is"
    cont "no way back..."
    para "How in life, you can only"
    next "go forward. There's no"
    cont "turning back."
    para "It is all a symbol of"
    next "evanescence. Panta rhei."
    cont "Everything flows..."
    para "Or maybe I'm just"
    next "overthinking things?"
    done

Map_0824_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "You know what grinds my"
    next "gears? Useless puzzles!"
    para "Why is all of this even"
    next "necessary? Come on, game"
    cont "designers, get with it!"
    para "Geez, what were they"
    next "thinking?"
    done

Map_0824_TX4:
    TX_ASM
    ld hl, Map_0824_TX_SuspiciousBoulder
    call PrintTextEnhanced
    ld de, Map_0824_BoulderPushMenu
    ld bc, $020b
    call PrintChoiceMenu
    and a
    jr nz, .nope
    ld hl, $c75b
    ldh a, [$8c]
    sub $04
    ld c, a
    ld b, 0
    add hl, bc
    push hl
    ld c, $12
    ld a, [hl]
    add hl, bc
    ld d, [hl]
    ld [hl], a
    add hl, bc
    ld a, [hl]
    ld [hl], d
    pop hl
    ld [hl], a
    ld a, SFX_GO_INSIDE
    call PlaySound
    ld hl, Map_0824_TX_Pushed
    call PrintTextEnhanced
    jp TextScriptEnd
.nope
    ld hl, Map_0824_TX_NotPushed
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_0824_TX_SuspiciousBoulder:
    text "A rather suspicious"
    next "object..."
    done
    
Map_0824_TX_Pushed:
    text "You pushed the switch."
    done
    
Map_0824_TX_NotPushed:
    text "Understandable."
    next "Have a great day."
    done
    
Map_0824_BoulderPushMenu:
    db $8f,$b4,$b2,$a7,$7f,$a8,$b3,$e7,$4f          ; Push it!
    db $8b,$a4,$a0,$b5,$a4,$7f,$a8,$b3,$7f,$a1,$a4  ; Leave it be
    db $50

