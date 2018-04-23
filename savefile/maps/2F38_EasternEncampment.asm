SECTION "Map_2F38", ROM0[$B800]

Map_2F38_Header:
    hdr_tileset         0
    hdr_dimensions      10, 8
    hdr_pointers_a      Map_2F38_Blocks, Map_2F38_TextPointers
    hdr_pointers_b      Map_2F38_Script, Map_2F38_Objects
    hdr_pointers_c      Map_2F38_InitScript, Map_2F38_RAMScript
    hdr_palette         $01
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $3336, 5, 1
    hdr_connection      WEST,  $2E2B, 18, 18
    hdr_connection      EAST,  $302C, 1, 7
    
Map_2F38_Objects:
    hdr_border          $0f
    hdr_warp_count      3
    hdr_warp            9, 9, 2, 7, $2F7F
    hdr_warp            15, 9, 2, 7, $2F80
    hdr_warp            14, 3, 4, 7, $2F81
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_WAITER, 13, 8, WALK, UP_DOWN, $01
    hdr_object          SPRITE_BALDING_GUY, 5, 8, STAY, NONE, $02

Map_2F38_RAMScript:
    rs_fill_byte $0a
    rs_fill_3 $c728
    rs_fill_byte $7b
    rs_fill_3 $c738
    rs_fill_byte $6f
    rs_fill_3 $c748
    rs_fill_byte $0a
    rs_fill_3 $c765
    rs_fill_byte $7b
    rs_fill_3 $c775
    rs_write_3 $c785, $7a, $74, $7a
    rs_write_3 $c79d, $7a, $7b, $74
    rs_write_3 $c7ad, $7a, $7b, $7a
    rs_end

Map_2F38_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$20,$0d,$21,$0f
    db $0a,$6c,$6c,$6c,$6c,$6c,$37,$3a,$7e,$0f
    db $7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$7b,$0f
    db $6f,$0a,$7a,$7b,$20,$21,$7b,$38,$39,$0f
    db $0f,$6d,$74,$7b,$7c,$7e,$7b,$3c,$3d,$0a
    db $0f,$6d,$7a,$7b,$7b,$7b,$7b,$7b,$7b,$7b
    db $0f,$6d,$74,$7b,$7a,$74,$7a,$74,$7a,$74
    db $0f,$0f,$7a,$7b,$7a,$0f,$0f,$0f,$0f,$0f

Map_2F38_TextPointers:
    dw Map_2F38_TX1
    dw Map_2F38_TX2

Map_2F38_InitScript:
    xor a
    ld [MapScriptGeneralPurpose], a
    ret
Map_2F38_Script:
    ret

Map_2F38_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I heard some events and"
    next "locations are available"
    cont "only at certain times of"
    cont "the day."
    done

Map_2F38_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "Let's see... if I place"
    next "a breakpoint here..."
    para "Oh, hi!"
    next "Are you there to take on"
    cont "the Cracker Cavern?"
    para "It's the best place for"
    next "hackers to have fun with"
    cont "our world!"
    para "I got through half of the"
    next "challenge, but I'm stuck"
    cont "now..."
    done

