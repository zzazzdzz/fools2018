SECTION "Map_3B31_Fun", ROM0[$B800]

Map_3B31_Fun_Header:
    hdr_tileset         0
    hdr_dimensions      7, 7
    hdr_pointers_a      Map_3B31_Fun_Blocks, Map_3B31_Fun_TextPointers
    hdr_pointers_b      Map_3B31_Fun_Script, Map_3B31_Fun_Objects
    hdr_pointers_c      Map_3B31_Fun_InitScript, Map_3B31_Fun_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON2, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $3B22, 7, 1
    hdr_connection      WEST,  $3A3E, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3B31_Fun_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        4, 9, $02
    hdr_object_count    1
    hdr_object          SPRITE_GIRL, 7, 6, STAY, NONE, $01

Map_3B31_Fun_RAMScript:
    rs_write_1 $c770, $7a
    rs_write_1 $c77d, $7a
    rs_end

Map_3B31_Fun_Blocks:
    db $0b,$0b,$0b,$0b,$0b,$0b,$0b
    db $0b,$62,$6c,$6c,$6c,$63,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$6d,$7a,$7a,$7a,$6e,$0b
    db $0b,$6d,$41,$7a,$7a,$6e,$0b
    db $0b,$50,$52,$7a,$52,$4f,$0b
    db $0b,$0b,$0f,$7a,$0f,$0b,$0b

Map_3B31_Fun_TextPointers:
    dw Map_3B31_Fun_TX1
    dw Map_3B31_Fun_TX2

Map_3B31_Fun_InitScript:
    ld a, 4
    ld [$c109], a
    ret
Map_3B31_Fun_ChangeDirFlag:
    db 32
Map_3B31_Fun_Script:
    ld a, [Map_3B31_Fun_ChangeDirFlag]
    and a
    ret z
    ld a, 4
    ld [$c109], a
    ld hl, Map_3B31_Fun_ChangeDirFlag
    dec [hl]
    ret

Map_3B31_Fun_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "This place was just filled"
    next "with treasure, but I got"
    cont "here first."
    para "What a bummer!"
    next "Haha! At least you tried!"
    done

Map_3B31_Fun_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "A random pillar. There's a"
    next "piece of paper attached."
    para "It looks like a scoreboard,"
    next "counting wins between two"
    cont "people in a best-of-25"
    cont "match."
    para "The match was never finished,"
    next "but it came close, with 24"
    cont "wins on one side."
    para "That doesn't make any sense."
    next "Welcome to Fidei."
    done
