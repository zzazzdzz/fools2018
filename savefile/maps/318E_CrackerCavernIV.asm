SECTION "Map_318E", ROM0[$B800]

Map_318E_Header:
    hdr_tileset         17
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_318E_Blocks, Map_318E_TextPointers
    hdr_pointers_b      Map_318E_Script, Map_318E_Objects
    hdr_pointers_c      Map_318E_InitScript, Map_318E_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_318E_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            8, 8, 3, 3, $318F
    hdr_warp            3, 3, 8, 8, $318D
    hdr_sign_count      1
    hdr_signpost        5, 5, $01
    hdr_object_count    0

Map_318E_RAMScript:
    rs_end

Map_318E_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$2b
    db $1a,$3e,$01,$01,$01,$18
    db $1a,$01,$2a,$01,$01,$18
    db $1a,$01,$01,$0d,$04,$18
    db $1a,$01,$01,$07,$27,$18
    db $19,$15,$15,$15,$15,$19

Map_318E_TextPointers:
    dw Map_318E_TX1

Map_318E_InitScript:
    ld c, EVENT_CRACKER_CAVERN_CLEARED
    call TestEventFlag
    ret nc
    ld a, $01
    ld [$c737], a
    ret
Map_318E_Script:
    ret

Map_318E_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Cracker Cavern"
    next "Challenge IV"
    para "The final challenge."
    next "It should be easy for you"
    cont "at this point."
    para "Make the final step forward"
    next "and reverse-engineer the"
    cont "transmission protocol"
    cont "used to send data to the"
    cont "game server."
    para "To clear the final challenge,"
    next "please send a packet with"
    cont "the command ID 0x77."
    para "The message body should"
    next "contain three bytes:"
    cont "0x13, 0x37, 0xCC."
    para "Once you're done, exit and"
    next "return back to this map."
    para "Good luck!"
    done
