SECTION "Map_116E", ROM0[$B800]

Map_116E_Header:
    hdr_tileset         8
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_116E_Blocks, Map_116E_TextPointers
    hdr_pointers_b      Map_116E_Script, Map_116E_Objects
    hdr_pointers_c      Map_116E_InitScript, Map_116E_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_116E_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            3, 7, 21, 10, $113D
    hdr_warp            2, 7, 21, 10, $113D
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_SAILOR, 2, 4, STAY, RIGHT, $01

Map_116E_RAMScript:
    rs_end

Map_116E_Blocks:
    db $04,$0e,$05,$09
    db $0f,$01,$02,$0f
    db $0f,$0c,$0d,$0f
    db $06,$0b,$0f,$07

Map_116E_TextPointers:
    dw Map_116E_TX1

Map_116E_InitScript:
    ret
Map_116E_Script:
    ret

Map_116E_TX1:
    TX_ASM
    ld b, $2d
    call IsItemInBag
    jr nz, .alreadyGot
    ld b, $06
    call IsItemInBag
    jr nz, .alreadyGot
    ld hl, Map_116E_Question
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    and a
    jr z, .yes
    ld hl, Map_116E_No
    call PrintTextEnhanced
    jp TextScriptEnd
.yes
    ld hl, Map_116E_Yes
    call PrintTextEnhanced
    ld a, SFX_GET_ITEM_1
    call PlaySound
    ld hl, Map_116E_ObtainedText
    call PrintTextEnhanced
    call WaitForSoundToFinish
    ld bc, $2d01
    call GiveItem
.alreadyGot
    ld hl, Map_116E_Yes2
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_116E_Question:
    text "Hello, I'm the Fishing Guru!"
    next "Do you like to fish?"
    done
    
Map_116E_Yes:
    text "You do? That's great!"
    next "I appreciate that."
    para "What? You really thought I'm"
    next "going to give you a Fishing"
    cont "Rod for free?"
    para "Sorry, giving out stuff for"
    next "free would be a bad business"
    cont "strategy for me."
    para "I can give you something"
    next "better, kid!"
    wait
    
Map_116E_Yes2:
    text "Take that baby to the Bike"
    next "Shop in Western Glitchland,"
    cont "and get yourself a free"
    cont "bike!"
    para "Maybe giving out stuff for"
    next "free is a better business"
    cont "model for them than it is"
    cont "for me!"
    done
    
Map_116E_ObtainedText:
    text "Obtained the BIKE VOUCHER!"
    wait

Map_116E_No:
    text "You don't?"
    next "That's really disappointing..."
    done

