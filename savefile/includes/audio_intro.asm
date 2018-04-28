; === audio_intro.asm
; Audio data for the communication setup music.
; It's a remix of the Tomodachi Life Mii Editor theme.

; Actually, I just ripped the MIDI from Tomodachi Collection,
; since both games share pretty much the same Mii Editor theme.

Intro1_Pointers:
    dw $c6f0 + (Intro1_Ch1 - Intro1_Ch1OffsetStart)
    dw $dcd0 + (Intro1_Ch2 - Intro1_Ch2OffsetStart)
    dw $d8a0 + (Intro1_Ch3 - Intro1_Ch3OffsetStart)
    dw $d8a0 + (Intro1_Ch4 - Intro1_Ch3OffsetStart)

Intro1_Ch1OffsetStart:
Intro1_Ch1_sub_0:
    rest 3
    notetype 6, 15, 0
    octave 4
    F_ 2
    rest 2
    G_ 2
    rest 2
    G# 2
    rest 2
    A# 2
    rest 2
    octave 5
    C_ 2
    rest 6
    C_ 2
    rest 2
    C_ 2
    rest 6
    D# 2
    rest 2
    D_ 2
    rest 2
    C_ 2
    rest 2
    D_ 2
    rest 6
    octave 4
    A# 2
    rest 2
    G_ 2
    rest 14
    G_ 2
    G# 2
    G_ 2
    rest 2
    F_ 2
    rest 2
    D# 2
    rest 2
    C_ 2
    rest 2
    D# 2
    rest 2
    F_ 2
    rest 2
    A# 2
    rest 2
    G_ 5
    rest 3
    notetype 6, 9, 0
    octave 3
    D# 1
    rest 3
    notetype 6, 10, 0
    D# 3
    rest 1
    notetype 6, 9, 0
    D_ 1
    rest 3
    notetype 6, 15, 0
    octave 4
    F_ 2
    rest 2
    G_ 2
    rest 2
    G# 2
    rest 2
    A# 2
    rest 2
    octave 5
    C_ 2
    rest 6
    C_ 2
    rest 2
    C_ 2
    rest 6
    D# 2
    rest 2
    D_ 2
    rest 2
    C_ 2
    rest 2
    D_ 2
    rest 6
    octave 4
    A# 2
    rest 2
    G_ 2
    rest 14
    G_ 2
    notetype 6, 14, 0
    G# 2
    notetype 6, 15, 0
    G_ 2
    rest 2
    endchannel
Intro1_Ch1_sub_1:
    rest 1
    notetype 12, 15, 0
    G_ 1
    rest 1
    notetype 12, 14, 0
    endchannel
Intro1_Ch1_sub_2:
    rest 3
    notetype 6, 11, 0
    D# 5
    rest 3
    notetype 6, 12, 0
    octave 2
    G# 6
    rest 2
    endchannel
Intro1_Ch1_sub_3:
    rest 2
    notetype 6, 15, 0
    D# 2
    rest 2
    endchannel
Intro1_Ch1_sub_4:
    octave 3
    D# 1
    rest 7
    notetype 6, 11, 0
    octave 2
    G# 5
    rest 3
    endchannel
Intro1_Ch1::
    tempo 160
    vibrato 16, 1, 2
    volume 2, 2
    duty 3
    toggleperfectpitch
    notetype 12, 11, 0
    octave 3
    D_ 1
    rest 3
    notetype 6, 13, 0
    D_ 5
    rest 3
    notetype 6, 11, 0
    G_ 1
    rest 3
    notetype 6, 13, 0
    G_ 5
    rest 3
    notetype 6, 12, 0
    C_ 6
    rest 2
    notetype 6, 13, 0
    C_ 5
    rest 3
    notetype 6, 11, 0
    F_ 1
    rest 3
    notetype 6, 13, 0
    F_ 1
    rest 7
    notetype 6, 11, 0
    F_ 5
    rest 3
    octave 2
    A# 2
    rest 6
    notetype 6, 13, 0
    A# 3
    rest 5
    notetype 6, 11, 0
    octave 3
    D# 1
    rest 3
    notetype 6, 12, 0
    D# 5
    rest 3
    notetype 6, 11, 0
    octave 2
    G# 6
    rest 2
    G# 5
    rest 3
    G# 1
    rest 3
    notetype 6, 13, 0
    callchannel (Intro1_Ch1_sub_4 - Intro1_Ch1OffsetStart + $c6f0)
