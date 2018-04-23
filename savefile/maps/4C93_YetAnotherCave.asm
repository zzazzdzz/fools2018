SECTION "Map_4C93", ROM0[$B800]

Map_4C93_Header:
    hdr_tileset         17
    hdr_dimensions      9, 9
    hdr_pointers_a      Map_4C93_Blocks, Map_4C93_TextPointers
    hdr_pointers_b      Map_4C93_Script, Map_4C93_Objects
    hdr_pointers_c      Map_4C93_InitScript, Map_4C93_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4C93_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            15, 15, 16, 12, $4C21
    hdr_warp            3, 15, 10, 8, $4C21
    hdr_sign_count      1
    hdr_signpost        7, 15, $03
    hdr_object_count    2
    hdr_object          SPRITE_HIKER, 6, 7, STAY, NONE, $02
    hdr_object          SPRITE_FISHER2, 4, 11, STAY, NONE, $01

Map_4C93_RAMScript:
    rs_end

Map_4C93_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$1d,$2b,$19,$19
    db $1a,$05,$05,$05,$05,$09,$18,$19,$19
    db $1a,$07,$05,$05,$05,$07,$1c,$1d,$2b
    db $1a,$07,$07,$05,$05,$0f,$05,$05,$18
    db $1a,$07,$0f,$05,$05,$07,$05,$0e,$18
    db $1a,$0f,$09,$06,$06,$09,$0f,$05,$18
    db $1a,$05,$05,$0e,$06,$09,$01,$01,$18
    db $1a,$3e,$01,$08,$05,$07,$01,$3e,$18
    db $19,$15,$15,$15,$15,$15,$15,$15,$19

Map_4C93_TextPointers:
    dw Map_4C93_TX1
    dw Map_4C93_TX2
    dw Map_4C93_TX3

Map_4C93_InitScript:
    ld a, 3
    ld [Map5FScriptIndex], a
    ret
Map_4C93_Script:
    ret

Map_4C93_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "I dropped a Poké Ball"
    next "somewhere in this cave."
    para "I think there's a guy"
    next "in the Western Encampment"
    cont "who collects Poké Balls."
    para "He would be so happy if"
    next "happened to find it!"
    done

Map_4C93_TX2:
    TX_ASM
    jp EnhancedTextOnly
    text "I heard using 5F in this"
    next "cave will reveal a shortcut."
    done

Map_4C93_TX3:
    TX_ASM
    ld c, EVENT_GOT_FIRST_POKEBALL
    call CheckEventAndQuitIfCompleted
    ld hl, Map_4C93_FoundBall
    call PrintTextEnhanced
    ld bc, $0401
    call GiveItem
    ld bc, $0280
    ld de, $949d 
    call CompleteEvent
    jp TextScriptEnd
    
Map_4C93_FoundBall:
    text "Found a Poké Ball on the"
    next "ground!"
    tx_snd SFX_GET_ITEM_1
    done

