SECTION "Map_1732", ROM0[$B800]

Map_1732_Header:
    hdr_tileset         17
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_1732_Blocks, Map_1732_TextPointers
    hdr_pointers_b      Map_1732_Script, Map_1732_Objects
    hdr_pointers_c      Map_1732_InitScript, Map_1732_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $1720, 6, 6
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1732_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            9, 13, 6, 6, $1720
    hdr_warp            8, 13, 6, 6, $1720
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIOVANNI, 3, 11, STAY, NONE, $01

Map_1732_RAMScript:
    rs_end

Map_1732_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$1d,$2b
    db $1a,$01,$01,$01,$01,$01,$18
    db $1a,$01,$14,$15,$16,$01,$18
    db $1a,$01,$18,$2c,$1e,$01,$18
    db $1a,$01,$18,$1a,$01,$01,$18
    db $1a,$01,$18,$1a,$01,$14,$19
    db $19,$15,$19,$1a,$24,$18,$19

Map_1732_TextPointers:
    dw Map_1732_TX1
    
Map_1732_InitScript:
    ret
Map_1732_Script:
    ret

Map_1732_TX1:
    TX_ASM
    ld hl, Map_1732_DomeText
    call PrintTextEnhanced
    ld c, EVENT_OBTAINED_DOME
    call TestEventFlag
    jp c, TextScriptEnd
    ld a, SFX_GET_ITEM_1
    call PlaySound
    call WaitForSoundToFinish
    ld bc, $2901
    call GiveItem
    ld bc, $569D
    ld de, $20EF
    call CompleteEvent
    jp TextScriptEnd

Map_1732_DomeText:
    text "Filthy Dome worshipper."
    done

