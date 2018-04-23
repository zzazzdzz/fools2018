SECTION "Map_2275", ROM0[$B800]

Map_2275_Header:
    hdr_tileset         22
    hdr_dimensions      11, 8
    hdr_pointers_a      Map_2275_Blocks, Map_2275_TextPointers
    hdr_pointers_b      Map_2275_Script, Map_2275_Objects
    hdr_pointers_c      Map_2275_InitScript, Map_2275_RAMScript
    hdr_palette         $08
    hdr_music           MUSIC_CINNABAR_MANSION, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2275_Objects:
    hdr_border          $2e
    hdr_warp_count      5
    hdr_warp            3, 2, 2, 9, $2276
    hdr_warp            7, 15, 4, 6, $223A
    hdr_warp            6, 15, 4, 6, $223A
    hdr_warp            5, 15, 4, 6, $223A
    hdr_warp            4, 15, 4, 6, $223A
    hdr_sign_count      1
    hdr_signpost        14, 13, $02
    hdr_object_count    1
    hdr_object          SPRITE_HIKER, 11, 3, STAY, NONE, $01

Map_2275_RAMScript:
    rs_end

Map_2275_Blocks:
    db $3c,$3d,$3d,$3d,$3d,$3c,$3d,$3d,$3d,$3d,$3e
    db $44,$6e,$35,$35,$35,$44,$06,$07,$53,$0e,$5d
    db $50,$49,$49,$58,$2d,$48,$49,$49,$4a,$0e,$5d
    db $44,$0e,$3f,$3b,$0e,$0e,$52,$0e,$0e,$0e,$5d
    db $44,$11,$3f,$3b,$0a,$0e,$12,$0e,$47,$0e,$66
    db $44,$11,$3f,$3b,$0a,$0e,$12,$0b,$0e,$0e,$46
    db $44,$11,$3f,$3b,$0a,$0e,$55,$77,$0e,$47,$46
    db $48,$58,$3f,$3b,$57,$49,$49,$49,$49,$49,$4a

Map_2275_TextPointers:
    dw Map_2275_TX1
    dw Map_2275_TX2

Map_2275_InitScript:
    ld hl, Map_2275_ReturnCoords
    call ArePlayerCoordsInArray
    ret nc
    ld a, $0e
    ld [$c744], a
    ret
Map_2275_Script:
    ret

Map_2275_ReturnCoords:
    db 2, 3, $ff

Map_2275_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "This place has a very"
    next "unsettling atmosphere..."
    para "Well, how do you get"
    next "upstairs? I think there"
    cont "must be a switch somewhere."
    done

Map_2275_TX2:
    TX_ASM
    ld a, $0e
    ld [$c744], a
    ld hl, .txt
    call PrintTextEnhanced
    jp TextScriptEnd
.txt
    text "A secret switch."
    para "You pressed it."
    tx_snd SFX_SWITCH
    done

