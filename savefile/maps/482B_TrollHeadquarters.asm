SECTION "Map_482B", ROM0[$B800]

Map_482B_Header:
    hdr_tileset         0
    hdr_dimensions      9, 5
    hdr_pointers_a      Map_482B_Blocks, Map_482B_TextPointers
    hdr_pointers_b      Map_482B_Script, Map_482B_Objects
    hdr_pointers_c      Map_482B_InitScript, Map_482B_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $472B, 7, 20
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_482B_Objects:
    hdr_border          $0f
    hdr_warp_count      2
    hdr_warp            12, 5, 11, 11, $4889
    hdr_warp            11, 5, 10, 11, $4889
    hdr_sign_count      1
    hdr_signpost        13, 7, $01
    hdr_object_count    0

Map_482B_RAMScript:
    rs_write_3 $c6fc, $65, $43, $64
    rs_write_3 $c70b, $65, $43, $64
    rs_end

Map_482B_Blocks:
    db $0f,$0f,$65,$43,$64,$0f,$0f,$0f,$0f
    db $0f,$0f,$65,$43,$64,$20,$0d,$21,$0f
    db $0f,$0f,$31,$0a,$0f,$7c,$3a,$7e,$0f
    db $0f,$0f,$31,$31,$31,$31,$08,$0f,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_482B_TextPointers:
    dw Map_482B_TX1

Map_482B_InitScript:
    ret
Map_482B_Script:
    ret

Map_482B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "PRIVATE PROPERTY"
    next "KEEP OUT"
    done
