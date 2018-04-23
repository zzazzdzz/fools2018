SECTION "Map_4787", ROM0[$B800]

Map_4787_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_4787_Blocks, Map_4787_TextPointers
    hdr_pointers_b      Map_4787_Script, Map_4787_Objects
    hdr_pointers_c      Map_4787_InitScript, Map_4787_RAMScript
    hdr_palette         $0A
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_4787_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            2, 7, 10, 12, $472B
    hdr_warp            3, 7, 10, 12, $472B
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_LAPRAS_GIVER, 2, 4, STAY, RIGHT, $01

Map_4787_RAMScript:
    rs_end

Map_4787_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_4787_TextPointers:
    dw Map_4787_TX1

Map_4787_InitScript:
    ret
Map_4787_Script:
    ret

Map_4787_TX1:
    TX_ASM
    ld c, EVENT_RETURNED_FLUTE
    call TestEventFlag
    jr c, .playSong
    ld b, $49
    call IsItemInBag
    jr z, .noFlute
    ld a, $49
    call RemoveItemFromBag
    ld hl, Map_4787_After
    call PrintTextEnhanced
    ld bc, $1059
    ld de, $DE15
    call CompleteEvent
    jp TextScriptEnd
.noFlute
    ld hl, Map_4787_Before
    call PrintTextEnhanced
    jp TextScriptEnd
.playSong
    ld hl, Map_4787_StartSong
    call PrintTextEnhanced
    ld de, $c780
    ld hl, FluteMusic_StartOffset
    ld bc, 800
    call CopyData
    ld de, $c770
    ld hl, FluteMusic_Pointers
    ld bc, 8
    call CopyData
    ld hl, $c770
    call PlayMusicFromRAM
    jp TextScriptEnd

Map_4787_Before:
    text "No! That's a disaster!"
    next "Unbelievable!"
    para "I lost my Poké Flute!"
    next "I always loved playing on"
    cont "it when I felt down, and"
    cont "now, I can't!"
    para "Please, help me find my lost"
    next "flute!"
    done

Map_4787_After:
    text "Is that..."
    next "Yes, I couldn't mistake it!"
    para "You found my flute!"
    next "Big thanks for all of your"
    cont "hard work!"
    wait
    
Map_4787_StartSong:
    text "Now that I have my flute"
    next "back, I can play you a cool"
    cont "song!"
    para "One! Two!"
    next "And one, two, three, four!"
    done

