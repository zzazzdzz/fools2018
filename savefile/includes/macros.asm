; === macros.asm
; All sorts of macros and constant declarations.

; Text engine macros.

text   EQUS "db " ; Start writing text.
next   EQUS "db $F2," ; Move a line down.
para   EQUS "db $F3," ; Start a new paragraph.
cont   EQUS "db $F1," ; Scroll to the next line.
done   EQUS "db $0"  ; End a text box.
wait   EQUS "db $F4,0"

tx_buf: MACRO
    db $f5
    dw \1
ENDM

tx_buf_end equs "db $f6"

tx_braille equs "db $f7,$8d"
tx_deliria equs "db $f7,$4d"

tx_snd: MACRO
    db $f8
    db \1
ENDM

; Some macros and consts from the original pokeyellow disassembly.

coord: MACRO
	IF _NARG >= 4
		ld \1, \4 + SCREEN_WIDTH * \3 + \2
	ELSE
		ld \1, wTileMap + SCREEN_WIDTH * \3 + \2
	ENDC
ENDM

TX_ASM equs "db 8"

ITEM    EQU $80
TRAINER EQU $40

object: MACRO
	db \1
	db \3 + 4
	db \2 + 4
	db \4
	db \5
	IF (_NARG > 7)
		db TRAINER | \6
		db \7
		db \8
	ELSE
		IF (_NARG > 6)
			db ITEM | \6
			db \7
		ELSE
			db \6
		ENDC
	ENDC
ENDM

WALK EQU $FE
STAY EQU $FF

DOWN       EQU $D0
UP         EQU $D1
LEFT       EQU $D2
RIGHT      EQU $D3
UP_DOWN    EQU $01
LEFT_RIGHT EQU $02
ALL        EQU $00
NONE       EQU $FF

; Random utility macros.

trampoline2: MACRO
    push de
    ld de, \1
    jr TrampolineSRAM2
ENDM

ldi_hl_de: MACRO
    ld [hl], e
    inc hl
    ld [hl], d
    inc hl
ENDM

arrow_tile: MACRO
    db \2
    db \1
    dw \3
ENDM

; RAM script macros.

rs_write_1: MACRO
    db ((\1 >> 8) & $1f)
    db \1 & $ff
    db \2
ENDM
rs_write_2: MACRO
    db ((\1 >> 8) & $1f) | $20
    db \1 & $ff
    db \2, \3
ENDM
rs_write_3: MACRO
    db ((\1 >> 8) & $1f) | $40
    db \1 & $ff
    db \2, \3, \4
ENDM
rs_write_term: MACRO
    db ((\1 >> 8) & $1f) | $60
    db \1 & $ff
ENDM
rs_fill_2: MACRO
    db ((\1 >> 8) & $1f) | $80
    db \1 & $ff
ENDM
rs_fill_3: MACRO
    db ((\1 >> 8) & $1f) | $a0
    db \1 & $ff
ENDM
rs_fill_len: MACRO
    db ((\1 >> 8) & $1f) | $c0
    db \1 & $ff
    db \2
ENDM
rs_fill_byte: MACRO
    db $e0
    db \1
ENDM
rs_end equs "db $ff"

; Map header macros.

NORTH equ 1
SOUTH equ 2
WEST equ 3
EAST equ 4

hdr_tileset equs "db "
hdr_dimensions: MACRO
    db \2
    db \1
ENDM
hdr_pointers_b: MACRO
    dw \1
    db 0
    dw \2
ENDM
hdr_pointers_a equs "dw"
hdr_pointers_c equs "dw"
hdr_music equs "db"
hdr_palette equs "db"

;\1 direction
;\2 map ID
;\3 target x position
;\4 target y position
hdr_connection: MACRO
    db \1
    db (\2 >> 8) & $ff
    db \2 & $ff
    db \3, \4
ENDM

hdr_connection_q EQUS "hdr_connection"

;\1 sprite id
;\2 x position
;\3 y position
;\4 movement (WALK/STAY)
;\5 range or direction
;\6 text id
;\7 items only: item id
;\7 trainers only: trainer class/pokemon id
;\8 trainers only: trainer number/pokemon level
hdr_object: MACRO
	db \1
	db \3 + 4
	db \2 + 4
	db \4
	db \5
	IF (_NARG > 7)
		db TRAINER | \6
		db \7
		db \8
	ELSE
		IF (_NARG > 6)
			db ITEM | \6
			db \7
		ELSE
			db \6
		ENDC
	ENDC
ENDM

;\1 x position
;\2 y position
;\3 target x position
;\4 target y position
;\5 warp map id (high byte is unused, but kept for consistency)
hdr_warp: MACRO
    db \2, \1
    db $22, $ba
    db $e0
    db \3, \4
    db \5 & $ff
ENDM

;\1 x position
;\2 y position
;\3 textbox_id
hdr_signpost: MACRO
    db \2
    db \1
    db \3
ENDM

hdr_border equs "db"
hdr_warp_count equs "db 2*"
hdr_sign_count equs "db"
hdr_object_count equs "db"

