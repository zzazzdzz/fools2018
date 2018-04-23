SECTION "Map_146F", ROM0[$B800]

Map_146F_Header:
    hdr_tileset         9
    hdr_dimensions      3, 3
    hdr_pointers_a      Map_146F_Blocks, Map_146F_TextPointers
    hdr_pointers_b      Map_146F_Script, Map_146F_Objects
    hdr_pointers_c      Map_146F_InitScript, Map_146F_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON1, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_146F_Objects:
    hdr_border          $0a
    hdr_warp_count      2
    hdr_warp            1, 5, 3, 4, $1432
    hdr_warp            0, 5, 3, 4, $1432
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_GYM_HELPER, 4, 4, STAY, LEFT, $01

Map_146F_RAMScript:
    rs_end

Map_146F_Blocks:
    db $4d,$4d,$4d
    db $00,$11,$21
    db $0b,$4a,$00

Map_146F_TextPointers:
    dw Map_146F_TX1

Map_146F_InitScript:
    ret
Map_146F_Script:
    ret

Map_146F_TX1:
    TX_ASM
    ld b, $49
    call IsItemInBag
    jr nz, .questFinished
    ld c, EVENT_RETURNED_FLUTE
    call TestEventFlag
    jr c, .questFinished
    ld hl, Map_146F_Intro
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    and a
    jr nz, .nope
    ld b, $31
    call IsItemInBag
    jr z, .noNugget
    ld a, $31
    call RemoveItemFromBag
    ld bc, $4901
    call GiveItem
    ld hl, Map_146F_Trade
    call PrintTextEnhanced
    jp TextScriptEnd
.nope
    ld hl, Map_146F_SaidNo
    call PrintTextEnhanced
    jp TextScriptEnd
.noNugget
    ld hl, Map_146F_NoNugget
    call PrintTextEnhanced
    jp TextScriptEnd
.questFinished
    ld hl, Map_146F_Traded
    call PrintTextEnhanced
    jp TextScriptEnd
    
    
Map_146F_Intro:
    text "Hello, hello!"
    next "Do I have a customer?"
    para "Have I got an offer just"
    next "for you!"
    para "Bring me a NUGGET, and"
    next "I'll give you this cool"
    cont "Poké Flute!"
    para "Near mint condition, only"
    next "used once or twice!"
    para "So, how about it?"
    next "Do we have a deal?"
    done

Map_146F_NoNugget:
    text "Oh, I'm afraid you don't"
    next "have a NUGGET."
    para "That's a shame."
    next "Bring me a NUGGET and I'll"
    cont "give you this cool flute!"
    done
    
Map_146F_SaidNo:
    text "You won't find such a deal"
    next "anywhere else!"
    done

Map_146F_Trade:
    text "Great!"
    next "We have a deal!"
    para "Here, have this Poké Flute!"
    next "A deal is a deal!"
    tx_snd SFX_GET_ITEM_1
    done

Map_146F_Traded:
    text "What?"
    next "I don't give any refunds!"
    done

