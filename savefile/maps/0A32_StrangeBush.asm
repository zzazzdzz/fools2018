SECTION "Map_0A32", ROM0[$B800]

Map_0A32_Header:
    hdr_tileset         0
    hdr_dimensions      5, 5
    hdr_pointers_a      Map_0A32_Blocks, Map_0A32_TextPointers
    hdr_pointers_b      Map_0A32_Script, Map_0A32_Objects
    hdr_pointers_c      Map_0A32_InitScript, Map_0A32_RAMScript
    hdr_palette         $06
    hdr_music           MUSIC_ROUTES2, AUDIO_1
    hdr_connection      NORTH, $0932, 6, 18
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_0A32_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        2, 5, $01
    hdr_object_count    0

Map_0A32_RAMScript:
    rs_write_2 $c6f9, $0a, $4d
    rs_write_2 $c704, $0a, $4d
    rs_end

Map_0A32_Blocks:
    db $0f,$0f,$0f,$0a,$4d
    db $62,$51,$51,$0a,$4d
    db $4e,$4c,$0a,$0a,$4d
    db $50,$52,$52,$52,$4f
    db $0f,$0f,$0f,$0f,$0f

Map_0A32_TextPointers:
    dw Map_0A32_TX1

Map_0A32_InitScript:
    ret
Map_0A32_Script:
    ldh a, [$f5]
    and SELECT
    ret z
    ld hl, MapScriptGeneralPurpose
    set 0, [hl]
    call OpenTextboxInOverworld
    ld hl, Map_0A32_YouDidIt
    call PrintTextEnhanced
    ld a, [MapScriptGeneralPurpose]
    cp $07
    jr z, .final
    call CloseTextboxInOverworld
    ret
.final
    ld hl, Map_0A32_Finished
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
    
Map_0A32_TX1:
    TX_ASM
    jp EnhancedTextOnly
    tx_braille
    text "PRESS_SELECT"
    done

Map_0A32_YouDidIt:
    text "It sounded as if a door"
    next "opened somewhere far away."
    tx_snd SFX_GO_INSIDE
    wait

Map_0A32_Finished:
    text "You fall into a cave, as the"
    next "ground beneath you crumbles."
    wait

