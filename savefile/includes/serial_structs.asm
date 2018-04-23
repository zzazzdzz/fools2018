; === serial_structs.asm
; Packet structures used in serial transmissions.

; Check connection and receive MOTD.

SerialHelloStruct:
    dw 9    ; Content Length
    dw 0    ; Checksum
    db $01  ; Request code
    db 72, 69, 76, 88 ; 'HELX'
    
; Register a new user (unused).
    
SerialRegisterStruct:
    dw 15   ; Content Length
    dw 0    ; Checksum
    db $02  ; Request code
    ; 10 bytes for registration code follow.
    ; This data is unused and rewritten dynamically.
    ; Good opportunity for an easter egg.
.buffer
    db 1
    db "Inb4 this game gets a TCRF page"
    
; Trigger an event.
    
SerialTriggerEventStruct:
    dw 50   ; Content Length
    dw 0    ; Checksum
    db $05  ; Request code
    ; Event ID and inventory data follow
.evtId
    db "####"
.inventoryData
    REPT 41
        db "X"
    ENDR
    
; Set a new trendy phrase.
    
SerialTrendyPhraseStruct:
    dw 21   ; Content Length
    dw 0    ; Checksum
    db $06  ; Request code
    ; 16 bytes for the phrase
.buf
    db "#####@@@@@#####@"
    
; Check letters in the lottery.
    
SerialCheckLotteryStruct:
    dw 6    ; Content Length
    dw 0    ; Checksum
    db $07  ; Request code
    db $ff  ; Dummy

; Give balls to the guy in Western Encampment.

SerialGaveBallsStruct:
    dw 6    ; Content Length
    dw 0    ; Checksum
    db $08  ; Request code
    db $ff  ; Dummy

; Attempt to solve Cracker Cavern challenge 3.

SerialCrackmeStruct:
    dw 21   ; Content Length
    dw 0    ; Checksum
    db $09  ; Request code
    ; 16 bytes for the password
.buf
    db "#####@@@@@#####@"

; Change the player's fun value.

SerialChangeFunValueStruct:
    dw 6    ; Content Length
    dw 0    ; Checksum
    db $0a  ; Request code
    db $ff  ; Dummy
