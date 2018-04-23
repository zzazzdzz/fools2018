SECTION "Map_2632", ROM0[$B800]

Map_2632_Header:
    hdr_tileset         0
    hdr_dimensions      6, 5
    hdr_pointers_a      Map_2632_Blocks, Map_2632_TextPointers
    hdr_pointers_b      Map_2632_Script, Map_2632_Objects
    hdr_pointers_c      Map_2632_InitScript, Map_2632_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $2435, 1, 5
    
Map_2632_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIRL, 2, 6, STAY, LEFT, $01

Map_2632_RAMScript:
    rs_fill_byte $0f
    rs_fill_3 $c715
    rs_fill_3 $c721
    rs_fill_byte $6c
    rs_fill_3 $c72d
    rs_fill_byte $31
    rs_fill_3 $c739
    rs_fill_byte $52
    rs_fill_3 $c745
    rs_end

Map_2632_Blocks:
    db $19,$0f,$0f,$0f,$0f,$0f
    db $19,$0f,$0f,$0f,$0f,$0f
    db $19,$6c,$6c,$6c,$6c,$6c
    db $19,$0a,$31,$31,$31,$31
    db $19,$52,$52,$52,$52,$52

Map_2632_TextPointers:
    dw Map_2632_TX1
    dw Map_2632_TX1

Map_2632_InitScript:
    ld a, [PlayerFunValue]
    cp $80
    ret nc
    ld hl, $c214
    ld a, $cc
    ld [hli], a
    ld [hl], a
    ret
Map_2632_Script:
    ret

Map_2632_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "When someone makes you"
    next "cry every night, you need"
    cont "to think to yourself."
    para "Is it a person?"
    next "Or is it a giant onion?"
    para "Should you perhaps stop"
    next "caring and accept whatever"
    cont "the life brought you?"
    para "And seek happiness in"
    next "some other place, in some"
    cont "other timeline?"
    para "Sometimes, there is no"
    next "choice other than to just"
    cont "keep believing."
    para "And to expect changes."
    next "Wait for a miracle."
    para "Because there is nothing"
    next "else to do."
    para "It's important to never"
    next "lose faith."
    para "No matter how bad things"
    next "may look right now,"
    cont "there might be a bright"
    cont "future ahead."
    para "And while there's that"
    next "nonzero chance of a"
    cont "miracle happening..."
    para "You have to push through,"
    next "continue the struggle."
    done
