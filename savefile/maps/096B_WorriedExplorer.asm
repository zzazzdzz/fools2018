SECTION "Map_096B", ROM0[$B800]

Map_096B_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_096B_Blocks, Map_096B_TextPointers
    hdr_pointers_b      Map_096B_Script, Map_096B_Objects
    hdr_pointers_c      Map_096B_InitScript, Map_096B_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_096B_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 3, 10, $0932
    hdr_warp            2, 7, 3, 10, $0932
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_WARDEN, 2, 4, STAY, RIGHT, $01

Map_096B_RAMScript:
    rs_end

Map_096B_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_096B_TextPointers:
    dw Map_096B_TX1

Map_096B_InitScript:
    ret
Map_096B_Script:
    ret

Map_096B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Hello! I'm Matt, but"
    next "everyone just calls me the"
    cont "'Worried Explorer'."
    para "I thought this place looked"
    next "very suspicious, so I"
    cont "decided to live here and"
    cont "devote my life to solving"
    cont "this mystery."
    para "I think there's a system"
    next "of caves hidden deep"
    cont "underground, but I have"
    cont "no idea how to access it."
    para "Maybe you can solve the"
    next "mystery of this place?"
    done

