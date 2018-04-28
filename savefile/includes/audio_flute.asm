; === audio_flute.asm
; Audio data for the Flute music.
; It's a remix of the Gen II second route theme.

FluteMusic_Pointers:
    dw $c780 + (FluteMusic_Empty - FluteMusic_StartOffset)
    dw $c780 + (FluteMusic_Empty - FluteMusic_StartOffset)
    dw $c780 + (FluteMusic_Ch3 - FluteMusic_StartOffset)
    dw $c780 + (FluteMusic_Empty - FluteMusic_StartOffset)

FluteMusic_StartOffset:
FluteMusic_Ch3_sub_0:
    notetype 7, 1, 2
    octave 5
    F_ 13
    notetype 1, 1, 2
    rest 5
    E_ 15
    rest 3
    endchannel
FluteMusic_Ch3_sub_1:
    notetype 6, 1, 2
    C_ 3
    notetype 1, 1, 2
    rest 3
    endchannel
FluteMusic_Ch3::
    tempo 180
    vibrato 24, 2, 8
    notetype 12, 1, 2
    notetype 6, 1, 2
    octave 4
    G_ 1
    notetype 12, 1, 2
    rest 4
    notetype 1, 1, 2
    rest 3
    G_ 9
    rest 3
    G_ 6
    rest 3
    G_ 6
    rest 12
    G_ 6
    rest 15
    G_ 6
    notetype 6, 1, 2
    rest 5
    notetype 1, 1, 2
    G_ 9
    notetype 12, 1, 2
    rest 4
    notetype 1, 1, 2
    rest 3
    G_ 6
    rest 3
    G_ 6
    rest 3
    G_ 6
    rest 12
    G_ 9
    rest 12
FluteMusic_Ch3_LoopPoint:
    D_ 6
    rest 3
    E_ 6
    rest 3
    F_ 6
    rest 3
    F# 9
    rest 3
    notetype 7, 1, 2
    G_ 13
    notetype 1, 1, 2
    rest 5
    octave 5
    D_ 15
    rest 3
    octave 4
    B_ 15
    rest 3
    G_ 9
    rest 12
    callchannel ($c780 - FluteMusic_StartOffset + FluteMusic_Ch3_sub_0)
    notetype 6, 1, 2
    D_ 3
    notetype 1, 1, 2
    rest 3
    C_ 15
    rest 3
    D_ 6
    rest 3
    E_ 6
    rest 3
    D_ 9
    rest 3
    E_ 6
    rest 3
    notetype 8, 1, 2
    D_ 14
    notetype 1, 1, 2
    rest 2
    octave 4
    B_ 6
    rest 3
    octave 5
    C_ 9
    rest 3
    octave 4
    B_ 6
    rest 3
    octave 5
    C_ 6
    rest 3
    notetype 10, 1, 2
    octave 4
    B_ 11
    notetype 4, 1, 2
    rest 1
    notetype 7, 1, 2
    octave 5
    C_ 13
    notetype 1, 1, 2
    rest 5
    callchannel ($c780 - FluteMusic_StartOffset + FluteMusic_Ch3_sub_1)
    octave 4
    A_ 15
    rest 3
    notetype 6, 1, 2
    F_ 3
    notetype 1, 1, 2
    rest 3
    callchannel ($c780 - FluteMusic_StartOffset + FluteMusic_Ch3_sub_0)
    D_ 15
    rest 3
    callchannel ($c780 - FluteMusic_StartOffset + FluteMusic_Ch3_sub_1)
    notetype 6, 1, 2
    octave 4
    B_ 9
    notetype 1, 1, 2
    rest 3
    G_ 6
    rest 12
    notetype 5, 1, 2
    octave 5
    D_ 15
    notetype 1, 1, 2
    rest 3
    notetype 6, 1, 2
    octave 4
    G_ 9
    notetype 1, 1, 2
    rest 3
    D_ 6
    rest 15
    notetype 12, 1, 2
    B_ 6
    notetype 1, 1, 2
    rest 3
    callchannel ($c780 - FluteMusic_StartOffset + FluteMusic_Ch3_sub_1)
    notetype 3, 1, 2
    A_ 11
    rest 1
    B_ 12
    rest 1
    octave 5
    C_ 12
    rest 1
    D_ 5
    rest 1
    notetype 5, 1, 2
    F_ 15
    notetype 1, 1, 2
    rest 3
    notetype 5, 1, 2
    A_ 15
    notetype 1, 1, 2
    rest 3
    G_ 15
    rest 3
    notetype 10, 1, 2
    D_ 10
    notetype 5, 1, 2
    rest 7
    notetype 12, 1, 2
    C_ 2
    notetype 1, 1, 2
    rest 15
    notetype 3, 1, 2
    octave 4
    B_ 11
    rest 1
    A_ 12
    rest 1
    G_ 12
    rest 7
    A_ 9
    rest 4
    B_ 12
    rest 1
    octave 5
    C_ 12
    rest 1
    D_ 2
    rest 4
    notetype 5, 1, 2
    F_ 15
    notetype 1, 1, 2
    rest 3
    notetype 12, 1, 2
    octave 6
    C_ 6
    notetype 1, 1, 2
    rest 3
    octave 5
    B_ 9
    rest 12
    notetype 12, 1, 2
    G_ 11
    notetype 1, 1, 2
    rest 3
    B_ 6
    rest 12
    notetype 12, 1, 2
    G_ 11
    rest 3
    notetype 1, 1, 2
    octave 4
    loopchannel 0, ($c780 - FluteMusic_StartOffset + FluteMusic_Ch3_LoopPoint)
FluteMusic_Empty:
    endchannel