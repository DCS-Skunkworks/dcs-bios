local Module = require("Scripts.DCS-BIOS.lib.modules.Module")
local lu = require("Scripts.DCS-BIOS.test.ext.luaunit")

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

function TestParseIndication:testMultiline()
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

function TestParseIndication:testMultipleChildren()
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

function TestParseIndication:testNumericIndex()
	local test_string = [[-----------------------------------------
HSD_base

-----------------------------------------
{5AF8AEA0-CC0E-4150-B4BC-189706D25839}

children are {
-----------------------------------------
{91B1C268-6AEA-4b1c-95EA-6C0494D687ED}

-----------------------------------------
{B69CF7EF-AB8F-465b-950F-C9C55641ED2C}

-----------------------------------------
{82559090-9105-4542-B174-F795C0138E9D}

-----------------------------------------
hsd_course_arrow

-----------------------------------------
{A6C8641F-6002-4616-98EE-AE938AED4916}

-----------------------------------------
{C75E2B82-EE8F-4ad0-9982-5C50638C2CF4}

}
-----------------------------------------
{2FEE4390-94D2-4e2a-928C-EB3BF03B087A}

children are {
-----------------------------------------
{9BD5610E-7905-4634-B5CF-30487E17812F}

}
-----------------------------------------
{4A8D4200-7E70-4fb2-8724-480882B675EB}

children are {
-----------------------------------------
{3011992F-E5A7-483f-A102-D055835E8FE6}

-----------------------------------------
{5415E8B0-BEC2-4502-AC63-7187A11A2348}

-----------------------------------------
{78BC989C-1CAE-4b5b-B3FE-5D051A16DCBC}
031. 
}
-----------------------------------------
{C5A1BA54-45DC-4891-8B46-C96178FCAF61}

children are {
-----------------------------------------
{DE81570C-E1F4-4f36-BB3C-332C589F7DF7}

-----------------------------------------
{DBCB667A-2EE1-4f44-92DA-A4755DD8D840}

-----------------------------------------
{9206BFC8-D2E2-4ab5-A20E-362BD190E0A6}
000
-----------------------------------------
{0FC85384-6428-4aac-83D1-5FAFD1335635}
000
-----------------------------------------
{91599891-47E1-4d50-BC5F-E9271994BF78}

-----------------------------------------
{A49AB977-2B32-48ab-A76D-559CE7625BF0}

-----------------------------------------
tas_string
0000
-----------------------------------------
{A34C1A1E-8DCD-476a-9C67-17CC5468831C}
0000
}
]]

	function list_indication()
		return test_string
	end

	local ind = Module.parse_indication(0)

	lu.assertEquals(ind[0], 23)
	lu.assertEquals(ind[1], "")
	lu.assertEquals(ind[2], "")
	lu.assertEquals(ind[3], "")
	lu.assertEquals(ind[4], "")
	lu.assertEquals(ind[5], "")
	lu.assertEquals(ind[6], "")
	lu.assertEquals(ind[7], "")
	lu.assertEquals(ind[8], "")
	lu.assertEquals(ind[9], "")
	lu.assertEquals(ind[10], "")
	lu.assertEquals(ind[11], "")
	lu.assertEquals(ind[12], "")
	lu.assertEquals(ind[13], "")
	lu.assertEquals(ind[14], "031. ")
	lu.assertEquals(ind[15], "")
	lu.assertEquals(ind[16], "")
	lu.assertEquals(ind[17], "")
	lu.assertEquals(ind[18], "000")
	lu.assertEquals(ind[19], "000")
	lu.assertEquals(ind[20], "")
	lu.assertEquals(ind[21], "")
	lu.assertEquals(ind[22], "0000")
	lu.assertEquals(ind[23], "0000")
end
