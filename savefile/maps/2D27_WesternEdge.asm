SECTION "Map_2D27", ROM0[$B800]

Map_2D27_Header:
    hdr_tileset         0
    hdr_dimensions      5, 4
    hdr_pointers_a      Map_2D27_Blocks, Map_2D27_TextPointers
    hdr_pointers_b      Map_2D27_Script, Map_2D27_Objects
    hdr_pointers_c      Map_2D27_InitScript, Map_2D27_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $2C29, 1, 10
    
Map_2D27_Objects:
    hdr_border          $43
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIOVANNI, 2, 4, STAY, RIGHT, $01

Map_2D27_RAMScript:
    rs_fill_byte $6b
    rs_fill_3 $c711
    rs_write_3 $c71c, $0a, $74, $0a
    rs_write_3 $c727, $74, $0a, $74
    rs_fill_byte $52
    rs_fill_3 $c732
    rs_end

Map_2D27_Blocks:
    db $6b,$6b,$6b,$6b,$6b
    db $4e,$0a,$74,$0a,$74
    db $4e,$74,$0a,$74,$0a
    db $50,$52,$52,$52,$52

Map_2D27_TextPointers:
    dw Map_2D27_TX1

Map_2D27_InitScript:
    ret
Map_2D27_Script:
    ret
    
Map_2D27_TX1:
    TX_ASM
    ld b, $58
    ld hl, Map_2D27_AnotherTime
    call CheckItemAndPrintHLIfCompleted
    ld hl, Map_2D27_Intro
    call PrintTextEnhanced
    ld bc, $5801
    call GiveItem
    ld hl, Map_2D27_AnotherTime
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_2D27_Intro:
    text "The power to travel freely,"
    next "dropping the worry about"
    cont "time and distance."
    para "This is what I grant you."
    tx_snd SFX_GET_KEY_ITEM
    wait

Map_2D27_AnotherTime:
    text "Hope I see you another"
    next "time..."
    done
