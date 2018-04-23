SECTION "Map_2731", ROM0[$B800]

Map_2731_Header:
    hdr_tileset         0
    hdr_dimensions      7, 12
    hdr_pointers_a      Map_2731_Blocks, Map_2731_TextPointers
    hdr_pointers_b      Map_2731_Script, Map_2731_Objects
    hdr_pointers_c      Map_2731_InitScript, Map_2731_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES4, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $4933, 3, 1
    hdr_connection      WEST,  $2B29, 18, 12
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2731_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            8, 7, 39, 8, $2791
    hdr_sign_count      1
    hdr_signpost        1, 15, $03
    hdr_object_count    2
    hdr_object          SPRITE_BIKER, 8, 18, STAY, DOWN, $02
    hdr_object          SPRITE_GIRL, 6, 11, STAY, NONE, $01

Map_2731_RAMScript:
    rs_fill_byte $31
    rs_fill_3 $c791
    rs_write_3 $c7b1, $6d, $31, $6e
    rs_write_3 $c7be, $6d, $31, $6e
    rs_end

Map_2731_Blocks:
    db $2c,$2c,$2c,$2c,$2c,$2c,$2c
    db $2c,$2c,$2c,$2c,$2c,$2c,$2c
    db $57,$57,$2a,$2c,$2c,$2c,$2b
    db $0f,$0f,$24,$57,$06,$57,$25
    db $0f,$0f,$6d,$74,$31,$0f,$0f
    db $0f,$0f,$0a,$0a,$31,$0f,$0f
    db $0f,$6d,$74,$31,$31,$6e,$0f
    db $6d,$a5,$0a,$31,$0a,$74,$0f
    db $6d,$97,$0a,$31,$74,$0a,$0f
    db $0f,$6d,$74,$31,$0a,$6e,$0f
    db $31,$31,$31,$31,$31,$6e,$0f
    db $0f,$0f,$0f,$6d,$31,$6e,$0f

Map_2731_TextPointers:
    dw Map_2731_TX1
    dw Map_2731_TX2
    dw Map_2731_TX3

Map_2731_InitScript:
    xor a
	ld [$d35c], a
    ret
Map_2731_Script:
    ret

Map_2731_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Something tells me that"
    next "there's a hidden item"
    cont "behind these corrupted"
    cont "tiles."
    para "How do I know? It's just"
    next "woman's intuition!"
    done

Map_2731_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I got my bike at the"
    next "BIKE SHOP. You should"
    cont "get one if you haven't"
    cont "already."
    para "It makes moving around"
    next "much faster and easier."
    done

Map_2731_TX3:
    TX_ASM
    ld c, EVENT_GOT_SECOND_POKEBALL
    call CheckEventAndQuitIfCompleted
    ld hl, Map_2731_FoundBall
    call PrintTextEnhanced
    ld bc, $0401
    call GiveItem
    ld bc, $deaf
    ld de, $5830
    call CompleteEvent
    jp TextScriptEnd

Map_2731_FoundBall:
    text "Found a Poké Ball on the"
    next "ground!"
    tx_snd SFX_GET_ITEM_1
    done

