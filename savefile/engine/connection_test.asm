; === connection_test.asm
; Test the connection to the server.

ConnectionTest:
    ld hl, ConnectAttemptText
    call PrintTextEnhanced
    ld de, StartText
    ld bc, $0105
    call PrintChoiceMenu
    call BlackScreen
    ld hl, SerialHelloStruct
    call PrepareSerialBuffer
    call SerialInteractiveTransfer
    and a
    jp z, ConnectionFailed
    ld hl, $d320
    call PlayMusicFromRAM
    ld hl, ConnectAttemptSuccess
    call PrintTextEnhanced
    ld a, [StandardSerialBuffer + 9]
    and a
    ret z
    ld hl, StandardSerialBuffer + 10
    jp PrintTextEnhanced
    
ConnectionFailed:
    ld hl, $d320
    call PlayMusicFromRAM
    ld hl, ConnectAttemptFail
    call PrintTextEnhanced
    jp ConnectionTest
    
StartText:
    ; Start\x50
    db $92,$b3,$a0,$b1,$b3,$50

ConnectAttemptText:
    text "Please configure your"
    next "server connection now."
    para "Once you're ready, press A"
    next "to test your connection."
    done
    
ConnectAttemptFail:
    text "The connection test"
    next "failed miserably."
    para "Verify your configuration"
    next "and try again."
    wait

ConnectAttemptSuccess:
    text "The connection has been"
    next "successfully estabilished!"
    wait
