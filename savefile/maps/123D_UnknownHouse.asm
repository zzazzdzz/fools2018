SECTION "Map_123D", ROM0[$B800]

Map_123D_Header:
    hdr_tileset         0
    hdr_dimensions      4, 6
    hdr_pointers_a      Map_123D_Blocks, Map_123D_TextPointers
    hdr_pointers_b      Map_123D_Script, Map_123D_Objects
    hdr_pointers_c      Map_123D_InitScript, Map_123D_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $113D, 26, 18
    hdr_connection      EAST,  $0000, 0, 0
    
Map_123D_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      4
    hdr_signpost        2, 3, $01
    hdr_signpost        5, 3, $01
    hdr_signpost        4, 3, $01
    hdr_signpost        3, 3, $01
    hdr_object_count    0

Map_123D_RAMScript:
    rs_fill_byte $51
    rs_fill_3 $c724
    rs_fill_byte $23
    rs_fill_3 $c72e
    rs_fill_byte $52
    rs_fill_3 $c738
    rs_end

Map_123D_Blocks:
    db $0f,$0c,$0e,$0f
    db $0f,$10,$12,$0f
    db $0f,$6f,$0a,$4d
    db $51,$51,$5d,$4d
    db $23,$23,$45,$4d
    db $52,$52,$52,$4f

Map_123D_TextPointers:
    dw Map_123D_TX1

Map_123D_InitScript:
    ret
Map_123D_Script:
    ret

Map_123D_TX1:
    TX_ASM
    ld hl, Map_123D_HouseIntro
    call PrintTextEnhanced
    ld bc, $020e
    ld de, Map_123D_Choice
    call PrintChoiceMenu
    and a
    jr nz, .gaveUp
    ld a, [PlayerFunValue]
    ld hl, Map_123D_House_TextStandard
    cp $d0
    jr c, .printerino
    ld hl, Map_123D_House_TextB
    cp $e0
    jr c, .printerino
    ld hl, Map_123D_House_TextC
    cp $f0
    jr c, .printerino
    ld hl, Map_123D_House_TextA
    jr .printerino
.gaveUp
    ld hl, Map_123D_House_Nope
.printerino
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_123D_Choice:
    db $8b,$a8,$b2,$b3,$a4,$ad,$7f,$a2,$ab,$ae,$b2,$a4,$ab,$b8,$4f
    db $88,$a6,$ad,$ae,$b1,$a4,$50
    
Map_123D_HouseIntro:
    text "A large house. The door"
    next "is firmly shut."
    para "But some people seem to"
    next "be talking inside..."
    done

Map_123D_House_TextStandard:
    text "You try listening"
    next "closely."
    para "Unfortunately, you can't"
    next "understand a thing from"
    cont "what they're saying."
    cont "It's too loud inside."
    done

Map_123D_House_TextA:
    text "You try listening"
    next "closely."
    para "You heard something"
    next "about... someone being"
    cont "a dog?"
    para "Cause a dog is a man's best"
    next "friend."
    para "That doesn't make any sense."
    next "Welcome to Fidei."
    done
    
Map_123D_House_TextB:
    text "You tried to listen"
    next "closely, but the people"
    cont "inside keep laughing and"
    cont "laughing. You can't"
    cont "understand a thing."
    done
    
Map_123D_House_TextC:
    text "You try listening"
    next "closely. You hear a bunch"
    cont "of people reminiscing"
    cont "about how long they've"
    cont "been together."
    para "Maybe you're wasting your"
    next "time trying to eavesdrop"
    cont "this conversation..."
    done

Map_123D_House_Nope:
    text "You decided not to listen."
    done
