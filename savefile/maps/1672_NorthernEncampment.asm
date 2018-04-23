SECTION "Map_1672", ROM0[$B800]

Map_1672_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_1672_Blocks, Map_1672_TextPointers
    hdr_pointers_b      Map_1672_Script, Map_1672_Objects
    hdr_pointers_c      Map_1672_InitScript, Map_1672_RAMScript
    hdr_palette         $07
    hdr_music           MUSIC_CITIES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1672_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 5, 16, $1631
    hdr_warp            2, 7, 5, 16, $1631
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_FAT_BALD_GUY, 2, 4, STAY, RIGHT, $01

Map_1672_RAMScript:
    rs_end

Map_1672_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_1672_TextPointers:
    dw Map_1672_TX1

Map_1672_InitScript:
    ret
Map_1672_Script:
    ret

Map_1672_TX1:
    TX_ASM
    ld c, EVENT_GOT_GLITCHLAND_PERMIT
    ld hl, Map_1672_AlreadyDone
    call CheckEventAndPrintHLIfCompleted
    ld hl, Map_1672_Intro
    call PrintTextEnhanced
    ld bc, $ba4b
    ld de, $1e17
    call CompleteEvent
    jp TextScriptEnd
    
Map_1672_Intro:
    text "Deliria. The most fun place"
    next "in all of Glitchland..."
    para "However, you need a permit"
    next "in order to get there."
    para "How preposterous!"
    next "Disallowing everyone from"
    cont "going there is just a"
    cont "cruel joke."
    para "That's why I give out"
    next "forged permits to everyone"
    cont "who wants to visit Deliria."
    para "Do you want one? Here's"
    next "one permit, free of charge."
    cont "We must free Deliria!"
    tx_snd SFX_GET_KEY_ITEM
    done

Map_1672_AlreadyDone:
    text "Go forth and explore Deliria"
    next "as much as you'd like!"
    done

