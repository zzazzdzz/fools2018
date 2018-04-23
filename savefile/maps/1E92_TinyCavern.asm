SECTION "Map_1E92", ROM0[$B800]

Map_1E92_Header:
    hdr_tileset         17
    hdr_dimensions      14, 10
    hdr_pointers_a      Map_1E92_Blocks, Map_1E92_TextPointers
    hdr_pointers_b      Map_1E92_Script, Map_1E92_Objects
    hdr_pointers_c      Map_1E92_InitScript, Map_1E92_RAMScript
    hdr_palette         $0D
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1E92_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            5, 19, 16, 14, $1E33
    hdr_warp            4, 19, 16, 14, $1E33
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_OAK_AIDE, 18, 4, STAY, NONE, $01

Map_1E92_RAMScript:
    rs_end

Map_1E92_Blocks:
    db $19,$19,$19,$19,$19,$19,$19,$2c,$1d,$1d,$1d,$2b,$19,$19
    db $19,$19,$19,$19,$19,$19,$19,$1a,$08,$01,$12,$1c,$2b,$19
    db $19,$19,$19,$19,$19,$19,$19,$1a,$01,$01,$01,$07,$18,$19
    db $19,$19,$19,$2c,$1d,$1d,$2b,$19,$16,$06,$01,$01,$1c,$2b
    db $19,$19,$2c,$1e,$05,$09,$1c,$1d,$1e,$01,$01,$01,$01,$18
    db $19,$19,$1a,$08,$01,$01,$01,$05,$01,$01,$01,$01,$0b,$18
    db $19,$2c,$1e,$01,$01,$01,$01,$01,$01,$04,$0c,$01,$14,$19
    db $2c,$1e,$01,$01,$01,$01,$04,$04,$14,$15,$15,$15,$19,$19
    db $1a,$01,$01,$07,$14,$15,$15,$15,$19,$19,$19,$19,$19,$19
    db $19,$16,$24,$14,$19,$19,$19,$19,$19,$19,$19,$19,$19,$19

Map_1E92_TextPointers:
    dw Map_1E92_TX1

Map_1E92_InitScript:
    ret
Map_1E92_Script:
    ret

Map_1E92_TX1:
    TX_ASM
    ld c, EVENT_OBTAINED_OLD_AMBER
    ld hl, Map_1E92_After
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_1E92_Before
    call PrintTextEnhanced
    ld bc, $1f01
    call GiveItem
    ld bc, $9AC4
    ld de, $98DA
    call CompleteEvent
    jp TextScriptEnd
    
Map_1E92_Before:
    text "Hi! I found this strange"
    next "fossil deep inside this"
    cont "cave."
    para "However, fossils are really"
    next "not in my area of expertise."
    para "Perhaps you'll find someone"
    next "more experienced."
    cont "Take this fossil from me."
    tx_snd SFX_GET_ITEM_1
    done

Map_1E92_After:
    text "How is it going?"
    next "Did you find someone to"
    cont "examine this fossil?"
    done

