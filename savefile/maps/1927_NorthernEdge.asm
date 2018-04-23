SECTION "Map_1927", ROM0[$B800]

Map_1927_Header:
    hdr_tileset         0
    hdr_dimensions      4, 5
    hdr_pointers_a      Map_1927_Blocks, Map_1927_TextPointers
    hdr_pointers_b      Map_1927_Script, Map_1927_Objects
    hdr_pointers_c      Map_1927_InitScript, Map_1927_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $182A, 8, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1927_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIOVANNI, 4, 3, STAY, DOWN, $01

Map_1927_RAMScript:
    rs_write_term  $c73b
    db $19,$0a,$0a,$4d,$ff
    rs_write_term  $c745
    db $19,$0a,$0a,$4d,$ff
    rs_end

Map_1927_Blocks:
    db $04,$6b,$6b,$6b
    db $19,$0a,$0a,$4d
    db $19,$0a,$0a,$4d
    db $19,$0a,$0a,$4d
    db $19,$0a,$0a,$4d

Map_1927_TextPointers:
    dw Map_1927_TX1

Map_1927_InitScript:
    ret
Map_1927_Script:
    ret

Map_1927_TX1:
    TX_ASM
    ld b, $07
    ld hl, Map_1927_AnotherTime
    call CheckItemAndPrintHLIfCompleted
    ld hl, Map_1927_Intro
    call PrintTextEnhanced
    ld bc, $0701
    call GiveItem
    ld hl, Map_1927_AnotherTime
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_1927_Intro:
    text "The power to traverse"
    next "seas and oceans."
    para "Having control over the"
    next "waters."
    para "This is what I grant you."
    tx_snd SFX_GET_KEY_ITEM
    wait

Map_1927_AnotherTime:
    text "Hope I see you another"
    next "time..."
    done
