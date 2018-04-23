SECTION "Map_0327", ROM0[$B800]

Map_0327_Header:
    hdr_tileset         0
    hdr_dimensions      8, 10
    hdr_pointers_a      Map_0327_Blocks, Map_0327_TextPointers
    hdr_pointers_b      Map_0327_Script, Map_0327_Objects
    hdr_pointers_c      Map_0327_InitScript, Map_0327_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $043A, 22, 12
    hdr_connection      EAST,  $0210, 1, 14
    
Map_0327_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            7, 1, 2, 7, $0364
    hdr_sign_count      0
    hdr_object_count    2
    hdr_object          SPRITE_ROCKER, 4, 10, STAY, NONE, $01
    hdr_object          SPRITE_BIKE_SHOP_GUY, 10, 5, STAY, NONE, $02

Map_0327_RAMScript:
    rs_write_3 $c73c, $0a, $74, $0a
    rs_write_term  $c747
    db $74,$0a,$74,$31,$31,$31,$ff
    rs_write_term  $c755
    db $31,$31,$31,$74,$0a,$74,$ff
    rs_write_term  $c763
    db $0a,$74,$0a,$52,$52,$52,$ff
    rs_fill_byte $52
    rs_fill_3 $c771
    rs_end

Map_0327_Blocks:
    db $0f,$0f,$0f,$02,$03,$0f,$0f,$0f
    db $0f,$0f,$8a,$a5,$9d,$88,$0f,$0f
    db $0f,$0f,$96,$0a,$0a,$0a,$0f,$0f
    db $74,$0a,$74,$0a,$74,$0a,$74,$0a
    db $31,$31,$31,$31,$31,$31,$31,$31
    db $0a,$74,$0a,$74,$0a,$74,$0a,$74
    db $52,$52,$52,$52,$52,$52,$52,$52
    db $3f,$3f,$3f,$3f,$3f,$3b,$13,$13
    db $2c,$2c,$2c,$2c,$2c,$2c,$3f,$3b
    db $2c,$2c,$2c,$2c,$2c,$2c,$2c,$29

Map_0327_TextPointers:
    dw Map_0327_TX1
    dw Map_0327_TX2

Map_0327_InitScript:
    ret
Map_0327_Script:
    ret
    
Map_0327_TX1:
    db 8
    jp EnhancedTextOnly
    text "I'm not sure what happened,"
    next "but I keep seeing a lot of"
    cont "map corruptions around."
    para "It is said that there's a"
    next "special item that will"
    cont "help cleanse the corruption."
    done

Map_0327_TX2:
    db 8
    jp EnhancedTextOnly
    text "Oh no!"
    next "It's awful!"
    para "A glitch went out of control"
    next "and locked my wife inside"
    cont "this house..."
    para "Could you help save my"
    next "beloved wife? I bet she"
    cont "feels pretty lonely without"
    cont "me..."
    done

