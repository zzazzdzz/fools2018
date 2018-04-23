SECTION "Map_Unexistent", ROM0[$B800]

Map_Unexistent_Header:
    hdr_tileset         8
    hdr_dimensions      1, 1
    hdr_pointers_a      Map_Unexistent_Blocks, Map_Unexistent_TextPointers
    hdr_pointers_b      Map_Unexistent_Script, Map_Unexistent_Objects
    hdr_pointers_c      Map_Unexistent_InitScript, Map_Unexistent_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0932, 6, 18
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_Unexistent_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      1
    hdr_signpost        2, 5, $01
    hdr_object_count    0

Map_Unexistent_RAMScript:
    rs_write_2 $c6fb, $0a, $4d
    rs_write_2 $c706, $0a, $4d
    rs_end

Map_Unexistent_Blocks:
    db $0f

Map_Unexistent_TextPointers:
    ; pass

Map_Unexistent_InitScript:
    ret
Map_Unexistent_Script:
    call OpenTextboxInOverworld
    ld hl, Map_Unexistent_Explanation
    call PrintTextEnhanced
    ld a, $10
    ld [MapWarpTargetIDL], a
    ld a, $01
    ld [MapWarpTargetIDH], a
    ld a, 10
    ld [MapWarpTargetX], a
    ld a, 12
    ld [MapWarpTargetY], a
    jp StartLoadingMap
    
Map_Unexistent_Explanation:
    text "You have attempted to load"
    next "an unexistent map."
    para "Either you've found a huge"
    next "bug in the game, or you're"
    cont "just a dirty hacker."
    para "If you think this is indeed"
    next "a bug, please let me know!"
    para "I might fix it, or not."
    next "It's for me to decide."
    para "Warping you back to"
    next "Central Square."
    wait
