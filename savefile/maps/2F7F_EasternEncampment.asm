SECTION "Map_2F7F", ROM0[$B800]

Map_2F7F_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_2F7F_Blocks, Map_2F7F_TextPointers
    hdr_pointers_b      Map_2F7F_Script, Map_2F7F_Objects
    hdr_pointers_c      Map_2F7F_InitScript, Map_2F7F_RAMScript
    hdr_palette         $01
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2F7F_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 9, 10, $2F38
    hdr_warp            2, 7, 9, 10, $2F38
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_MART_GUY, 2, 4, STAY, RIGHT, $01

Map_2F7F_RAMScript:
    rs_end

Map_2F7F_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_2F7F_TextPointers:
    dw Map_2F7F_TX1

Map_2F7F_InitScript:
    ld a, $05
    ld [$d35c], a
    ld a, 2
    ld [Map5FScriptIndex], a
    ret
Map_2F7F_Script:
    ret

Map_2F7F_TX1:
    TX_ASM
    ld c, EVENT_DARK_HOUSE
    ld hl, Map_2F7F_Dark
    call CheckEventAndPrintHLIfCompleted
    ld a, [$d35c]
    cp $05
    jr z, .nope
    ld hl, Map_2F7F_After
    call PrintTextEnhanced
    ld bc, $40D1
    ld de, $7FFA
    call CompleteEvent
    jp TextScriptEnd
.nope
    ld hl, Map_2F7F_Before
    call PrintTextEnhanced
    jp TextScriptEnd

Map_2F7F_Before:
    text "I didn't pay my electricity"
    next "bills..."
    cont "What should I do now?"
    done

Map_2F7F_After:
    text "Wow, it's a lot brighter"
    next "here now!"
    para "I have no idea what you did,"
    next "but thank you."
    tx_snd SFX_GET_KEY_ITEM
    done
    
Map_2F7F_Dark:
    text "Come to think of it..."
    next "I actually like living in"
    cont "the darkness."
    done

