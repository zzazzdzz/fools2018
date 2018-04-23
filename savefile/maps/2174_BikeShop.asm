SECTION "Map_2174", ROM0[$B800]

Map_2174_Header:
    hdr_tileset         21
    hdr_dimensions      4, 4
    hdr_pointers_a      Map_2174_Blocks, Map_2174_TextPointers
    hdr_pointers_b      Map_2174_Script, Map_2174_Objects
    hdr_pointers_c      Map_2174_InitScript, Map_2174_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_2174_Objects:
    hdr_border          $0e
    hdr_warp_count      2
    hdr_warp            3, 7, 6, 6, $2125
    hdr_warp            2, 7, 6, 6, $2125
    hdr_sign_count      0
    hdr_object_count    1
    hdr_object          SPRITE_WAITER, 6, 2, STAY, DOWN, $01

Map_2174_RAMScript:
    rs_end

Map_2174_Blocks:
    db $04,$05,$02,$03
    db $08,$08,$06,$07
    db $0b,$0a,$0a,$0a
    db $0a,$01,$0a,$09

Map_2174_TextPointers:
    dw Map_2174_TX1

Map_2174_InitScript:
    ret
Map_2174_Script:
    ret

Map_2174_TX1:
    TX_ASM
    ld b, $2d
    call IsItemInBag
    jr z, .nope
    ld hl, Map_2174_HasVoucher
    call PrintTextEnhanced
    ld a, $2d
    call RemoveItemFromBag
    ld bc, $0601
    call GiveItem
    jp TextScriptEnd
.nope
    ld hl, Map_2174_NoVoucher
    call PrintTextEnhanced
    jp TextScriptEnd
    
Map_2174_NoVoucher:
    text "Welcome to our Bike Shop."
    para "For limited time only, you"
    next "can get a totally radical"
    cont "bike for just $999999.99!"
    para "Oh, we're sorry."
    next "You can't afford it."
    done

Map_2174_HasVoucher:
    text "Oh, is that a Bike Voucher?"
    next "You're in luck, the voucher"
    cont "was to expire tomorrow."
    para "Well, here you go!"
    next "A gnarly, rad bicycle!"
    para "You exhanged the Voucher for"
    next "a Bicycle!"
    tx_snd SFX_GET_KEY_ITEM
    done

