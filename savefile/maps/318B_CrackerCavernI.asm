SECTION "Map_318B", ROM0[$B800]

Map_318B_Header:
    hdr_tileset         17
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_318B_Blocks, Map_318B_TextPointers
    hdr_pointers_b      Map_318B_Script, Map_318B_Objects
    hdr_pointers_c      Map_318B_InitScript, Map_318B_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_318B_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            8, 8, 3, 3, $318C
    hdr_warp            3, 3, 6, 10, $3120
    hdr_sign_count      1
    hdr_signpost        5, 5, $01
    hdr_object_count    0

Map_318B_RAMScript:
    rs_end

Map_318B_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$2b
    db $1a,$3e,$01,$01,$01,$18
    db $1a,$01,$2a,$01,$01,$18
    db $1a,$01,$01,$0d,$04,$18
    db $1a,$01,$01,$07,$27,$18
    db $19,$15,$15,$15,$15,$19

Map_318B_TextPointers:
    dw Map_318B_TX1

Map_318B_InitScript:
    ret
Map_318B_Script:
    ret

Map_318B_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Cracker Cavern"
    next "Challenge I"
    para "To get started with more"
    next "difficult topics, prove"
    cont "that you understand the"
    cont "basics."
    para "Use whatever tools you"
    next "desire to go through the"
    cont "rock barrier below."
    para "Note: basic protections"
    next "against cheating are"
    cont "implemented."
    done

