SECTION "Map_323F", ROM0[$B800]

Map_323F_Header:
    hdr_tileset         0
    hdr_dimensions      7, 6
    hdr_pointers_a      Map_323F_Blocks, Map_323F_TextPointers
    hdr_pointers_b      Map_323F_Script, Map_323F_Objects
    hdr_pointers_c      Map_323F_InitScript, Map_323F_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES3, AUDIO_1
    hdr_connection      NORTH, $302C, 9, 11
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_323F_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        7, 7, $02
    hdr_object_count    1
    hdr_object          SPRITE_LANCE, 6, 5, STAY, NONE, $01

Map_323F_RAMScript:
    rs_write_3 $c6fa, $6d, $31, $6e
    rs_write_3 $c707, $6d, $31, $6e
    rs_end

Map_323F_Blocks:
    db $0f,$0f,$6d,$31,$6e,$0f,$0f
    db $0f,$4e,$0a,$31,$0a,$4d,$0f
    db $0f,$4e,$0a,$31,$0a,$4d,$0f
    db $0f,$4e,$0a,$08,$0a,$4d,$0f
    db $0f,$4e,$0a,$0a,$0a,$4d,$0f
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f

Map_323F_TextPointers:
    dw Map_323F_TX1
    dw Map_323F_TX2

Map_323F_InitScript:
    ret
Map_323F_Script:
    ret

Map_323F_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I knew it!"
    para "I just kept walking and"
    next "walking, and this passage"
    cont "opened up eventually!"
    para "Things like this are the"
    next "reason why I came here"
    cont "all the way from the"
    cont "Johto region."
    para "This stuff is even better"
    next "than my Dragon-type Pokémon!"
    done

Map_323F_TX2:
    TX_ASM
    ld c, EVENT_OBSCURED_PATH_SIGN
    ld hl, Map_323F_Sign
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_323F_Sign
    call PrintTextEnhanced
    ld bc, $15DE
    ld de, $1CA0
    call CompleteEvent
    jp TextScriptEnd
    
Map_323F_Sign:
    text "It looks like this recursion"
    next "had a termination condition"
    cont "after all..."
    para "Knowing this instantly"
    next "fills you with joy."
    wait

