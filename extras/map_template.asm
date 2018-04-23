SECTION "Map_XXXX", ROM0[$B800]

Map_XXXX_Header:
    hdr_tileset         _TILESET_
    hdr_dimensions      _W_, _H_
    hdr_pointers_a      Map_XXXX_Blocks, Map_XXXX_TextPointers
    hdr_pointers_b      Map_XXXX_Script, Map_XXXX_Objects
    hdr_pointers_c      Map_XXXX_InitScript, Map_XXXX_RAMScript
    hdr_palette         $06
    hdr_music           $ff, $02
    hdr_connection      NORTH, $0000, 0, 0
    hdr_connection      SOUTH, $0000, 0, 0
    hdr_connection      WEST,  $0000, 0, 0
    hdr_connection      EAST,  $0000, 0, 0
    
Map_XXXX_Objects:
    hdr_border          _BORDER_
    hdr_warp_count      0
    hdr_sign_count      0
    hdr_object_count    0
    
Map_XXXX_RAMScript:
    rs_end

Map_XXXX_Blocks:
    _BLOCKS_

Map_XXXX_TextPointers:

Map_XXXX_InitScript:
    ret
Map_XXXX_Script:
    ret
