SECTION "Map_318D", ROM0[$B800]

Map_318D_Header:
    hdr_tileset         17
    hdr_dimensions      6, 6
    hdr_pointers_a      Map_318D_Blocks, Map_318D_TextPointers
    hdr_pointers_b      Map_318D_Script, Map_318D_Objects
    hdr_pointers_c      Map_318D_InitScript, Map_318D_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_DUNGEON3, AUDIO_3
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_318D_Objects:
    hdr_border          $19
    hdr_warp_count      2
    hdr_warp            8, 8, 3, 3, $318E
    hdr_warp            3, 3, 8, 8, $318C
    hdr_sign_count      2
    hdr_signpost        5, 3, $01
    hdr_signpost        7, 3, $02
    hdr_object_count    0

Map_318D_RAMScript:
    rs_end

Map_318D_Blocks:
    db $2c,$1d,$1d,$1d,$1d,$2b
    db $1a,$3e,$2a,$2a,$01,$18
    db $1a,$01,$01,$01,$01,$18
    db $1a,$01,$01,$0d,$04,$18
    db $1a,$01,$01,$07,$27,$18
    db $19,$15,$15,$15,$15,$19

Map_318D_TextPointers:
    dw Map_318D_TX1
    dw Map_318D_TX2

Map_318D_InitScript:
    ld c, EVENT_CRACKER_CAVERN_CHALLENGE_2
    call TestEventFlag
    ret nc
    ld a, $01
    ld [$c737], a
    ret
Map_318D_Script:
    ret

Map_318D_TX1:
    TX_ASM
    jp EnhancedTextOnly
    text "Cracker Cavern"
    next "Challenge III"
    para "You have come very far."
    next "Here's the next challenge."
    para "I have a nice image for"
    next "you. Unfortunately, it is"
    cont "encrypted."
    para "Figure out the key that"
    next "makes the image look as"
    cont "intended."
    para "You can view the image and"
    next "test various keys by"
    cont "interacting with the sign"
    cont "next to this one."
    para "The key is all numeric."
    para "The next challenge will"
    next "not load until this one"
    cont "is completed."
    cont "Checks are done server-side."
    para "The challenge should be"
    next "solved locally."
    para "Do NOT bruteforce the"
    next "remote server!"
    para "All IPs making an excessive"
    next "amount of requests are"
    cont "banned automatically."
    done

Map_318D_TX2:
    TX_ASM
    ld hl, Map_318D_EnterKey
    call PrintTextEnhanced
    ld bc, $000a
    call PrintInputMenu
    ld bc, 16
    ld hl, InputMenuBuffer
    ld de, SerialCrackmeStruct.buf
    call CopyData
    ld hl, InputMenuBuffer
    ld a, PREDEF_HandleCrackMe
    call PredefCmd
    ld hl, Map_318D_TheImageIs
    call PrintTextEnhanced
    ld de, YesNoBoxset
    ld bc, $0203
    call PrintChoiceMenu
    and a
    jr nz, .nope
    ld hl, SerialCrackmeStruct
    call CompleteEventSerial
    ld a, [StandardSerialBuffer+5]
    cp 1
    jr nz, .wrong
    ld hl, Map_318D_CorrectKey
    call PrintTextEnhanced
    ld bc, $1337
    ld de, $beef
    call CompleteEvent
    ld a, $01
    ld [$c737], a
    ld hl, RedrawMapView
    ld b, b_RedrawMapView
    call Bankswitch
    ld hl, Map_318D_Opened
    call PrintTextEnhanced
    jp TextScriptEnd
.wrong
    ld hl, Map_318D_WrongKey
    call PrintTextEnhanced
    jp TextScriptEnd
.nope
    ld hl, Map_318D_BetterLuck
    call PrintTextEnhanced
    jp TextScriptEnd

Map_318D_EnterKey:
    text "Please enter a 10-digit"
    next "key..."
    done
    
Map_318D_TheImageIs:
    text "This is the decrypted"
    next "image..."
    para "Do you think this key"
    next "is correct?"
    done
    
Map_318D_BetterLuck:
    text "Better luck next time!"
    done

Map_318D_WrongKey:
    text "This key is incorrect."
    done
    
Map_318D_CorrectKey:
    text "This key is correct!"
    tx_snd SFX_GET_ITEM_1
    wait

Map_318D_Opened:
    text "Please go on."
    done