; GB button masks.

A_BUTTON EQU %00000001
B_BUTTON EQU %00000010
SELECT   EQU %00000100
START    EQU %00001000
D_RIGHT  EQU %00010000
D_LEFT   EQU %00100000
D_UP     EQU %01000000
D_DOWN   EQU %10000000

; Substitution strings for maps.

SUBST_TRENDY_PHRASE equs "db $25,$54,$52,$45,$4e,$44,$59,$50,$48,$52,$41,$53,$45,$5f,$5f,$25"
SUBST_TRENDY_AUTHOR equs "db $25,$54,$52,$45,$4e,$44,$59,$41,$55,$54,$48,$4f,$52,$5f,$5f,$25"
SUBST_CURRENT_USER  equs "db $25,$43,$55,$52,$52,$45,$4e,$54,$55,$53,$45,$52,$5f,$5f,$5f,$25"
SUBST_PERC_COMPLETE equs "db $25,$50,$45,$52,$43,$43,$4f,$4d,$50,$4c,$45,$54,$45,$5f,$5f,$25"
SUBST_HOUR_MODULO3  equs "db $25,$48,$4f,$55,$52,$4d,$4f,$44,$55,$4c,$4f,$33,$5f,$5f,$5f,$25"

; Sprite constants.

SPRITE_RED                       equ $01
SPRITE_BLUE                      equ $02
SPRITE_OAK                       equ $03
SPRITE_BUG_CATCHER               equ $04
SPRITE_SLOWBRO                   equ $05
SPRITE_LASS                      equ $06
SPRITE_BLACK_HAIR_BOY_1          equ $07
SPRITE_LITTLE_GIRL               equ $08
SPRITE_BIRD                      equ $09
SPRITE_FAT_BALD_GUY              equ $0a
SPRITE_GAMBLER                   equ $0b
SPRITE_BLACK_HAIR_BOY_2          equ $0c
SPRITE_GIRL                      equ $0d
SPRITE_HIKER                     equ $0e
SPRITE_FOULARD_WOMAN             equ $0f
SPRITE_GENTLEMAN                 equ $10
SPRITE_DAISY                     equ $11
SPRITE_BIKER                     equ $12
SPRITE_SAILOR                    equ $13
SPRITE_COOK                      equ $14
SPRITE_BIKE_SHOP_GUY             equ $15
SPRITE_MR_FUJI                   equ $16
SPRITE_GIOVANNI                  equ $17
SPRITE_ROCKET                    equ $18
SPRITE_MEDIUM                    equ $19
SPRITE_WAITER                    equ $1a
SPRITE_ERIKA                     equ $1b
SPRITE_MOM_GEISHA                equ $1c
SPRITE_BRUNETTE_GIRL             equ $1d
SPRITE_LANCE                     equ $1e
SPRITE_OAK_SCIENTIST_AIDE        equ $1f
SPRITE_OAK_AIDE                  equ $20
SPRITE_ROCKER                    equ $21
SPRITE_SWIMMER                   equ $22
SPRITE_WHITE_PLAYER              equ $23
SPRITE_GYM_HELPER                equ $24
SPRITE_OLD_PERSON                equ $25
SPRITE_MART_GUY                  equ $26
SPRITE_FISHER                    equ $27
SPRITE_OLD_MEDIUM_WOMAN          equ $28
SPRITE_NURSE                     equ $29
SPRITE_CABLE_CLUB_WOMAN          equ $2a
SPRITE_MR_MASTERBALL             equ $2b
SPRITE_LAPRAS_GIVER              equ $2c
SPRITE_WARDEN                    equ $2d
SPRITE_SS_CAPTAIN                equ $2e
SPRITE_FISHER2                   equ $2f
SPRITE_BLACKBELT                 equ $30
SPRITE_GUARD                     equ $31
SPRITE_COP_GUARD                 equ $32
SPRITE_MOM                       equ $33
SPRITE_BALDING_GUY               equ $34
SPRITE_YOUNG_BOY                 equ $35
SPRITE_GAMEBOY_KID               equ $36
SPRITE_GAMEBOY_KID_COPY          equ $37
SPRITE_CLEFAIRY                  equ $38
SPRITE_AGATHA                    equ $39
SPRITE_BRUNO                     equ $3a
SPRITE_LORELEI                   equ $3b
SPRITE_SEEL                      equ $3c
SPRITE_BALL                      equ $3d
SPRITE_OMANYTE                   equ $3e
SPRITE_BOULDER                   equ $3f
SPRITE_PAPER_SHEET               equ $40
SPRITE_BOOK_MAP_DEX              equ $41
SPRITE_CLIPBOARD                 equ $42
SPRITE_SNORLAX                   equ $43
SPRITE_OLD_AMBER_COPY            equ $44
SPRITE_OLD_AMBER                 equ $45
SPRITE_LYING_OLD_MAN_UNUSED_1    equ $46
SPRITE_LYING_OLD_MAN_UNUSED_2    equ $47
SPRITE_LYING_OLD_MAN             equ $48

