# *** Event IDs and their corresponding flags

EVENT_FLAGS = {
    0x734ACF0D: 5,          # EVENT_MICROSCOPIC_NUCLEAR_THINGS
    0x4F50CAC9: 20,         # EVENT_GOT_LOST_WOODS_HINT
    0x0280949D: 26,         # EVENT_GOT_FIRST_POKEBALL
    0xDEAF5830: 27,         # EVENT_GOT_SECOND_POKEBALL
    0x081CD447: 28,         # EVENT_GOT_THIRD_POKEBALL
    0xB27C8876: 31,         # EVENT_DUNSPARCE_SURVEY
    0x79A42FD4: 35,         # EVENT_GLITCHED_HOUSE
    0x5C90DEA1: 36,         # EVENT_GLITCH_LAB
    0xC5A52904: 37,         # EVENT_OBTAINED_HELIX
    0x8C251640: 38,         # EVENT_WON_THOUSAND_COINS
    0xBA4B1E17: 39,         # EVENT_GOT_GLITCHLAND_PERMIT
    0x569D20EF: 40,         # EVENT_OBTAINED_DOME
    0x9AC498DA: 41,         # EVENT_OBTAINED_OLD_AMBER
    0x9D20CC27: 11,         # EVENT_RETURNED_EXPALL
    0x2F0F4105: 42,         # EVENT_RETURNED_FOSSILS
    0x40D17FFA: 43,         # EVENT_DARK_HOUSE
    0x1337DEAD: 44,         # EVENT_CRACKER_CAVERN_CHALLENGE_1
    0x1337BEEF: 45,         # EVENT_CRACKER_CAVERN_CHALLENGE_2
    0x15DE1CA0: 47,         # EVENT_OBSCURED_PATH_SIGN
    0xFEF0A169: 48,         # EVENT_CORRUPTED_PLAINS
    0xDE102964: 49,         # EVENT_GRASSLANDS
    0x40225EF0: 29,         # EVENT_GOT_FOURTH_POKEBALL
    0xAF0FD100: 50,         # EVENT_DESIGNERS_CREATION
    0x5DA12FA5: 51,         # EVENT_BINARY_WOODS_MEDIUM
    0x1059DE15: 10,         # EVENT_RETURNED_FLUTE
    0xA0295868: 30,         # EVENT_GOT_FIFTH_POKEBALL
    0xFF39C195: 52,         # EVENT_HIDDEN_RETREAT
    0xD1F0A339: 53,         # EVENT_YET_ANOTHER_SECRET
}

# *** Maps and their corresponding fly flags

FLY_FLAGS = {
    0x0110: 1,
    0x1631: 2,
    0x4786: 3,
    0x2B29: 4,
    0x2F38: 5
}

# *** Map names

