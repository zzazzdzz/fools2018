SECTION "Map_182A", ROM0[$B800]

Map_182A_Header:
    hdr_tileset         0
    hdr_dimensions      6, 12
    hdr_pointers_a      Map_182A_Blocks, Map_182A_TextPointers
    hdr_pointers_b      Map_182A_Script, Map_182A_Objects
    hdr_pointers_c      Map_182A_InitScript, Map_182A_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $1927, 4, 8
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $1720, 38, 4
    hdr_connection      EAST,  $0000, 0, 0
    
Map_182A_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    4
    hdr_object          SPRITE_MART_GUY, 7, 20, STAY, NONE, $01
    hdr_object          SPRITE_GUARD, 8, 3, STAY, DOWN, $02
    hdr_object          SPRITE_GUARD, 3, 9, STAY, DOWN, $02
    hdr_object          SPRITE_GUARD, 8, 15, STAY, DOWN, $02

Map_182A_RAMScript:
    rs_write_1 $c6fb, $7a
    rs_write_1 $c707, $7a
    rs_fill_byte $7a
    rs_fill_3 $c778
    rs_fill_3 $c784
    rs_end

Map_182A_Blocks:
    db $0f,$0f,$0f,$0f,$5d,$0f
    db $0f,$0f,$0f,$0f,$27,$0f
    db $0f,$74,$74,$7a,$27,$0f
    db $0f,$49,$23,$23,$45,$0f
    db $0f,$27,$0f,$0f,$0f,$0f
    db $0f,$27,$7a,$74,$74,$0f
    db $0f,$44,$23,$23,$48,$0f
    db $0f,$0f,$0f,$0f,$27,$0f
    db $0f,$74,$49,$23,$45,$0f
    db $7a,$7a,$27,$7a,$3e,$3b
    db $7a,$7a,$5e,$7a,$28,$29
    db $0f,$0f,$0f,$0f,$24,$25

Map_182A_TextPointers:
    dw Map_182A_TX1
    dw Map_182A_TX2

Map_182A_InitScript:
    xor a
    ld [MapScriptGeneralPurpose], a
    ret
Map_182A_Script:
    ld a, [$d360]
    cp 15
    jp z, Map_182A_Guard1Script
    cp 9
    jp z, Map_182A_Guard2Script
    cp 3
    jp z, Map_182A_Guard3Script
    cp 2
    ret nz
    ld a, 4
    ld [MapScriptGeneralPurpose], a
    ret

Map_182A_Guard1Script:
    ld a, [MapScriptGeneralPurpose]
    and a
    ret nz
    call ScriptEventInOverworld
    ret nz
    ld de, Map_182A_Dex1_Answer
    ld hl, Map_182A_Dex1
    ld bc, 6
    jp Map_182A_AskQuestion
    
Map_182A_Guard2Script:
    ld a, [MapScriptGeneralPurpose]
    cp $1
    ret nz
    call ScriptEventInOverworld
    ret nz
    ld de, Map_182A_Dex2_Answer
    ld hl, Map_182A_Dex2
    ld bc, 7
    jp Map_182A_AskQuestion
    
Map_182A_Guard3Script:
    ld a, [MapScriptGeneralPurpose]
    cp $2
    ret nz
    call ScriptEventInOverworld
    ret nz
    ld de, Map_182A_Dex3_Answer
    ld hl, Map_182A_Dex3
    ld bc, 9
    jp Map_182A_AskQuestion

; de - correct answer
; hl - dex entry ptr
; bc - answer length
Map_182A_AskQuestion:
    push de
    push bc
    push hl
    call OpenTextboxInOverworld
    pop hl
    call PrintTextEnhanced
    pop bc
    push bc
    call PrintInputMenu
    pop bc
    pop de
    ld hl, InputMenuBuffer
    call StringCmp
    jr nz, Map_182A_Nope
    ld hl, MapScriptGeneralPurpose
    inc [hl]
    ld hl, Map_182A_Correct
    call PrintTextEnhanced
    jp CloseTextboxInOverworld
    
Map_182A_Nope:
    ld hl, Map_182A_Incorrect
    call PrintTextEnhanced
    call CloseTextboxInOverworld
    ld a, D_DOWN
    ld [$ccd3], a
    ld a, 1
    ld [$cd38], a
    jp StartSimulatingJoypadStates

Map_182A_Dex1:
    text "Who's that Pokémon?"
    next "Its long neck and elongated"
    cont "beak are ideal for catching"
    cont "prey in soil or water. It"
    cont "deftly moves this extended"
    cont "and skinny beak to pluck"
    cont "prey."
    para "Enter the Pokémon name."
    next "All uppercase."
    done
    
Map_182A_Dex1_Answer:
    db $85,$84,$80,$91,$8e,$96
    
Map_182A_Dex2:
    text "Who's that Pokémon?"
    next "It stores electricity in the"
    cont "electric sacs on its cheeks."
    cont "When it releases pent-up"
    cont "energy in a burst, the"
    cont "electric power is equal to a"
    cont "lightning bolt."
    para "Enter the Pokémon name."
    next "All uppercase."
    done
    
Map_182A_Dex2_Answer:
    db $8f,$88,$8a,$80,$82,$87,$94
    
Map_182A_Dex3:
    text "Who's that Pokémon?"
    next "It floats in the air by"
    cont "emitting electromagnetic"
    cont "waves from the units at its"
    cont "sides. These waves block"
    cont "gravity. This Pokémon is"
    cont "incapable of flight if its"
    cont "internal electrical supply"
    cont "is depleted."
    para "Enter the Pokémon name."
    next "All uppercase."
    done
    
Map_182A_Dex3_Answer:
    db $8c,$80,$86,$8d,$84,$8c,$88,$93,$84
    
Map_182A_Correct:
    text "Yes, that's correct!"
    next "Go on through!"
    tx_snd SFX_GET_ITEM_1
    wait
    
Map_182A_Incorrect:
    text "Sorry, your answer is"
    next "wrong!"
    tx_snd SFX_DENIED
    wait

Map_182A_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Man, I really suck at"
    next "remembering names."
    para "Or maybe, I can just"
    next "cheat by looking things up"
    cont "on the Internet."
    para "You're probably doing this"
    next "right now. Did I getcha?"
    done

Map_182A_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "To pass through, you must"
    next "first answer our questions."
    para "Please step forward."
    done