; Music constants.

AUDIO_1 EQUS "$02"
AUDIO_3 EQUS "$1f"

; AUDIO_1
MUSIC_PALLET_TOWN EQUS "((Music_PalletTown - SFX_Headers_1) / 3)"
MUSIC_POKECENTER EQUS "((Music_Pokecenter - SFX_Headers_1) / 3)"
MUSIC_GYM EQUS "((Music_Gym - SFX_Headers_1) / 3)"
MUSIC_CITIES1 EQUS "((Music_Cities1 - SFX_Headers_1) / 3)"
MUSIC_CITIES2 EQUS "((Music_Cities2 - SFX_Headers_1) / 3)"
MUSIC_CELADON EQUS "((Music_Celadon - SFX_Headers_1) / 3)"
MUSIC_CINNABAR EQUS "((Music_Cinnabar - SFX_Headers_1) / 3)"
MUSIC_VERMILION EQUS "((Music_Vermilion - SFX_Headers_1) / 3)"
MUSIC_LAVENDER EQUS "((Music_Lavender - SFX_Headers_1) / 3)"
MUSIC_SS_ANNE EQUS "((Music_SSAnne - SFX_Headers_1) / 3)"
MUSIC_MEET_PROF_OAK EQUS "((Music_MeetProfOak - SFX_Headers_1) / 3)"
MUSIC_MEET_RIVAL EQUS "((Music_MeetRival - SFX_Headers_1) / 3)"
MUSIC_MUSEUM_GUY EQUS "((Music_MuseumGuy - SFX_Headers_1) / 3)"
MUSIC_SAFARI_ZONE EQUS "((Music_SafariZone - SFX_Headers_1) / 3)"
MUSIC_PKMN_HEALED EQUS "((Music_PkmnHealed - SFX_Headers_1) / 3)"
MUSIC_ROUTES1 EQUS "((Music_Routes1 - SFX_Headers_1) / 3)"
MUSIC_ROUTES2 EQUS "((Music_Routes2 - SFX_Headers_1) / 3)"
MUSIC_ROUTES3 EQUS "((Music_Routes3 - SFX_Headers_1) / 3)"
MUSIC_ROUTES4 EQUS "((Music_Routes4 - SFX_Headers_1) / 3)"
MUSIC_INDIGO_PLATEAU EQUS "((Music_IndigoPlateau - SFX_Headers_1) / 3)"

; AUDIO_3 $1f
MUSIC_TITLE_SCREEN EQUS "((Music_TitleScreen - SFX_Headers_1) / 3)"
MUSIC_CREDITS EQUS "((Music_Credits - SFX_Headers_1) / 3)"
MUSIC_HALL_OF_FAME EQUS "((Music_HallOfFame - SFX_Headers_1) / 3)"
MUSIC_OAKS_LAB EQUS "((Music_OaksLab - SFX_Headers_1) / 3)"
MUSIC_JIGGLYPUFF_SONG EQUS "((Music_JigglypuffSong - SFX_Headers_1) / 3)"
MUSIC_BIKE_RIDING EQUS "((Music_BikeRiding - SFX_Headers_1) / 3)"
MUSIC_SURFING EQUS "((Music_Surfing - SFX_Headers_1) / 3)"
MUSIC_GAME_CORNER EQUS "((Music_GameCorner - SFX_Headers_1) / 3)"
MUSIC_INTRO_BATTLE EQUS "((Music_IntroBattle - SFX_Headers_1) / 3)"
MUSIC_DUNGEON1 EQUS "((Music_Dungeon1 - SFX_Headers_1) / 3)"
MUSIC_DUNGEON2 EQUS "((Music_Dungeon2 - SFX_Headers_1) / 3)"
MUSIC_DUNGEON3 EQUS "((Music_Dungeon3 - SFX_Headers_1) / 3)"
MUSIC_CINNABAR_MANSION EQUS "((Music_CinnabarMansion - SFX_Headers_1) / 3)"
MUSIC_POKEMON_TOWER EQUS "((Music_PokemonTower - SFX_Headers_1) / 3)"
MUSIC_SILPH_CO EQUS "((Music_SilphCo - SFX_Headers_1) / 3)"
MUSIC_MEET_EVIL_TRAINER EQUS "((Music_MeetEvilTrainer - SFX_Headers_1) / 3)"
MUSIC_MEET_FEMALE_TRAINER EQUS "((Music_MeetFemaleTrainer - SFX_Headers_1) / 3)"
MUSIC_MEET_MALE_TRAINER EQUS "((Music_MeetMaleTrainer - SFX_Headers_1) / 3)"

