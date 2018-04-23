; === emulator_tests.asm
; Simple tests to detect inaccurate emulators.

; Test whether echo RAM ($E000-$FEFF) is accessible and working as expected.
; Try to make a write at $D222, and check if it is mirrored at $F222.

EchoRAMTest:
    ld b, 0
.loop
    ld a, b
    ld [$d222], a
    ld a, [$f222]
    cp b
    jr nz, .fail
    dec b
    jr nz, .loop
    scf
    ccf
    ret
.fail
    scf
    ret

; Test whether VRAM inaccessibility works as expected.
; Try to read a value from VRAM several times, check if at least one write
; returns $FF due to VRAM inaccessibility.

VRAMInaccessibilityTest:
    ld hl, $8111
    ld bc, $ff00
.loop
    ld a, [hl]
    cp $ff
    jr nz, .notFF
    inc c
.notFF
    dec b
    jr nz, .loop
    ld a, c
    and a
    scf
    ret z
    ccf
    ret
