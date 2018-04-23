SECTION "Map_4F21", ROM0[$B800]

Map_4F21_Header:
    hdr_tileset         0
    hdr_dimensions      5, 5
    hdr_pointers_a      Map_4F21_Blocks, Map_4F21_TextPointers
    hdr_pointers_b      Map_4F21_Script, Map_4F21_Objects
    hdr_pointers_c      Map_4F21_InitScript, Map_4F21_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $4D3A, 9, 26
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4F21_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIOVANNI, 5, 6, STAY, UP, $01

Map_4F21_RAMScript:
    rs_write_term  $c6f6
    db $19,$0a,$0a,$0a,$4d,$ff
    rs_write_term  $c701
    db $19,$0a,$74,$0a,$4d,$ff
    rs_end

Map_4F21_Blocks:
    db $19,$7a,$0a,$0a,$4d
    db $19,$0a,$7a,$74,$4d
    db $19,$74,$7a,$7a,$4d
    db $19,$7a,$7b,$7a,$4d
    db $19,$52,$52,$52,$4f

Map_4F21_TextPointers:
    dw Map_4F21_TX1

Map_4F21_InitScript:
    ret
Map_4F21_Script:
    ret

Map_4F21_TX1:
    TX_ASM
    ld b, $59
    ld hl, Map_4F21_AnotherTime
    call CheckItemAndPrintHLIfCompleted
    ld hl, Map_4F21_Intro
    call PrintTextEnhanced
    ld bc, $5901
    call GiveItem
    ld hl, Map_4F21_AnotherTime
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_4F21_Intro:
    text "The power to purge the"
    next "glitches of this world."
    para "Having not only the power,"
    next "but also the responsibility"
    cont "to cleanse the corruption"
    cont "of this land."
    para "This is what I grant you."
    tx_snd SFX_GET_KEY_ITEM
    wait

Map_4F21_AnotherTime:
    text "Hope I see you another"
    next "time..."
    done
