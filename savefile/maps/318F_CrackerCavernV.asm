SECTION "Map_318F", ROM0[$B800]

Map_318F_Header:
    hdr_tileset         17
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_318F_Blocks, Map_318F_TextPointers
    hdr_pointers_b      Map_318F_Script, Map_318F_Objects
    hdr_pointers_c      Map_318F_InitScript, Map_318F_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_318F_Objects:
    hdr_border          $19
    hdr_warp_count      1
    hdr_warp            3, 3, 8, 8, $318E
    hdr_sign_count      1
    hdr_signpost        5, 5, $01
    hdr_object_count    0

Map_318F_RAMScript:
    rs_end

Map_318F_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$2b
    db $1a,$3e,$01,$01,$01,$18
    db $1a,$01,$2a,$01,$01,$18
    db $1a,$01,$01,$01,$01,$18
    db $1a,$01,$01,$01,$01,$18
    db $19,$15,$15,$15,$15,$19

Map_318F_TextPointers:
    dw Map_318F_TX1

Map_318F_InitScript:
    ret
Map_318F_Script:
    ret

Map_318F_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Congratulations!"
    next "You have completed the"
    cont "Cracker Cavern challenge."
    para "Hope you had lots of fun."
    next "Now, instead of hacking"
    cont "away at the game's code,"
    cont "go out and explore the"
    cont "world I created."
    para "And hopefully, do all"
    next "the quests legitimately!"
    done

