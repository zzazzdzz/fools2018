SECTION "Map_0523", ROM0[$B800]

Map_0523_Header:
    hdr_tileset         0
    hdr_dimensions      15, 9
    hdr_pointers_a      Map_0523_Blocks, Map_0523_TextPointers
    hdr_pointers_b      Map_0523_Script, Map_0523_Objects
    hdr_pointers_c      Map_0523_InitScript, Map_0523_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $062F, 16, 26
    hdr_connection      SOUTH, $0210, 7, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0523_Objects:
    hdr_border          $0f
    hdr_warp_count      1
    hdr_warp            10, 5, 5, 11, $0565
    hdr_sign_count      1
    hdr_signpost        11, 7, $03
    hdr_object_count    2
    hdr_object          SPRITE_BALDING_GUY, 22, 7, STAY, NONE, $01
    hdr_object          SPRITE_BLACKBELT, 5, 10, STAY, NONE, $02

Map_0523_RAMScript:
    rs_write_3 $c70b, $74, $31, $4d
    rs_write_3 $c720, $0a, $31, $4d
    rs_write_3 $c7e9, $0a, $31, $0a
    rs_write_3 $c7fe, $0a, $31, $74
    rs_end

Map_0523_Blocks:
    db $0f,$0f,$0f,$0f,$68,$7f,$7f,$69,$0f,$0f,$0f,$0a,$31,$4d,$0f
    db $0f,$0f,$0f,$0f,$68,$7f,$7f,$69,$0f,$0f,$0f,$74,$31,$4d,$0f
    db $0f,$0f,$0f,$0f,$37,$3a,$7d,$7e,$0f,$0f,$0f,$0a,$31,$4d,$0f
    db $0f,$0f,$0a,$74,$0a,$08,$0a,$74,$0a,$0a,$74,$0a,$31,$4d,$0f
    db $0f,$0f,$0a,$31,$31,$31,$31,$31,$31,$31,$31,$31,$31,$4d,$0f
    db $0f,$0f,$74,$31,$0a,$52,$52,$52,$52,$52,$52,$52,$52,$4f,$0f
    db $0f,$0f,$0a,$31,$74,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$0a,$31,$0a,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f
    db $0f,$0f,$74,$31,$0a,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_0523_TextPointers:
    dw Map_0523_TX1
    dw Map_0523_TX2
    dw Map_0523_TX3

Map_0523_InitScript:
    ret
Map_0523_Script:
    ret

Map_0523_TX1:
    db 8
    jp EnhancedTextOnly
    text "The Glitch Research Lab in"
    next "Northern Glitchland is well"
    cont "known for its discoveries"
    cont "in the field of glitchology."
    done
    
Map_0523_TX2:
    db 8
    jp EnhancedTextOnly
    text "Living near the Glitch"
    next "Research Lab is a real"
    cont "struggle..."
    para "They keep playing the GSC"
    next "Lucky Channel theme every"
    cont "single night..."
    para "And on the weekends, the"
    next "SM64 File Select theme."
    para "It's seriously driving me"
    next "crazy. I'm moving away!"
    done
    
Map_0523_TX3:
    db 8
    jp EnhancedTextOnly
    text "NORTHERN GLITCHLAND"
    next "GLITCH RESEARCH LAB"
    done

