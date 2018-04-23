SECTION "Map_152D", ROM0[$B800]

Map_152D_Header:
    hdr_tileset         0
    hdr_dimensions      8, 19
    hdr_pointers_a      Map_152D_Blocks, Map_152D_TextPointers
    hdr_pointers_b      Map_152D_Script, Map_152D_Objects
    hdr_pointers_c      Map_152D_InitScript, Map_152D_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $1631, 16, 18
    hdr_connection      SOUTH, $0D3E, 24, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_152D_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        11, 35, $02
    hdr_object_count    0

Map_152D_RAMScript:
    rs_write_term  $c6fa
    db $74,$0a,$0a,$0a,$74,$ff
    rs_write_term  $c708
    db $0a,$0a,$74,$0a,$0a,$ff
    rs_write_1 $c824, $7a
    rs_write_1 $c832, $7a
    rs_end

Map_152D_Blocks:
    db $0f,$0a,$74,$0a,$74,$0a,$0f,$0f
    db $0f,$5d,$0f,$5d,$0f,$5d,$0f,$0f
    db $0f,$27,$0f,$27,$0f,$27,$0f,$0f
    db $0f,$5e,$0f,$5e,$0f,$5e,$0f,$0f
    db $0f,$0a,$74,$0a,$74,$0a,$0f,$0f
    db $0f,$5d,$0f,$5d,$0f,$5d,$0f,$0f
    db $0f,$27,$0f,$27,$0f,$27,$0f,$0f
    db $0f,$5e,$0f,$5e,$0f,$5e,$0f,$0f
    db $0f,$0a,$74,$0a,$74,$0a,$0f,$0f
    db $0f,$5d,$0f,$5d,$0f,$5d,$0f,$0f
    db $0f,$27,$0f,$27,$0f,$27,$0f,$0f
    db $0f,$5e,$0f,$5e,$0f,$5e,$0f,$0f
    db $0f,$0a,$74,$0a,$74,$0a,$0f,$0f
    db $0f,$5d,$0f,$5d,$0f,$5d,$0f,$0f
    db $0f,$27,$0f,$27,$0f,$27,$0f,$0f
    db $0f,$5e,$0f,$5e,$0f,$5e,$0f,$0f
    db $0f,$0a,$74,$0a,$74,$0a,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$79,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$7a,$0f,$0f

Map_152D_TextPointers:
    dw Map_152D_TX1
    dw Map_152D_TX2

Map_152D_TestedCoords:
    db $15,$02
    db $15,$03
    db $15,$0a
    db $15,$0b
    db $0d,$06
    db $0d,$07
    db $0d,$0a
    db $0d,$0b
    db $05,$02
    db $05,$03
    db $05,$06
    db $05,$07
    db $ff

Map_152D_InitScript:
    ret
Map_152D_Script:
    ld a, [$d360]
    ld hl, Map_152D_TestedCoords
    call ArePlayerCoordsInArray
    jr c, .goBack
    ret
.goBack
    ld a, SFX_DENIED
    call PlaySound
.moveCoords
    ld a, [$d360]
    add 8
    ld [$d360], a
    ld hl, $d35e
    push hl
    ld a, [hli]
    ld h, [hl]
    ld l, a
    ld bc, (8+6)*4
    add hl, bc
    ld d, h
    ld a, l
    pop hl
    ld [hli], a
    ld [hl], d
    ld a, [$d360]
    cp $1d
    jr nz, .moveCoords
    ret

Map_152D_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Please go away."
    para "My mom always told me not"
    next "to talk to strangers."
    done

Map_152D_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "There are so many paths,"
    next "but only one is right."
    done

