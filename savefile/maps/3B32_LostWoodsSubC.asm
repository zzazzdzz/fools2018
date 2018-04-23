SECTION "Map_3B32", ROM0[$B800]

Map_3B32_Header:
    hdr_tileset         0
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_3B32_Blocks, Map_3B32_TextPointers
    hdr_pointers_b      Map_3B32_Script, Map_3B32_Objects
    hdr_pointers_c      Map_3B32_InitScript, Map_3B32_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $3B22, 7, 1
    hdr_connection      WEST,  $3A3E, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3B32_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_BRUNETTE_GIRL, 7, 6, STAY, NONE, $01

Map_3B32_RAMScript:
    rs_write_1 $c770, $7a
    rs_write_1 $c77d, $7a
    rs_end

Map_3B32_Blocks:
    db $0b,$0b,$0b,$0b,$0b,$0b,$0b
    db $0b,$62,$6c,$6c,$6c,$63,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$50,$52,$7a,$52,$4f,$0b
    db $0b,$0b,$0f,$7a,$0f,$0b,$0b

Map_3B32_TextPointers:
    dw Map_3B32_TX1

Map_3B32_InitScript:
    ld a, 4
    ld [$c109], a
    ret
Map_3B32_ChangeDirFlag:
    db 32
Map_3B32_Script:
    ld a, [Map_3B32_ChangeDirFlag]
    and a
    ret z
    ld a, 4
    ld [$c109], a
    ld hl, Map_3B32_ChangeDirFlag
    dec [hl]
    ret

Map_3B32_TX1:
    TX_ASM
    ld c, EVENT_GOT_FOURTH_POKEBALL
    ld hl, Map_3B32_AlreadyGotText
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_3B32_GiveBallText
    call PrintTextEnhanced
    ld bc, $0401
    call GiveItem
    ld bc, $4022
    ld de, $5EF0
    call CompleteEvent
    jp TextScriptEnd

Map_3B32_AlreadyGotText:
    text "This place is so cool."
    next "No one is going to find"
    cont "me here."
    done
    
Map_3B32_GiveBallText:
    text "When I arrived, there"
    next "were heaps of treasure"
    cont "here!"
    para "I got there first, so all"
    next "of the treasure is mine."
    cont "Sorry!"
    para "But you can have this, as"
    next "a reward for trying."
    para "Obtained a Poké Ball!"
    tx_snd SFX_GET_ITEM_1
    wait

