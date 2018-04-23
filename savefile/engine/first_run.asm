; === first_run.asm
; First run of the game.

FirstRun:
    ld hl, WelcomeText
    call PrintTextEnhanced
    ld hl, $d320
    call PlayMusicFromRAM
    ld hl, ConnectText
    call PrintTextEnhanced
    call ConnectionTest
    ld hl, FlavorText
    call PrintTextEnhanced
    ld a, 1
    ld [FirstRunFlag], a
    jp SetUpAndLoadFirstMap

WelcomeText:
    text "Oh, hello!"
    next "You seem to be new here."
    para "I rarely see any new people"
    next "here. I'm really surprised."
    para "Your brand new adventure is"
    next "going to start real soon."
    para "In the meantime, let's deal"
    next "with the technical stuff!"
    wait
    
ConnectText:
    text "To play, you'll need to"
    next "connect to a game server."
    para "This is done by utilizing the"
    next "link cable feature in your"
    cont "GameBoy emulator."
    para "Refer to the event's website"
    next "for a list of supported"
    cont "emulators and setup"
    cont "instructions."
    wait

FlavorText:
    text "So, everything's done!"
    para "You are now ready to explore"
    next "Glitchland."
    para "Many secrets wait to be"
    next "discovered in this strange"
    cont "world."
    para "Your progress will be"
    next "saved automatically if"
    cont "deemed necessary."
    para "See you on the other side!"
    wait
