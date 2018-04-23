SECTION "Map_0B2D", ROM0[$B800]

Map_0B2D_Header:
    hdr_tileset         0
    hdr_dimensions      5, 5
    hdr_pointers_a      Map_0B2D_Blocks, Map_0B2D_TextPointers
    hdr_pointers_b      Map_0B2D_Script, Map_0B2D_Objects
    hdr_pointers_c      Map_0B2D_InitScript, Map_0B2D_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0932, 6, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0B2D_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        2, 4, $01
    hdr_object_count    0

Map_0B2D_RAMScript:
    rs_write_2 $c746, $0a, $4d
    rs_write_2 $c751, $0a, $4d
    rs_end

Map_0B2D_Blocks:
    db $0f,$0f,$0f,$0f,$0f
    db $62,$51,$51,$51,$63
    db $4e,$40,$0a,$0a,$4d
    db $50,$52,$52,$0a,$4d
    db $0f,$0f,$0f,$0a,$4d

Map_0B2D_TextPointers:
    dw Map_0B2D_TX1

Map_0B2D_InitScript:
    ret
Map_0B2D_Script:
    ld a, [$d354]
    and %10000111
    cp $85
    ret nz
    ld a, 1
    ld [$d354], a
    ld hl, MapScriptGeneralPurpose
    set 1, [hl]
    call OpenTextboxInOverworld
    ld hl, Map_0B2D_YouDidIt
    call PrintTextEnhanced
    ld a, [MapScriptGeneralPurpose]
    cp $07
    jr z, .final
    call CloseTextboxInOverworld
    ret
.final
    ld hl, Map_0B2D_Finished
    call PrintTextEnhanced
    call CloseTextboxInOverworld
    ld a, SFX_CUT
    call PlaySound
    call WaitForSoundToFinish
    ld a, $8a
    ld [MapWarpTargetIDL], a
    ld a, $09
    ld [MapWarpTargetIDH], a
    ld a, 5
    ld [MapWarpTargetX], a
    ld [MapWarpTargetY], a
    jp StartLoadingMap

Map_0B2D_TX1:
    TX_ASM
    jp EnhancedTextOnly
    tx_braille
    text "TEXT_SPEED_SLOW"
    next "ANIMATION__OFF"
    done

Map_0B2D_YouDidIt:
    text "It sounded as if a door"
    next "opened somewhere far away."
    tx_snd SFX_GO_INSIDE
    wait

Map_0B2D_Finished:
    text "You fall into a cave, as the"
    next "ground beneath you crumbles."
    wait

