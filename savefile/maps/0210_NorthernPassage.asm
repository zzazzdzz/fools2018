SECTION "Map_0210", ROM0[$B800]

Map_0210_Header:
    hdr_tileset         0
    hdr_dimensions      9, 16
    hdr_pointers_a      Map_0210_Blocks, Map_0210_TextPointers
    hdr_pointers_b      Map_0210_Script, Map_0210_Objects
    hdr_pointers_c      Map_0210_InitScript, Map_0210_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0523, 7, 16
    hdr_connection      SOUTH, $0110, 10, 1
    hdr_connection      WEST,  $0327, 14, 8
    hdr_connection      EAST,  $2E2B, 1, 5
    
Map_0210_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_GIRL, 6, 24, STAY, NONE, $01
    hdr_object          SPRITE_GENTLEMAN, 9, 12, WALK, LEFT_RIGHT, $02

Map_0210_RAMScript:
    rs_write_3          $c6fc, $0a, $31, $0a
    rs_write_3          $c70b, $0a, $31, $0a
    rs_write_3          $c76f, $0a, $0a, $0a
    rs_write_3          $c77e, $31, $31, $31
    rs_write_3          $c78d, $0a, $0a, $0a
    rs_write_2          $c80a, $55, $55
    rs_write_2          $c819, $55, $55
    rs_end

Map_0210_Blocks:
    db $0f,$0f,$0a,$31,$0a,$0f,$0f,$0f,$0f
    db $0f,$0f,$0a,$31,$31,$31,$0f,$0f,$0f
    db $0f,$0f,$0a,$0a,$74,$31,$0f,$0f,$0f
    db $0f,$0f,$0f,$0a,$0a,$31,$0a,$0f,$0f
    db $0f,$0f,$0f,$07,$07,$5c,$07,$07,$0f
    db $0f,$0f,$0b,$0b,$0a,$31,$0a,$0b,$0f
    db $0a,$0a,$0a,$74,$0a,$31,$0a,$0b,$0f
    db $31,$31,$31,$31,$31,$31,$0a,$0b,$0f
    db $0a,$74,$0a,$0a,$0a,$74,$0a,$0b,$0f
    db $0f,$07,$07,$2f,$07,$07,$0f,$0b,$0f
    db $0f,$0b,$7a,$7a,$7a,$0b,$0f,$0f,$0f
    db $0f,$0b,$7a,$7a,$0a,$0f,$0f,$0f,$0f
    db $0f,$0b,$7a,$0a,$74,$0f,$0f,$0f,$0f
    db $0f,$0f,$55,$0a,$74,$0f,$3e,$3f,$3f
    db $0f,$0f,$55,$55,$0f,$0f,$28,$2c,$2c
    db $0f,$0f,$55,$55,$0f,$0f,$28,$2c,$2c

Map_0210_TextPointers:
    dw Map_0210_TX1
    dw Map_0210_TX2

Map_0210_InitScript:
    ret
Map_0210_Script:
    ld a, [$c218]
    and $07
    ld [$c218], a
    ret

Map_0210_TX1:
    db 8
    jp EnhancedTextOnly
    text "Hi!"
    next "I'm practicing spinning."
    para "My hobby is to make every"
    next "speedrunner cry when I"
    cont "notice them with my sick"
    cont "moves."
    para "If werster ever comes back"
    next "to Gen I Glitchless, I'll"
    cont "be there to crush his hopes"
    cont "and dreams!"
    done

Map_0210_TX2:
    db 8
    jp EnhancedTextOnly
    text "I would normally tell you"
    next "to stay out from tall grass,"
    cont "but here's the thing..."
    para "In Glitchland, we don't have"
    next "any wild encounters."
    para "It's really kind of"
    next "disappointing..."
    done
