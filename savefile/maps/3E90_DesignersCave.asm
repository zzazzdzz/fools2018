SECTION "Map_3E90", ROM0[$B800]

Map_3E90_Header:
    hdr_tileset         17
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_3E90_Blocks, Map_3E90_TextPointers
    hdr_pointers_b      Map_3E90_Script, Map_3E90_Objects
    hdr_pointers_c      Map_3E90_InitScript, Map_3E90_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_3E90_Objects:
    hdr_border          $2f
    hdr_warp_count      2
    hdr_warp            9, 11, 32, 6, $3E31
    hdr_warp            8, 11, 32, 6, $3E31
    hdr_sign_count      4
    hdr_signpost        9, 5, $01
    hdr_signpost        8, 5, $02
    hdr_signpost        7, 5, $03
    hdr_signpost        6, 5, $04
    hdr_object_count    0

Map_3E90_RAMScript:
    rs_end

Map_3E90_Blocks:
    db $02,$02,$02,$02,$02,$02
    db $14,$15,$16,$02,$02,$02
    db $1c,$29,$1e,$ec,$ec,$2f
    db $02,$60,$60,$60,$60,$60
    db $02,$02,$60,$60,$60,$60
    db $02,$02,$33,$33,$24,$33

Map_3E90_TextPointers:
    dw Map_3E90_TX1
    dw Map_3E90_TX2
    dw Map_3E90_TX3
    dw Map_3E90_TX4

Map_3E90_InitScript:
    ret
Map_3E90_Script:
    ret

Map_3E90_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "This is the wrong"
    next "way!"
    cont "____ - Matthew"
    done

Map_3E90_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "It's important to"
    next "have splitting paths,"
    cont "so the player is more"
    cont "engaged."
    cont "____ - Matthew"
    done

Map_3E90_TX3:
    TX_ASM
    jp EnhancedTextOnly
    text "But seriously, there's"
    next "nothing there."
    cont "____ - Matthew"
    done

Map_3E90_TX4:
    TX_ASM
    jp EnhancedTextOnly
    text "How did you get here"
    next "though? Isn't the path"
    cont "blocked by corrupted tiles?"
    cont "____ - Matthew"
    done

