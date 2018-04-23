SECTION "Map_0110", ROM0[$B800]

Map_0110_Header:
    hdr_tileset         0
    hdr_dimensions      10, 10
    hdr_pointers_a      Map_0110_Blocks, Map_0110_TextPointers
    hdr_pointers_b      Map_0110_Script, Map_0110_Objects
    hdr_pointers_c      Map_0110_InitScript, Map_0110_RAMScript
    hdr_palette         $05
    hdr_music           MUSIC_VERMILION, AUDIO_1
    hdr_connection      NORTH, $0210, 6, 30
    hdr_connection      SOUTH, $3F3D, 9, 1
    hdr_connection      WEST,  $1B37, 28, 13
    hdr_connection      EAST,  $2E2B, 1, 5

Map_0110_Objects:
    hdr_border          $0f
    hdr_warp_count      0
    hdr_sign_count      4
    hdr_signpost        13, 3, $05
    hdr_signpost        7, 17, $06
    hdr_signpost        3, 13, $07
    hdr_signpost        17, 7, $08
    hdr_object_count    4
    hdr_object          SPRITE_GAMBLER, 4, 6, WALK, ALL, $01
    hdr_object          SPRITE_BUG_CATCHER, 15, 5, WALK, ALL, $02
    hdr_object          SPRITE_LASS, 13, 14, WALK, ALL, $03
    hdr_object          SPRITE_SAILOR, 4, 12, WALK, ALL, $04

Map_0110_RAMScript:
    rs_fill_byte        $55
    rs_fill_2           $c6ff
    rs_fill_2           $c70f
    rs_fill_3           $c758
    rs_fill_3           $c768
    rs_fill_3           $c765
    rs_fill_3           $c775
    rs_fill_2           $c7bf
    rs_fill_2           $c7cf
    rs_end

Map_0110_Blocks:
    db $0f,$0f,$0f,$0f,$55,$55,$0f,$0f,$0f,$0f
    db $0f,$0f,$0f,$7b,$55,$55,$79,$0f,$0f,$0f
    db $0f,$0f,$7b,$7b,$55,$55,$7b,$7b,$0f,$0f
    db $0f,$7b,$7b,$49,$23,$23,$48,$7b,$79,$0f
    db $55,$55,$55,$27,$16,$17,$27,$55,$55,$55
    db $55,$55,$55,$27,$14,$15,$27,$55,$55,$55
    db $0f,$79,$7b,$44,$23,$23,$45,$7b,$7b,$0f
    db $0f,$0f,$7b,$7b,$55,$55,$7b,$7b,$0f,$0f
    db $0f,$0f,$0f,$79,$55,$55,$7b,$0f,$0f,$0f
    db $0f,$0f,$0f,$0f,$55,$55,$0f,$0f,$0f,$0f

Map_0110_TextPointers:
    dw Map_0110_TX1
    dw Map_0110_TX2
    dw Map_0110_TX3
    dw Map_0110_TX4
    dw Map_0110_TX5
    dw Map_0110_TX6
    dw Map_0110_TX7
    dw Map_0110_TX8

Map_0110_InitScript:
    ret
Map_0110_Script:
    ret
    
Map_0110_TX1:
    db 8
    jp EnhancedTextOnly
    text "In Glitchland, there's truly"
    next "everything for everyone to"
    cont "enjoy!"
    para "I even heard about a place"
    next "called Cracker Cavern,"
    cont "located not too far to the"
    cont "east from here."
    para "It is supposedly the go-to"
    next "place in this world for"
    cont "testing one's hacking skills."
    done

Map_0110_TX2:
    db 8
    jp EnhancedTextOnly
    text "Glitchland is a big world,"
    next "but no world is infinite."
    para "The northern, southern,"
    next "western and eastern edges..."
    para "I once heard that very"
    next "helpful and rare items are"
    cont "located on each edge."
    para "However, I was never able"
    next "to venture this far in just"
    cont "one direction."
    para "I'm a pretty brave boy,"
    next "but I'm not brave enough"
    cont "for this."
    done
    
Map_0110_TX3:
    db 8
    jp EnhancedTextOnly
    text "Hello! Are you here for the"
    next "first time?"
    para "Remember to talk with"
    next "everyone you meet in your"
    cont "adventures!"
    para "The people at Glitchland"
    next "might give you useful hints"
    cont "during your journey."
    para "You also get to laugh at all"
    next "the pop culture, game and"
    cont "movie references in the"
    cont "character dialogue!"
    para "I wish you best luck while"
    next "exploring Glitchland!"
    cont "Have fun!"
    done

Map_0110_TX4:
    db 8
    jp EnhancedTextOnly
    text "Here in Glitchland, we don't"
    next "really like fighting."
    para "That's why we don't engage"
    next "in any Pokémon battles."
    para "Many retired trainers come"
    next "to Glitchland and try their"
    cont "luck as explorers."
    para "The world of Glitchland is"
    next "full of secrets that await"
    cont "their discovery."
    done

Map_0110_TX5:
    db 8
    jp EnhancedTextOnly
    text "NORTHERN PASSAGE"
    done

Map_0110_TX6:
    db 8
    jp EnhancedTextOnly
    text "SOUTHERN PASSAGE"
    done

Map_0110_TX7:
    db 8
    jp EnhancedTextOnly
    text "WESTERN PASSAGE"
    done

Map_0110_TX8:
    db 8
    jp EnhancedTextOnly
    text "EASTERN PASSAGE"
    done
