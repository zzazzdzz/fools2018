; === overworld_utils.asm
; Utility functions in SRAM3 (overworld-related).

; Hide all sprites by setting all their Y coordinates to $A0.

HideAllSprites:
    ld hl, $c104
.loop
    ld [hl], $a0
    ld a, l
    add $10
    ld l, a
    cp $f4
    jr nz, .loop
    ret

; Black out the palette.

PalAllBlack:
    ld a, $ff
    ldh [$47], a
    ldh [$48], a
    ldh [$49], a
    ret

; Loads the music ID in the current map's header to corresponding
; addresses in the game's RAM.

LoadCurrentMusicIDToRAM:
    ld hl, CurrentMapData + 18
    ld a, [hld]
    ld c, a
    ld [$d35b], a
    ld a, [hld]
    ld [$d35a], a
    ret

; Loads music IDs to RAM, then plays the current map music.

PlayCurrentMapMusic:
    call LoadCurrentMusicIDToRAM
    jp PlayMusic

; Open a textbox ensuring that the font is loaded, auto BG transfer is enabled,
; and previous screen data is saved.

OpenTextboxInOverworld:
    call SaveScreenTilesToBuffer1
    call LoadFontTilePatterns
    ld hl, $cfc3
    bit 0, [hl]
    ld a, 1
    ldh [$ba], a
    ld [$d124], a
    call DisplayTextBoxID
    call UpdateSprites
    ld hl, $c102
    ld a, [hl]
    and $1
    jr z, .noAdjust
    dec [hl]
.noAdjust
    ld hl, .return
    push hl
    ld hl, ReturnToSRAM3
    push hl
    jp CopyScreenTileBufferToVRAM
.return
    xor a
    ldh [$b0], a
    ret
    
; Close textbox, ensuring that the font is correctly unloaded.
    
CloseTextboxInOverworld:
    ld a, $90
    ldh [$b0], a
    call DelayFrame
    call LoadGBPal
    xor a
    ldh [$ba], a
    call SwitchToMapRomBank
    ldh a, [$f8]
    ld h, a
    ld l, 0
    push hl
    jp $28fb
    
; Safely interrupt the player in overworld - that is, make sure the player
; isn't in the middle of sprite animation and walks only in one direction.
; Mostly used in map scripts.
    
ScriptEventInOverworld:
    ld a, $ff
    ld [$cd6b], a
    xor a
    ld [$c108], a
    ld a, [$c102]
    and 1
    ret nz
    xor a
    ld [$cd6b], a
    ret

; Check whether an event flag was triggered, set carry if it was.

TestEventFlag:
    ld a, $10
    ld b, 2
    ld hl, EventFlagsBitfield
    call Predef
    ld a, c
    and a
    jr z, .ok
    scf
    ret
.ok
    scf
    ccf
    ret

; Complete event with ID bc:de.

CompleteEvent:
    ld hl, SerialTriggerEventStruct.evtId
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
    ld [hl], c
    inc hl
    ld [hl], b
    ld de, SerialTriggerEventStruct.inventoryData
    ld hl, $d31c
    ld bc, 41
    call CopyData
.retry
    ld hl, CompleteEventQuestionText
    call PrintTextEnhanced
    ld hl, SerialTriggerEventStruct
    call PrepareSerialBuffer
    call SerialInteractiveTransfer
    and a
    jr z, .failed
    ld a, [StandardSerialBuffer + 5]
    and a
    jr z, .failed
    ld c, a
    ld a, $10
    ld b, 1
    ld hl, EventFlagsBitfield
    call Predef
    call PlayCurrentMapMusic
    ld a, $91
    call PlaySound
    ld hl, CompleteEventSuccessText
    call PrintTextEnhanced
    jp WaitForSoundToFinish
.failed
    ld hl, CompleteEventFailedText
    call PrintTextEnhanced
    jr .retry
    
; Complete event by sending a custom serial packet.
    
CompleteEventSerial:
    push hl
    ld hl, CompleteEventQuestionText
    call PrintTextEnhanced
    pop hl
    push hl
    call PrepareSerialBuffer
    call SerialInteractiveTransfer
    and a
    jr z, .failed
    pop hl
    call PlayCurrentMapMusic
    ld a, $91
    call PlaySound
    ld hl, CompleteEventSuccessText
    call PrintTextEnhanced
    jp WaitForSoundToFinish
.failed
    ld hl, CompleteEventFailedText
    call PrintTextEnhanced
    pop hl
    jr CompleteEventSerial
    
CompleteEventQuestionText:
    text "Your progress will now be"
    next "saved on the server."
    wait

CompleteEventFailedText:
    text "Could not synchronize your"
    next "progress."
    para "Check your connection"
    next "and try again."
    wait

CompleteEventSuccessText:
    text "Successfully synchronized"
    next "your progress!"
    done

; Remove an item from the player's inventory.
; Basically a wrapper around RemoveItemByID.

RemoveItemFromBag:
    ldh [$db], a
    ld b, b_RemoveItemByID
    ld hl, RemoveItemByID
    jp Bankswitch

; Checks an event flag and displays a generic "Nothing wrong here"
; textbox if the tested flag is already set.

CheckEventAndQuitIfCompleted:
    call TestEventFlag
    ret nc
    ld hl, NothingWrongHereText
    call PrintTextEnhanced
    pop hl
    jp TextScriptEnd

NothingWrongHereText:
    text "Nothing wrong here."
    done

; Checks an event flag and displays the textbox in HL if the tested
; flag is already set.

CheckEventAndPrintHLIfCompleted:
    push hl
    call TestEventFlag
    pop hl
    ret nc
    pop de
    call PrintTextEnhanced
    jp TextScriptEnd

; Checks whether a specific item is in the player's inventory.
; Display the textbox in HL if it is.

CheckItemAndPrintHLIfCompleted:
    push hl
    call IsItemInBag
    pop hl
    ret z
    pop de
    call PrintTextEnhanced
    jp TextScriptEnd

; This function is called whenever walking through walls is detected.
; WTW detection works by constantly checking whether the tile below
; the player is passable. If it isn't, then someone must certainly be
; going through walls.

CheatingAttempt:
    call HideAllSprites
    call PalAllBlack
    call OpenTextboxInOverworld
    call BlackScreenWithVRAMCopy
    ld hl, CheatingText
    call PrintTextEnhanced
    jp _StartLoadingMap
    
CheatingText:
    text "Walking through walls was"
    next "detected."
    para "Consider playing this game"
    next "legit. It's part of the"
    cont "charm of it."
    para "If you got to this screen"
    next "without hacking, please let"
    cont "me know!"
    para "Let me reload the map for"
    next "you..."
    wait
