; === crackme.asm
; The challenge at Cracker Cavern III.

; An image is encrypted using a rather simple XOR-based algorithm.
; The player's job is to find a 10-digit password that will recover
; the original image. The 10-digit password was passed through a
; key-derivation routine that would produce a 10-byte binary key.

; The intended solution was to make an assumption that the first
; 10 bytes of the image are 0. Then, because the image is XORed with
; the key to decrypt it, and x XOR 0 = x, the first 10 bytes of the
; image would be the key. With that knowledge, it was possible
; to trace back the steps in the key derivation routine to recover
; the original password, then use it to decrypt the whole image.
; Bruteforcing the thing was also an acceptable solution, although
; a bit slower.

; ---

; General handling function:
; - Reads a password from InputMenuBuffer
; - Generates a 10-byte binary key from the password
; - Tries to decrypt the image and shows it to the user

HandleCrackMe:
    ld hl, CrackMeImage
    ld de, StandardSerialBuffer
    ld bc, 16 * 8
    call CopyData
    ld c, 25
.keyderivation
    ld a, [InputMenuBuffer+9]
    ld b, a
    call CrackMeKeyDerivationSingleRound
    dec c
    jr nz, .keyderivation
    call CrackMeDecryptImage
    ld de, StandardSerialBuffer
    ld hl, $9600
    ld bc, $0110
    call CopyVideoDataDouble
    coord hl, 7, 5
    ld bc, $0404
    call TextBoxBorder
    call UpdateSpritesSafeguarded
    coord hl, 8, 6
    ld de, CrackMeImageTilemap
    jp PutStringSameBank
    
; The key derivation algorithm. For every byte of the key:
; rotate it right, XOR $5C, add $1E, pass it through a lookup table,
; XOR it with the previous byte and write it back.
    
CrackMeKeyDerivationSingleRound:
    push bc
    ld c, 10
    ld hl, InputMenuBuffer
.loop
    ld a, [hl]
    rrca
    xor $5c
    add $1e
    call CrackMeGetLookupValue
    xor b
    ld b, a
    ld [hli], a
    dec c
    jr nz, .loop
    pop bc
    ret
    
; Image decryption.
; Just XOR every byte with the corresponding key byte.
    
CrackMeDecryptImage:
    ld hl, InputMenuBuffer
    ld c, 16 * 8
    ld de, StandardSerialBuffer
.loop
    ld a, [de]
    xor [hl]
    ld [de], a
    inc de
    ld a, [hl]
    call CrackMeGetLookupValue
    ld [hli], a
    ld a, l
    cp $ea
    jr nz, .noReset
    ld hl, InputMenuBuffer
.noReset
    dec c
    jr nz, .loop
    ret

; Retrieve a value from the lookup table.

CrackMeGetLookupValue:
    push hl
    push bc
    ld hl, CrackMeKeyDerivationLookup
    ld b, 0
    ld c, a
    add hl, bc
    ld a, [hl]
    pop bc
    pop hl
    ret
    
CrackMeKeyDerivationLookup:
    db $6d,$e5,$9a,$4c,$c7,$35,$1a,$3b,$78,$fb,$02,$84,$7b,$4b,$4a,$c0
    db $6c,$9b,$36,$1f,$34,$4d,$ce,$24,$b9,$e0,$29,$54,$99,$67,$19,$21
    db $73,$cb,$57,$46,$2f,$df,$5e,$43,$72,$7a,$28,$b0,$0f,$f6,$49,$e2
    db $12,$f0,$09,$44,$cd,$69,$95,$6b,$d3,$d1,$e6,$87,$92,$f7,$dd,$89
    db $c2,$63,$ea,$1d,$bb,$a7,$0a,$48,$93,$90,$c1,$08,$14,$1b,$79,$91
    db $65,$f8,$0d,$d8,$d0,$47,$e1,$f9,$15,$9e,$05,$41,$c8,$b7,$0e,$7e
    db $22,$e9,$da,$b1,$62,$13,$26,$42,$ab,$d4,$5c,$4f,$74,$c4,$04,$66
    db $d6,$5f,$38,$4e,$10,$a5,$75,$52,$aa,$fe,$f2,$a3,$70,$25,$82,$3a
    db $0c,$9d,$97,$56,$7d,$d5,$a4,$e8,$af,$11,$b8,$33,$e4,$f4,$3e,$60
    db $cc,$5a,$fd,$71,$de,$94,$7f,$40,$53,$d7,$f3,$03,$96,$bf,$17,$2c
    db $98,$f5,$50,$8a,$88,$59,$ac,$6e,$8e,$77,$c5,$58,$8d,$c9,$b5,$be
    db $3f,$ec,$a2,$bc,$a0,$23,$0b,$85,$b2,$86,$07,$61,$d9,$a1,$8f,$7c
    db $01,$64,$ad,$3c,$ff,$06,$8b,$a8,$e3,$76,$31,$80,$ef,$81,$51,$32
    db $45,$db,$3d,$1e,$20,$ba,$8c,$27,$30,$6a,$d2,$b3,$18,$b4,$c6,$fc
    db $55,$1c,$dc,$eb,$ae,$f1,$a6,$ca,$6f,$5b,$9f,$16,$9c,$cf,$b6,$ee
    db $39,$a9,$2a,$68,$37,$fa,$5d,$83,$00,$2d,$ed,$2e,$2b,$e7,$bd,$c3
    
CrackMeImage:
    db $7d,$bc,$5d,$92,$c7,$66,$fb,$16
    db $b3,$c7,$25,$39,$07,$65,$e4,$00
    db $2e,$ce,$bc,$a8,$df,$6a,$85,$e7
    db $8e,$5e,$49,$51,$d9,$8e,$fc,$5c
    db $d5,$ca,$3e,$0e,$90,$f8,$6a,$3e
    db $38,$c1,$be,$33,$dc,$4b,$ce,$04
    db $50,$4d,$50,$a3,$e7,$80,$88,$db
    db $ef,$6d,$c8,$b4,$3f,$eb,$3b,$39
    db $a0,$64,$ee,$c4,$e3,$a0,$89,$2f
    db $83,$d1,$98,$62,$b6,$ff,$eb,$07
    db $0f,$c2,$e8,$db,$53,$da,$0b,$fa
    db $16,$53,$9b,$51,$6f,$b3,$d8,$5e
    db $bd,$05,$d1,$d6,$0d,$f6,$66,$bc
    db $89,$84,$44,$ad,$68,$09,$4c,$00
    db $9f,$60,$8d,$79,$ab,$73,$f8,$12
    db $98,$e1,$56,$62,$36,$9b,$df,$e7
    
CrackMeImageTilemap:
    db $60,$61,$62,$63,$4f
    db $64,$65,$66,$67,$4f
    db $68,$69,$6a,$6b,$4f
    db $6c,$6d,$6e,$6f,$50
