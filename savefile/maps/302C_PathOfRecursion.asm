SECTION "Map_302C", ROM0[$B800]

Map_302C_Header:
    hdr_tileset         0
    hdr_dimensions      9, 7
    hdr_pointers_a      Map_302C_Blocks, Map_302C_TextPointers
    hdr_pointers_b      Map_302C_Script, Map_302C_Objects
    hdr_pointers_c      Map_302C_InitScript, Map_302C_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $3120, 6, 16
    hdr_connection      SOUTH, $323F, 7, 1
    hdr_connection      WEST,  $2F38, 18, 11
    hdr_connection      EAST,  $302C, 1, 7
    
Map_302C_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_ROCKER, 12, 8, STAY, NONE, $02
    hdr_object          SPRITE_WARDEN, 6, 5, STAY, NONE, $01

Map_302C_RAMScript:
    rs_write_3 $c6fd, $6d, $55, $6e
    rs_write_3 $c70c, $6d, $55, $6e
    rs_fill_byte $6c
    rs_fill_3 $c733
    rs_write_term  $c73f
    db $6c,$6c,$6c,$55,$55,$55,$ff
    rs_write_term  $c74e
    db $55,$55,$55,$6f,$6f,$6f,$ff
    rs_fill_byte $6f
    rs_fill_3 $c75d
    rs_end

Map_302C_Blocks:
    db $0f,$0f,$0f,$6d,$55,$6e,$0f,$0f,$0f
    db $0f,$0f,$6c,$0a,$55,$0a,$6c,$0f,$0f
    db $6c,$0a,$0a,$0a,$55,$0a,$0a,$0a,$6c
    db $55,$55,$55,$55,$55,$55,$55,$55,$55
    db $6f,$0a,$0a,$0a,$55,$0a,$0a,$0a,$6f
    db $0f,$0f,$6f,$0a,$55,$0a,$6f,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_302C_TextPointers:
    dw Map_302C_TX1
    dw Map_302C_TX2
    
Map_302C_DownPathOpenedRAMScript
    rs_write_3 $c775, $0a, $55, $0a
    rs_write_3 $c784, $0a, $55, $0a
    rs_write_3 $c793, $0a, $55, $0a
    rs_end

Map_302C_InitScript:
    ld a, [MapScriptGeneralPurpose]
    inc a
    ld [MapScriptGeneralPurpose], a
    cp $08
    ret nz
    ld hl, Map_302C_DownPathOpenedRAMScript
    call RunRAMScript
    ret
Map_302C_Script:
    ret

Map_302C_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "To understand recursion,"
    next "you must first understand"
    cont "recursion."
    done

Map_302C_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Perseverence is key!"
    para "The map might repeat and"
    next "repeat forever, but I"
    cont "strongly believe that"
    cont "that if I try for long"
    cont "enough, something is bound"
    cont "to happen!"
    done

