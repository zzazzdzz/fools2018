; === main_wram.asm
; WRAM functions. Mostly stuff related to SRAM bank switching

SECTION "WRAM", ROM0[$DA80]

; Restart (or start) the game.

GameStart:
    ld a, 3
    call SwitchSRAMBank
    jp $a000

; Several variables for keeping track of SRAM banking.

CurrentSRAMBank:
    db 0
SavedSRAMBank:
    db 0
    
; Set to nonzero if serial transmissions are interactive
; (that is, if they're cancellable with the B button)

SerialIsInteractive:
    db 0
    
; Serial functions

include "engine/serial.asm"

; Switch to the SRAM bank in A

SwitchSRAMBank:
    push af
    ld a, $0a
    ld [$0000], a
    pop af
    ld [$4000], a
    ld [CurrentSRAMBank], a
    ; Fall through to WRAMEmptyScript
    
; A plain RET instruction in WRAM, so it never switches out.
; Used in some map scripts.
    
WRAMEmptyScript:
    ret

; A function table for several commonly used subroutines.
; Each of these stubs will pass execution to TrampolineSRAM2,
; which will handle SRAM bank switching

PlayMusicFromRAM:
    trampoline2 _PlayMusicFromRAM
PrintTextEnhanced:
    trampoline2 _PrintTextEnhanced
PrintChoiceMenu:
    trampoline2 _PrintChoiceMenu
PrintInputMenu:
    trampoline2 _PrintInputMenu
PredefCmd:
    trampoline2 _PredefCmd
SerialInteractiveTransfer:
    trampoline2 _SerialInteractiveTransfer
PutString:
    trampoline2 _PutString
ItemUse3F:
    trampoline2 _ItemUse3F
ItemUse4F:
    trampoline2 _ItemUse4F
ItemUse5F:
    trampoline2 _ItemUse5F

TrampolineSRAM2:
    ; Clever self-modifying code to have a dynamic subroutine call,
    ; while preserving all of the registers
    push af
    push hl
    ld hl, .trickyDicky + 1
    ld [hl], e
    inc hl
    ld [hl], d
    ld a, [CurrentSRAMBank]
    ld [SavedSRAMBank], a
    ld a, 2
    call SwitchSRAMBank
    pop hl
    pop af
    ; de previously pushed by trampoline2
    pop de
.trickyDicky
    call $1337
.return
    push af
    ld a, [SavedSRAMBank]
    ld [CurrentSRAMBank], a
    call SwitchSRAMBank
    pop af
    ret

; Read byte at address HL from the parent SRAM bank.
; Return in A. Takes care not to clobber any registers.

ReadFromSavedSRAM:
    push bc
    ld a, [CurrentSRAMBank]
    ld b, a
    ld a, [SavedSRAMBank]
    call SwitchSRAMBank
    ld a, [hl]
    ld c, a
    ld a, b
    ld [CurrentSRAMBank], a
    call SwitchSRAMBank
    ld a, c
    pop bc
    ret
    
; Write A to address HL in the parent SRAM bank.
; Takes care not to clobber any registers except A.
    
WriteToSavedSRAM:
    push bc
    push af
    ld a, [CurrentSRAMBank]
    ld b, a
    ld a, [SavedSRAMBank]
    call SwitchSRAMBank
    pop af
    ld [hl], a
    ld a, b
    ld [CurrentSRAMBank], a
    call SwitchSRAMBank
    pop bc
    ret

; Copy the packet at HL to StandardSerialBuffer and fix its checksum.

PrepareSerialBuffer:
    ld de, StandardSerialBuffer
    push de
    ld bc, 128
    call CopyData
    pop hl
    push hl
    call FixSerialChecksum
    pop hl
    ret

; Call HL in SRAM bank 3. Restore original bank upon returning.

CallInSRAM3:
    ld a, 3
    call SwitchSRAMBank
    ld de, .return
    push de
    jp hl
.return
    ld a, 2
    jp SwitchSRAMBank

; Do a serial request, reading the packet from StandardSerialBuffer

SerialRequest:
    ld hl, StandardSerialBuffer
    jp SerialTransmitBlock

; Display a custom text engine textbox and end the text script.
; For use in map scripts, to construct single-textbox NPCs easier

EnhancedTextOnly:
    inc hl
    inc hl
    inc hl
    call PrintTextEnhanced
    jp TextScriptEnd

; Proxy for DefaultMapScript - it ensures the correct SRAM bank is loaded

DefaultMapScript:
    ld a, 3
    call SwitchSRAMBank
    jp _DefaultMapScript
    
; Return from a subroutine, while switching the SRAM bank to 3

ReturnToSRAM3:
    ld a, 3
    jp SwitchSRAMBank

; Proxy for StartLoadingMap - it ensures the correct SRAM bank is loaded

StartLoadingMap:
    ld a, 3
    call SwitchSRAMBank
    jp _StartLoadingMap
