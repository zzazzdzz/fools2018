; === special_items.asm
; Handle the special items within the game (3F, 4F, 5F).

; Item use subroutine for 3F.

_ItemUse3F:
    ld hl, Item3FIntroText
    call PrintTextEnhanced
    ld de, Item3FChoiceMenu
    ld bc, $060f
    call PrintChoiceMenu
    and a
    ret z
    ld hl, Item3FFlyFlagMasks
    ld b, 0
    ld c, a
    add hl, bc
    ld b, [hl]
    ld a, [PlayerFlyFlags]
    and b
    jr z, .cannotFly
    ld a, c
    push af
    ld hl, Item3FStartTeleportText
    call PrintTextEnhanced
    pop af
    ld hl, Item3FTeleportData
    ld de, 5
    call IsInArray
    inc hl
    ld a, [hli]
    ld [MapWarpTargetIDL], a
    ld a, [hli]
    ld [MapWarpTargetIDH], a
    ld a, [hli]
    ld [MapWarpTargetX], a
    ld a, [hl]
    ld [MapWarpTargetY], a
    jp StartLoadingMap
.cannotFly
    ld hl, Item3FCannotFlyText
    jp PrintTextEnhanced

Item3FIntroText:
    text "Teleport mode engaged."
    para "Where do you want to go?"
    done
    
Item3FChoiceMenu:
    db $82,$a0,$ad,$a2,$a4,$ab,$4f
    db $82,$a4,$ad,$b3,$b1,$a0,$ab,$7f,$92,$b0,$b4,$a0,$b1,$a4,$4f
    db $8d,$ae,$b1,$b3,$a7,$a4,$b1,$ad,$7f,$84,$ad,$a2,$af,$ac,$e8,$4f
    db $92,$ae,$b4,$b3,$a7,$a4,$b1,$ad,$7f,$84,$ad,$a2,$af,$ac,$e8,$4f
    db $96,$a4,$b2,$b3,$a4,$b1,$ad,$7f,$84,$ad,$a2,$af,$ac,$e8,$4f
    db $84,$a0,$b2,$b3,$a4,$b1,$ad,$7f,$84,$ad,$a2,$af,$ac,$e8
    db $50

Item3FStartTeleportText:
    text "As you wish."
    next "Teleportation commencing."
    wait
    
Item3FCannotFlyText:
    text "You haven't visited this"
    next "location yet."
    wait
    
Item3FFlyFlagMasks:
    db 0
    db %00000010
    db %00000100
    db %00001000
    db %00010000
    db %00100000

Item3FTeleportData:
    ; Central Square
    db $01             ; Menu entry ID
    dw $0110           ; Map ID
    db 10, 12          ; Coordinates
    ; Northern Encampment
    db $02
    dw $1631
    db 13, 14
    ; Southern Encampment
    db $03
    dw $472b
    db 7, 8
    ; Western Encampment
    db $04
    dw $2b29
    db 12, 10
    ; Eastern Encampment
    db $05
    dw $2f38
    db 7, 9
    ; End
    db $ff

; Item use subroutine for 4F.

_ItemUse4F:
    ld hl, Item4FUseText1
    call PrintTextEnhanced
    ld hl, CloseTextboxInOverworld
    call CallInSRAM3
    ld hl, OpenTextboxInOverworld
    call CallInSRAM3
    ld hl, Item4FUseText2
    call PrintTextEnhanced
    ; Determine the replacement block and replacement threshold
    ; based on the current map's tileset
    ld de, $800a
    ld a, [$d366]
    cp $05
    jr nz, .notTileset5
    ld de, $7405
.notTileset5
    ld hl, $c6e8
    ld bc, 750
    ; Loop through wOverworldMap, replacing all bytes greater than
    ; D with tile identifier E
.loop
    ld a, [hl]
    cp d
    jr c, .nope
    ld [hl], e
