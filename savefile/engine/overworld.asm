; === overworld.asm
; Everything related to map handling.

; Map script handler.

_DefaultMapScript:
    jp HandleCurrentMapScript

; Generic function to begin the map loading process.

_StartLoadingMap:
    call HideAllSprites
    call PalAllBlack
    call OpenTextboxInOverworld
    call BlackScreenWithVRAMCopy
    xor a
	ld [$d35c], a
    call LoadGBPal
    jp ReceiveMap

include "engine/overworld_utils.asm"
include "engine/ram_script.asm"

include "engine/load_map.asm"
include "engine/map_script.asm"