; AUDIO_1 AUDIO_2 AUDIO_3
SFX_SNARE_1 EQUS "((SFX_Snare1_1 - SFX_Headers_1) / 3)"
SFX_SNARE_2 EQUS "((SFX_Snare2_1 - SFX_Headers_1) / 3)"
SFX_SNARE_3 EQUS "((SFX_Snare3_1 - SFX_Headers_1) / 3)"
SFX_SNARE_4 EQUS "((SFX_Snare4_1 - SFX_Headers_1) / 3)"
SFX_SNARE_5 EQUS "((SFX_Snare5_1 - SFX_Headers_1) / 3)"
SFX_TRIANGLE_1 EQUS "((SFX_Triangle1_1 - SFX_Headers_1) / 3)"
SFX_TRIANGLE_2 EQUS "((SFX_Triangle2_1 - SFX_Headers_1) / 3)"
SFX_SNARE_6 EQUS "((SFX_Snare6_1 - SFX_Headers_1) / 3)"
SFX_SNARE_7 EQUS "((SFX_Snare7_1 - SFX_Headers_1) / 3)"
SFX_SNARE_8 EQUS "((SFX_Snare8_1 - SFX_Headers_1) / 3)"
SFX_SNARE_9 EQUS "((SFX_Snare9_1 - SFX_Headers_1) / 3)"
SFX_CYMBAL_1 EQUS "((SFX_Cymbal1_1 - SFX_Headers_1) / 3)"
SFX_CYMBAL_2 EQUS "((SFX_Cymbal2_1 - SFX_Headers_1) / 3)"
SFX_CYMBAL_3 EQUS "((SFX_Cymbal3_1 - SFX_Headers_1) / 3)"
SFX_MUTED_SNARE_1 EQUS "((SFX_Muted_Snare1_1 - SFX_Headers_1) / 3)"
SFX_TRIANGLE_3 EQUS "((SFX_Triangle3_1 - SFX_Headers_1) / 3)"
SFX_MUTED_SNARE_2 EQUS "((SFX_Muted_Snare2_1 - SFX_Headers_1) / 3)"
SFX_MUTED_SNARE_3 EQUS "((SFX_Muted_Snare3_1 - SFX_Headers_1) / 3)"
SFX_MUTED_SNARE_4 EQUS "((SFX_Muted_Snare4_1 - SFX_Headers_1) / 3)"
SFX_CRY_00 EQUS "((SFX_Cry00_1 - SFX_Headers_1) / 3)"
SFX_CRY_01 EQUS "((SFX_Cry01_1 - SFX_Headers_1) / 3)"
SFX_CRY_02 EQUS "((SFX_Cry02_1 - SFX_Headers_1) / 3)"
SFX_CRY_03 EQUS "((SFX_Cry03_1 - SFX_Headers_1) / 3)"
SFX_CRY_04 EQUS "((SFX_Cry04_1 - SFX_Headers_1) / 3)"
SFX_CRY_05 EQUS "((SFX_Cry05_1 - SFX_Headers_1) / 3)"
SFX_CRY_06 EQUS "((SFX_Cry06_1 - SFX_Headers_1) / 3)"
SFX_CRY_07 EQUS "((SFX_Cry07_1 - SFX_Headers_1) / 3)"
SFX_CRY_08 EQUS "((SFX_Cry08_1 - SFX_Headers_1) / 3)"
SFX_CRY_09 EQUS "((SFX_Cry09_1 - SFX_Headers_1) / 3)"
SFX_CRY_0A EQUS "((SFX_Cry0A_1 - SFX_Headers_1) / 3)"
SFX_CRY_0B EQUS "((SFX_Cry0B_1 - SFX_Headers_1) / 3)"
SFX_CRY_0C EQUS "((SFX_Cry0C_1 - SFX_Headers_1) / 3)"
SFX_CRY_0D EQUS "((SFX_Cry0D_1 - SFX_Headers_1) / 3)"
SFX_CRY_0E EQUS "((SFX_Cry0E_1 - SFX_Headers_1) / 3)"
SFX_CRY_0F EQUS "((SFX_Cry0F_1 - SFX_Headers_1) / 3)"
SFX_CRY_10 EQUS "((SFX_Cry10_1 - SFX_Headers_1) / 3)"
SFX_CRY_11 EQUS "((SFX_Cry11_1 - SFX_Headers_1) / 3)"
SFX_CRY_12 EQUS "((SFX_Cry12_1 - SFX_Headers_1) / 3)"
SFX_CRY_13 EQUS "((SFX_Cry13_1 - SFX_Headers_1) / 3)"
SFX_CRY_14 EQUS "((SFX_Cry14_1 - SFX_Headers_1) / 3)"
SFX_CRY_15 EQUS "((SFX_Cry15_1 - SFX_Headers_1) / 3)"
SFX_CRY_16 EQUS "((SFX_Cry16_1 - SFX_Headers_1) / 3)"
SFX_CRY_17 EQUS "((SFX_Cry17_1 - SFX_Headers_1) / 3)"
SFX_CRY_18 EQUS "((SFX_Cry18_1 - SFX_Headers_1) / 3)"
SFX_CRY_19 EQUS "((SFX_Cry19_1 - SFX_Headers_1) / 3)"
SFX_CRY_1A EQUS "((SFX_Cry1A_1 - SFX_Headers_1) / 3)"
SFX_CRY_1B EQUS "((SFX_Cry1B_1 - SFX_Headers_1) / 3)"
SFX_CRY_1C EQUS "((SFX_Cry1C_1 - SFX_Headers_1) / 3)"
SFX_CRY_1D EQUS "((SFX_Cry1D_1 - SFX_Headers_1) / 3)"
SFX_CRY_1E EQUS "((SFX_Cry1E_1 - SFX_Headers_1) / 3)"
SFX_CRY_1F EQUS "((SFX_Cry1F_1 - SFX_Headers_1) / 3)"
SFX_CRY_20 EQUS "((SFX_Cry20_1 - SFX_Headers_1) / 3)"
SFX_CRY_21 EQUS "((SFX_Cry21_1 - SFX_Headers_1) / 3)"
SFX_CRY_22 EQUS "((SFX_Cry22_1 - SFX_Headers_1) / 3)"
SFX_CRY_23 EQUS "((SFX_Cry23_1 - SFX_Headers_1) / 3)"
SFX_CRY_24 EQUS "((SFX_Cry24_1 - SFX_Headers_1) / 3)"
SFX_CRY_25 EQUS "((SFX_Cry25_1 - SFX_Headers_1) / 3)"

