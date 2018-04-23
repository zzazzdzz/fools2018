SECTION "Map_2725", ROM0[$B800]

Map_2725_Header:
    hdr_tileset         0
    hdr_dimensions      10, 9
    hdr_pointers_a      Map_2725_Blocks, Map_2725_TextPointers
    hdr_pointers_b      Map_2725_Script, Map_2725_Objects
    hdr_pointers_c      Map_2725_InitScript, Map_2725_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $1C2C, 6, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2725_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            8, 5, 21, 3, $2791
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_FAT_BALD_GUY, 11, 11, WALK, UP_DOWN, $01

Map_2725_RAMScript:
    rs_write_3 $c7b1, $4e, $0a, $4d
    rs_write_3 $c7c1, $4e, $0a, $4d
    rs_end

Map_2725_Blocks:
    db $2c,$2c,$2c,$2c,$2c,$2c,$2c,$2c,$29,$0f
    db $57,$57,$2a,$2c,$2c,$2c,$2c,$2b,$25,$0f
    db $0f,$0f,$24,$57,$06,$57,$2a,$29,$0f,$0f
    db $0f,$0f,$0a,$0a,$5d,$0a,$24,$25,$0f,$0f
    db $0f,$0f,$6f,$0a,$27,$0a,$0a,$6c,$0f,$0f
    db $0f,$0f,$0f,$0a,$44,$23,$23,$48,$0a,$0f
    db $0f,$0f,$0f,$0f,$0a,$0a,$0a,$27,$0a,$0f
    db $0f,$0f,$0f,$0f,$0f,$6f,$0a,$5e,$0a,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$4e,$0a,$4d,$0f

Map_2725_TextPointers:
    dw Map_2725_TX1

Map_2725_InitScript:
    xor a
	ld [$d35c], a
    ret
Map_2725_Script:
    ret

Map_2725_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "If you ever get lost inside"
    next "the caves, do not worry!"
    para "One quick reset of the game"
    next "will bring you back to"
    cont "Central Square."
    para "From there, you can"
    next "go back and try again!"
    done
