SECTION "Map_062F", ROM0[$B800]

Map_062F_Header:
    hdr_tileset         0
    hdr_dimensions      10, 14
    hdr_pointers_a      Map_062F_Blocks, Map_062F_TextPointers
    hdr_pointers_b      Map_062F_Script, Map_062F_Objects
    hdr_pointers_c      Map_062F_InitScript, Map_062F_RAMScript
    hdr_palette         $02
    hdr_music           MUSIC_CITIES1, AUDIO_1
    hdr_connection      NORTH, $0734, 6, 12
    hdr_connection      SOUTH, $0523, 24, 1
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_062F_Objects:
    hdr_border          $0f
    hdr_warp_count      4
    hdr_warp            11, 19, 2, 7, $0667
    hdr_warp            4, 19, 2, 7, $0668
    hdr_warp            10, 13, 3, 9, $066A
    hdr_warp            3, 7, 2, 7, $0669
    hdr_sign_count      0
    hdr_object_count    3
    hdr_object          SPRITE_WARDEN, 2, 5, STAY, NONE, $03
    hdr_object          SPRITE_FAT_BALD_GUY, 4, 12, WALK, ALL, $02
    hdr_object          SPRITE_LITTLE_GIRL, 8, 20, WALK, LEFT_RIGHT, $01

Map_062F_RAMScript:
    rs_write_3 $c702, $4e, $31, $4d
    rs_write_3 $c712, $4e, $31, $4d
    rs_write_3 $c802, $4e, $31, $4d
    rs_write_3 $c812, $4e, $31, $4d
    rs_end

Map_062F_Blocks:
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$4e,$31,$4d
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$4e,$31,$4d
    db $0f,$51,$51,$1d,$1f,$1f,$1e,$0a,$31,$4d
    db $0f,$02,$03,$51,$51,$51,$51,$0a,$31,$4d
    db $0f,$31,$31,$31,$31,$31,$31,$31,$31,$4d
    db $0f,$74,$0a,$31,$20,$0d,$21,$4e,$31,$4d
    db $0f,$0a,$74,$31,$37,$3a,$7e,$4e,$31,$4d
    db $0f,$74,$0a,$31,$31,$31,$31,$4e,$31,$4d
    db $0f,$0c,$0e,$31,$0a,$74,$0a,$4e,$31,$4d
    db $0f,$10,$12,$31,$0a,$02,$03,$4e,$31,$4d
    db $0f,$31,$31,$31,$31,$31,$31,$31,$31,$4d
    db $0f,$52,$52,$52,$52,$52,$52,$41,$31,$4d
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$4e,$31,$4d
    db $0f,$0f,$0f,$0f,$0f,$0f,$0f,$4e,$31,$4d

Map_062F_TextPointers:
    dw Map_062F_TX1
    dw Map_062F_TX2
    dw Map_062F_TX3

Map_062F_InitScript:
    ret
Map_062F_Script:
    ret

Map_062F_TX1:
    db 8
    jp EnhancedTextOnly
    text "I heard rumors about a very"
    next "wise old man living deep"
    cont "in Northern Glitchland."
    para "If I ever found him, I would"
    next "definitely ask him a lot of"
    cont "questions!"
    done

Map_062F_TX2:
    db 8
    jp EnhancedTextOnly
    text "With every day, I see more"
    next "and more glitches in the"
    cont "wild."
    para "Corrupted tiles are randomly"
    next "scattered around the map..."
    para "I fear that one day, the"
    next "corruption might even be"
    cont "TMZ4"
    cont "TMZ4"
    cont "TMZ4"
    cont "TMZ4"
    cont "TMZ4"
    cont "TMZ4"
    done

Map_062F_TX3:
    db 8
    jp EnhancedTextOnly
    text "You found me? How did you"
    next "know I was hiding?"
    para "Please don't tell anyone I'm"
    next "here, okay?"
    para "In exchange, here's a hint to"
    next "help you in your adventures."
    para "You know about Lost Woods?"
    next "If you walk for at least"
    cont "100 steps and go south, you"
    cont "might find something cool!"
    done

