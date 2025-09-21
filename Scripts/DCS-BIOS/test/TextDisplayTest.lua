local CH_47F_CDU = require("Scripts.DCS-BIOS.lib.modules.displays.CH_47F_CDU")
local F_16C_DED = require("Scripts.DCS-BIOS.lib.modules.displays.F_16C_DED")
local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local TextDisplay = require("Scripts.DCS-BIOS.lib.modules.TextDisplay")
local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

--- @class TestTextDisplay
TestTextDisplay = {}

function TestTextDisplay:testFormatCharactersF16()
	-- F-16C IFF_MAIN_STAT
	local test_string = [[-----------------------------------------
IFF label
IFF
-----------------------------------------
IFF Power Status
 ON 
-----------------------------------------
Mode label
STAT
-----------------------------------------
M1 Mode_placeholder

children are {
-----------------------------------------
M1 Mode
M1
}
-----------------------------------------
M2 Mode_placeholder

children are {
-----------------------------------------
M2 Mode
M2
}
-----------------------------------------
M3 Mode_placeholder

children are {
-----------------------------------------
M3 Mode
M3
}
-----------------------------------------
M1 Lockout Status
:
-----------------------------------------
M2 Lockout Status
:
-----------------------------------------
M3 Lockout Status
:
-----------------------------------------
M1 Code
42
-----------------------------------------
M2 Code
6174
-----------------------------------------
M3 Code
1337
-----------------------------------------
M4 Mode_placeholder_inv

children are {
-----------------------------------------
M4 Mode_inv
M4
}
-----------------------------------------
M4 Key
(6)
-----------------------------------------
M4 Monitoring
OUT
-----------------------------------------
M4 Monitoring Key
(7)
-----------------------------------------
MC Mode_placeholder

children are {
-----------------------------------------
MC Mode
MC
}
-----------------------------------------
MC Code

-----------------------------------------
MC Key
(5)
-----------------------------------------
MS Mode_placeholder

children are {
-----------------------------------------
MS Mode
MS
}
-----------------------------------------
MS Key
(8)
-----------------------------------------
Mode Asterisks_lhs
*
-----------------------------------------
Mode Asterisks_rhs
*
-----------------------------------------
Mode Scratchpad_placeholder_inv

children are {
-----------------------------------------
Mode Scratchpad_inv
    0
}
-----------------------------------------
POS EVENT - Side
N
-----------------------------------------
POS EVENT - OF
OF
-----------------------------------------
POS EVENT - Number
1
-----------------------------------------
TIM EVENT - Time
01:23
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)

	local page = "IFF_MAIN_STAT"

	local ded_lines, ded_formats = TextDisplay.GetDisplayLinesWithColor(ind, 24, 5, F_16C_DED, page, {}, nil, false)

	lu.assertEquals(ded_lines[1], " IFF  ON    STAT        ")
	lu.assertEquals(ded_lines[2], "                 *    0*")
	lu.assertEquals(ded_lines[3], "M1 :42  M4    (6)  NOF1 ")
	lu.assertEquals(ded_lines[4], "M2 :6174 MC   (5) 01:23 ")
	lu.assertEquals(ded_lines[5], "M3 :1337 OUT  (7) MS (8)")

	lu.assertEquals(ded_formats[1], "                        ")
	lu.assertEquals(ded_formats[2], "                 iiiiiii")
	lu.assertEquals(ded_formats[3], "        ii              ")
	lu.assertEquals(ded_formats[4], "                        ")
	lu.assertEquals(ded_formats[5], "                        ")
end

function TestTextDisplay:testFormatCharactersF16_2()
	-- F-16C COM_2
	local test_string = [[-----------------------------------------
COM 2 Mode
VHF
-----------------------------------------
Receiver Power Status
ON
-----------------------------------------
Active Frequency or Channe
127.00
-----------------------------------------
Scratchpad_placeholder

children are {
-----------------------------------------
Scratchpad
127.00
}
-----------------------------------------
Preset Label
PRE     a
-----------------------------------------
Preset Number_placeholder

children are {
-----------------------------------------
Preset Number
 1
}
-----------------------------------------
Asterisks on PresetChannel_lhs
*
-----------------------------------------
Asterisks on PresetChannel_rhs
*
-----------------------------------------
Preset Frequency_placeholder

children are {
-----------------------------------------
Preset Frequency
127.00
}
-----------------------------------------
Bandwidth_placeholder

children are {
-----------------------------------------
Bandwidth
NB
}
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)

	local page = "COM_2"

	local ded_lines, ded_formats = TextDisplay.GetDisplayLinesWithColor(ind, 24, 5, F_16C_DED, page, {}, nil, false)

	lu.assertEquals(ded_lines[1], "        VHF  ON         ")
	lu.assertEquals(ded_lines[2], "  127.00                ")
	lu.assertEquals(ded_lines[3], "              127.00    ")
	lu.assertEquals(ded_lines[4], "  PRE * 1*a             ")
	lu.assertEquals(ded_lines[5], "     127.00       NB    ")

	lu.assertEquals(ded_formats[1], "                        ")
	lu.assertEquals(ded_formats[2], "                        ")
	lu.assertEquals(ded_formats[3], "                        ")
	lu.assertEquals(ded_formats[4], "      i  i              ")
	lu.assertEquals(ded_formats[5], "                        ")
end

function TestTextDisplay:testFormatCharactersF16_3()
	-- F-16C INS
	local test_string = [[-----------------------------------------
INS_SelectedSteerpoint
  1
-----------------------------------------
INS_STPT_IncDecSymbol
a
-----------------------------------------
INS_lbl
INS
-----------------------------------------
INS_AlignTime
08.0
-----------------------------------------
INS_AlignSlash
/
-----------------------------------------
INS_AlignStatusCode
10
-----------------------------------------
INS_LAT_lbl
LAT
-----------------------------------------
INS_LAT_Scratchpad_placeholder

children are {
-----------------------------------------
INS_LAT_Scratchpad
N 43o06.2'
}
-----------------------------------------
Asterisks_on_LAT_Scratchpad_lhs
*
-----------------------------------------
Asterisks_on_LAT_Scratchpad_rhs
*
-----------------------------------------
INS_LNG_lbl
LNG
-----------------------------------------
INS_LNG_Scratchpad_placeholder

children are {
-----------------------------------------
INS_LNG_Scratchpad
E040o34.2'
}
-----------------------------------------
INS_SALT_lbl
SALT
-----------------------------------------
INS_SALT_Scratchpad_placeholder

children are {
-----------------------------------------
INS_SALT_Scratchpad
   74FT
}
-----------------------------------------
INS_THDG_lbl
THDG
-----------------------------------------
INS_THDG_Scratchpad_placeholder

children are {
-----------------------------------------
INS_THDG_Scratchpad
 25.0o
}
-----------------------------------------
INS_GS_lbl
G/S
-----------------------------------------
INS_GS_value
   0
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)

	local page = "INS"

	local ded_lines, ded_formats = TextDisplay.GetDisplayLinesWithColor(ind, 24, 5, F_16C_DED, page, {}, nil, false)

	lu.assertEquals(ded_lines[1], "  INS  08.0/10        1a")
	lu.assertEquals(ded_lines[2], "  LAT *N 43o06.2'*      ")
	lu.assertEquals(ded_lines[3], "  LNG  E040o34.2'       ")
	lu.assertEquals(ded_lines[4], " SALT      74FT         ")
	lu.assertEquals(ded_lines[5], " THDG   25.0o   G/S    0")

	lu.assertEquals(ded_formats[1], "                        ")
	lu.assertEquals(ded_formats[2], "      i          i      ")
	lu.assertEquals(ded_formats[3], "                        ")
	lu.assertEquals(ded_formats[4], "                        ")
	lu.assertEquals(ded_formats[5], "                        ")
end

function TestTextDisplay:testFormatCharactersCH47()
	-- CH-47F CDU_SUBSET_FPLN
	local test_string = [[-----------------------------------------
Reference_Pos

-----------------------------------------
CDU_display_mask

-----------------------------------------
Reference_Pos

children are {
-----------------------------------------
scratch_up_dn_arr
.
-----------------------------------------
scratch_left_bracket
[
-----------------------------------------
scratch_text

-----------------------------------------
scratch_right_bracket
]
-----------------------------------------
scratch_cursor
_
}
-----------------------------------------
Reference_Pos

children are {
-----------------------------------------
pg_title_FPLN
FPLN
-----------------------------------------
pg_title_FPLNNAME
ABCD0001
-----------------------------------------
COURSE_field
COURSE
-----------------------------------------
COURSE_left_bracket
[
-----------------------------------------
COURSE_value
331
-----------------------------------------
COURSE_right_bracket
]
-----------------------------------------
COURSE_deg
*
-----------------------------------------
OFFSET_field
OFFSET
-----------------------------------------
OFFSET_left_bracket
[
-----------------------------------------
OFFSET_right_bracket
]
-----------------------------------------
TO_field_0
TO
-----------------------------------------
TO_arrow_down_1_0
}
-----------------------------------------
TO_arrow_down_2_0
}
-----------------------------------------
HDG_WPT_0
331*
-----------------------------------------
POS_WPT_0
11.1NM
-----------------------------------------
num_0
02
-----------------------------------------
NAME_0
N42*25 E042*33
-----------------------------------------
HDG_WPT_1
245*
-----------------------------------------
POS_WPT_1
8.7NM
-----------------------------------------
num_1
03
-----------------------------------------
NAME_1
N42*23 E042*21
-----------------------------------------
HDG_WPT_2
233*
-----------------------------------------
POS_WPT_2
7.5NM
-----------------------------------------
num_2
04
-----------------------------------------
NAME_2
N42*20 E042*12
-----------------------------------------
HDG_WPT_3
214*
-----------------------------------------
POS_WPT_3
7.1NM
-----------------------------------------
num_3
05
-----------------------------------------
NAME_3
N42*16 E042*05
-----------------------------------------
SKIP
------------------------
-----------------------------------------
CLEAR_field
FPLN MGMT
-----------------------------------------
CLEAR_branch
<
-----------------------------------------
SEQ_MODE_field
SEQ MODE
-----------------------------------------
SEQ_MODE
AUTO
-----------------------------------------
H4_LBT_available
:
-----------------------------------------
FP_DATA_ACCESS_1_field

-----------------------------------------
FP_DATA_ACCESS_1_branch
>
-----------------------------------------
FP_DATA_ACCESS_2_field

-----------------------------------------
FP_DATA_ACCESS_2_branch
>
-----------------------------------------
FP_DATA_ACCESS_3_field

-----------------------------------------
FP_DATA_ACCESS_3_branch
>
-----------------------------------------
FP_DATA_ACCESS_4_field

-----------------------------------------
FP_DATA_ACCESS_4_branch
>
-----------------------------------------
MOD_FPLN_field
MOD FPLN
-----------------------------------------
MOD_FPLN_branch
>
}
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)

	local page = "CDU_SUBSET_FPLN"

	local cdu_lines, cdu_formats = TextDisplay.GetDisplayLinesWithColor(ind, 24, 14, CH_47F_CDU, page, {}, nil, false)

	lu.assertEquals(cdu_lines[1], "FPLN            ABCD0001")
	lu.assertEquals(cdu_lines[2], "COURSE  OFFSET  SEQ MODE")
	lu.assertEquals(cdu_lines[3], "[331]*  [     ]    AUTO:")
	lu.assertEquals(cdu_lines[4], "}TO}   331*  11.1NM     ")
	lu.assertEquals(cdu_lines[5], " 02  N42*25 E042*33    >")
	lu.assertEquals(cdu_lines[6], "       245*  8.7NM      ")
	lu.assertEquals(cdu_lines[7], " 03  N42*23 E042*21    >")
	lu.assertEquals(cdu_lines[8], "       233*  7.5NM      ")
	lu.assertEquals(cdu_lines[9], " 04  N42*20 E042*12    >")
	lu.assertEquals(cdu_lines[10], "       214*  7.1NM      ")
	lu.assertEquals(cdu_lines[11], " 05  N42*16 E042*05    >")
	lu.assertEquals(cdu_lines[12], "------------------------")
	lu.assertEquals(cdu_lines[13], "<FPLN MGMT     MOD FPLN>")
	lu.assertEquals(cdu_lines[14], ".[_                    ]")

	lu.assertEquals(cdu_formats[1], "wwww            wwwwwwww")
	lu.assertEquals(cdu_formats[2], "wwwwww  wwwwww  wwwwwwww")
	lu.assertEquals(cdu_formats[3], "wgggww  w     w    ggggw")
	lu.assertEquals(cdu_formats[4], "wwww   gggg  gggggg     ")
	lu.assertEquals(cdu_formats[5], " pp  pppppppppppppp    w")
	lu.assertEquals(cdu_formats[6], "       gggg  ggggg      ")
	lu.assertEquals(cdu_formats[7], " pp  pppppppppppppp    w")
	lu.assertEquals(cdu_formats[8], "       gggg  ggggg      ")
	lu.assertEquals(cdu_formats[9], " pp  pppppppppppppp    w")
	lu.assertEquals(cdu_formats[10], "       gggg  ggggg      ")
	lu.assertEquals(cdu_formats[11], " pp  pppppppppppppp    w")
	lu.assertEquals(cdu_formats[12], "wwwwwwwwwwwwwwwwwwwwwwww")
	lu.assertEquals(cdu_formats[13], "wwwwwwwwww     wwwwwwwww")
	lu.assertEquals(cdu_formats[14], "wwg                    w")
end