MAP_NAMES = {
    0x0000: "MYSTERY ZONE",
    0x0001: "TestMap2",
    0x0110: "CENTRAL SQUARE",
    0x0210: "NORTHERN PASSAGE",
    0x0327: "GLITCHED HOUSE",
    0x0364: "GLITCHED HOUSE",
    0x043A: "TOO MUCH WATER",
    0x0523: "NORTHERN PASSAGE",
    0x0565: "GLITCHLAND LAB",
    0x0566: "GLITCHLAND LAB",
    0x062F: "NORTHERN RETREAT",
    0x0667: "NORTHERN RETREAT",
    0x0668: "NORTHERN RETREAT",
    0x0669: "NORTHERN RETREAT",
    0x066A: "GLITCHOLOGY MUSEUM",
    0x0734: "CROSSROADS",
    0x0824: "SHIFTING GROVE",
    0x0932: "WORRIED EXPLORER",
    0x096B: "WORRIED EXPLORER",
    0x098A: "UNDERGROUND",
    0x0A32: "STRANGE BUSH",
    0x0B2D: "STRANGE PILLAR",
    0x0C2C: "STRANGE SIGN",
    0x0D3E: "SHIMMERING PASS",
    0x0E3C: "THE TRENDSETTERS",
    0x0E6C: "THE TRENDSETTERS",
    0x0F3B: "BOARDWALK",
    0x103B: "THE WISE MAN",
    0x106D: "THE WISE MAN",
    0x113D: "THE HARBOR",
    0x116E: "HARBOR HOUSE",
    0x123D: "UNKNOWN HOUSE",
    0x1321: "SEABORGIUM SEA",
    0x1337: "MYSTERIOUS",
    0x1432: "SHADY MERCHANT",
    0x146F: "SHADY MERCHANT",
    0x152D: "WORLD 4-4",
    0x1631: "NORTHERN CAMP",
    0x1670: "NORTHERN CAMP",
    0x1671: "NORTHERN CAMP",
    0x1672: "NORTHERN CAMP",
    0x1720: "ROAD OF ULTIMATE",
    0x1730: "ALTERING CAVE",
    0x1731: "ALTERING CAVE",
    0x1732: "ALTERING CAVE",
    0x182A: "WHO'S THAT POK%MON",
    0x1927: "NORTHERN EDGE",
    0x1A3C: "GAME CORNER",
    0x1A73: "GAME CORNER",
    0x1B37: "WESTERN PASSAGE",
    0x1C2C: "CROSSING FIELD",
    0x1D3B: "WINDY VALLEY",
    0x1E33: "GUARD POST",
    0x1E92: "TINY CAVERN",
    0x1F3A: "DELIRIA",
    0x1F79: "DELIRIA",
    0x1F7A: "DELIRIA",
    0x202F: "DELIRIA POND",
    0x207B: "DELIRIA",
    0x2125: "BIKE SHOP",
    0x2174: "BIKE SHOP",
    0x223A: "MANSION ENTRANCE",
    0x2275: "GLITCHLAND MANSION",
    0x2276: "GLITCHLAND MANSION",
    0x2277: "GLITCHLAND MANSION",
    0x232D: "PATH OF POINTLESS",
    0x2435: "???",
    0x2478: "DESOLATED CABIN",
    0x2536: "CABIN FRONTYARD",
    0x2632: "LOOKOUT POINT",
    0x2725: "DARK CAVE",
    0x2731: "DARK CAVE",
    0x2791: "DARK CAVE",
    0x2B29: "WESTERN ENCAMPMENT",
    0x2B7C: "WESTERN ENCAMPMENT",
    0x2B7D: "WESTERN ENCAMPMENT",
    0x2B7E: "EXPLORER SINDICATE",
    0x2C29: "ROUTE 13.5",
    0x2D27: "WESTERN EDGE",
    0x2E2B: "EASTERN PASSAGE",
    0x2F38: "EASTERN ENCAMPMENT",
    0x2F7F: "EASTERN ENCAMPMENT",
    0x2F80: "EASTERN ENCAMPMENT",
    0x2F81: "EASTERN ENCAMPMENT",
    0x302C: "PATH OF RECURSION",
    0x3120: "CRACKER CAVERN",
    0x318B: "CRACKER CAVERN I",
    0x318C: "CRACKER CAVERN II",
    0x318D: "CRACKER CAVERN III",
    0x318E: "CRACKER CAVERN IV",
    0x318F: "CRACKER CAVERN V",
    0x323F: "OBSCURED PATH",
    0x3336: "DOWNHILL ROAD",
    0x3420: "THE BLING PARK",
    0x3828: "CORRUPTED PLAINS",
    0x3920: "EASTERN AVENUE",
    0x3A3E: "GRASSLANDS",
    0x3B22: "LOST WOODS",
    0x3B30: "LOST WOODS A",
    0x3B31: "LOST WOODS B",
    0x3B32: "LOST WOODS C",
    0x3C36: "EASTERN EDGE",
    0x3D20: "THE GREAT DESIGNER",
    0x3D83: "DESIGNER'S HOUSE",
    0x3E31: "DESIGNER CREATION",
    0x3E90: "DESIGNER'S CAVE",
    0x3F3D: "SOUTHERN PASSAGE",
    0x4026: "BROKEN BRIDGE",
    0x412E: "FRAGNANT FIELDS",
    0x423A: "BRIDGE OF HOPES",
    0x432A: "GLITCHLAND LIBRARY",
    0x4384: "GLITCHLAND LIBRARY",
    0x4528: "BINARY WOODS",
    0x4530: "BINARY WOODS",
    0x4585: "BINARY WOODS",
    0x472B: "SOUTHERN CAMP",
    0x4786: "SOUTHERN CAMP",
    0x4787: "SOUTHERN CAMP",
    0x4788: "SOUTHERN CAMP",
    0x482B: "TEAM ROCKET HQ",
    0x4889: "TEAM ROCKET HQ",
    0x4933: "JUMPITY JUMP",
    0x4A34: "YET ANOTHER ROUTE",
    0x4B3A: "HIDDEN RETREAT",
    0x4C21: "YET ANOTHER CAVE",
    0x4C93: "YET ANOTHER CAVE",
    0x4D3A: "YET ANOTHER PATH",
    0x4E22: "YET ANOTHER SECRET",
    0x4F21: "SOUTHERN EDGE"
}

# *** Maps that have an alternate version for certain fun values

FUN_MAPS = {
    0x0667: (lambda x: 60 < x < 66),
    0x232D: (lambda x: 10 < x < 16),
    0x3B31: (lambda x: 130 < x < 136),
    0x2F81: (lambda x: 160 < x < 166)
}

from events import *
from storage import EVT_MAPVISITED, EVT_GAVEBALLS, EVT_FLAGTRIGGERED, EVT_LOTTERY

# *** Achievements and their corresponding requirements

