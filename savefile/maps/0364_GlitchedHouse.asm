SECTION "Map_0364", ROM0[$B800]

Map_0364_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_0364_Blocks, Map_0364_TextPointers
    hdr_pointers_b      Map_0364_Script, Map_0364_Objects
    hdr_pointers_c      Map_0364_InitScript, Map_0364_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0364_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 7, 4, $0327
    hdr_warp            2, 7, 7, 4, $0327
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_MOM_GEISHA, 2, 4, STAY, RIGHT, $01

Map_0364_RAMScript:
    rs_end

Map_0364_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_0364_TextPointers:
    dw Map_0364_TX1

Map_0364_InitScript:
    ret
Map_0364_Script:
    ret

Map_0364_TX1:
    TX_ASM
    ld hl, Map_0364_Text
    call PrintTextEnhanced
    ld c, EVENT_GLITCHED_HOUSE
    call TestEventFlag
    jp c, TextScriptEnd
    ld bc, $79A4
    ld de, $2FD4
    call CompleteEvent
    jp TextScriptEnd
    
Map_0364_Text:
    text "Is the corruption gone?"
    next "Oh my, you've saved me!"
    para "I really appreciate it,"
    next "but I enjoyed being alone."
    para "My husband is extremely"
    next "annoying. Being separated"
    cont "for a few days was a breath"
    cont "of fresh air for me."
    wait

