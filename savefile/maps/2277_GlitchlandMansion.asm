SECTION "Map_2277", ROM0[$B800]

Map_2277_Header:
    hdr_tileset         22
    hdr_dimensions      8, 6
    hdr_pointers_a      Map_2277_Blocks, Map_2277_TextPointers
    hdr_pointers_b      Map_2277_Script, Map_2277_Objects
    hdr_pointers_c      Map_2277_InitScript, Map_2277_RAMScript
    hdr_palette         $08
    hdr_music           MUSIC_CINNABAR_MANSION, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2277_Objects:
    hdr_border          $2e
    hdr_warp_count      1
    hdr_warp            2, 9, 3, 12, $2276
    hdr_sign_count      1
    hdr_signpost        9, 4, $02
    hdr_object_count    1
    hdr_object          SPRITE_BLACK_HAIR_BOY_2, 12, 5, STAY, NONE, $01

Map_2277_RAMScript:
    rs_end

Map_2277_Blocks:
    db $3c,$3d,$3d,$3d,$3d,$3d,$3d,$3e
    db $44,$7b,$0e,$2b,$61,$61,$2a,$46
    db $44,$37,$0e,$0e,$0e,$0e,$0e,$46
    db $44,$0e,$0e,$2b,$61,$61,$2a,$5d
    db $44,$21,$0c,$0e,$0e,$0e,$31,$5d
    db $48,$49,$4a,$49,$49,$49,$49,$4a

Map_2277_TextPointers:
    dw Map_2277_TX1
    dw Map_2277_TX2

Map_2277_InitScript:
    ret
Map_2277_Script:
    ret

Map_2277_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Hey! My ITEMFINDER's"
    next "responding here!"
    done

Map_2277_TX2:
    TX_ASM
    ld b, $4b
    call IsItemInBag
    jr nz, .questFinished
    ld c, EVENT_RETURNED_EXPALL
    call TestEventFlag
    jr c, .questFinished
    ld hl, Map_2277_Found
    call PrintTextEnhanced
    ld bc, $4b01
    call GiveItem
    jp TextScriptEnd
.questFinished
    ld hl, Map_2277_Nothing
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_2277_Found:
    text "Found EXP.ALL!"
    tx_snd SFX_GET_ITEM_1
    done

Map_2277_Nothing:
    text "There's nothing here."
    done

