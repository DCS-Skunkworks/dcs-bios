local Module = require("Module")
local lu = require("luaunit")

--- @class TestParseIndication
TestParseIndication = {}

function TestParseIndication:testSingleFieldIndication()
	-- KA-50 indication 7
	local test_string = [[-----------------------------------------
txt_digits
064
]]
	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)
	lu.assertEquals(ind.txt_digits, "064")
end

function TestParseIndication:testMultipleFieldIndication()
	-- KA-50 indication 5
	local test_string = [[-----------------------------------------
#1#

children are {
-----------------------------------------
txt_VIT
 43116
-----------------------------------------
txt_VIT_apostrophe1
'
-----------------------------------------
txt_VIT_apostrophe2
'
-----------------------------------------
txt_OIT_PPM
1
-----------------------------------------
txt_NIT
044402
-----------------------------------------
txt_NIT_apostrophe1
'
-----------------------------------------
txt_NIT_apostrophe2
'
}
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)
	lu.assertEquals(ind.txt_VIT, " 43116")
	lu.assertEquals(ind.txt_VIT_apostrophe1, "'")
	lu.assertEquals(ind.txt_VIT_apostrophe2, "'")
	lu.assertEquals(ind.txt_OIT_PPM, "1")
	lu.assertEquals(ind.txt_NIT, "044402")
	lu.assertEquals(ind.txt_NIT_apostrophe1, "'")
	lu.assertEquals(ind.txt_NIT_apostrophe2, "'")
end

function TestParseIndication:test_multiline()
	-- KA-50 indication 4
	local test_string = [[-----------------------------------------
frame

-----------------------------------------
txt_1

-----------------------------------------
txt_2
ДАВЛЕНИЕ 0
  МАСЛА  1
         1
 ЛЕВ РЕД 4
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)

	local txt_2_expected = [[ДАВЛЕНИЕ 0
  МАСЛА  1
         1
 ЛЕВ РЕД 4]]

	lu.assertEquals(ind.frame, "")
	lu.assertEquals(ind.txt_1, "")
	lu.assertEquals(ind.txt_2, txt_2_expected)
end

function TestParseIndication:test_multiple_children()
	--- A-10 indication 3
	local test_string = [[-----------------------------------------
LowerLeftCornerCDU

children are {
-----------------------------------------
PageNameWAYPT
WAYPT
-----------------------------------------
PAGE
P /2
}
-----------------------------------------
LowerLeftCornerCDU

children are {
-----------------------------------------
WAYPT_INCR_DECR
я
-----------------------------------------
WAYPTNumber1
0
-----------------------------------------
STEERPTIndicator
SP
-----------------------------------------
BRACKETS_EL

-----------------------------------------
EL
EL:
-----------------------------------------
WAYPT_EL3
67
-----------------------------------------
BRACKETS_WPT_NAME

-----------------------------------------
WAYPTIdent1
INIT POSIT
-----------------------------------------
WAYPTClass21
UNK
-----------------------------------------
DTOT
DTOT
-----------------------------------------
WAYPT_DTOT
********
-----------------------------------------
TGTSYM_NEW_WPT
©
-----------------------------------------
NEW_WAYPT_NUM
?6
-----------------------------------------
WND
WND    /
-----------------------------------------
WAYPTWindDirection1
***
-----------------------------------------
WAYPTWindSpeed1
***
-----------------------------------------
WAYPTCoordFormat
L/L
-----------------------------------------
WAYPTDATA_ENTRY

-----------------------------------------
WAYPTLat
N41°55.938
-----------------------------------------
WAYPTDATA_ENTRY1

-----------------------------------------
WAYPTLong
E041°52.564
-----------------------------------------
PAGE_NUM
1
}
-----------------------------------------
LowerLeftCornerCDU

children are {
-----------------------------------------
CurrSteerPointNumber
0
-----------------------------------------
DTSAS_EGI_STATUS
**/B1
}
-----------------------------------------
LowerLeftCornerCDU

children are {
-----------------------------------------
NUM
 
}
-----------------------------------------
LowerLeftCornerCDU

children are {
-----------------------------------------
ScratchBorders
[               ]
}
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)

	lu.assertEquals(ind.PageNameWAYPT, "WAYPT")
	lu.assertEquals(ind.PAGE, "P /2")
	lu.assertEquals(ind.WAYPT_INCR_DECR, "я")
	lu.assertEquals(ind.WAYPTNumber1, "0")
	lu.assertEquals(ind.STEERPTIndicator, "SP")
	lu.assertEquals(ind.BRACKETS_EL, "")
	lu.assertEquals(ind.EL, "EL:")
	lu.assertEquals(ind.WAYPT_EL3, "67")
	lu.assertEquals(ind.BRACKETS_WPT_NAME, "")
	lu.assertEquals(ind.WAYPTIdent1, "INIT POSIT")
	lu.assertEquals(ind.WAYPTClass21, "UNK")
	lu.assertEquals(ind.DTOT, "DTOT")
	lu.assertEquals(ind.WAYPT_DTOT, "********")
	lu.assertEquals(ind.TGTSYM_NEW_WPT, "©")
	lu.assertEquals(ind.NEW_WAYPT_NUM, "?6")
	lu.assertEquals(ind.WND, "WND    /")
	lu.assertEquals(ind.WAYPTWindDirection1, "***")
	lu.assertEquals(ind.WAYPTWindSpeed1, "***")
	lu.assertEquals(ind.WAYPTCoordFormat, "L/L")
	lu.assertEquals(ind.WAYPTDATA_ENTRY, "")
	lu.assertEquals(ind.WAYPTLat, "N41°55.938")
	lu.assertEquals(ind.WAYPTDATA_ENTRY1, "")
	lu.assertEquals(ind.WAYPTLong, "E041°52.564")
	lu.assertEquals(ind.PAGE_NUM, "1")
	lu.assertEquals(ind.CurrSteerPointNumber, "0")
	lu.assertEquals(ind.DTSAS_EGI_STATUS, "**/B1")
	lu.assertEquals(ind.NUM, " ")
	lu.assertEquals(ind.ScratchBorders, "[               ]")
end
