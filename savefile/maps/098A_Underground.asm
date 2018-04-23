SECTION "Map_098A", ROM0[$B800]

Map_098A_Header:
    hdr_tileset         17
    hdr_dimensions      5, 10
    hdr_pointers_a      Map_098A_Blocks, Map_098A_TextPointers
    hdr_pointers_b      Map_098A_Script, Map_098A_Objects
    hdr_pointers_c      Map_098A_InitScript, Map_098A_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_098A_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            5, 19, 3, 10, $0932
    hdr_warp            4, 19, 3, 10, $0932
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GIOVANNI, 5, 15, STAY, DOWN, $01

Map_098A_RAMScript:
    rs_write_term  $c77a
    db $1a,$1a,$52,$18,$18,$ff
    rs_write_term  $c785
    db $1a,$1a,$52,$18,$18,$ff
    rs_end

Map_098A_Blocks:
    db $2c,$1d,$1d,$1d,$2b
    db $1a,$2c,$1d,$2b,$18
    db $1a,$1a,$01,$18,$18
    db $1a,$1a,$01,$18,$18
    db $1a,$1a,$01,$18,$18
    db $1a,$1a,$01,$18,$18
    db $1a,$1a,$01,$18,$18
    db $1a,$1a,$01,$18,$18
    db $1a,$1a,$01,$18,$18
    db $1a,$1a,$24,$18,$18

Map_098A_TextPointers:
    dw Map_098A_TX1

Map_098A_InitScript:
    ret
Map_098A_Script:
    ret

Map_098A_TX1:
    TX_ASM
    ld hl, Map_098A_HelixText
    call PrintTextEnhanced
    ld c, EVENT_OBTAINED_HELIX
    call TestEventFlag
    jp c, TextScriptEnd
    ld a, SFX_GET_ITEM_1
    call PlaySound
    call WaitForSoundToFinish
    ld bc, $2a01
    call GiveItem
    ld bc, $C5A5
    ld de, $2904
    call CompleteEvent
    jp TextScriptEnd
    
Map_098A_HelixText:
    text "All hail the Helix."
    done
