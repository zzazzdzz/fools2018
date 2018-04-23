SECTION "Map_3C36", ROM0[$B800]

Map_3C36_Header:
    hdr_tileset         0
    hdr_dimensions      5, 4
    hdr_pointers_a      Map_3C36_Blocks, Map_3C36_TextPointers
    hdr_pointers_b      Map_3C36_Script, Map_3C36_Objects
    hdr_pointers_c      Map_3C36_InitScript, Map_3C36_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_PALLET_TOWN, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $3B22, 12, 7
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3C36_Objects:
    hdr_border          $0b
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIOVANNI, 7, 3, STAY, LEFT, $02

Map_3C36_RAMScript:
    rs_fill_byte $51
    rs_fill_3 $c709
    rs_fill_byte $0a
    rs_fill_3 $c714
    rs_fill_3 $c71f
    rs_fill_byte $51
    rs_fill_3 $c72a
    rs_end

Map_3C36_Blocks:
    db $51,$51,$51,$51,$63
    db $0a,$7a,$7b,$7b,$4d
    db $0a,$0a,$7a,$7a,$4d
    db $51,$51,$51,$51,$51

Map_3C36_TextPointers:
    dw Map_3C36_TX1
    dw Map_3C36_TX2

Map_3C36_InitScript:
    ret
Map_3C36_ChangeDirFlag:
    db 32
Map_3C36_Script:
    ld a, [Map_3C36_ChangeDirFlag]
    and a
    ret z
    ld a, $0c
    ld [$c109], a
    ld hl, Map_3C36_ChangeDirFlag
    dec [hl]
    ret

Map_3C36_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "redacted"
    done

Map_3C36_TX2:
    TX_ASM
    ld b, $5a
    ld hl, Map_3C36_AnotherTime
    call CheckItemAndPrintHLIfCompleted
    ld hl, Map_3C36_Intro
    call PrintTextEnhanced
    ld bc, $5a01
    call GiveItem
    ld hl, Map_3C36_AnotherTime
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_3C36_Intro:
    text "All the world's powers,"
    next "channeled to a single item."
    para "This is what I grant you."
    tx_snd SFX_GET_KEY_ITEM
    wait

Map_3C36_AnotherTime:
    text "Hope I see you another"
    next "time..."
    done
