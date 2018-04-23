SECTION "Map_1337", ROM0[$B800]

Map_1337_Header:
    hdr_tileset         8
    hdr_dimensions      1, 1
    hdr_pointers_a      Map_1337_Blocks, Map_1337_TextPointers
    hdr_pointers_b      Map_1337_Script, Map_1337_Objects
    hdr_pointers_c      Map_1337_InitScript, Map_1337_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0932, 6, 18
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_1337_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    0

Map_1337_RAMScript:
    rs_write_2 $c6fb, $0a, $4d
    rs_write_2 $c706, $0a, $4d
    rs_end

Map_1337_Blocks:
    db $0f

Map_1337_TextPointers:
    ; pass

Map_1337_InitScript:
    ret
Map_1337_Script:
    call OpenTextboxInOverworld
    ld hl, Map_1337_Explanation
    call PrintTextEnhanced
    ld bc, $1337
    ld de, $dead
    call CompleteEvent
    ld a, $20
    ld [MapWarpTargetIDL], a
    ld a, $31
    ld [MapWarpTargetIDH], a
    ld a, 6
    ld [MapWarpTargetX], a
    ld a, 10
    ld [MapWarpTargetY], a
    jp StartLoadingMap
    
Map_1337_Explanation:
    text "You did really well."
    wait