.nope
    inc hl
    dec bc
    ld a, c
    or b
    jr nz, .loop
    ld hl, CloseTextboxInOverworld
    call CallInSRAM3
    ld hl, RedrawMapView
    ld b, b_RedrawMapView
    call Bankswitch
    ld a, SFX_CUT
    call PlaySound
    ld sp, $dfff
    jp OverworldLoop

Item4FUseText1:
    text "You used 4F."
    tx_snd SFX_SWITCH
    wait
    
Item4FUseText2:
    text "All nearby corrupted"
    next "tiles were removed!"
    wait
    
; Item use subroutine for 5F.

_ItemUse5F:
    ; Map5FScriptIndex is set by the map init script
    ld a, [Map5FScriptIndex]
    add a
    ld c, a
    ld b, 0
    ld hl, Item5FScriptPointers
    add hl, bc
    ld a, [hli]
    ld h, [hl]
    ld l, a
    jp hl
    
Item5FScriptPointers:
    dw Item5FUselessScript
    dw Item5FStrangeSignScript
    dw Item5FFlashScript
    dw Item5FYetAnotherCaveScript
    dw Item5FCutter
    
; Standard script for 5F.
; Just does nothing and displays a message.
    
Item5FUselessScript:
    ld hl, Item5FUselessText
    jp PrintTextEnhanced
    
Item5FUselessText:
    text "You used 5F."
    next "But nothing happened."
    wait

; 5F script for the Strange Sign.

Item5FStrangeSignScript:
    ld hl, MapScriptGeneralPurpose
    set 2, [hl]
    ld hl, Item5FStrangeSignText
    call PrintTextEnhanced
    ld a, [MapScriptGeneralPurpose]
    cp $07
    ret nz
    ld hl, Item5FStrangeSignFall
    call PrintTextEnhanced
    ld a, SFX_CUT
    call PlaySound
    call WaitForSoundToFinish
    ld a, $8a
    ld [MapWarpTargetIDL], a
    ld a, $09
    ld [MapWarpTargetIDH], a
    ld a, 5
    ld [MapWarpTargetX], a
    ld [MapWarpTargetY], a
    jp StartLoadingMap

Item5FStrangeSignText:
    text "You used 5F."
    para "It sounded as if a door"
    next "opened somewhere far away."
    tx_snd SFX_GO_INSIDE
    wait

Item5FStrangeSignFall:
    text "You fall into a cave, as the"
    next "ground beneath you crumbles."
    done

; 5F script for unlit areas
; (acts as Flash)

Item5FFlashScript:
    ld hl, Item5FFlashText
    call PrintTextEnhanced
    xor a
    ld [$d35c], a
    ld hl, CloseTextboxInOverworld
    call CallInSRAM3
    ld sp, $dfff
    jp OverworldLoop

Item5FFlashText:
    text "You used 5F."
    para "A blinding flash lights the"
    next "area!"
    tx_snd $05
    tx_snd $05
    tx_snd $05
    tx_snd $05
    done
    
; 5F script for Yet Another Cave
; (reveals a hidden path)
    
Item5FYetAnotherCaveScript:
    ld hl, Item5FYetAnotherCaveText
    call PrintTextEnhanced
    ld hl, $c784
    ld a, $01
    ld [hli], a
    ld [hli], a
    ld [hl], a
    ld hl, CloseTextboxInOverworld
    call CallInSRAM3
    ld hl, RedrawMapView
    ld b, b_RedrawMapView
    call Bankswitch
    ld a, SFX_CUT
    call PlaySound
    ld sp, $dfff
    jp OverworldLoop

Item5FYetAnotherCaveText:
    text "You used 5F."
    para "A hidden passage was"
    next "revealed!"
    tx_snd SFX_SWITCH
    done

; 5F script for Grasslands
; (act as the field move Cut)

Item5FCutter:
    ld hl, CloseTextboxInOverworld
    call CallInSRAM3
    ld a, $52
    ld [$cd4d], a
    call SaveScreenTilesToBuffer1
    call SaveScreenTilesToBuffer2
    call UpdateSpritesSafeguarded
    ld hl, $6e42
    ld b, $03
    call Bankswitch
    ld sp, $dfff
    jp OverworldLoop