ACHIEVEMENTS = {
    'northern_edge': [(EVT_MAPVISITED, 0x1927)],
    'southern_edge': [(EVT_MAPVISITED, 0x4F21)],
    'western_edge': [(EVT_MAPVISITED, 0x2D27)],
    'eastern_edge': [(EVT_MAPVISITED, 0x3C36)],
    'altering_cave_all': [(EVT_MAPVISITED, 0x1730), (EVT_MAPVISITED, 0x1731), (EVT_MAPVISITED, 0x1732)],
    'deliria': [(EVT_MAPVISITED, 0x1F3A)],
    'lost_woods_all': [(EVT_MAPVISITED, 0x3B30), (EVT_MAPVISITED, 0x3B31), (EVT_MAPVISITED, 0x3B32)],
    'demonetized': [(EVT_MAPVISITED, 0x4889)],
    'microscopic_nuclear_things': [(EVT_FLAGTRIGGERED, EVENT_MICROSCOPIC_NUCLEAR_THINGS)],
    'pokeball_lv1': [(EVT_GAVEBALLS, 1)],
    'pokeball_lv2': [(EVT_GAVEBALLS, 3)],
    'pokeball_lv3': [(EVT_GAVEBALLS, 5)],
    'best_pokemon': [(EVT_FLAGTRIGGERED, EVENT_DUNSPARCE_SURVEY)],
    'glitched_house': [(EVT_FLAGTRIGGERED, EVENT_GLITCHED_HOUSE)],
    'glitched_lab': [(EVT_FLAGTRIGGERED, EVENT_GLITCH_LAB)],
    'obtained_helix': [(EVT_FLAGTRIGGERED, EVENT_OBTAINED_HELIX)],
    'obtained_dome': [(EVT_FLAGTRIGGERED, EVENT_OBTAINED_DOME)],
    'obtained_old_amber': [(EVT_FLAGTRIGGERED, EVENT_OBTAINED_OLD_AMBER)],
    'thousand_coins': [(EVT_FLAGTRIGGERED, EVENT_WON_THOUSAND_COINS)],
    'returned_fossils': [(EVT_FLAGTRIGGERED, EVENT_RETURNED_FOSSILS)],
    'returned_flute': [(EVT_FLAGTRIGGERED, EVENT_RETURNED_FLUTE)],
    'dark_house': [(EVT_FLAGTRIGGERED, EVENT_DARK_HOUSE)],
    'obscured_path': [(EVT_FLAGTRIGGERED, EVENT_OBSCURED_PATH_SIGN)],
    'glitch_plains': [(EVT_FLAGTRIGGERED, EVENT_CORRUPTED_PLAINS)],
    'grasslands': [(EVT_FLAGTRIGGERED, EVENT_GRASSLANDS)],
    'designers_creation': [(EVT_FLAGTRIGGERED, EVENT_DESIGNERS_CREATION)],
    'binary_woods': [(EVT_FLAGTRIGGERED, EVENT_BINARY_WOODS_MEDIUM)],
    'hidden_retreat': [(EVT_FLAGTRIGGERED, EVENT_HIDDEN_RETREAT)],
    'yet_another_secret': [(EVT_FLAGTRIGGERED, EVENT_YET_ANOTHER_SECRET)],
    'cracker_cavern_1': [(EVT_MAPVISITED, 0x318C)],
    'cracker_cavern_2': [(EVT_MAPVISITED, 0x1337)],
    'cracker_cavern_3': [(EVT_FLAGTRIGGERED, EVENT_CRACKME_SOLVED)],
    'cracker_cavern_4': [(EVT_FLAGTRIGGERED, EVENT_CRACKER_CAVERN_CLEARED)],
    'small_winner': [(EVT_LOTTERY, 1)],
    'medium_winner': [(EVT_LOTTERY, 3)],
    'big_winner': [(EVT_LOTTERY, 5)],
    'you_tried': [(EVT_MAPVISITED, 0x0110)]
}

# *** Points granted for completing each achievement

ACHIEVEMENT_POINTS = {
    'northern_edge': 30,
    'southern_edge': 30,
    'western_edge': 30,
    'eastern_edge': 30,
    'altering_cave_all': 40,
    'deliria': 30,
    'lost_woods_all': 40,
    'demonetized': 10,
    'microscopic_nuclear_things': 20,
    'pokeball_lv1': 10,
    'pokeball_lv2': 20,
    'pokeball_lv3': 30,
    'best_pokemon': 10,
    'glitched_house': 10,
    'glitched_lab': 20,
    'obtained_helix': 30,
    'obtained_dome': 20,
    'obtained_old_amber': 20,
    'thousand_coins': 20,
    'returned_fossils': 30,
    'returned_flute': 30,
    'dark_house': 10,
    'obscured_path': 20,
    'glitch_plains': 10,
    'grasslands': 20,
    'designers_creation': 10,
    'binary_woods': 10,
    'hidden_retreat': 10,
    'yet_another_secret': 20,
    'cracker_cavern_1': 20,
    'cracker_cavern_2': 20,
    'cracker_cavern_3': 30,
    'cracker_cavern_4': 40,
    'small_winner': 0,
    'medium_winner': 0,
    'big_winner': 0,
    'you_tried': 10,
    'exploration_lv1': 20,
    'exploration_lv2': 30,
    'exploration_lv3': 40
}

# *** The password salt

PASSWORD_SALT = b'v93njv0sk40glspfb05kn'

# *** Directory from which maps are loaded

MAP_PATH = "../../bin"

# *** Fallback server MOTD (overridden in main.py)

SERVER_MOTD = b'bepis'