SFX_GET_ITEM_2 EQUS "((SFX_Get_Item2_1 - SFX_Headers_1) / 3)"
SFX_TINK EQUS "((SFX_Tink_1 - SFX_Headers_1) / 3)"
SFX_HEAL_HP EQUS "((SFX_Heal_HP_1 - SFX_Headers_1) / 3)"
SFX_HEAL_AILMENT EQUS "((SFX_Heal_Ailment_1 - SFX_Headers_1) / 3)"
SFX_START_MENU EQUS "((SFX_Start_Menu_1 - SFX_Headers_1) / 3)"
SFX_PRESS_AB EQUS "((SFX_Press_AB_1 - SFX_Headers_1) / 3)"

; AUDIO_1 AUDIO_3
SFX_GET_ITEM_1 EQUS "((SFX_Get_Item1_1 - SFX_Headers_1) / 3)"

SFX_POKEDEX_RATING EQUS "((SFX_Pokedex_Rating_1 - SFX_Headers_1) / 3)"
SFX_GET_KEY_ITEM EQUS "((SFX_Get_Key_Item_1 - SFX_Headers_1) / 3)"
SFX_POISONED EQUS "((SFX_Poisoned_1 - SFX_Headers_1) / 3)"
SFX_TRADE_MACHINE EQUS "((SFX_Trade_Machine_1 - SFX_Headers_1) / 3)"
SFX_TURN_ON_PC EQUS "((SFX_Turn_On_PC_1 - SFX_Headers_1) / 3)"
SFX_TURN_OFF_PC EQUS "((SFX_Turn_Off_PC_1 - SFX_Headers_1) / 3)"
SFX_ENTER_PC EQUS "((SFX_Enter_PC_1 - SFX_Headers_1) / 3)"
SFX_SHRINK EQUS "((SFX_Shrink_1 - SFX_Headers_1) / 3)"
SFX_SWITCH EQUS "((SFX_Switch_1 - SFX_Headers_1) / 3)"
SFX_HEALING_MACHINE EQUS "((SFX_Healing_Machine_1 - SFX_Headers_1) / 3)"
SFX_TELEPORT_EXIT_1 EQUS "((SFX_Teleport_Exit1_1 - SFX_Headers_1) / 3)"
SFX_TELEPORT_ENTER_1 EQUS "((SFX_Teleport_Enter1_1 - SFX_Headers_1) / 3)"
SFX_TELEPORT_EXIT_2 EQUS "((SFX_Teleport_Exit2_1 - SFX_Headers_1) / 3)"
SFX_LEDGE EQUS "((SFX_Ledge_1 - SFX_Headers_1) / 3)"
SFX_TELEPORT_ENTER_2 EQUS "((SFX_Teleport_Enter2_1 - SFX_Headers_1) / 3)"
SFX_FLY EQUS "((SFX_Fly_1 - SFX_Headers_1) / 3)"
SFX_DENIED EQUS "((SFX_Denied_1 - SFX_Headers_1) / 3)"
SFX_ARROW_TILES EQUS "((SFX_Arrow_Tiles_1 - SFX_Headers_1) / 3)"
SFX_PUSH_BOULDER EQUS "((SFX_Push_Boulder_1 - SFX_Headers_1) / 3)"
SFX_SS_ANNE_HORN EQUS "((SFX_SS_Anne_Horn_1 - SFX_Headers_1) / 3)"
SFX_WITHDRAW_DEPOSIT EQUS "((SFX_Withdraw_Deposit_1 - SFX_Headers_1) / 3)"
SFX_CUT EQUS "((SFX_Cut_1 - SFX_Headers_1) / 3)"
SFX_GO_INSIDE EQUS "((SFX_Go_Inside_1 - SFX_Headers_1) / 3)"
SFX_SWAP EQUS "((SFX_Swap_1 - SFX_Headers_1) / 3)"
SFX_PURCHASE EQUS "((SFX_Purchase_1 - SFX_Headers_1) / 3)"
SFX_COLLISION EQUS "((SFX_Collision_1 - SFX_Headers_1) / 3)"
SFX_GO_OUTSIDE EQUS "((SFX_Go_Outside_1 - SFX_Headers_1) / 3)"
SFX_SAVE EQUS "((SFX_Save_1 - SFX_Headers_1) / 3)"

