SECTION "Map_318C", ROM0[$B800]

Map_318C_Header:
    hdr_tileset         17
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_318C_Blocks, Map_318C_TextPointers
    hdr_pointers_b      Map_318C_Script, Map_318C_Objects
    hdr_pointers_c      Map_318C_InitScript, Map_318C_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_318C_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            8, 8, 3, 3, $318D
    hdr_warp            3, 3, 8, 8, $318B
    hdr_sign_count      1
    hdr_signpost        5, 5, $01
    hdr_object_count    0

Map_318C_RAMScript:
    rs_end

Map_318C_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$2b
    db $1a,$3e,$01,$01,$01,$18
    db $1a,$01,$2a,$01,$01,$18
    db $1a,$01,$01,$0d,$04,$18
    db $1a,$01,$01,$07,$27,$18
    db $19,$15,$15,$15,$15,$19

Map_318C_TextPointers:
    dw Map_318C_TX1

Map_318C_InitScript:
    ld c, EVENT_CRACKER_CAVERN_CHALLENGE_1
    call TestEventFlag
    ret nc
    ld a, $01
    ld [$c737], a
    ret
Map_318C_Script:
    ret

Map_318C_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Cracker Cavern"
    next "Challenge II"
    para "As you may have noticed,"
    next "this entire world is"
    cont "created of many different"
    cont "small maps."
    para "Use whatever tools you"
    next "desire to visit a map with"
    cont "the hex identifier 0x1337."
    para "Once this is done, return"
    next "here and take the bottom"
    cont "exit."
    para "Note - bypassing the"
    next "barrier by memory hacking"
    cont "will not work anymore."
    cont "Checks are done server-side."
    para "The next challenge will"
    next "not load until this one"
    cont "is completed."
    done