LoopPointCh1:
    notetype 6, 15, 0
    octave 4
    F_ 2
    rest 2
    notetype 6, 14, 0
    D# 2
    rest 2
    notetype 6, 15, 0
    F_ 2
    rest 2
    notetype 6, 14, 0
    G_ 2
    notetype 12, 14, 0
    rest 9
    notetype 12, 15, 0
    G_ 1
    rest 1
    notetype 12, 14, 0
    F_ 1
    callchannel (Intro1_Ch1_sub_1 - Intro1_Ch1OffsetStart + $c6f0)
    G# 1
    rest 9
    notetype 12, 15, 0
    G# 1
    rest 1
    notetype 12, 14, 0
    G_ 1
    rest 1
    notetype 12, 15, 0
    G# 1
    rest 1
    notetype 12, 14, 0
    A# 1
    rest 3
    notetype 12, 15, 0
    G_ 1
    rest 3
    D# 1
    rest 3
    C_ 1
    rest 3
    F_ 1
    rest 9
    F_ 1
    rest 1
    notetype 12, 14, 0
    D# 1
    rest 1
    notetype 12, 15, 0
    F_ 1
    rest 1
    notetype 12, 14, 0
    G_ 1
    rest 9
    notetype 12, 15, 0
    G_ 1
    rest 1
    notetype 12, 13, 0
    F_ 1
    rest 1
    notetype 12, 15, 0
    G_ 1
    rest 1
    notetype 12, 13, 0
    G# 1
    rest 9
    notetype 12, 15, 0
    G# 1
    rest 1
    notetype 12, 13, 0
    G_ 1
    rest 1
    notetype 12, 15, 0
    G# 1
    rest 1
    notetype 12, 13, 0
    A# 1
    rest 3
    notetype 12, 15, 0
    G_ 1
    rest 3
    octave 5
    C_ 1
    rest 9
    octave 4
    G# 1
    rest 3
    notetype 12, 14, 0
    A# 1
    rest 3
    notetype 12, 15, 0
    octave 5
    C_ 1
    rest 1
    notetype 12, 14, 0
    C_ 1
    rest 1
    C_ 1
    rest 1
    C_ 1
    rest 1
    notetype 12, 15, 0
    D# 1
    rest 1
    notetype 12, 14, 0
    D_ 1
    rest 1
    notetype 12, 15, 0
    C_ 1
    rest 1
    octave 4
    A# 1
    rest 3
    G_ 1
    rest 3
    D# 1
    rest 9
    F_ 1
    rest 1
    notetype 12, 14, 0
    F_ 1
    rest 1
    F_ 1
    rest 1
    notetype 12, 15, 0
    F_ 1
    rest 1
    F_ 1
    rest 1
    G_ 1
    rest 1
    notetype 12, 14, 0
    G# 1
    rest 1
    notetype 12, 15, 0
    octave 5
    C_ 1
    rest 3
    octave 4
    A# 1
    rest 9
    G_ 1
    rest 1
    notetype 12, 14, 0
    G# 1
    callchannel (Intro1_Ch1_sub_1 - Intro1_Ch1OffsetStart + $c6f0)
    G_ 1
    callchannel (Intro1_Ch1_sub_1 - Intro1_Ch1OffsetStart + $c6f0)
    G_ 1
    callchannel (Intro1_Ch1_sub_1 - Intro1_Ch1OffsetStart + $c6f0)
    F_ 1
    rest 1
    notetype 12, 15, 0
    D# 1
    rest 1
    D_ 1
    rest 3
    D# 1
    rest 3
    octave 5
    C_ 1
    rest 3
    octave 4
    G_ 1
    rest 3
    F_ 1
    rest 9
    A_ 1
    rest 5
    A# 1
    rest 3
    notetype 6, 11, 0
    C_ 5
    rest 3
    C_ 1
    rest 3
    notetype 6, 10, 0
    D# 5
    rest 3
    notetype 6, 11, 0
    C_ 1
    rest 3
    D# 1
    rest 3
    notetype 6, 10, 0
    D_ 1
    rest 3
    notetype 6, 9, 0
    octave 3
    G# 1
    rest 3
    A# 1
    rest 3
    notetype 6, 10, 0
    G_ 1
    callchannel (Intro1_Ch1_sub_0 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 14, 0
    F_ 2
    callchannel (Intro1_Ch1_sub_3 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 14, 0
    C_ 2
    callchannel (Intro1_Ch1_sub_3 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 14, 0
    F_ 2
    rest 6
    notetype 6, 15, 0
    D# 5
    rest 3
    notetype 6, 9, 0
    octave 3
    F_ 1
    rest 3
    notetype 6, 10, 0
    D# 3
    rest 1
    notetype 6, 9, 0
    octave 2
    A# 1
    callchannel (Intro1_Ch1_sub_0 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 13, 0
    F_ 2
    callchannel (Intro1_Ch1_sub_3 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 13, 0
    C_ 2
    callchannel (Intro1_Ch1_sub_3 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 13, 0
    F_ 2
    rest 6
    notetype 6, 15, 0
    D# 8
    rest 4
    notetype 6, 12, 0
    octave 3
    C_ 3
    rest 5
    G_ 1
    rest 3
    notetype 6, 11, 0
    C_ 5
    rest 3
    notetype 6, 12, 0
    F_ 6
    rest 2
    F_ 5
    rest 3
    F_ 1
    rest 3
    F_ 1
    rest 7
    notetype 6, 11, 0
    octave 2
    A# 5
    rest 3
    notetype 6, 12, 0
    octave 3
    D# 2
    rest 6
    D# 3
    rest 5
    F_ 1
    callchannel (Intro1_Ch1_sub_2 - Intro1_Ch1OffsetStart + $c6f0)
    G# 5
    rest 3
    G# 1
    rest 3
    callchannel (Intro1_Ch1_sub_4 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 12, 0
    octave 3
    D_ 4
    rest 4
    D_ 3
    rest 5
    G_ 1
    rest 3
    notetype 6, 11, 0
    G_ 5
    rest 3
    notetype 6, 12, 0
    C_ 6
    rest 2
    C_ 5
    rest 3
    F_ 1
    rest 3
    F_ 1
    rest 7
    notetype 6, 11, 0
    F_ 5
    rest 3
    notetype 6, 12, 0
    octave 2
    A# 2
    rest 6
    A# 3
    rest 5
    octave 3
    D# 1
    callchannel (Intro1_Ch1_sub_2 - Intro1_Ch1OffsetStart + $c6f0)
    notetype 6, 11, 0
    G# 1
    rest 3
    notetype 6, 10, 0
    G# 1
    rest 3
    notetype 6, 12, 0
    F_ 6
    rest 2
    notetype 6, 10, 0
    octave 3
    D# 2
    rest 2
    notetype 6, 12, 0
    F_ 2
    rest 2
    F# 6
    rest 2
    notetype 6, 10, 0
    D# 2
    rest 2
    F# 2
    rest 2
    notetype 6, 9, 0
    octave 2
    G# 6
    rest 2
    notetype 6, 11, 0
    A# 2
    rest 2
    octave 3
    G# 6
    rest 2
    loopchannel 0, (LoopPointCh1 - Intro1_Ch1OffsetStart + $c6f0)
    
Intro1_Ch2OffsetStart:
Intro1_Ch2::
    tempo 160
    vibrato 16, 1, 2
    volume 2, 2
    duty 3
    toggleperfectpitch
    notetype 12, 11, 0
    octave 3
    G_ 1
    rest 3
    notetype 6, 13, 0
    G_ 5
    rest 3
    notetype 6, 11, 0
    C_ 1
    rest 3
    notetype 6, 13, 0
    C_ 5
    rest 3
    notetype 6, 12, 0
    F_ 6
    rest 2
    notetype 6, 13, 0
    F_ 5
    rest 3
    notetype 6, 11, 0
    C_ 1
    rest 3
    notetype 6, 13, 0
    octave 2
    A# 1
    rest 7
    notetype 6, 11, 0
    A# 5
    rest 3
    octave 3
    D# 2
    rest 6
    notetype 6, 13, 0
    D# 3
    rest 5
    notetype 6, 11, 0
    octave 2
    G# 1
    rest 3
    notetype 6, 12, 0
    G# 5
    rest 3
    notetype 6, 11, 0
    octave 3
    D# 6
    rest 2
    C_ 5
    rest 3
    D_ 1
    rest 3
    notetype 6, 13, 0
    callchannel (Intro1_Ch2_sub_9 - Intro1_Ch2CallChannels + $d163)
LoopPointCh2:
    notetype 6, 13, 0
    octave 3
    callchannel (Intro1_Ch2_sub_2 - Intro1_Ch2CallChannels + $d163)
    D# 1
    callchannel (Intro1_Ch2_sub_4 - Intro1_Ch2CallChannels + $d163)
    A# 4
    rest 4
    A# 3
    rest 5
    D# 1
    rest 3
    notetype 6, 10, 0
    D# 5
    rest 3
    notetype 6, 11, 0
    D# 2
    rest 6
    G# 5
    rest 3
    D# 1
    callchannel (Intro1_Ch2_sub_4 - Intro1_Ch2CallChannels + $d163)
    callchannel (Intro1_Ch2_sub_2 - Intro1_Ch2CallChannels + $d163)
    G# 1
    callchannel (Intro1_Ch2_sub_4 - Intro1_Ch2CallChannels + $d163)
    A# 4
    rest 4
    A# 3
    rest 5
    octave 4
    C_ 1
    rest 3
    notetype 6, 10, 0
    octave 3
    A# 5
    rest 3
    notetype 6, 11, 0
    D# 6
    rest 2
    D# 5
    rest 3
    D# 1
    rest 3
    D# 1
    rest 7
    notetype 6, 10, 0
    D# 5
    callchannel (Intro1_Ch2_sub_10 - Intro1_Ch2CallChannels + $d163)
    octave 3
    F_ 1
    callchannel (Intro1_Ch2_sub_7 - Intro1_Ch2CallChannels + $d163)
    A# 6
    rest 2
    A# 5
    rest 3
    A# 1
    rest 3
    A# 1
    rest 7
    notetype 6, 10, 0
    A# 5
    callchannel (Intro1_Ch2_sub_10 - Intro1_Ch2CallChannels + $d163)
    C_ 1
    rest 3
    notetype 6, 10, 0
    C_ 5
    rest 3
    notetype 6, 11, 0
    octave 3
    A# 4
    rest 4
    G# 3
    rest 1
    octave 4
    C# 1
    rest 3
    D# 1
    rest 3
    octave 3
    G_ 1
    rest 7
    notetype 6, 10, 0
    G_ 5
    rest 3
    notetype 6, 11, 0
    A_ 4
    rest 4
    octave 4
    C_ 3
    rest 5
    octave 3
    B_ 1
    rest 3
    notetype 6, 10, 0
    F_ 5
    rest 3
    notetype 6, 11, 0
    D# 6
    rest 2
    A# 5
    rest 3
    A# 1
    rest 3
    D# 1
    rest 7
    notetype 6, 10, 0
    A# 5
    rest 3
    notetype 6, 11, 0
    D# 4
    rest 4
    D# 3
    rest 5
    G_ 1
    rest 3
    notetype 6, 10, 0
    G_ 5
    rest 3
    notetype 6, 11, 0
    G# 6
    rest 2
    G# 5
    rest 3
    G# 1
    callchannel (Intro1_Ch2_sub_7 - Intro1_Ch2CallChannels + $d163)
    G# 1
    rest 3
    octave 4
    C_ 1
    rest 3
    notetype 6, 10, 0
    octave 3
    G# 1
    rest 3
    notetype 6, 9, 0
    octave 4
    C_ 1
    rest 3
    octave 3
    G# 1
    rest 3
    notetype 6, 10, 0
    A# 1
    rest 7
    notetype 6, 11, 0
    octave 4
    C# 1
    rest 3
    notetype 6, 9, 0
    C# 1
    rest 3
    notetype 6, 10, 0
    octave 3
    A# 1
    rest 3
    octave 4
    callchannel (Intro1_Ch2_sub_3 - Intro1_Ch2CallChannels + $d163)
    callchannel (Intro1_Ch2_sub_1 - Intro1_Ch2CallChannels + $d163)
    callchannel (Intro1_Ch2_sub_6 - Intro1_Ch2CallChannels + $d163)
    notetype 6, 11, 0
    D# 1
    callchannel (Intro1_Ch2_sub_5 - Intro1_Ch2CallChannels + $d163)
    A# 1
    rest 7
    notetype 6, 11, 0
    octave 3
    D_ 1
    rest 3
    notetype 6, 10, 0
    C_ 1
    rest 7
    notetype 6, 11, 0
    A# 1
    rest 3
    notetype 6, 9, 0
    callchannel (Intro1_Ch2_sub_0 - Intro1_Ch2CallChannels + $d163)
    notetype 6, 11, 0
    G_ 1
    rest 3
    notetype 6, 10, 0
    F_ 1
    rest 3
    notetype 6, 9, 0
    D# 1
    rest 3
    notetype 6, 11, 0
    D_ 1
    rest 11
    callchannel (Intro1_Ch2_sub_1 - Intro1_Ch2CallChannels + $d163)
    notetype 6, 10, 0
    G_ 1
    rest 3
    notetype 6, 8, 0
    F_ 1
    rest 3
    notetype 6, 9, 0
    D# 1
    rest 7
    notetype 6, 11, 0
    octave 4
    D# 1
    rest 3
    notetype 6, 9, 0
    C_ 1
    rest 3
    octave 3
    A# 1
    rest 7
    notetype 6, 11, 0
    A# 1
    rest 3
    notetype 6, 9, 0
    G# 1
    callchannel (Intro1_Ch2_sub_8 - Intro1_Ch2CallChannels + $d163)
    rest 3
    notetype 6, 8, 0
    A# 1
    rest 3
    notetype 6, 10, 0
    G_ 5
    callchannel (Intro1_Ch2_sub_5 - Intro1_Ch2CallChannels + $d163)
    A# 3
    rest 1
    notetype 6, 9, 0
    octave 3
    D_ 1
    rest 3
    notetype 6, 10, 0
    C# 3
    rest 1
    notetype 6, 9, 0
    C# 1
    rest 3
    notetype 6, 10, 0
    G_ 3
    rest 1
    notetype 6, 9, 0
    octave 4
    C# 1
    rest 3
    notetype 6, 10, 0
    callchannel (Intro1_Ch2_sub_3 - Intro1_Ch2CallChannels + $d163)
    octave 2
    A# 1
    rest 3
    notetype 6, 10, 0
    octave 3
    G# 1
    rest 3
    notetype 6, 11, 0
    A_ 1
    rest 3
    callchannel (Intro1_Ch2_sub_6 - Intro1_Ch2CallChannels + $d163)
    D# 1
    callchannel (Intro1_Ch2_sub_5 - Intro1_Ch2CallChannels + $d163)
    A# 1
    rest 7
    notetype 6, 9, 0
    octave 3
    D_ 1
    rest 3
    C_ 1
    rest 7
    A# 1
    rest 3
    callchannel (Intro1_Ch2_sub_0 - Intro1_Ch2CallChannels + $d163)
    G_ 1
    rest 3
    notetype 6, 10, 0
    F_ 1
    rest 3
    D# 1
    rest 3
    notetype 6, 9, 0
    D_ 1
    rest 11
    notetype 6, 11, 0
    callchannel (Intro1_Ch2_sub_1 - Intro1_Ch2CallChannels + $d163)
    notetype 6, 10, 0
    G_ 1
    rest 3
    F_ 1
    rest 3
    notetype 6, 11, 0
    D# 1
    rest 7
    notetype 6, 10, 0
    octave 4
    D# 1
    rest 3
    notetype 6, 9, 0
    C_ 1
    rest 3
    notetype 6, 11, 0
    octave 3
    A# 1
    callchannel (Intro1_Ch2_sub_8 - Intro1_Ch2CallChannels + $d163)
    rest 7
    notetype 6, 10, 0
    G# 1
    rest 3
    notetype 6, 9, 0
    G# 1
    rest 3
    notetype 6, 10, 0
    G# 1
    rest 3
    C_ 8
    rest 4
    notetype 6, 12, 0
    G_ 3
    rest 5
    D_ 1
    rest 3
    notetype 6, 11, 0
    G_ 5
    rest 3
    notetype 6, 12, 0
    C_ 6
    rest 2
    octave 2
    A# 5
    rest 3
    A# 1
    rest 3
    octave 3
    C_ 1
    rest 7
    notetype 6, 11, 0
    F_ 5
    rest 3
    notetype 6, 12, 0
    octave 2
    A_ 2
    rest 6
    A_ 3
    rest 5
    A_ 1
    rest 3
    notetype 6, 11, 0
    A_ 5
    rest 3
    notetype 6, 12, 0
    octave 3
    D# 6
    rest 2
    C_ 5
    rest 3
    D_ 1
    rest 3
    callchannel (Intro1_Ch2_sub_9 - Intro1_Ch2CallChannels + $d163)
    notetype 6, 12, 0
    G_ 4
    rest 4
    G_ 3
    rest 5
    C_ 1
    rest 3
    notetype 6, 11, 0
    C_ 5
    rest 3
    notetype 6, 12, 0
    F_ 6
    rest 2
    F_ 5
    rest 3
    C_ 1
    rest 3
    octave 2
    A# 1
    rest 7
    notetype 6, 11, 0
    A# 5
    rest 3
    notetype 6, 12, 0
    octave 3
    D# 2
    rest 6
    D# 3
    rest 5
    octave 2
    G# 1
    rest 3
    notetype 6, 11, 0
    G# 5
    rest 3
    notetype 6, 12, 0
    octave 3
    D# 6
    rest 2
    notetype 6, 11, 0
    C_ 1
    rest 3
    notetype 6, 10, 0
    D# 1
    rest 3
    notetype 6, 12, 0
    D_ 6
    rest 2
    notetype 6, 10, 0
    octave 2
    G_ 2
    rest 2
    notetype 6, 12, 0
    G# 2
    rest 2
    A# 6
    rest 2
    notetype 6, 10, 0
    F# 2
    rest 2
    A# 2
    rest 2
    notetype 6, 9, 0
    octave 3
    F_ 6
    rest 2
    notetype 6, 11, 0
    F# 2
    rest 2
    octave 2
    B_ 6
    rest 2
    loopchannel 0, (LoopPointCh2 - Intro1_Ch2OffsetStart + $dcd0)
    
Intro1_Ch2CallChannels:
Intro1_Ch2_sub_0:
    G# 1
    rest 3
    G_ 1
    rest 3
    notetype 6, 10, 0
    F_ 5
    rest 3
    notetype 6, 9, 0
    C_ 1
    rest 3
    notetype 6, 10, 0
    octave 2
    A# 3
    rest 1
    notetype 6, 9, 0
    A# 1
    rest 3
    notetype 6, 10, 0
    octave 3
    C_ 3
    rest 1
    notetype 6, 9, 0
    F_ 1
    rest 3
    notetype 6, 10, 0
    C# 3
    rest 1
    notetype 6, 9, 0
    G_ 1
    rest 3
    endchannel
Intro1_Ch2_sub_1:
    octave 2
    A# 1
    rest 3
    notetype 6, 9, 0
    octave 3
    G# 1
    rest 3
    notetype 6, 11, 0
    A_ 1
    rest 3
    endchannel
Intro1_Ch2_sub_2:
    G_ 4
    rest 4
    G_ 3
    rest 5
    C_ 1
    rest 3
    notetype 6, 10, 0
    C_ 5
    rest 3
    notetype 6, 11, 0
    C_ 2
    rest 6
    G# 5
    rest 3
    endchannel
Intro1_Ch2_sub_3:
    C_ 1
    rest 3
    notetype 6, 9, 0
    C_ 1
    rest 3
    octave 3
    G_ 1
    rest 3
    notetype 6, 10, 0
    octave 4
    C_ 1
    rest 11
    notetype 6, 11, 0
    endchannel
Intro1_Ch2_sub_4:
    rest 3
    D_ 1
    rest 7
    notetype 6, 10, 0
    G# 5
    rest 3
    notetype 6, 11, 0
    endchannel
Intro1_Ch2_sub_5:
    rest 3
    notetype 6, 9, 0
    C_ 1
    rest 3
    notetype 6, 10, 0
    octave 2
    endchannel
Intro1_Ch2_sub_6:
    notetype 6, 9, 0
    G_ 1
    rest 3
    F_ 1
    rest 3
    notetype 6, 10, 0
    D# 1
    rest 7
    endchannel
Intro1_Ch2_sub_7:
    rest 3
    notetype 6, 10, 0
    octave 4
    C_ 5
    rest 3
    notetype 6, 11, 0
    octave 3
    endchannel
Intro1_Ch2_sub_8:
    rest 7
    notetype 6, 10, 0
    A# 1
    rest 3
    notetype 6, 9, 0
    G# 1
    endchannel
Intro1_Ch2_sub_9:
    octave 2
    G# 1
    rest 7
    notetype 6, 11, 0
    octave 3
    F_ 5
    rest 3
    endchannel
Intro1_Ch2_sub_10:
    rest 3
    notetype 6, 11, 0
    octave 4
    C_ 4
    rest 4
    C_ 3
    rest 5
    endchannel
    
Intro1_Ch3OffsetStart:
Intro1_Ch3_sub_0:
    G# 1
    rest 3
    D# 1
    rest 3
    G# 1
    rest 3
    A# 1
    rest 7
    F_ 2
    rest 2
    A# 2
    rest 2
    G# 2
    rest 2
    G_ 1
    rest 3
    A_ 1
    rest 3
    A# 1
    rest 3
    octave 3
    C_ 1
    rest 15
    octave 2
    C_ 2
    rest 2
    F_ 2
    rest 2
    octave 3
    C_ 1
    rest 3
    G_ 1
    rest 3
    octave 2
    F_ 2
    rest 2
    octave 1
    A# 2
    rest 2
    octave 3
    G# 1
    rest 7
    octave 2
    D# 6
    rest 2
    octave 3
    D# 2
    rest 2
    octave 2
    G_ 4
    octave 3
    D# 2
    rest 2
    octave 2
    A# 4
    octave 3
    D# 2
    rest 2
    octave 2
    D# 4
    octave 3
    A# 2
    rest 2
    octave 2
    F_ 1
    rest 3
    G_ 1
    rest 3
    G# 1
    rest 3
    A# 1
    rest 7
    F_ 2
    rest 2
    A# 2
    rest 2
    G# 2
    rest 2
    G_ 1
    rest 3
    A_ 1
    rest 3
    A# 1
    rest 3
    octave 3
    C_ 1
    rest 11
    octave 2
    C_ 6
    rest 2
    F_ 2
    rest 2
    octave 3
    endchannel
Intro1_Ch3_sub_1:
    rest 1
    octave 1
    A# 5
    rest 1
    A# 1
    rest 1
    octave 2
    endchannel
Intro1_Ch3::
    tempo 160
    vibrato 0, 0, 0
    notetype 12, 15, 0
    octave 2
    D# 4
    rest 2
    D# 1
    callchannel (Intro1_Ch3_sub_1 - Intro1_Ch3OffsetStart + $d8a0)
    C# 5
    rest 1
    C# 1
    rest 1
    octave 1
    G# 5
    rest 1
    G# 1
    rest 1
    B_ 5
    rest 1
    B_ 1
    rest 1
    F# 5
    rest 1
    F# 1
    rest 1
    F_ 5
    rest 1
    B_ 1
    rest 1
    A# 1
    rest 1
    octave 2
    A# 3
    rest 1
    octave 1
    A# 1
    rest 1
LoopPointCh3:
    notetype 12, 15, 0
    octave 2
    D# 5
    rest 1
    D# 1
    callchannel (Intro1_Ch3_sub_1 - Intro1_Ch3OffsetStart + $d8a0)
    F_ 5
    rest 1
    F_ 1
    callchannel (Intro1_Ch3_sub_1 - Intro1_Ch3OffsetStart + $d8a0)
    G_ 5
    rest 1
    G_ 1
    rest 1
    C_ 5
    rest 1
    C_ 1
    rest 1
    F_ 5
    rest 1
    F_ 1
    callchannel (Intro1_Ch3_sub_1 - Intro1_Ch3OffsetStart + $d8a0)
    D# 5
    rest 1
    D# 1
    callchannel (Intro1_Ch3_sub_1 - Intro1_Ch3OffsetStart + $d8a0)
    D# 5
    rest 1
    D# 1
    callchannel (Intro1_Ch3_sub_1 - Intro1_Ch3OffsetStart + $d8a0)
    D# 5
    rest 1
    D# 1
    rest 1
    octave 1
    A# 3
    rest 1
    octave 2
    A# 2
    A_ 1
    rest 1
    G# 5
    rest 1
    G# 1
    rest 1
    G_ 5
    rest 1
    G_ 1
    rest 1
    F_ 5
    rest 1
    F_ 1
    rest 1
    octave 1
    A# 5
    rest 1
    octave 2
    F_ 1
    rest 1
    G_ 5
    rest 1
    G_ 1
    rest 1
    C_ 5
    rest 1
    G_ 1
    rest 1
    G# 5
    rest 1
    G# 1
    rest 1
    A# 5
    rest 1
    F_ 1
    rest 1
    octave 1
    A# 5
    rest 1
    octave 2
    A# 1
    rest 1
    D# 3
    rest 1
    octave 3
    D# 2
    octave 2
    A# 1
    rest 1
    D_ 5
    rest 1
    D_ 1
    rest 1
    octave 1
    G_ 5
    rest 1
    G_ 1
    rest 1
    octave 2
    C_ 5
    rest 1
    octave 3
    C_ 1
    rest 1
    octave 2
    A# 5
    rest 1
    A# 1
    rest 1
    A_ 5
    rest 1
    A_ 1
    rest 1
    F_ 5
    rest 1
    F_ 1
    callchannel (Intro1_Ch3_sub_1 - Intro1_Ch3OffsetStart + $d8a0)
    F_ 5
    rest 1
    F_ 1
    rest 1
    notetype 6, 15, 0
    octave 1
    A# 1
    rest 3
    octave 2
    C_ 1
    rest 3
    D_ 1
    rest 3
    D# 1
    rest 15
    D# 2
    rest 2
    callchannel (Intro1_Ch3_sub_0 - Intro1_Ch3OffsetStart + $d8a0)
    C_ 1
    rest 3
    G_ 1
    rest 3
    octave 2
    F_ 2
    rest 2
    C# 2
    rest 2
    octave 3
    C# 2
    rest 2
    G# 2
    rest 2
    octave 2
    D# 6
    rest 2
    octave 3
    D# 2
    rest 2
    octave 2
    G_ 4
    octave 3
    D# 2
    rest 2
    octave 2
    A# 4
    octave 3
    D# 2
    rest 2
    octave 2
    D# 4
    octave 3
    D# 2
    rest 2
    octave 2
    callchannel (Intro1_Ch3_sub_0 - Intro1_Ch3OffsetStart + $d8a0)
    C_ 2
    rest 2
    G_ 2
    rest 2
    octave 2
    F_ 2
    rest 2
    octave 1
    A# 2
    rest 2
    octave 2
    A# 1
    rest 3
    octave 3
    F_ 1
    rest 3
    octave 2
    G# 10
    rest 6
    G# 2
    rest 2
    D# 10
    rest 2
    D# 2
    rest 2
    G_ 10
    rest 2
    G_ 2
    rest 2
    D_ 10
    rest 2
    D_ 2
    rest 2
    F# 10
    rest 2
    F# 2
    rest 2
    D# 10
    rest 2
    D# 2
    rest 2
    F_ 10
    rest 2
    octave 1
    B_ 2
    rest 2
    A# 2
    rest 2
    octave 2
    A# 6
    rest 2
    octave 1
    A# 2
    rest 2
    octave 2
    D# 10
    rest 2
    D# 2
    rest 2
    octave 1
    A# 10
    rest 2
    A# 2
    rest 2
    octave 2
    C# 10
    rest 2
    C# 2
    rest 2
    octave 1
    G# 10
    rest 2
    G# 2
    rest 2
    B_ 10
    rest 2
    B_ 2
    rest 2
    F# 10
    rest 2
    F_ 8
    octave 2
    C_ 2
    rest 2
    F_ 2
    rest 2
    octave 1
    A# 6
    rest 2
    octave 2
    F_ 2
    rest 2
    A# 2
    rest 2
    octave 1
    G# 8
    octave 2
    D# 2
    rest 2
    G# 2
    rest 2
    C# 6
    rest 2
    G# 2
    rest 2
    octave 3
    C# 4
    octave 2
    C# 2
    rest 2
    loopchannel 0, (LoopPointCh3 - Intro1_Ch3OffsetStart + $d8a0)
Intro1_Ch4::
Intro1_OffsetEnd:
    endchannel