; AUDIO_1
SFX_POKEFLUE EQUS "((SFX_Pokeflute - SFX_Headers_1) / 3)"
SFX_SAFARI_ZONE_PA EQUS "((SFX_Safari_Zone_PA - SFX_Headers_1) / 3)"

; AUDIO_3
SFX_INTRO_LUNGE EQUS "((SFX_Intro_Lunge - SFX_Headers_1) / 3)"
SFX_INTRO_HIP EQUS "((SFX_Intro_Hip - SFX_Headers_1) / 3)"
SFX_INTRO_HOP EQUS "((SFX_Intro_Hop - SFX_Headers_1) / 3)"
SFX_INTRO_RAISE EQUS "((SFX_Intro_Raise - SFX_Headers_1) / 3)"
SFX_INTRO_CRASH EQUS "((SFX_Intro_Crash - SFX_Headers_1) / 3)"
SFX_INTRO_WHOOSH EQUS "((SFX_Intro_Whoosh - SFX_Headers_1) / 3)"
SFX_SLOTS_STOP_WHEEL EQUS "((SFX_Slots_Stop_Wheel - SFX_Headers_1) / 3)"
SFX_SLOTS_REWARD EQUS "((SFX_Slots_Reward - SFX_Headers_1) / 3)"
SFX_SLOTS_NEW_SPIN EQUS "((SFX_Slots_New_Spin - SFX_Headers_1) / 3)"
SFX_SHOOTING_STAR EQUS "((SFX_Shooting_Star - SFX_Headers_1) / 3)"

; Predef constants.

PREDEF_PutStringSameBank            equ 0
PREDEF_CharsetEnhancedToStandard    equ 1
PREDEF_CharsetStandardToEnhanced    equ 2
PREDEF_ReplaceTextPointer           equ 3
PREDEF_StrLen                       equ 4
PREDEF_HandleCrackMe                equ 5
PREDEF_ShowMapOfGlitchland          equ 6
PREDEF_PreserveMusicRegisters       equ 7
PREDEF_RestoreMusicRegisters        equ 8

; RAM address constants.

StandardSerialBuffer equ $c660

MapWarpTargetIDL equ $da48
MapWarpTargetIDH equ $da49
MapWarpTargetX equ $da4a
MapWarpTargetY equ $da4b
MapScriptPtr equ $da4c
MapScriptGeneralPurpose equ $da4e
Map5FScriptIndex equ $da4f
PlayerFunValue equ $da50
PlayerFlyFlags equ $da51
PreservedMapMusicID equ $da52
PreservedMapMusicBank equ $da53
MapCurrentIDH equ $da54

CurrentMapData equ $b800

EventFlagsBitfield equ $d309
InputMenuBuffer equ $d0e0

; HRAM constants.

hSerialConnectionStatus equ $AA
hSerialReceiveData equ $AD
hSerialSendData equ $AC
hSerialReceivedNewData equ $A9
rSB equ $01
rSC equ $02

; Event constants.

