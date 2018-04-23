; === main_sram3.asm
; SRAM bank 3. Contains the map loader, custom audio tracks,
; and the connection test procedure.

SECTION "SRAM3", ROM0[$A000]

; This is where it all begins.

_EntryPoint:
    jp _Start

; This flag is unset on a brand new save file.

FirstRunFlag:
    db 0

; Custom audio tracks

include "includes/audio_macros.asm"
include "includes/audio_intro.asm"
include "includes/audio_flute.asm"

; Emulation testing subroutines

include "engine/emulator_tests.asm"

; Connection test procedure

include "engine/first_run.asm"
include "engine/connection_test.asm"

; Map loader and overworld functions

include "engine/overworld.asm"

; Load a solid black tile into VRAM and fill the screen with it.

BlackScreenWithVRAMCopy:
    ld hl, $dd00
    ld bc, $0008
    ld a, $ff
    call FillMemory
    ld c, 1
    ld de, $dd00
    ld hl, $9010
    call CopyVideoDataDouble
BlackScreen:
    ld hl, $c3a0
    ld bc, 18*20
    ld a, $01
    jp FillMemory

; Game start

_Start:
    call OpenTextboxInOverworld
    call BlackScreenWithVRAMCopy
    call HideAllSprites
    ld a, $ff
    call PlaySound
.drawInitializing
    coord hl, 3, 7
    ld bc, $010c
    call TextBoxBorder
    coord hl, 4, 8
    ld de, Initializing
    call PutString
    ld c, $60
.muteFadeoutLoop
    ld a, $ff
    call PlaySound
    call DelayFrame
    dec c
    jr nz, .muteFadeoutLoop
.loadIntroMusic
    ld de, $c6f0
    ld hl, Intro1_Ch1OffsetStart
    ld bc, 900
    call CopyData
    ld de, $dcd0
    ld hl, Intro1_Ch2OffsetStart
    ld bc, 700
    call CopyData
    ld de, $d163
    ld hl, Intro1_Ch2CallChannels
    ld bc, 400
    call CopyData
    ld de, $d8a0
    ld hl, Intro1_Ch3OffsetStart
    ld bc, 460
    call CopyData
.loadIntroMusicPointers
    ld de, $d320
    ld hl, Intro1_Pointers
    ld bc, 8
    call CopyData
.checkEmulatorCompatibility
    call BlackScreen
    call EchoRAMTest
    jp c, UnsupportedEmulator
    call VRAMInaccessibilityTest
    jp c, UnsupportedEmulator
    ; Fall through to TestConnectionAndLoadMap

; Perform a connection test.
; Also display some flavor text if the user has loaded the save
; for the first time

TestConnectionAndLoadMap:
    ld a, [FirstRunFlag]
    and a
    jp z, FirstRun
    ld hl, $d320
    call PlayMusicFromRAM
    call ConnectionTest
    ; Fall through to SetUpAndLoadFirstMap
    
; Set up all critical game variables and warp the player to the first
; map (Central Square, X=10, Y=12)
    
SetUpAndLoadFirstMap:
    ; Player has 255 items in inventory. This makes the inventory invalid,
    ; so when it's sent to the server, it will be rejected and the
    ; previously saved inventory data will be reloaded instead.
    ; This is what we want!
    ld a, $ff
    ld [$d31c], a
    ; Target map warp
    ld a, $01
    ld [MapWarpTargetIDH], a
    ld a, $10
    ld [MapWarpTargetIDL], a
    ld a, 10
    ld [MapWarpTargetX], a
    ld a, 12
    ld [MapWarpTargetY], a
    ; Player is in the Cable Club
    ; (that is - replace the Save option with Reset)
    ld hl, $d72d
    set 6, [hl]
    ; Empty the player party
    ld hl, $d162
    xor a
    ld [hli], a
    ld [hl], $ff
    ; Begin loading the map
    jp ReceiveMap
    
; Called when any of the emulation accuracy tests fail
    
UnsupportedEmulator:
    ld c, $20
    ld a, $a3
    call PlayMusic
    ld hl, EmulatorFailText
    call PrintTextEnhanced
.forever
    jr .forever
    ; You can't stop people from doing bad things, because it would
    ; also stop them from doing nice things.
    ; If someone really wants to run the game regardless of the
    ; emulation problems, it is made easy here by including this jump.
    ; To bypass the message, just nop out the infinite loop above.
    jp TestConnectionAndLoadMap

; Serial packet struct definitions.

include "includes/serial_structs.asm"

Initializing:
    db $88,$ad,$a8,$b3,$a8,$a0,$ab,$a8,$b9,$a8,$ad,$a6,$50

EmulatorFailText:
    text "You are using an inaccurate"
    next "or unsupported emulator."
    cont "The game cannot be played."
    para "Refer to the following site"
    next "for further information:"
    cont "zzazzdzz.github.io/emu"
    done
