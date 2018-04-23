SECTION "Map_3B30", ROM0[$B800]

Map_3B30_Header:
    hdr_tileset         0
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_3B30_Blocks, Map_3B30_TextPointers
    hdr_pointers_b      Map_3B30_Script, Map_3B30_Objects
    hdr_pointers_c      Map_3B30_InitScript, Map_3B30_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $3B22, 7, 1
    hdr_connection      WEST,  $3A3E, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3B30_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_FISHER, 7, 6, STAY, NONE, $01

Map_3B30_RAMScript:
    rs_write_1 $c770, $7a
    rs_write_1 $c77d, $7a
    rs_end

Map_3B30_Blocks:
    db $0b,$0b,$0b,$0b,$0b,$0b,$0b
    db $0b,$62,$6c,$6c,$6c,$63,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$50,$52,$7a,$52,$4f,$0b
    db $0b,$0b,$0f,$7a,$0f,$0b,$0b

Map_3B30_TextPointers:
    dw Map_3B30_TX1

Map_3B30_InitScript:
    ret
Map_3B30_ChangeDirFlag:
    db 32
Map_3B30_Script:
    ld a, [Map_3B30_ChangeDirFlag]
    and a
    ret z
    ld a, 4
    ld [$c109], a
    ld hl, Map_3B30_ChangeDirFlag
    dec [hl]
    ret

Map_3B30_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I once heard that this"
    next "place was supposed to be"
    cont "filled with treasure."
    para "However, when I got here,"
    next "there was completely"
    cont "nothing!"
    para "I guess someone must have"
    next "found this place before me."
    done