EVENT_UNK_00 EQU 0
EVENT_UNK_01 EQU 1
EVENT_UNK_02 EQU 2
EVENT_UNK_03 EQU 3
EVENT_UNK_04 EQU 4
EVENT_MICROSCOPIC_NUCLEAR_THINGS EQU 5
EVENT_UNK_06 EQU 6
EVENT_UNK_07 EQU 7
EVENT_UNK_08 EQU 8
EVENT_UNK_09 EQU 9
EVENT_RETURNED_FLUTE EQU 10
EVENT_RETURNED_EXPALL EQU 11
EVENT_UNK_0C EQU 12
EVENT_UNK_0D EQU 13
EVENT_UNK_0E EQU 14
EVENT_UNK_0F EQU 15
EVENT_UNK_10 EQU 16
EVENT_UNK_11 EQU 17
EVENT_UNK_12 EQU 18
EVENT_UNK_13 EQU 19
EVENT_GOT_LOST_WOODS_HINT EQU 20
EVENT_UNK_15 EQU 21
EVENT_UNK_16 EQU 22
EVENT_UNK_17 EQU 23
EVENT_UNK_18 EQU 24
EVENT_UNK_19 EQU 25
EVENT_GOT_FIRST_POKEBALL EQU 26
EVENT_GOT_SECOND_POKEBALL EQU 27
EVENT_GOT_THIRD_POKEBALL EQU 28
EVENT_GOT_FOURTH_POKEBALL EQU 29
EVENT_GOT_FIFTH_POKEBALL EQU 30
EVENT_DUNSPARCE_SURVEY EQU 31
EVENT_UNK_20 EQU 32
EVENT_UNK_21 EQU 33
EVENT_UNK_22 EQU 34
EVENT_GLITCHED_HOUSE EQU 35
EVENT_GLITCH_LAB EQU 36
EVENT_OBTAINED_HELIX EQU 37
EVENT_WON_THOUSAND_COINS EQU 38
EVENT_GOT_GLITCHLAND_PERMIT EQU 39
EVENT_OBTAINED_DOME EQU 40
EVENT_OBTAINED_OLD_AMBER EQU 41
EVENT_RETURNED_FOSSILS EQU 42
EVENT_DARK_HOUSE EQU 43
EVENT_CRACKER_CAVERN_CHALLENGE_1 EQU 44
EVENT_CRACKER_CAVERN_CHALLENGE_2 EQU 45
EVENT_CRACKER_CAVERN_CHALLENGE_3 EQU 46
EVENT_OBSCURED_PATH_SIGN EQU 47
EVENT_CORRUPTED_PLAINS EQU 48
EVENT_GRASSLANDS EQU 49
EVENT_DESIGNERS_CREATION EQU 50
EVENT_BINARY_WOODS_MEDIUM EQU 51
EVENT_HIDDEN_RETREAT EQU 52
EVENT_YET_ANOTHER_SECRET EQU 53
EVENT_UNK_36 EQU 54
EVENT_UNK_37 EQU 55
EVENT_UNK_38 EQU 56
EVENT_UNK_39 EQU 57
EVENT_UNK_3A EQU 58
EVENT_UNK_3B EQU 59
EVENT_UNK_3C EQU 60
EVENT_UNK_3D EQU 61
EVENT_UNK_3E EQU 62
EVENT_UNK_3F EQU 63
EVENT_UNK_40 EQU 64
EVENT_UNK_41 EQU 65
EVENT_UNK_42 EQU 66
EVENT_UNK_43 EQU 67
EVENT_UNK_44 EQU 68
EVENT_UNK_45 EQU 69
EVENT_UNK_46 EQU 70
EVENT_UNK_47 EQU 71
EVENT_UNK_48 EQU 72
EVENT_UNK_49 EQU 73
EVENT_UNK_4A EQU 74
EVENT_UNK_4B EQU 75
EVENT_UNK_4C EQU 76
EVENT_UNK_4D EQU 77
EVENT_UNK_4E EQU 78
EVENT_UNK_4F EQU 79
EVENT_UNK_50 EQU 80
EVENT_UNK_51 EQU 81
EVENT_UNK_52 EQU 82
EVENT_UNK_53 EQU 83
EVENT_UNK_54 EQU 84
EVENT_UNK_55 EQU 85
EVENT_UNK_56 EQU 86
EVENT_UNK_57 EQU 87
EVENT_UNK_58 EQU 88
EVENT_UNK_59 EQU 89
EVENT_UNK_5A EQU 90
EVENT_UNK_5B EQU 91
EVENT_UNK_5C EQU 92
EVENT_UNK_5D EQU 93
EVENT_UNK_5E EQU 94
EVENT_UNK_5F EQU 95
EVENT_UNK_60 EQU 96
EVENT_UNK_61 EQU 97
EVENT_UNK_62 EQU 98
EVENT_MAP_1337_VISITED EQU 99
EVENT_CRACKME_SOLVED EQU 100
EVENT_CRACKER_CAVERN_CLEARED EQU 101
EVENT_UNK_66 EQU 102
EVENT_UNK_67 EQU 103
EVENT_UNK_68 EQU 104
EVENT_UNK_69 EQU 105
EVENT_UNK_6A EQU 106
EVENT_UNK_6B EQU 107
EVENT_UNK_6C EQU 108
EVENT_UNK_6D EQU 109
EVENT_UNK_6E EQU 110
EVENT_UNK_6F EQU 111
EVENT_UNK_70 EQU 112
EVENT_UNK_71 EQU 113
EVENT_UNK_72 EQU 114
EVENT_UNK_73 EQU 115
EVENT_UNK_74 EQU 116
EVENT_UNK_75 EQU 117
EVENT_UNK_76 EQU 118
EVENT_UNK_77 EQU 119
EVENT_UNK_78 EQU 120
EVENT_UNK_79 EQU 121
EVENT_UNK_7A EQU 122
EVENT_UNK_7B EQU 123
EVENT_UNK_7C EQU 124
EVENT_UNK_7D EQU 125
EVENT_UNK_7E EQU 126
EVENT_UNK_7F EQU 127
EVENT_UNK_80 EQU 128
EVENT_UNK_81 EQU 129
EVENT_UNK_82 EQU 130
EVENT_UNK_83 EQU 131
EVENT_UNK_84 EQU 132
EVENT_UNK_85 EQU 133
EVENT_UNK_86 EQU 134
EVENT_UNK_87 EQU 135
EVENT_UNK_88 EQU 136
EVENT_UNK_89 EQU 137
EVENT_UNK_8A EQU 138
EVENT_UNK_8B EQU 139
EVENT_UNK_8C EQU 140
EVENT_UNK_8D EQU 141
EVENT_UNK_8E EQU 142
EVENT_UNK_8F EQU 143
EVENT_UNK_90 EQU 144
EVENT_UNK_91 EQU 145
EVENT_UNK_92 EQU 146
EVENT_UNK_93 EQU 147
EVENT_UNK_94 EQU 148
EVENT_UNK_95 EQU 149
EVENT_UNK_96 EQU 150
EVENT_UNK_97 EQU 151
EVENT_UNK_98 EQU 152
EVENT_UNK_99 EQU 153
EVENT_UNK_9A EQU 154
EVENT_UNK_9B EQU 155
EVENT_UNK_9C EQU 156
EVENT_UNK_9D EQU 157
EVENT_UNK_9E EQU 158
EVENT_UNK_9F EQU 159
EVENT_UNK_A0 EQU 160
EVENT_UNK_A1 EQU 161
EVENT_UNK_A2 EQU 162
EVENT_UNK_A3 EQU 163
EVENT_UNK_A4 EQU 164
EVENT_UNK_A5 EQU 165
EVENT_UNK_A6 EQU 166
EVENT_UNK_A7 EQU 167
EVENT_UNK_A8 EQU 168
EVENT_UNK_A9 EQU 169
EVENT_UNK_AA EQU 170
EVENT_UNK_AB EQU 171
EVENT_UNK_AC EQU 172
EVENT_UNK_AD EQU 173
EVENT_UNK_AE EQU 174
EVENT_UNK_AF EQU 175
EVENT_UNK_B0 EQU 176
EVENT_UNK_B1 EQU 177
EVENT_UNK_B2 EQU 178
EVENT_UNK_B3 EQU 179
EVENT_UNK_B4 EQU 180
EVENT_UNK_B5 EQU 181
EVENT_UNK_B6 EQU 182
EVENT_UNK_B7 EQU 183
EVENT_UNK_B8 EQU 184
EVENT_UNK_B9 EQU 185
EVENT_UNK_BA EQU 186
EVENT_UNK_BB EQU 187
EVENT_UNK_BC EQU 188
EVENT_UNK_BD EQU 189
EVENT_UNK_BE EQU 190
EVENT_UNK_BF EQU 191
EVENT_UNK_C0 EQU 192
EVENT_UNK_C1 EQU 193
EVENT_UNK_C2 EQU 194
EVENT_UNK_C3 EQU 195
EVENT_UNK_C4 EQU 196
EVENT_UNK_C5 EQU 197
EVENT_UNK_C6 EQU 198
EVENT_UNK_C7 EQU 199
EVENT_UNK_C8 EQU 200
EVENT_UNK_C9 EQU 201
EVENT_UNK_CA EQU 202
EVENT_UNK_CB EQU 203
EVENT_UNK_CC EQU 204
EVENT_UNK_CD EQU 205
EVENT_UNK_CE EQU 206
EVENT_UNK_CF EQU 207
EVENT_UNK_D0 EQU 208
EVENT_UNK_D1 EQU 209
EVENT_UNK_D2 EQU 210
EVENT_UNK_D3 EQU 211
EVENT_UNK_D4 EQU 212
EVENT_UNK_D5 EQU 213
EVENT_UNK_D6 EQU 214
EVENT_UNK_D7 EQU 215
EVENT_UNK_D8 EQU 216
EVENT_UNK_D9 EQU 217
EVENT_UNK_DA EQU 218
EVENT_UNK_DB EQU 219
EVENT_UNK_DC EQU 220
EVENT_UNK_DD EQU 221
EVENT_UNK_DE EQU 222
EVENT_UNK_DF EQU 223
EVENT_UNK_E0 EQU 224
EVENT_UNK_E1 EQU 225
EVENT_UNK_E2 EQU 226
EVENT_UNK_E3 EQU 227
EVENT_UNK_E4 EQU 228
EVENT_UNK_E5 EQU 229
EVENT_UNK_E6 EQU 230
EVENT_UNK_E7 EQU 231
EVENT_UNK_E8 EQU 232
EVENT_UNK_E9 EQU 233
EVENT_UNK_EA EQU 234
EVENT_UNK_EB EQU 235
EVENT_UNK_EC EQU 236
EVENT_UNK_ED EQU 237
EVENT_UNK_EE EQU 238
EVENT_UNK_EF EQU 239
EVENT_UNK_F0 EQU 240
EVENT_UNK_F1 EQU 241
EVENT_UNK_F2 EQU 242
EVENT_UNK_F3 EQU 243
EVENT_UNK_F4 EQU 244
EVENT_UNK_F5 EQU 245
EVENT_UNK_F6 EQU 246
EVENT_UNK_F7 EQU 247
EVENT_UNK_F8 EQU 248
EVENT_UNK_F9 EQU 249
EVENT_UNK_FA EQU 250
EVENT_UNK_FB EQU 251
EVENT_UNK_FC EQU 252
EVENT_UNK_FD EQU 253
EVENT_UNK_FE EQU 254
EVENT_UNK_FF EQU 255

; And the odd one out.

SCREEN_WIDTH equ 20

