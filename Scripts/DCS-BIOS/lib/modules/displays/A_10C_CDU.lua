module("A_10C_CDU", package.seeall)

--- @type { [string]: TextDisplayItem[] }
local A_10C_CDU = {
	ACCEPT = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
			},
			id = "ACCEPT",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	ADI_ATT = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "ADI_ATT",
			index = 0,
			static_text = true,
			x = 10,
			y = 4,
		},
	},
	ADI_ATT0 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "ADI_ATT0",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	ADI_ATT1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "ADI_ATT1",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	ALIGN = {
		{
			alignment = "LFT",
			pages = {
				"NAV",
				"INS",
			},
			id = "ALIGN",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	ALL = {
		{
			alignment = "LFT",
			pages = {
				"DTSUPLD",
			},
			id = "ALL",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	ALL1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSDNLD",
			},
			id = "ALL1",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	ALL2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSDNLD",
			},
			id = "ALL2",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	ALM_REQ = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "ALM_REQ",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	ALM_REQs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "ALM_REQs",
			index = 0,
			static_text = false,
			x = 11,
			y = 8,
		},
	},
	ALM_REQs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "ALM_REQs1",
			index = 0,
			static_text = false,
			x = 11,
			y = 8,
		},
	},
	ALTITUDE = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "ALTITUDE",
			index = 0,
			static_text = true,
			x = 10,
			y = 8,
		},
	},
	ALT_ALIGN = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "ALT_ALIGN",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	ALT_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "ALT_ST1",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
	},
	ALT_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "ALT_ST2",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
	},
	ALT_WIND_TEMP = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "ALT_WIND_TEMP",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	ANCHORDIS1 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORDIS1",
			index = 0,
			static_text = false,
			x = 20,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORDIS1",
			index = 1,
			static_text = false,
			x = 9,
			y = 8,
		},
	},
	ANCHORDIS2 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORDIS2",
			index = 0,
			static_text = false,
			x = 20,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORDIS2",
			index = 1,
			static_text = false,
			x = 9,
			y = 8,
		},
	},
	ANCHORDISMH = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORDISMH",
			index = 0,
			static_text = true,
			x = 19,
			y = 9,
		},
	},
	ANCHORDMH1 = {
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORDMH1",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	ANCHORDMH2 = {
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORDMH2",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	ANCHORIdent1 = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORIdent1",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	ANCHORIdent2 = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORIdent2",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	ANCHORIdentEntry = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORIdentEntry",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	ANCHORMH1 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORMH1",
			index = 0,
			static_text = false,
			x = 16,
			y = 9,
		},
	},
	ANCHORMH2 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORMH2",
			index = 0,
			static_text = false,
			x = 16,
			y = 9,
		},
	},
	ANCHORMH3 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORMH3",
			index = 0,
			static_text = false,
			x = 16,
			y = 9,
		},
	},
	ANCHORNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	ANCHORNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORNumber2",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	ANCHORNumberEntry = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORNumberEntry",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	ANCHORTOFRMode1 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORTOFRMode1",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	ANCHORTOFRMode2 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORTOFRMode2",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	ANCHORTOFRRotary = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORTOFRRotary",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	ANCHORTTG1 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORTTG1",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORTTG1",
			index = 1,
			static_text = false,
			x = 6,
			y = 6,
		},
	},
	ANCHORTTG2 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORTTG2",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORTTG2",
			index = 1,
			static_text = false,
			x = 6,
			y = 6,
		},
	},
	ANCHORTTG3 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "ANCHORTTG3",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "ANCHORTTG3",
			index = 1,
			static_text = false,
			x = 6,
			y = 6,
		},
	},
	ANCHOR_PT = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "ANCHOR_PT",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WPMENU",
			},
			id = "ANCHOR_PT",
			index = 1,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	ANN1 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN1",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN10 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN10",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN11 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN11",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN12 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN12",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN13 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN13",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN14 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN14",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN15 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN15",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN16 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN16",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN17 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN17",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN18 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN18",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN19 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN19",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN2 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN2",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN20 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN20",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN21 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN21",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN22 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN22",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN23 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN23",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN24 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN24",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN25 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN25",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN26 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN26",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN26a = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN26a",
			index = 0,
			static_text = false,
			x = 7,
			y = 2,
		},
	},
	ANN27 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN27",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN28 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN28",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN29 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN29",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN3 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN3",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN30 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN30",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN31 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN31",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN32 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN32",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN33 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN33",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN34 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN34",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN35 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN35",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN36 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN36",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN37 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN37",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN38 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN38",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN39 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN39",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN4 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN4",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN40 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN40",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN41 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN41",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN42 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN42",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN43 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN43",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN5 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN5",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN6 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN6",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN7 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN7",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN8 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN8",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	ANN9 = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "ANN9",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	APP = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "APP",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	AS = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "AS",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	AS_FLAG = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "AS_FLAG",
			index = 0,
			static_text = false,
			x = 8,
			y = 4,
		},
	},
	AS_FLAG1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "AS_FLAG1",
			index = 0,
			static_text = false,
			x = 8,
			y = 4,
		},
	},
	AS_FLAG2 = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "AS_FLAG2",
			index = 0,
			static_text = false,
			x = 8,
			y = 4,
		},
	},
	ATT = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "ATT",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	ATTRIBCRS0 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBCRS0",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	ATTRIBCRS1 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBCRS1",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	ATTRIBCRS2 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBCRS2",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	ATTRIBCRS3 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBCRS3",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	ATTRIBCRS4 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBCRS4",
			index = 0,
			static_text = false,
			x = 14,
			y = 9,
		},
	},
	ATTRIBCRS5 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBCRS5",
			index = 0,
			static_text = false,
			x = 14,
			y = 9,
		},
	},
	ATTRIBCRS6 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBCRS6",
			index = 0,
			static_text = false,
			x = 14,
			y = 9,
		},
	},
	ATTRIBSCS0 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBSCS0",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
	},
	ATTRIBSCS1 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBSCS1",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
	},
	ATTRIBScale = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBScale",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	ATTRIBScale1 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBScale1",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	ATTRIBScale2 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBScale2",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	ATTRIBScale3 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBScale3",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	ATTRIBSteer = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBSteer",
			index = 0,
			static_text = false,
			x = 2,
			y = 8,
		},
	},
	ATTRIBSteer1 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBSteer1",
			index = 0,
			static_text = false,
			x = 2,
			y = 8,
		},
	},
	ATTRIBSteer2 = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBSteer2",
			index = 0,
			static_text = false,
			x = 2,
			y = 8,
		},
	},
	ATTRIBUTES = {
		{
			alignment = "RGHT",
			pages = {
				"NAV",
			},
			id = "ATTRIBUTES",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	ATTRIBVNavMode = {
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBVNavMode",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	ATTRIBVNavMode1 = {
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIBVNavMode1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	ATTRIB_CRS_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "ATTRIB_CRS_VAL",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	ActiveFP = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "ActiveFP",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	ActiveFP1 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "ActiveFP1",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
	},
	ActiveFP2 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "ActiveFP2",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	ActiveFP3 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "ActiveFP3",
			index = 0,
			static_text = false,
			x = 22,
			y = 5,
		},
	},
	ActiveFP4 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "ActiveFP4",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	ActiveFP5 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "ActiveFP5",
			index = 0,
			static_text = false,
			x = 22,
			y = 7,
		},
	},
	AlignMode_BATH = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignMode_BATH",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	AlignMode_Ground = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignMode_Ground",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	AlignMode_InFlt = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignMode_InFlt",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	AlignMode_SH = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignMode_SH",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	AlignModes = {
		{
			alignment = "RGHT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignModes",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	AlignStatus = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignStatus",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	AlignStatus1 = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignStatus1",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	AlignStatus2 = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignStatus2",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	AlignStatusAsterisk = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignStatusAsterisk",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	AlignTime = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignTime",
			index = 0,
			static_text = false,
			x = 7,
			y = 8,
		},
	},
	AlignTimeAsterisk = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "AlignTimeAsterisk",
			index = 0,
			static_text = false,
			x = 7,
			y = 8,
		},
	},
	Asterisk = {
		{
			alignment = "LFT",
			pages = {
				"1ST_LINE",
				"1ST_LINE",
			},
			id = "Asterisk",
			index = 0,
			static_text = false,
			x = 1,
			y = 1,
		},
	},
	BATTERY = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "BATTERY",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	BATTERYs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "BATTERYs",
			index = 0,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	BATTERYs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "BATTERYs1",
			index = 0,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	BBCTL = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "BBCTL",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"BITBALL",
			},
			id = "BBCTL",
			index = 1,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	BIT_INPR = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "BIT_INPR",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	BIT_INPRs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "BIT_INPRs",
			index = 0,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	BIT_INPRs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "BIT_INPRs1",
			index = 0,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	BIT_TST = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "BIT_TST",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	BLOCK_NUM1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM1",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BLOCK_NUM2 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM2",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BLOCK_NUM3 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM3",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BLOCK_NUM4 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM4",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BLOCK_NUM5 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM5",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BLOCK_NUM6 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM6",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BLOCK_NUM7 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM7",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BLOCK_NUM8 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "BLOCK_NUM8",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
	},
	BRACKETS = {
		{
			alignment = "LFT",
			pages = {
				"WPMENU",
			},
			id = "BRACKETS",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	BRACKETS_EL = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "BRACKETS_EL",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	BRACKETS_FIRSTCOORD = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "BRACKETS_FIRSTCOORD",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	BRACKETS_INIT_WP_ID = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "BRACKETS_INIT_WP_ID",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	BRACKETS_ITEM1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "BRACKETS_ITEM1",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	BRACKETS_ITEM2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "BRACKETS_ITEM2",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	BRACKETS_ITEM3 = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "BRACKETS_ITEM3",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	BRACKETS_ITEM4 = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "BRACKETS_ITEM4",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	BRACKETS_MH_DIS = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
			},
			id = "BRACKETS_MH_DIS",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	BRACKETS_MISC_DATA = {
		{
			alignment = "RGHT",
			pages = {
				"INS",
			},
			id = "BRACKETS_MISC_DATA",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	BRACKETS_SECONDCOORD = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "BRACKETS_SECONDCOORD",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	BRACKETS_WPNUM_LTR = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
			},
			id = "BRACKETS_WPNUM_LTR",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	BRACKETS_WPT_NAME = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
				"WAYPT1",
			},
			id = "BRACKETS_WPT_NAME",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	BRANCH1 = {
		{
			alignment = "LFT",
			pages = {
				"BBCTL",
			},
			id = "BRANCH1",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	BVL = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT1",
			},
			id = "BVL",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	BVL_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"GPSBIT1",
			},
			id = "BVL_VAL",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	BVU = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT1",
			},
			id = "BVU",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	BVU_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"GPSBIT1",
			},
			id = "BVU_VAL",
			index = 0,
			static_text = true,
			x = 24,
			y = 6,
		},
	},
	B_ALT = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "B_ALT",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	B_ALT_ST = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "B_ALT_ST",
			index = 0,
			static_text = false,
			x = 21,
			y = 5,
		},
	},
	B_ALT_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "B_ALT_ST1",
			index = 0,
			static_text = false,
			x = 21,
			y = 5,
		},
	},
	B_ALT_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"CADC",
			},
			id = "B_ALT_VAL",
			index = 0,
			static_text = false,
			x = 13,
			y = 5,
		},
	},
	C = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "C",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	CADC = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "CADC",
			index = 0,
			static_text = true,
			x = 16,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CADC",
			index = 1,
			static_text = true,
			x = 2,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "CADC",
			index = 2,
			static_text = true,
			x = 18,
			y = 3,
		},
		{
			alignment = "RGHT",
			pages = {
				"SYS2",
			},
			id = "CADC",
			index = 3,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	CADC_SA = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CADC_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	CADC_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "CADC_ST0",
			index = 0,
			static_text = false,
			x = 21,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
				"RESET",
			},
			id = "CADC_ST0",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CADC_ST0",
			index = 2,
			static_text = false,
			x = 11,
			y = 6,
		},
	},
	CADC_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "CADC_ST1",
			index = 0,
			static_text = false,
			x = 21,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CADC_ST1",
			index = 1,
			static_text = false,
			x = 11,
			y = 6,
		},
	},
	CADC_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "CADC_ST2",
			index = 0,
			static_text = false,
			x = 21,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
				"RESET",
			},
			id = "CADC_ST2",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CADC_ST2",
			index = 2,
			static_text = false,
			x = 11,
			y = 6,
		},
	},
	CADC_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "CADC_ST3",
			index = 0,
			static_text = false,
			x = 21,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
				"RESET",
			},
			id = "CADC_ST3",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CADC_ST3",
			index = 2,
			static_text = false,
			x = 11,
			y = 6,
		},
	},
	CADC_ST4 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "CADC_ST4",
			index = 0,
			static_text = false,
			x = 21,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
				"RESET",
			},
			id = "CADC_ST4",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CADC_ST4",
			index = 2,
			static_text = false,
			x = 11,
			y = 6,
		},
	},
	CADC_STATUS0 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CADC_STATUS0",
			index = 0,
			static_text = false,
			x = 7,
			y = 5,
		},
	},
	CADC_STATUS1 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CADC_STATUS1",
			index = 0,
			static_text = false,
			x = 7,
			y = 5,
		},
	},
	CADC_STATUS2 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CADC_STATUS2",
			index = 0,
			static_text = false,
			x = 7,
			y = 5,
		},
	},
	CADC_STATUS3 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CADC_STATUS3",
			index = 0,
			static_text = false,
			x = 7,
			y = 5,
		},
	},
	CBIT1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT1",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	CBIT10 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT10",
			index = 0,
			static_text = true,
			x = 14,
			y = 5,
		},
	},
	CBIT11 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT11",
			index = 0,
			static_text = true,
			x = 14,
			y = 6,
		},
	},
	CBIT2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT2",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	CBIT3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT3",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	CBIT4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT4",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	CBIT5 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT5",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	CBIT6 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT6",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	CBIT7 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT7",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	CBIT8 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT8",
			index = 0,
			static_text = true,
			x = 14,
			y = 3,
		},
	},
	CBIT9 = {
		{
			alignment = "LFT",
			pages = {
				"EGI4",
			},
			id = "CBIT9",
			index = 0,
			static_text = true,
			x = 14,
			y = 4,
		},
	},
	CDU = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CDU",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "CDU",
			index = 1,
			static_text = true,
			x = 18,
			y = 6,
		},
	},
	CDUTEST = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
		{
			alignment = "RGHT",
			pages = {
				"SYS2",
			},
			id = "CDUTEST",
			index = 1,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	CDUTEST1 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST1",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
	},
	CDUTEST10 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST10",
			index = 0,
			static_text = false,
			x = 9,
			y = 6,
		},
	},
	CDUTEST11 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST11",
			index = 0,
			static_text = false,
			x = 9,
			y = 6,
		},
	},
	CDUTEST12 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST12",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	CDUTEST13 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST13",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	CDUTEST14 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST14",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	CDUTEST15 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST15",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	CDUTEST16 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST16",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	CDUTEST17 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST17",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	CDUTEST2 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST2",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	CDUTEST3 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST3",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	CDUTEST4 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST4",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	CDUTEST5 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST5",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	CDUTEST6 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST6",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	CDUTEST7 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST7",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	CDUTEST8 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST8",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	CDUTEST9 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "CDUTEST9",
			index = 0,
			static_text = false,
			x = 9,
			y = 6,
		},
	},
	CDU_LASTE = {
		{
			alignment = "RGHT",
			pages = {
				"DTSUPLD",
			},
			id = "CDU_LASTE",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	CDU_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CDU_ST0",
			index = 0,
			static_text = false,
			x = 17,
			y = 3,
		},
	},
	CDU_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "CDU_ST1",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CDU_ST1",
			index = 1,
			static_text = false,
			x = 17,
			y = 3,
		},
	},
	CDU_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "CDU_ST3",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CDU_ST3",
			index = 1,
			static_text = false,
			x = 17,
			y = 3,
		},
	},
	CDU_ST4 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "CDU_ST4",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "CDU_ST4",
			index = 1,
			static_text = false,
			x = 17,
			y = 3,
		},
	},
	CDU_STATUS0 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CDU_STATUS0",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	CDU_STATUS1 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CDU_STATUS1",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	CDU_STATUS2 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CDU_STATUS2",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	CDU_STATUS3 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CDU_STATUS3",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	CDU_SYS_ACTION = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "CDU_SYS_ACTION",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	CHASSIS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "CHASSIS",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	CHASSIS_STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "CHASSIS_STATUS",
			index = 0,
			static_text = true,
			x = 10,
			y = 6,
		},
	},
	CLEAR = {
		{
			alignment = "RGHT",
			pages = {
				"BBCTL",
			},
			id = "CLEAR",
			index = 0,
			static_text = true,
			x = 23,
			y = 7,
		},
	},
	CLEAR_SA = {
		{
			alignment = "RGHT",
			pages = {
				"BBCTL",
			},
			id = "CLEAR_SA",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	CODE = {
		{
			alignment = "LFT",
			pages = {
				"BITBALL",
			},
			id = "CODE",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	CR_ON_OFF = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "CR_ON_OFF",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	CR_ON_OFF1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "CR_ON_OFF1",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	CR_SYMB = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "CR_SYMB",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	CR_TXT = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "CR_TXT",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	CSCI = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "CSCI",
			index = 0,
			static_text = false,
			x = 4,
			y = 10,
		},
	},
	CTD = {
		{
			alignment = "LFT",
			pages = {
				"POS",
			},
			id = "CTD",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	CTD_VAL = {
		{
			alignment = "LFT",
			pages = {
				"POS",
			},
			id = "CTD_VAL",
			index = 0,
			static_text = false,
			x = 16,
			y = 8,
		},
	},
	CoordFormat0 = {
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
				"UPDATE",
			},
			id = "CoordFormat0",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	CoordFormat1 = {
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
				"UPDATE",
			},
			id = "CoordFormat1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	CurrFlightPlanLetter0 = {
		{
			alignment = "LFT",
			pages = {
				"1ST_LINE",
			},
			id = "CurrFlightPlanLetter0",
			index = 0,
			static_text = false,
			x = 10,
			y = 1,
		},
	},
	CurrFlightPlanLetter1 = {
		{
			alignment = "LFT",
			pages = {
				"1ST_LINE",
			},
			id = "CurrFlightPlanLetter1",
			index = 0,
			static_text = false,
			x = 10,
			y = 1,
		},
	},
	CurrFlightPlanNumber = {
		{
			alignment = "LFT",
			pages = {
				"1ST_LINE",
			},
			id = "CurrFlightPlanNumber",
			index = 0,
			static_text = false,
			x = 11,
			y = 1,
		},
	},
	CurrSteerPointAsterisk = {
		{
			alignment = "LFT",
			pages = {
				"1ST_LINE",
			},
			id = "CurrSteerPointAsterisk",
			index = 0,
			static_text = false,
			x = 14,
			y = 1,
		},
	},
	CurrSteerPointNumber = {
		{
			alignment = "LFT",
			pages = {
				"1ST_LINE",
			},
			id = "CurrSteerPointNumber",
			index = 0,
			static_text = false,
			x = 14,
			y = 1,
		},
	},
	Cursor = {
		{
			alignment = "LFT",
			pages = {},
			id = "Cursor",
			index = 0,
			static_text = false,
			x = 2,
			y = 10,
		},
	},
	DATA = {
		{
			alignment = "LFT",
			pages = {
				"DTSUPLD",
			},
			id = "DATA",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	DATA2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSUPLD",
			},
			id = "DATA2",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	DATA_OFF = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "DATA_OFF",
			index = 0,
			static_text = false,
			x = 21,
			y = 7,
		},
	},
	DATA_OFF1 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "DATA_OFF1",
			index = 0,
			static_text = false,
			x = 21,
			y = 7,
		},
	},
	DATA_PUMP = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "DATA_PUMP",
			index = 0,
			static_text = true,
			x = 11,
			y = 7,
		},
	},
	DAY = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DAY",
			index = 0,
			static_text = true,
			x = 16,
			y = 7,
		},
	},
	DAY_DE = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DAY_DE",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	DAY_TXT = {
		{
			alignment = "RGHT",
			pages = {
				"TIME",
			},
			id = "DAY_TXT",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	DECR = {
		{
			alignment = "RGHT",
			pages = {
				"MXLOG",
			},
			id = "DECR",
			index = 0,
			static_text = true,
			x = 23,
			y = 3,
		},
	},
	DEF_ATT = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "DEF_ATT",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	DEGREE1 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "DEGREE1",
			index = 0,
			static_text = true,
			x = 17,
			y = 5,
		},
	},
	DEGREE2 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "DEGREE2",
			index = 0,
			static_text = true,
			x = 17,
			y = 7,
		},
	},
	DEGREE3 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "DEGREE3",
			index = 0,
			static_text = true,
			x = 17,
			y = 9,
		},
	},
	DIS = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
			},
			id = "DIS",
			index = 0,
			static_text = true,
			x = 16,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "DIS",
			index = 1,
			static_text = true,
			x = 7,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "DIS",
			index = 2,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	DISPLAY_TEST = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST2",
			},
			id = "DISPLAY_TEST",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	DISPLAY_TEST1 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST2",
			},
			id = "DISPLAY_TEST1",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	DISPLAY_TEST_VALUES = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST2",
			},
			id = "DISPLAY_TEST_VALUES",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	DIVERT = {
		{
			alignment = "RGHT",
			pages = {
				"NAV",
			},
			id = "DIVERT",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	DIVERTDIV = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDIV",
			index = 0,
			static_text = false,
			x = 5,
			y = 4,
		},
	},
	DIVERTDIV1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDIV1",
			index = 0,
			static_text = false,
			x = 5,
			y = 6,
		},
	},
	DIVERTDIV2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDIV2",
			index = 0,
			static_text = false,
			x = 5,
			y = 8,
		},
	},
	DIVERTDIV3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDIV3",
			index = 0,
			static_text = false,
			x = 5,
			y = 10,
		},
	},
	DIVERTDistance = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDistance",
			index = 0,
			static_text = false,
			x = 6,
			y = 4,
		},
	},
	DIVERTDistance1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDistance1",
			index = 0,
			static_text = false,
			x = 6,
			y = 6,
		},
	},
	DIVERTDistance2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDistance2",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	DIVERTDistance3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTDistance3",
			index = 0,
			static_text = false,
			x = 6,
			y = 10,
		},
	},
	DIVERTMH = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTMH",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	DIVERTMH1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTMH1",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	DIVERTMH2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTMH2",
			index = 0,
			static_text = false,
			x = 2,
			y = 8,
		},
	},
	DIVERTMH3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTMH3",
			index = 0,
			static_text = false,
			x = 2,
			y = 10,
		},
	},
	DIVERTName = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTName",
			index = 0,
			static_text = false,
			x = 7,
			y = 3,
		},
	},
	DIVERTName1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTName1",
			index = 0,
			static_text = false,
			x = 7,
			y = 5,
		},
	},
	DIVERTName2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTName2",
			index = 0,
			static_text = false,
			x = 7,
			y = 7,
		},
	},
	DIVERTName3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTName3",
			index = 0,
			static_text = false,
			x = 7,
			y = 9,
		},
	},
	DIVERTNumber = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTNumber",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	DIVERTNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	DIVERTNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTNumber2",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	DIVERTNumber3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTNumber3",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	DIVERTSteer = {
		{
			alignment = "RGHT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteer",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	DIVERTSteer1 = {
		{
			alignment = "RGHT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteer1",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	DIVERTSteer2 = {
		{
			alignment = "RGHT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteer2",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	DIVERTSteer3 = {
		{
			alignment = "RGHT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteer3",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	DIVERTSteerNOT = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteerNOT",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	DIVERTSteerNOT1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteerNOT1",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	DIVERTSteerNOT2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteerNOT2",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	DIVERTSteerNOT3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTSteerNOT3",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	DIVERTTTG = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG",
			index = 0,
			static_text = false,
			x = 17,
			y = 4,
		},
	},
	DIVERTTTG1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG1",
			index = 0,
			static_text = false,
			x = 17,
			y = 4,
		},
	},
	DIVERTTTG2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG2",
			index = 0,
			static_text = false,
			x = 17,
			y = 6,
		},
	},
	DIVERTTTG3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG3",
			index = 0,
			static_text = false,
			x = 17,
			y = 6,
		},
	},
	DIVERTTTG4 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG4",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	DIVERTTTG5 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG5",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	DIVERTTTG6 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG6",
			index = 0,
			static_text = false,
			x = 17,
			y = 10,
		},
	},
	DIVERTTTG7 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTG7",
			index = 0,
			static_text = false,
			x = 17,
			y = 10,
		},
	},
	DIVERTTTGText = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTGText",
			index = 0,
			static_text = false,
			x = 12,
			y = 4,
		},
	},
	DIVERTTTGText1 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTGText1",
			index = 0,
			static_text = false,
			x = 12,
			y = 6,
		},
	},
	DIVERTTTGText2 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTGText2",
			index = 0,
			static_text = false,
			x = 12,
			y = 8,
		},
	},
	DIVERTTTGText3 = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "DIVERTTTGText3",
			index = 0,
			static_text = false,
			x = 12,
			y = 10,
		},
	},
	DKI = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "DKI",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "DKI",
			index = 1,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	DMH = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "DMH",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	DP_RTR = {
		{
			alignment = "RGHT",
			pages = {
				"CDUTEST1",
			},
			id = "DP_RTR",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	DSW1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT1",
			},
			id = "DSW1",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	DSW1_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"GPSBIT1",
			},
			id = "DSW1_VAL",
			index = 0,
			static_text = true,
			x = 24,
			y = 4,
		},
	},
	DSW2 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT1",
			},
			id = "DSW2",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	DSW2_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"GPSBIT1",
			},
			id = "DSW2_VAL",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	DTCID = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "DTCID",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	DTOT = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "DTOT",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "DTOT",
			index = 1,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	DTOT_ADJUST = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DTOT_ADJUST",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	DTOT_ADJUST_TXT = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DTOT_ADJUST_TXT",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	DTS = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "DTS",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTS",
			index = 1,
			static_text = true,
			x = 18,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS2",
			},
			id = "DTS",
			index = 2,
			static_text = true,
			x = 1,
			y = 3,
		},
		{
			alignment = "RGHT",
			pages = {
				"DTSDNLD",
				"DTSSTAT",
				"DTSUPLD",
			},
			id = "DTS",
			index = 3,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	DTSAS = {
		{
			alignment = "RGHT",
			pages = {
				"SYS1",
			},
			id = "DTSAS",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	DTSAS_EGI_STATUS = {
		{
			alignment = "RGHT",
			pages = {
				"1ST_LINE",
			},
			id = "DTSAS_EGI_STATUS",
			index = 0,
			static_text = false,
			x = 23,
			y = 1,
		},
	},
	DTSAS_HPU1 = {
		{
			alignment = "RGHT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_HPU1",
			index = 0,
			static_text = false,
			x = 10,
			y = 7,
		},
	},
	DTSAS_ON_OFF = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_ON_OFF",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	DTSAS_ON_OFF1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_ON_OFF1",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	DTSAS_OWC = {
		{
			alignment = "RGHT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_OWC",
			index = 0,
			static_text = false,
			x = 20,
			y = 9,
		},
	},
	DTSAS_OWC1 = {
		{
			alignment = "RGHT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_OWC1",
			index = 0,
			static_text = false,
			x = 20,
			y = 9,
		},
	},
	DTSAS_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTSAS_ST0",
			index = 0,
			static_text = false,
			x = 15,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTSAS_ST0",
			index = 1,
			static_text = false,
			x = 19,
			y = 6,
		},
	},
	DTSAS_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTSAS_ST2",
			index = 0,
			static_text = false,
			x = 15,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTSAS_ST2",
			index = 1,
			static_text = false,
			x = 19,
			y = 6,
		},
	},
	DTSAS_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTSAS_ST3",
			index = 0,
			static_text = false,
			x = 15,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTSAS_ST3",
			index = 1,
			static_text = false,
			x = 19,
			y = 6,
		},
	},
	DTSAS_SYMB = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_SYMB",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	DTSAS_TXT = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_TXT",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	DTSAS_VPU1 = {
		{
			alignment = "RGHT",
			pages = {
				"DTSAS",
			},
			id = "DTSAS_VPU1",
			index = 0,
			static_text = false,
			x = 9,
			y = 8,
		},
	},
	DTSDNLD = {
		{
			alignment = "RGHT",
			pages = {
				"DTS",
			},
			id = "DTSDNLD",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	DTSSTAT = {
		{
			alignment = "RGHT",
			pages = {
				"DTS",
			},
			id = "DTSSTAT",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	DTSUPLD = {
		{
			alignment = "RGHT",
			pages = {
				"DTS",
			},
			id = "DTSUPLD",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	DTSUPLOAD = {
		{
			alignment = "LFT",
			pages = {
				"NAV",
			},
			id = "DTSUPLOAD",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	DTS_LB = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "DTS_LB",
			index = 0,
			static_text = true,
			x = 18,
			y = 3,
		},
	},
	DTS_SA = {
		{
			alignment = "RGHT",
			pages = {
				"LRUTEST",
			},
			id = "DTS_SA",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	DTS_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "DTS_ST0",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTS_ST0",
			index = 1,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "DTS_ST0",
			index = 2,
			static_text = false,
			x = 23,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTS_ST0",
			index = 3,
			static_text = false,
			x = 17,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "DTS_ST0",
			index = 4,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	DTS_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "DTS_ST1",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTS_ST1",
			index = 1,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "DTS_ST1",
			index = 2,
			static_text = false,
			x = 23,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTS_ST1",
			index = 3,
			static_text = false,
			x = 17,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "DTS_ST1",
			index = 4,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	DTS_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "DTS_ST2",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTS_ST2",
			index = 1,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "DTS_ST2",
			index = 2,
			static_text = false,
			x = 23,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTS_ST2",
			index = 3,
			static_text = false,
			x = 17,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "DTS_ST2",
			index = 4,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	DTS_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "DTS_ST3",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "DTS_ST3",
			index = 1,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "DTS_ST3",
			index = 2,
			static_text = false,
			x = 23,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTS_ST3",
			index = 3,
			static_text = false,
			x = 17,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "DTS_ST3",
			index = 4,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	DTS_ST4 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "DTS_ST4",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "DTS_ST4",
			index = 1,
			static_text = false,
			x = 17,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "DTS_ST4",
			index = 2,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	DTS_STATUS0 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "DTS_STATUS0",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
	},
	DTS_STATUS1 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "DTS_STATUS1",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
	},
	DTS_STATUS2 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "DTS_STATUS2",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
	},
	DTS_STATUS3 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "DTS_STATUS3",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
	},
	DTTG = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "DTTG",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	DUR = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "DUR",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	DUR_VALS = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "DUR_VALS",
			index = 0,
			static_text = true,
			x = 9,
			y = 7,
		},
	},
	EEPROM = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "EEPROM",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "EEPROM",
			index = 1,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	EGI = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGI",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	EGIAvailableMode = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "EGIAvailableMode",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	EGIAvailableMode1 = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
			},
			id = "EGIAvailableMode1",
			index = 0,
			static_text = false,
			x = 24,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"ALTALGN",
			},
			id = "EGIAvailableMode1",
			index = 1,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	EGIAvailableMode2 = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
			},
			id = "EGIAvailableMode2",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	EGICurrentMode = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "EGICurrentMode",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
			},
			id = "EGICurrentMode",
			index = 1,
			static_text = false,
			x = 17,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"ALTALGN",
			},
			id = "EGICurrentMode",
			index = 2,
			static_text = false,
			x = 19,
			y = 3,
		},
	},
	EGICurrentMode1 = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "EGICurrentMode1",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
			},
			id = "EGICurrentMode1",
			index = 1,
			static_text = false,
			x = 18,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"ALTALGN",
			},
			id = "EGICurrentMode1",
			index = 2,
			static_text = false,
			x = 20,
			y = 7,
		},
	},
	EGICurrentMode2 = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
			},
			id = "EGICurrentMode2",
			index = 0,
			static_text = false,
			x = 20,
			y = 7,
		},
	},
	EGIStatus = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "EGIStatus",
			index = 1,
			static_text = false,
			x = 20,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus",
			index = 2,
			static_text = false,
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "EGIStatus",
			index = 3,
			static_text = false,
			x = 8,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus",
			index = 4,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	EGIStatus1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus1",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "EGIStatus1",
			index = 1,
			static_text = false,
			x = 20,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus1",
			index = 2,
			static_text = false,
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "EGIStatus1",
			index = 3,
			static_text = false,
			x = 8,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus1",
			index = 4,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	EGIStatus10 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus10",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus10",
			index = 1,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus10",
			index = 2,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	EGIStatus11 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus11",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus11",
			index = 1,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus11",
			index = 2,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	EGIStatus12 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus12",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus12",
			index = 1,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus12",
			index = 2,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	EGIStatus13 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus13",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus13",
			index = 1,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus13",
			index = 2,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	EGIStatus14 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus14",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus14",
			index = 1,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus14",
			index = 2,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	EGIStatus15 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus15",
			index = 0,
			static_text = false,
			x = 17,
			y = 5,
		},
	},
	EGIStatus16 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus16",
			index = 0,
			static_text = false,
			x = 17,
			y = 5,
		},
	},
	EGIStatus2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus2",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "EGIStatus2",
			index = 1,
			static_text = false,
			x = 20,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus2",
			index = 2,
			static_text = false,
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "EGIStatus2",
			index = 3,
			static_text = false,
			x = 8,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus2",
			index = 4,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	EGIStatus3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus3",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "EGIStatus3",
			index = 1,
			static_text = false,
			x = 20,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus3",
			index = 2,
			static_text = false,
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "EGIStatus3",
			index = 3,
			static_text = false,
			x = 8,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus3",
			index = 4,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	EGIStatus4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus4",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "EGIStatus4",
			index = 1,
			static_text = false,
			x = 20,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus4",
			index = 2,
			static_text = false,
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "EGIStatus4",
			index = 3,
			static_text = false,
			x = 8,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus4",
			index = 4,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	EGIStatus5 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus5",
			index = 0,
			static_text = false,
			x = 14,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus5",
			index = 1,
			static_text = false,
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus5",
			index = 2,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	EGIStatus6 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus6",
			index = 0,
			static_text = false,
			x = 14,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus6",
			index = 1,
			static_text = false,
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus6",
			index = 2,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	EGIStatus7 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus7",
			index = 0,
			static_text = false,
			x = 14,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus7",
			index = 1,
			static_text = false,
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus7",
			index = 2,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	EGIStatus8 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus8",
			index = 0,
			static_text = false,
			x = 14,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus8",
			index = 1,
			static_text = false,
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus8",
			index = 2,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	EGIStatus9 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGIStatus9",
			index = 0,
			static_text = false,
			x = 14,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "EGIStatus9",
			index = 1,
			static_text = false,
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "EGIStatus9",
			index = 2,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	EGITEST = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "EGITEST",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	EGI_BLD_FOM = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM1",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM2",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM3",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM4",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM5 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM5",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM6 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM6",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM7 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM7",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM8 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM8",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_BLD_FOM9 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_BLD_FOM9",
			index = 0,
			static_text = false,
			x = 22,
			y = 8,
		},
	},
	EGI_GPS_EHE = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_EHE",
			index = 0,
			static_text = false,
			x = 15,
			y = 4,
		},
	},
	EGI_GPS_EHE1 = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_EHE1",
			index = 0,
			static_text = false,
			x = 15,
			y = 4,
		},
	},
	EGI_GPS_EVE = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_EVE",
			index = 0,
			static_text = false,
			x = 15,
			y = 5,
		},
	},
	EGI_GPS_EVE1 = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_EVE1",
			index = 0,
			static_text = false,
			x = 15,
			y = 5,
		},
	},
	EGI_GPS_FOM = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM1",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM1",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM2",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM2",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM3",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM3",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM4",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM4",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM5 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM5",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM5",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM6 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM6",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM6",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM7 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM7",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM7",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM8 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM8",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM8",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_FOM9 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_GPS_FOM9",
			index = 0,
			static_text = false,
			x = 14,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_FOM9",
			index = 1,
			static_text = false,
			x = 15,
			y = 3,
		},
	},
	EGI_GPS_ST3 = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_ST3",
			index = 0,
			static_text = false,
			x = 15,
			y = 7,
		},
	},
	EGI_GPS_ST31 = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_ST31",
			index = 0,
			static_text = false,
			x = 15,
			y = 7,
		},
	},
	EGI_GPS_ST5 = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_ST5",
			index = 0,
			static_text = false,
			x = 15,
			y = 6,
		},
	},
	EGI_GPS_ST51 = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "EGI_GPS_ST51",
			index = 0,
			static_text = false,
			x = 15,
			y = 6,
		},
	},
	EGI_INS_FOM = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM1",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM2",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM3",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM4",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM5 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM5",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM6 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM6",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM7 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM7",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM8 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM8",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_INS_FOM9 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "EGI_INS_FOM9",
			index = 0,
			static_text = false,
			x = 6,
			y = 8,
		},
	},
	EGI_OFP = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "EGI_OFP",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	EGI_SA = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "EGI_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	EHE = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "EHE",
			index = 0,
			static_text = true,
			x = 8,
			y = 4,
		},
	},
	EL = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "EL",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	ELEVATION = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "ELEVATION",
			index = 0,
			static_text = true,
			x = 16,
			y = 4,
		},
	},
	EMPTY = {
		{
			alignment = "LFT",
			pages = {
				"MXLOG",
			},
			id = "EMPTY",
			index = 0,
			static_text = true,
			x = 3,
			y = 5,
		},
	},
	ERASE = {
		{
			alignment = "LFT",
			pages = {
				"MXLOG",
			},
			id = "ERASE",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	ERASEFL = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "ERASEFL",
			index = 0,
			static_text = true,
			x = 13,
			y = 4,
		},
	},
	ERASEFs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "ERASEFs",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	ERASEFs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "ERASEFs1",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	ERASE_SA = {
		{
			alignment = "LFT",
			pages = {
				"MXLOG",
			},
			id = "ERASE_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	EVE = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "EVE",
			index = 0,
			static_text = true,
			x = 8,
			y = 5,
		},
	},
	EX = {
		{
			alignment = "LFT",
			pages = {
				"BITBALL",
			},
			id = "EX",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	EstimatedDrift = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "EstimatedDrift",
			index = 0,
			static_text = false,
			x = 13,
			y = 8,
		},
	},
	F = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "F",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "F",
			index = 1,
			static_text = true,
			x = 5,
			y = 4,
		},
	},
	FAST = {
		{
			alignment = "RGHT",
			pages = {
				"ALTALGN",
			},
			id = "FAST",
			index = 0,
			static_text = true,
			x = 23,
			y = 3,
		},
	},
	FAULT = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "FAULT",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	FAUL_STATUS0 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "FAUL_STATUS0",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	FAUL_STATUS1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "FAUL_STATUS1",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	FLDINFO = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT2",
			},
			id = "FLDINFO",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	FLDINFO_APP_UHF = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_APP_UHF",
			index = 0,
			static_text = false,
			x = 7,
			y = 9,
		},
	},
	FLDINFO_APP_VHF = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_APP_VHF",
			index = 0,
			static_text = false,
			x = 15,
			y = 9,
		},
	},
	FLDINFO_BR = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT2",
			},
			id = "FLDINFO_BR",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	FLDINFO_ELEV = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_ELEV",
			index = 0,
			static_text = false,
			x = 21,
			y = 4,
		},
	},
	FLDINFO_ID = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_ID",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	FLDINFO_ILS1 = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_ILS1",
			index = 0,
			static_text = false,
			x = 7,
			y = 7,
		},
	},
	FLDINFO_ILS2 = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_ILS2",
			index = 0,
			static_text = false,
			x = 15,
			y = 7,
		},
	},
	FLDINFO_NUM = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_NUM",
			index = 0,
			static_text = false,
			x = 16,
			y = 3,
		},
	},
	FLDINFO_Name = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_Name",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	FLDINFO_RWY_HD = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_RWY_HD",
			index = 0,
			static_text = false,
			x = 7,
			y = 6,
		},
	},
	FLDINFO_RWY_HD2 = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_RWY_HD2",
			index = 0,
			static_text = false,
			x = 15,
			y = 6,
		},
	},
	FLDINFO_RWY_LNG = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_RWY_LNG",
			index = 0,
			static_text = false,
			x = 19,
			y = 6,
		},
	},
	FLDINFO_TAC_CHAN = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_TAC_CHAN",
			index = 0,
			static_text = false,
			x = 7,
			y = 8,
		},
	},
	FLDINFO_TAC_OFF = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_TAC_OFF",
			index = 0,
			static_text = false,
			x = 11,
			y = 8,
		},
	},
	FLDINFO_TWR_UHF = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_TWR_UHF",
			index = 0,
			static_text = false,
			x = 7,
			y = 10,
		},
	},
	FLDINFO_TWR_VHF = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "FLDINFO_TWR_VHF",
			index = 0,
			static_text = false,
			x = 15,
			y = 10,
		},
	},
	["FLIGHT DRIVER"] = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "FLIGHT DRIVER",
			index = 0,
			static_text = true,
			x = 5,
			y = 4,
		},
	},
	FLIGHT_DRIVER = {
		{
			alignment = "RGHT",
			pages = {
				"NAV",
				"POS",
			},
			id = "FLIGHT_DRIVER",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	FLIGHT_DRIVER1 = {
		{
			alignment = "RGHT",
			pages = {
				"NAV",
				"POS",
			},
			id = "FLIGHT_DRIVER1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "FLIGHT_DRIVER1",
			index = 1,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	FLIGHT_DRIVER2 = {
		{
			alignment = "RGHT",
			pages = {
				"NAV",
				"POS",
			},
			id = "FLIGHT_DRIVER2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "FLIGHT_DRIVER2",
			index = 1,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	FLIGHT_DRIVER3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "FLIGHT_DRIVER3",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"POS",
			},
			id = "FLIGHT_DRIVER3",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	FLIGHT_DRIVER4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "FLIGHT_DRIVER4",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	FLTR_INS = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "FLTR_INS",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	FLTR_INSs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "FLTR_INSs",
			index = 0,
			static_text = false,
			x = 11,
			y = 9,
		},
	},
	FLTR_INSs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "FLTR_INSs1",
			index = 0,
			static_text = false,
			x = 11,
			y = 9,
		},
	},
	FOM = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "FOM",
			index = 0,
			static_text = true,
			x = 11,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "FOM",
			index = 1,
			static_text = true,
			x = 8,
			y = 3,
		},
	},
	FOM_LINE = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "FOM_LINE",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	FPAction = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPAction",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	FPAction1 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPAction1",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	FPAction2 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPAction2",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	FPBUILDBranch = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPBUILDBranch",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	FPBUILDBranch1 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPBUILDBranch1",
			index = 0,
			static_text = false,
			x = 24,
			y = 5,
		},
	},
	FPBUILDBranch2 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPBUILDBranch2",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	FPBUILDPlanName = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "FPBUILDPlanName",
			index = 0,
			static_text = false,
			x = 5,
			y = 3,
		},
	},
	FPBUILDPlanNumber = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "FPBUILDPlanNumber",
			index = 0,
			static_text = false,
			x = 6,
			y = 4,
		},
	},
	FPMode = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPMode",
			index = 0,
			static_text = false,
			x = 5,
			y = 3,
		},
	},
	FPMode1 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPMode1",
			index = 0,
			static_text = false,
			x = 5,
			y = 3,
		},
	},
	FPMode2 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPMode2",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	FPMode3 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPMode3",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	FPMode4 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPMode4",
			index = 0,
			static_text = false,
			x = 5,
			y = 7,
		},
	},
	FPMode5 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPMode5",
			index = 0,
			static_text = false,
			x = 5,
			y = 7,
		},
	},
	FPName = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPName",
			index = 0,
			static_text = false,
			x = 11,
			y = 3,
		},
	},
	FPName1 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPName1",
			index = 0,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	FPName2 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPName2",
			index = 0,
			static_text = false,
			x = 11,
			y = 7,
		},
	},
	FPNameInput = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPNameInput",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	FPNumber = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPNumber",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	FPNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	FPNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FPNumber2",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	FPP = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "FPP",
			index = 0,
			static_text = false,
			x = 1,
			y = 6,
		},
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "FPP",
			index = 1,
			static_text = true,
			x = 1,
			y = 6,
		},
	},
	FROM_CF_RTRY = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_CF_RTRY",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	FROM_CoordFormat0 = {
		{
			alignment = "RGHT",
			pages = {
				"FROM",
			},
			id = "FROM_CoordFormat0",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	FROM_CoordFormat1 = {
		{
			alignment = "RGHT",
			pages = {
				"FROM",
			},
			id = "FROM_CoordFormat1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	FROM_DataEntry0 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_DataEntry0",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	FROM_DataEntry1 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_DataEntry1",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	FROM_Lat = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_Lat",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	FROM_Lat1 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_Lat1",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	FROM_Long = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_Long",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	FROM_Long1 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_Long1",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	FROM_NUMBER = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "FROM_NUMBER",
			index = 0,
			static_text = false,
			x = 20,
			y = 2,
		},
	},
	FROM_PT = {
		{
			alignment = "RGHT",
			pages = {
				"WPMENU",
			},
			id = "FROM_PT",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	FROM_PointArea = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_PointArea",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	FROM_PointArea1 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_PointArea1",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	FROM_PointGrid = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_PointGrid",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	FROM_PointGrid1 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_PointGrid1",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	FROM_TITLE = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "FROM_TITLE",
			index = 0,
			static_text = false,
			x = 15,
			y = 2,
		},
	},
	FROM_WptIdent = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_WptIdent",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	FROM_WptIdent1 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_WptIdent1",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	FROM_WptNumber = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_WptNumber",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	FROM_WptNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "FROM_WptNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	FT_BRACKETS = {
		{
			alignment = "RGHT",
			pages = {
				"DTSAS",
			},
			id = "FT_BRACKETS",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
	},
	FT_TXT = {
		{
			alignment = "RGHT",
			pages = {
				"DTSAS",
			},
			id = "FT_TXT",
			index = 0,
			static_text = true,
			x = 23,
			y = 9,
		},
	},
	FULLText = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "FULLText",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
	},
	FWI = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT2",
				"GPSBIT3",
				"GPSBIT4",
			},
			id = "FWI",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	GC = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT1",
			},
			id = "GC",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	GC1 = {
		{
			alignment = "RGHT",
			pages = {
				"GPSBIT1",
			},
			id = "GC1",
			index = 0,
			static_text = true,
			x = 24,
			y = 8,
		},
	},
	GCAS_LAST_SOURCE = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "GCAS_LAST_SOURCE",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	GCAS_MSGS = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "GCAS_MSGS",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	GCAS_MSGS1 = {
		{
			alignment = "RGHT",
			pages = {
				"LASTE",
			},
			id = "GCAS_MSGS1",
			index = 0,
			static_text = false,
			x = 16,
			y = 9,
		},
	},
	GEM_OFP = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GEM_OFP",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	GEM_SA = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GEM_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	GMT_DE = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "GMT_DE",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
	},
	GMT_LCL1 = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "GMT_LCL1",
			index = 0,
			static_text = false,
			x = 12,
			y = 9,
		},
	},
	GMT_LCL2 = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "GMT_LCL2",
			index = 0,
			static_text = false,
			x = 12,
			y = 9,
		},
	},
	GMT_LCL_Time = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "GMT_LCL_Time",
			index = 0,
			static_text = false,
			x = 16,
			y = 9,
		},
	},
	GPS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GPS",
			index = 0,
			static_text = true,
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "GPS",
			index = 1,
			static_text = true,
			x = 1,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPSBIT1",
				"GPSBIT2",
				"GPSBIT3",
				"GPSKEYS",
				"GPSSTAT2",
			},
			id = "GPS",
			index = 2,
			static_text = true,
			x = 24,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
			},
			id = "GPS",
			index = 3,
			static_text = true,
			x = 1,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GPS",
			index = 4,
			static_text = true,
			x = 14,
			y = 3,
		},
	},
	GPS1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSDNLD",
			},
			id = "GPS1",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPSBIT4",
				"GPSBIT5",
				"GPSSTAT1",
			},
			id = "GPS1",
			index = 1,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	GPS2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSDNLD",
			},
			id = "GPS2",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	GPSAltitude = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "GPSAltitude",
			index = 0,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	GPSAltitude1 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "GPSAltitude1",
			index = 0,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	GPSAltitude2 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "GPSAltitude2",
			index = 0,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	GPSAltitude3 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "GPSAltitude3",
			index = 0,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	GPSAltitude4 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "GPSAltitude4",
			index = 0,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	GPSBIT = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "GPSBIT",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	GPSKEYS = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "GPSKEYS",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	GPSSTAT = {
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "GPSSTAT",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	GPSStatus = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GPSStatus",
			index = 0,
			static_text = false,
			x = 20,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GPSStatus",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	GPSStatus1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GPSStatus1",
			index = 0,
			static_text = false,
			x = 20,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GPSStatus1",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	GPSStatus2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GPSStatus2",
			index = 0,
			static_text = false,
			x = 20,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GPSStatus2",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	GPSStatus3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GPSStatus3",
			index = 0,
			static_text = false,
			x = 20,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GPSStatus3",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	GPSStatus4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GPSStatus4",
			index = 0,
			static_text = false,
			x = 20,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GPSStatus4",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	GPS_SA = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "GPS_SA",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	GPS_SA1 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "GPS_SA1",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	GPS_STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "GPS_STATUS",
			index = 0,
			static_text = true,
			x = 20,
			y = 3,
		},
	},
	GPS_STATUS0 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "GPS_STATUS0",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
	},
	GPS_STATUS1 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "GPS_STATUS1",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
	},
	GPS_STATUS2 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "GPS_STATUS2",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
	},
	GPS_STATUS3 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "GPS_STATUS3",
			index = 0,
			static_text = false,
			x = 6,
			y = 3,
		},
	},
	GROUND = {
		{
			alignment = "RGHT",
			pages = {
				"ALIGN",
			},
			id = "GROUND",
			index = 0,
			static_text = true,
			x = 23,
			y = 3,
		},
	},
	GUK_USER = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GUK_USER",
			index = 0,
			static_text = true,
			x = 14,
			y = 6,
		},
	},
	GUK_USERs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GUK_USERs",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	GUK_USERs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "GUK_USERs1",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	G_ALT = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "G_ALT",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	HARS = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "HARS",
			index = 0,
			static_text = true,
			x = 18,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "HARS",
			index = 1,
			static_text = true,
			x = 18,
			y = 4,
		},
		{
			alignment = "RGHT",
			pages = {
				"SYS1",
			},
			id = "HARS",
			index = 2,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	HARS_I_F = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "HARS_I_F",
			index = 0,
			static_text = false,
			x = 13,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "HARS_I_F",
			index = 1,
			static_text = true,
			x = 13,
			y = 3,
		},
	},
	HARS_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "HARS_ST2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "HARS_ST2",
			index = 1,
			static_text = false,
			x = 23,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "HARS_ST2",
			index = 2,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "HARS_ST2",
			index = 3,
			static_text = false,
			x = 11,
			y = 7,
		},
	},
	HARS_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "HARS_ST3",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "HARS_ST3",
			index = 1,
			static_text = false,
			x = 23,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "HARS_ST3",
			index = 2,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "HARS_ST3",
			index = 3,
			static_text = false,
			x = 11,
			y = 7,
		},
	},
	HAS_KEYS = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "HAS_KEYS",
			index = 0,
			static_text = true,
			x = 13,
			y = 5,
		},
	},
	HAS_KEYSs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "HAS_KEYSs",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	HAS_KEYSs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "HAS_KEYSs1",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	HPU = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "HPU",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	HUD_ATT = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "HUD_ATT",
			index = 0,
			static_text = true,
			x = 10,
			y = 5,
		},
	},
	HUD_ATT1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "HUD_ATT1",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	HUD_ATT2 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "HUD_ATT2",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	HUD_IND = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "HUD_IND",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	HUD_OFF = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "HUD_OFF",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
	},
	HUD_ON = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "HUD_ON",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
	},
	IAS = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "IAS",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	IAS_ST = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "IAS_ST",
			index = 0,
			static_text = false,
			x = 21,
			y = 8,
		},
	},
	IAS_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "IAS_ST1",
			index = 0,
			static_text = false,
			x = 21,
			y = 8,
		},
	},
	IAS_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"CADC",
			},
			id = "IAS_VAL",
			index = 0,
			static_text = false,
			x = 16,
			y = 8,
		},
	},
	IE = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "IE",
			index = 0,
			static_text = true,
			x = 15,
			y = 4,
		},
	},
	IE_STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "IE_STATUS",
			index = 0,
			static_text = true,
			x = 20,
			y = 4,
		},
	},
	IIW = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT5",
			},
			id = "IIW",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	ILS = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "ILS",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	ILS1 = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "ILS1",
			index = 0,
			static_text = true,
			x = 2,
			y = 10,
		},
	},
	INCR = {
		{
			alignment = "LFT",
			pages = {
				"MXLOG",
			},
			id = "INCR",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	INFLT = {
		{
			alignment = "RGHT",
			pages = {
				"ALIGN",
			},
			id = "INFLT",
			index = 0,
			static_text = true,
			x = 23,
			y = 5,
		},
	},
	INIT = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "INIT",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "INIT",
			index = 1,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	INITWAYPTIdent1 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "INITWAYPTIdent1",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	INITWAYPTIdent2 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "INITWAYPTIdent2",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	INITWAYPTNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "INITWAYPTNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	INITWAYPTNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "INITWAYPTNumber2",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	INITWAYPT_INCR_DECR = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "INITWAYPT_INCR_DECR",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	INIT_REQ = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "INIT_REQ",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	INIT_REQs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "INIT_REQs",
			index = 0,
			static_text = false,
			x = 11,
			y = 6,
		},
	},
	INIT_REQs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "INIT_REQs1",
			index = 0,
			static_text = false,
			x = 11,
			y = 6,
		},
	},
	INS = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "INS",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "INS",
			index = 1,
			static_text = true,
			x = 24,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "INS",
			index = 2,
			static_text = true,
			x = 1,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "INS",
			index = 3,
			static_text = false,
			x = 24,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "INS",
			index = 4,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	INS1 = {
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "INS1",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	INS2 = {
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "INS2",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	INSERT = {
		{
			alignment = "RGHT",
			pages = {
				"FPBUILD",
			},
			id = "INSERT",
			index = 0,
			static_text = true,
			x = 23,
			y = 3,
		},
	},
	INSERTDisplay = {
		{
			alignment = "RGHT",
			pages = {
				"FPBUILD",
			},
			id = "INSERTDisplay",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	INSSTAT = {
		{
			alignment = "RGHT",
			pages = {
				"INS",
			},
			id = "INSSTAT",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	INS_SA = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "INS_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	INS_ST = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "INS_ST",
			index = 0,
			static_text = true,
			x = 19,
			y = 3,
		},
	},
	INS_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "INS_ST1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	INS_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "INS_ST2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	INS_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "INS_ST3",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	INS_ST4 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "INS_ST4",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	INS_ST5 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "INS_ST5",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	INS_STATUS0 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "INS_STATUS0",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	INS_STATUS1 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "INS_STATUS1",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	INS_STATUS2 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "INS_STATUS2",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	INS_STATUS3 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "INS_STATUS3",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	INVALID = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "INVALID",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	INVALID_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "INVALID_ST0",
			index = 0,
			static_text = false,
			x = 10,
			y = 3,
		},
	},
	INVALID_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "INVALID_ST1",
			index = 0,
			static_text = false,
			x = 10,
			y = 3,
		},
	},
	IN_FP = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "IN_FP",
			index = 0,
			static_text = true,
			x = 19,
			y = 3,
		},
	},
	ISA = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "ISA",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	ISA_STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "ISA_STATUS",
			index = 0,
			static_text = true,
			x = 10,
			y = 4,
		},
	},
	I_F_1553 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "I_F_1553",
			index = 0,
			static_text = false,
			x = 13,
			y = 5,
		},
	},
	InitInputLatUTM = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitInputLatUTM",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	InitInputLongMGRS = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitInputLongMGRS",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	InitPosCoordFormat_LL = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitPosCoordFormat_LL",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	InitPosCoordFormat_UTM = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitPosCoordFormat_UTM",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	InitPositLat = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitPositLat",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	InitPositLong = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitPositLong",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	InitPositMGRS = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitPositMGRS",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	InitPositText = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitPositText",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	InitPositUTM = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "InitPositUTM",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	KEYLOAD = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "KEYLOAD",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	KEY_2HR = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_2HR",
			index = 0,
			static_text = true,
			x = 14,
			y = 8,
		},
	},
	KEY_DUR = {
		{
			alignment = "RGHT",
			pages = {
				"GPSKEYS",
			},
			id = "KEY_DUR",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPSSTAT2",
			},
			id = "KEY_DUR",
			index = 1,
			static_text = false,
			x = 12,
			y = 7,
		},
	},
	KEY_PAR = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_PAR",
			index = 0,
			static_text = true,
			x = 14,
			y = 7,
		},
	},
	KEY_PARs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_PARs",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	KEY_PARs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_PARs1",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	KEY_PARs2 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_PARs2",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
	},
	KEY_PARs3 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_PARs3",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
	},
	KEY_REM = {
		{
			alignment = "RGHT",
			pages = {
				"GPSKEYS",
			},
			id = "KEY_REM",
			index = 0,
			static_text = false,
			x = 11,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPSSTAT2",
			},
			id = "KEY_REM",
			index = 1,
			static_text = false,
			x = 16,
			y = 7,
		},
	},
	KEY_USED = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_USED",
			index = 0,
			static_text = true,
			x = 14,
			y = 5,
		},
	},
	KEY_USEDs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_USEDs",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	KEY_USEDs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_USEDs1",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	KEY_USEDs2 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_USEDs2",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	KEY_USEDs3 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "KEY_USEDs3",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	KLDs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "KLDs",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	KLDs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "KLDs1",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	KYK = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT1",
			},
			id = "KYK",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	L4 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT2",
				"GPSBIT3",
			},
			id = "L4",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	L5 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT2",
				"GPSBIT3",
			},
			id = "L5",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	LAR = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "LAR",
			index = 0,
			static_text = true,
			x = 17,
			y = 6,
		},
	},
	LAR_VALUE = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "LAR_VALUE",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	LAR_VALUE1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "LAR_VALUE1",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	LAR_VALUE2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "LAR_VALUE2",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	LASTE = {
		{
			alignment = "RGHT",
			pages = {
				"SYS1",
			},
			id = "LASTE",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "LASTE",
			index = 1,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	LASTE_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "LASTE_ST0",
			index = 0,
			static_text = false,
			x = 15,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LASTE_ST0",
			index = 1,
			static_text = false,
			x = 11,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "LASTE_ST0",
			index = 2,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	LASTE_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "LASTE_ST1",
			index = 0,
			static_text = false,
			x = 15,
			y = 7,
		},
	},
	LASTE_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LASTE_ST2",
			index = 0,
			static_text = false,
			x = 11,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "LASTE_ST2",
			index = 1,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	LASTE_V = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "LASTE_V",
			index = 0,
			static_text = true,
			x = 17,
			y = 3,
		},
	},
	LCL_ADJUST = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "LCL_ADJUST",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	LCL_ADJUST_TXT = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "LCL_ADJUST_TXT",
			index = 0,
			static_text = false,
			x = 2,
			y = 8,
		},
	},
	LINE7 = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "LINE7",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	LINE9 = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "LINE9",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	LOAD_PASS = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "LOAD_PASS",
			index = 0,
			static_text = true,
			x = 11,
			y = 7,
		},
	},
	LRU1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSDNLD",
			},
			id = "LRU1",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	LRU2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSDNLD",
			},
			id = "LRU2",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	LRUTEST = {
		{
			alignment = "RGHT",
			pages = {
				"CDUTEST1",
				"EGITEST",
			},
			id = "LRUTEST",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"SYS2",
			},
			id = "LRUTEST",
			index = 1,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	LRU_CADC = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_CADC",
			index = 0,
			static_text = false,
			x = 6,
			y = 6,
		},
	},
	LRU_CDU = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_CDU",
			index = 0,
			static_text = false,
			x = 13,
			y = 3,
		},
	},
	LRU_DTS = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_DTS",
			index = 0,
			static_text = false,
			x = 13,
			y = 5,
		},
	},
	LRU_DTSAS = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_DTSAS",
			index = 0,
			static_text = false,
			x = 13,
			y = 6,
		},
	},
	LRU_GPS = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_GPS",
			index = 0,
			static_text = false,
			x = 7,
			y = 4,
		},
	},
	LRU_HARS = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_HARS",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	LRU_INS = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_INS",
			index = 0,
			static_text = false,
			x = 7,
			y = 3,
		},
	},
	LRU_LASTE = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_LASTE",
			index = 0,
			static_text = false,
			x = 5,
			y = 8,
		},
	},
	LRU_MBC = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_MBC",
			index = 0,
			static_text = false,
			x = 13,
			y = 4,
		},
	},
	LRU_MSN = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "LRU_MSN",
			index = 0,
			static_text = false,
			x = 7,
			y = 5,
		},
	},
	MACH = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "MACH",
			index = 0,
			static_text = true,
			x = 18,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "MACH",
			index = 1,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	MACH_ST = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "MACH_ST",
			index = 0,
			static_text = false,
			x = 21,
			y = 7,
		},
	},
	MACH_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "MACH_ST1",
			index = 0,
			static_text = false,
			x = 21,
			y = 7,
		},
	},
	MACH_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"CADC",
			},
			id = "MACH_VAL",
			index = 0,
			static_text = false,
			x = 16,
			y = 7,
		},
	},
	MAGH_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "MAGH_ST2",
			index = 0,
			static_text = false,
			x = 19,
			y = 9,
		},
	},
	MAGH_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "MAGH_ST3",
			index = 0,
			static_text = false,
			x = 19,
			y = 9,
		},
	},
	MAGH_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"HARS",
			},
			id = "MAGH_VAL",
			index = 0,
			static_text = false,
			x = 16,
			y = 9,
		},
	},
	MAG_HEAD = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "MAG_HEAD",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	MBC = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "MBC",
			index = 0,
			static_text = true,
			x = 18,
			y = 7,
		},
	},
	MBC1 = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "MBC1",
			index = 0,
			static_text = true,
			x = 23,
			y = 7,
		},
	},
	MBIT1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT1",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	MBIT10 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT10",
			index = 0,
			static_text = true,
			x = 14,
			y = 5,
		},
	},
	MBIT11 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT11",
			index = 0,
			static_text = true,
			x = 14,
			y = 6,
		},
	},
	MBIT2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT2",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	MBIT3 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT3",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	MBIT4 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT4",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	MBIT5 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT5",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	MBIT6 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT6",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	MBIT7 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT7",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	MBIT8 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT8",
			index = 0,
			static_text = true,
			x = 14,
			y = 3,
		},
	},
	MBIT9 = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
			},
			id = "MBIT9",
			index = 0,
			static_text = true,
			x = 14,
			y = 4,
		},
	},
	MH = {
		{
			alignment = "RGHT",
			pages = {
				"ALTALGN",
			},
			id = "MH",
			index = 0,
			static_text = true,
			x = 16,
			y = 5,
		},
	},
	MH1 = {
		{
			alignment = "RGHT",
			pages = {
				"ALTALGN",
			},
			id = "MH1",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	MHD = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
			},
			id = "MHD",
			index = 0,
			static_text = true,
			x = 18,
			y = 7,
		},
	},
	MHD_ERR = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
			},
			id = "MHD_ERR",
			index = 0,
			static_text = false,
			x = 21,
			y = 7,
		},
	},
	MH_DE = {
		{
			alignment = "LFT",
			pages = {
				"ALTALGN",
			},
			id = "MH_DE",
			index = 0,
			static_text = false,
			x = 24,
			y = 5,
		},
	},
	MISC_ADDR = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "MISC_ADDR",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	MISSION = {
		{
			alignment = "LFT",
			pages = {
				"MXLOG",
			},
			id = "MISSION",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	MODE = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "MODE",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE",
			index = 1,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	MODE0 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE0",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE1",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE2 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE2",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE3 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE3",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE4 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE4",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE5 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE5",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE6 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE6",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE7 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE7",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE8 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE8",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MODE9 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "MODE9",
			index = 0,
			static_text = false,
			x = 8,
			y = 3,
		},
	},
	MONTH = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "MONTH",
			index = 0,
			static_text = true,
			x = 16,
			y = 5,
		},
	},
	MONTH_DE = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "MONTH_DE",
			index = 0,
			static_text = false,
			x = 24,
			y = 5,
		},
	},
	MONTH_TXT = {
		{
			alignment = "RGHT",
			pages = {
				"TIME",
			},
			id = "MONTH_TXT",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	MSN = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "MSN",
			index = 0,
			static_text = true,
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "MSN",
			index = 1,
			static_text = true,
			x = 18,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "MSN",
			index = 2,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	MSN_DUR = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "MSN_DUR",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	MSN_SA = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "MSN_SA",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	MSN_STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "MSN_STATUS",
			index = 0,
			static_text = true,
			x = 20,
			y = 5,
		},
	},
	MSN_STATUS0 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "MSN_STATUS0",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	MSN_STATUS1 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "MSN_STATUS1",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	MSN_STATUS2 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "MSN_STATUS2",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	MSN_STATUS3 = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "MSN_STATUS3",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	MV = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "MV",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "MV",
			index = 1,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	MV1 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "MV1",
			index = 0,
			static_text = false,
			x = 17,
			y = 5,
		},
	},
	MV2 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "MV2",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	MV3 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "MV3",
			index = 0,
			static_text = false,
			x = 17,
			y = 5,
		},
	},
	MV4 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "MV4",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	MV5 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "MV5",
			index = 0,
			static_text = false,
			x = 17,
			y = 5,
		},
	},
	MV6 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "MV6",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	MV_EQ = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "MV_EQ",
			index = 0,
			static_text = false,
			x = 18,
			y = 5,
		},
	},
	MV_EQ1 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "MV_EQ1",
			index = 0,
			static_text = false,
			x = 18,
			y = 5,
		},
	},
	MV_EQ2 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "MV_EQ2",
			index = 0,
			static_text = false,
			x = 18,
			y = 5,
		},
	},
	MXLOG = {
		{
			alignment = "RGHT",
			pages = {
				"SYS2",
			},
			id = "MXLOG",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	MXOPT = {
		{
			alignment = "RGHT",
			pages = {
				"MXLOG",
			},
			id = "MXOPT",
			index = 0,
			static_text = true,
			x = 23,
			y = 7,
		},
	},
	Mach = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "Mach",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	NAV = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "NAV",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "NAV",
			index = 1,
			static_text = true,
			x = 23,
			y = 7,
		},
	},
	NAVMODEROTARY = {
		{
			alignment = "RGHT",
			pages = {
				"NAV",
				"POS",
			},
			id = "NAVMODEROTARY",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	NAV_DAT = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "NAV_DAT",
			index = 0,
			static_text = true,
			x = 10,
			y = 6,
		},
	},
	NAV_DAT1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "NAV_DAT1",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	NAV_DAT2 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "NAV_DAT2",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	NAV_DATA = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "NAV_DATA",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	NAV_DATAs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "NAV_DATAs",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	NAV_DATAs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "NAV_DATAs1",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	NAV_RDY = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "NAV_RDY",
			index = 0,
			static_text = true,
			x = 10,
			y = 7,
		},
	},
	NAV_RDY1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "NAV_RDY1",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	NAV_RDY2 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "NAV_RDY2",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	NAV_RDY3 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "NAV_RDY3",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	NEWFPNumber = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "NEWFPNumber",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	NEWFPText = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "NEWFPText",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
	},
	NEW_WAYPT_NUM = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
				"WAYPT1",
			},
			id = "NEW_WAYPT_NUM",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	NM = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "NM",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	NMDisplay = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "NMDisplay",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	NMINPUT = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "NMINPUT",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	NOT_ATTEMPTED = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "NOT_ATTEMPTED",
			index = 0,
			static_text = true,
			x = 11,
			y = 5,
		},
	},
	NS = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
			},
			id = "NS",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	NS_ERR = {
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
			},
			id = "NS_ERR",
			index = 0,
			static_text = false,
			x = 7,
			y = 6,
		},
	},
	NUM = {
		{
			alignment = "LFT",
			pages = {
				"ANNUNCIATIONS",
			},
			id = "NUM",
			index = 0,
			static_text = false,
			x = 1,
			y = 2,
		},
	},
	OAT = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "OAT",
			index = 0,
			static_text = true,
			x = 15,
			y = 9,
		},
	},
	OF = {
		{
			alignment = "LFT",
			pages = {
				"BITBALL",
			},
			id = "OF",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	OFFSETDIV = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETDIV",
			index = 0,
			static_text = true,
			x = 19,
			y = 6,
		},
	},
	OFFSETWAYPTCoordFormat1 = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTCoordFormat1",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	OFFSETWAYPTCoordFormat2 = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTCoordFormat2",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	OFFSETWAYPTDIS1 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTDIS1",
			index = 0,
			static_text = false,
			x = 20,
			y = 6,
		},
	},
	OFFSETWAYPTDIS2 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTDIS2",
			index = 0,
			static_text = false,
			x = 20,
			y = 6,
		},
	},
	OFFSETWAYPTLat = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTLat",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	OFFSETWAYPTLatUTM = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTLatUTM",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	OFFSETWAYPTLong = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTLong",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	OFFSETWAYPTLongMGRS = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTLongMGRS",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	OFFSETWAYPTMGRS = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTMGRS",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	OFFSETWAYPTMH1 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTMH1",
			index = 0,
			static_text = false,
			x = 16,
			y = 6,
		},
	},
	OFFSETWAYPTMH2 = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTMH2",
			index = 0,
			static_text = false,
			x = 16,
			y = 6,
		},
	},
	OFFSETWAYPTNumber1 = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTNumber1",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	OFFSETWAYPTNumber2 = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTNumber2",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	OFFSETWAYPTUTM = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "OFFSETWAYPTUTM",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	OFP = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "OFP",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	OFPID = {
		{
			alignment = "LFT",
			pages = {
				"SYS2",
			},
			id = "OFPID",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	OFPID1_LINE3 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE3",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	OFPID1_LINE4_1 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE4_1",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	OFPID1_LINE4_2 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE4_2",
			index = 0,
			static_text = true,
			x = 13,
			y = 4,
		},
	},
	OFPID1_LINE5 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE5",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	OFPID1_LINE6_1 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE6_1",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	OFPID1_LINE6_2 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE6_2",
			index = 0,
			static_text = true,
			x = 13,
			y = 6,
		},
	},
	OFPID1_LINE7 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE7",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	OFPID1_LINE8 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "OFPID1_LINE8",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	OFPID2_LINE3 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE3",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	OFPID2_LINE4_1 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE4_1",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	OFPID2_LINE4_2 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE4_2",
			index = 0,
			static_text = true,
			x = 16,
			y = 4,
		},
	},
	OFPID2_LINE5 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE5",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	OFPID2_LINE6_1 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE6_1",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	OFPID2_LINE6_2 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE6_2",
			index = 0,
			static_text = true,
			x = 16,
			y = 6,
		},
	},
	OFPID2_LINE7 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE7",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	OFPID2_LINE8 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "OFPID2_LINE8",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	OFP_SA = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "OFP_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	OPTIOMS_MAGHEAD = {
		{
			alignment = "RGHT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIOMS_MAGHEAD",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	OPTIONS = {
		{
			alignment = "RGHT",
			pages = {
				"NAV",
			},
			id = "OPTIONS",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	OPTIONS_CF = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_CF",
			index = 0,
			static_text = false,
			x = 4,
			y = 5,
		},
	},
	OPTIONS_DE = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_DE",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	OPTIONS_EQUAL = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_EQUAL",
			index = 0,
			static_text = false,
			x = 4,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "OPTIONS_EQUAL",
			index = 1,
			static_text = false,
			x = 18,
			y = 5,
		},
	},
	OPTIONS_EQUAL1 = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_EQUAL1",
			index = 0,
			static_text = false,
			x = 3,
			y = 5,
		},
	},
	OPTIONS_HD0 = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_HD0",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	OPTIONS_HD1 = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_HD1",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	OPTIONS_HF0 = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_HF0",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	OPTIONS_HF1 = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_HF1",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	OPTIONS_HS0 = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_HS0",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "OPTIONS_HS0",
			index = 1,
			static_text = true,
			x = 16,
			y = 5,
		},
	},
	OPTIONS_HS1 = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_HS1",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	OPTIONS_MV = {
		{
			alignment = "RGHT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_MV",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	OPTIONS_RTRY = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "OPTIONS_RTRY",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	ORIG_NAV = {
		{
			alignment = "LFT",
			pages = {
				"DTSUPLD",
			},
			id = "ORIG_NAV",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	OWC = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "OWC",
			index = 0,
			static_text = true,
			x = 17,
			y = 4,
		},
	},
	OWC1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "OWC1",
			index = 0,
			static_text = true,
			x = 21,
			y = 8,
		},
	},
	OWC_VALUE = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "OWC_VALUE",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	OWC_VALUE1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "OWC_VALUE1",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	OWC_VALUE2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "OWC_VALUE2",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	Overload = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "Overload",
			index = 0,
			static_text = false,
			x = 20,
			y = 7,
		},
	},
	Overload1 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "Overload1",
			index = 0,
			static_text = false,
			x = 20,
			y = 7,
		},
	},
	Overload2 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "Overload2",
			index = 0,
			static_text = false,
			x = 20,
			y = 7,
		},
	},
	Overload3 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "Overload3",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	Overload4 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "Overload4",
			index = 0,
			static_text = false,
			x = 22,
			y = 7,
		},
	},
	PC = {
		{
			alignment = "LFT",
			pages = {
				"BITBALL",
			},
			id = "PC",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	PGCAS = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PGCAS",
			index = 0,
			static_text = true,
			x = 17,
			y = 3,
		},
	},
	PGCAS_VALUE = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PGCAS_VALUE",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PGCAS_VALUE1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PGCAS_VALUE1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PGCAS_VALUE2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PGCAS_VALUE2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PITCH = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "PITCH",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	PITCH_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "PITCH_ST2",
			index = 0,
			static_text = false,
			x = 19,
			y = 7,
		},
	},
	PITCH_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "PITCH_ST3",
			index = 0,
			static_text = false,
			x = 19,
			y = 7,
		},
	},
	PITCH_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"HARS",
			},
			id = "PITCH_VAL",
			index = 0,
			static_text = false,
			x = 16,
			y = 7,
		},
	},
	POS = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "POS",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	POS_SOURCE = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "POS_SOURCE",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	POS_Source_DTS = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "POS_Source_DTS",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	POS_Source_GPS = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "POS_Source_GPS",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	POS_Source_GPS1 = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "POS_Source_GPS1",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	POS_Source_Last_Pos = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "POS_Source_Last_Pos",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	POS_Source_Man = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "POS_Source_Man",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	POS_Source_Standby = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "POS_Source_Standby",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	PPOSGroundSpeed = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSGroundSpeed",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PPOSGroundSpeed1 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSGroundSpeed1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PPOSGroundSpeed2 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSGroundSpeed2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PPOSIAS = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSIAS",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PPOSSpeedMode = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSSpeedMode",
			index = 0,
			static_text = false,
			x = 19,
			y = 3,
		},
	},
	PPOSSpeedMode1 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSSpeedMode1",
			index = 0,
			static_text = false,
			x = 19,
			y = 3,
		},
	},
	PPOSSpeedMode2 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "PPOSSpeedMode2",
			index = 0,
			static_text = false,
			x = 17,
			y = 3,
		},
	},
	PPOSSpeedMode3 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSSpeedMode3",
			index = 0,
			static_text = false,
			x = 19,
			y = 3,
		},
	},
	PPOSSpeedMode4 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSSpeedMode4",
			index = 0,
			static_text = false,
			x = 19,
			y = 3,
		},
	},
	PPOSSpeedMode5 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSSpeedMode5",
			index = 0,
			static_text = false,
			x = 19,
			y = 3,
		},
	},
	PPOSSpeedRotary = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "PPOSSpeedRotary",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	PPOSTAS1 = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "PPOSTAS1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	PR = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PR",
			index = 0,
			static_text = true,
			x = 17,
			y = 5,
		},
	},
	PREF = {
		{
			alignment = "RGHT",
			pages = {
				"DTSUPLD",
			},
			id = "PREF",
			index = 0,
			static_text = true,
			x = 23,
			y = 4,
		},
	},
	PR_VALUE = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PR_VALUE",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	PR_VALUE1 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PR_VALUE1",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	PR_VALUE2 = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PR_VALUE2",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	PS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "PS",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	PS_STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "PS_STATUS",
			index = 0,
			static_text = true,
			x = 10,
			y = 5,
		},
	},
	P_ALT = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "P_ALT",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	P_ALT_ST = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "P_ALT_ST",
			index = 0,
			static_text = false,
			x = 21,
			y = 4,
		},
	},
	P_ALT_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "P_ALT_ST1",
			index = 0,
			static_text = false,
			x = 21,
			y = 4,
		},
	},
	P_ALT_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"CADC",
			},
			id = "P_ALT_VAL",
			index = 0,
			static_text = false,
			x = 13,
			y = 4,
		},
	},
	PAGE = {
		{
			alignment = "LFT",
			pages = {},
			id = "PAGE",
			index = 0,
			static_text = false,
			x = 19,
			y = 10,
		},
	},
	PAGE_NUM = {
		{
			alignment = "LFT",
			pages = {},
			id = "PAGE_NUM",
			index = 0,
			static_text = false,
			x = 20,
			y = 10,
		},
	},
	PAGE_NUMBER = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "PAGE_NUMBER",
			index = 0,
			static_text = true,
			x = 19,
			y = 10,
		},
	},
	PageFPBUILD = {
		{
			alignment = "RGHT",
			pages = {
				"FPMENU",
			},
			id = "PageFPBUILD",
			index = 0,
			static_text = false,
			x = 24,
			y = 2,
		},
	},
	PageNameACCREJ = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
			},
			id = "PageNameACCREJ",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameALIGN = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
			},
			id = "PageNameALIGN",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameALTALGN = {
		{
			alignment = "LFT",
			pages = {
				"ALTALGN",
			},
			id = "PageNameALTALGN",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameANCHOR = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "PageNameANCHOR",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameATTRIB = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "PageNameATTRIB",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameBBCTL = {
		{
			alignment = "LFT",
			pages = {
				"BBCTL",
			},
			id = "PageNameBBCTL",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameBITBALL = {
		{
			alignment = "LFT",
			pages = {
				"BITBALL",
			},
			id = "PageNameBITBALL",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameCADC = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "PageNameCADC",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameCDUTEST1 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "PageNameCDUTEST1",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameCDUTEST2 = {
		{
			alignment = "LFT",
			pages = {
				"CDUTEST2",
			},
			id = "PageNameCDUTEST2",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameDIVERT = {
		{
			alignment = "LFT",
			pages = {
				"DIVERT",
			},
			id = "PageNameDIVERT",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameDTS = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "PageNameDTS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameDTSAS = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "PageNameDTSAS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameDTSDNLD = {
		{
			alignment = "LFT",
			pages = {
				"DTSDNLD",
			},
			id = "PageNameDTSDNLD",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameDTSSTAT = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "PageNameDTSSTAT",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameDTSUPLD = {
		{
			alignment = "LFT",
			pages = {
				"DTSUPLD",
			},
			id = "PageNameDTSUPLD",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameEGI = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
				"EGI2",
				"EGI3",
				"EGI4",
			},
			id = "PageNameEGI",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameEGITEST = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "PageNameEGITEST",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameFLDINFO = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "PageNameFLDINFO",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameFPBUILD = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "PageNameFPBUILD",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameFPMENU = {
		{
			alignment = "LFT",
			pages = {
				"FPMENU",
			},
			id = "PageNameFPMENU",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameFROM = {
		{
			alignment = "LFT",
			pages = {
				"FROM",
			},
			id = "PageNameFROM",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPS = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "PageNameGPS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPSBIT1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT1",
			},
			id = "PageNameGPSBIT1",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPSBIT2 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT2",
			},
			id = "PageNameGPSBIT2",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPSBIT3 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT3",
			},
			id = "PageNameGPSBIT3",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPSBIT4 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT4",
			},
			id = "PageNameGPSBIT4",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPSBIT5 = {
		{
			alignment = "LFT",
			pages = {
				"GPSBIT5",
			},
			id = "PageNameGPSBIT5",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPSKEYS = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "PageNameGPSKEYS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameGPSSTAT1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "PageNameGPSSTAT1",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameHARS = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "PageNameHARS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameINS = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "PageNameINS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameINSSTAT = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "PageNameINSSTAT",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameLASTE = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "PageNameLASTE",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameLRUTEST = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "PageNameLRUTEST",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameMXLOG = {
		{
			alignment = "LFT",
			pages = {
				"MXLOG",
			},
			id = "PageNameMXLOG",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameNAV = {
		{
			alignment = "LFT",
			pages = {
				"NAV",
			},
			id = "PageNameNAV",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameOFFSET = {
		{
			alignment = "LFT",
			pages = {
				"OFFSET",
			},
			id = "PageNameOFFSET",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameOFPID1 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID1",
			},
			id = "PageNameOFPID1",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameOFPID2 = {
		{
			alignment = "LFT",
			pages = {
				"OFPID2",
			},
			id = "PageNameOFPID2",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameOPTIONS = {
		{
			alignment = "LFT",
			pages = {
				"OPTIONS",
			},
			id = "PageNameOPTIONS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNamePOS = {
		{
			alignment = "LFT",
			pages = {
				"POS",
			},
			id = "PageNamePOS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNamePOSINFO = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "PageNamePOSINFO",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameREINIT = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "PageNameREINIT",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameRESET = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "PageNameRESET",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameSTARTUPBIT = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "PageNameSTARTUPBIT",
			index = 0,
			static_text = false,
			x = 3,
			y = 1,
		},
	},
	PageNameSTRINFO = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "PageNameSTRINFO",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameSYS = {
		{
			alignment = "LFT",
			pages = {
				"SYS",
			},
			id = "PageNameSYS",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameTIME = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "PageNameTIME",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameUPDATE = {
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "PageNameUPDATE",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameWAYPT = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT",
			},
			id = "PageNameWAYPT",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameWIND = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "PageNameWIND",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameWNDEDIT = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT",
			},
			id = "PageNameWNDEDIT",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameWPINFO = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "PageNameWPINFO",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameWPMENU = {
		{
			alignment = "LFT",
			pages = {
				"WPMENU",
			},
			id = "PageNameWPMENU",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PageNameWPTATT = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "PageNameWPTATT",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
	PresPositLat = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositLat",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	PresPositLat1 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositLat1",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	PresPositLong = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositLong",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	PresPositLong1 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositLong1",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	PresPositMGRS = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositMGRS",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	PresPositMGRS1 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositMGRS1",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	PresPositUTM = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositUTM",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	PresPositUTM1 = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
				"POS",
			},
			id = "PresPositUTM1",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	RAM = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "RAM",
			index = 0,
			static_text = false,
			x = 1,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "RAM",
			index = 1,
			static_text = true,
			x = 1,
			y = 4,
		},
	},
	RAM_1553 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "RAM_1553",
			index = 0,
			static_text = false,
			x = 13,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"CDUTEST1",
			},
			id = "RAM_1553",
			index = 1,
			static_text = true,
			x = 13,
			y = 4,
		},
	},
	READY = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "READY",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "READY",
			index = 1,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	READY_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "READY_ST0",
			index = 0,
			static_text = false,
			x = 8,
			y = 5,
		},
	},
	READY_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "READY_ST1",
			index = 0,
			static_text = false,
			x = 8,
			y = 5,
		},
	},
	READY_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "READY_ST2",
			index = 0,
			static_text = false,
			x = 8,
			y = 5,
		},
	},
	READY_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "READY_ST3",
			index = 0,
			static_text = false,
			x = 8,
			y = 5,
		},
	},
	READY_ST4 = {
		{
			alignment = "LFT",
			pages = {
				"DTS",
			},
			id = "READY_ST4",
			index = 0,
			static_text = false,
			x = 8,
			y = 5,
		},
	},
	RECENT_NAV = {
		{
			alignment = "LFT",
			pages = {
				"DTSUPLD",
			},
			id = "RECENT_NAV",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	RECORD = {
		{
			alignment = "RGHT",
			pages = {
				"LRUTEST",
			},
			id = "RECORD",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	REINIT = {
		{
			alignment = "LFT",
			pages = {
				"SYS1",
			},
			id = "REINIT",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	REINIT_DTSAS = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "REINIT_DTSAS",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	REINIT_GPS = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "REINIT_GPS",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	REINIT_INS = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "REINIT_INS",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	REINIT_LASTE = {
		{
			alignment = "LFT",
			pages = {
				"REINIT",
			},
			id = "REINIT_LASTE",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	REJECT = {
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
			},
			id = "REJECT",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	RESET = {
		{
			alignment = "RGHT",
			pages = {
				"SYS1",
				"BBCTL",
			},
			id = "RESET",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	RESET_CADC = {
		{
			alignment = "RGHT",
			pages = {
				"RESET",
			},
			id = "RESET_CADC",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	RESET_CICU = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_CICU",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	RESET_CICU0 = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_CICU0",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	RESET_CICU1 = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_CICU1",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	RESET_DTS = {
		{
			alignment = "RGHT",
			pages = {
				"RESET",
			},
			id = "RESET_DTS",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	RESET_EGI = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_EGI",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	RESET_HARS = {
		{
			alignment = "RGHT",
			pages = {
				"RESET",
			},
			id = "RESET_HARS",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	RESET_LASTE = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_LASTE",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	RESET_LASTE1 = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_LASTE1",
			index = 0,
			static_text = true,
			x = 8,
			y = 7,
		},
	},
	RESET_ST0 = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_ST0",
			index = 0,
			static_text = false,
			x = 8,
			y = 5,
		},
	},
	RESET_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"RESET",
			},
			id = "RESET_ST1",
			index = 0,
			static_text = false,
			x = 8,
			y = 5,
		},
	},
	ROLL = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "ROLL",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	ROLL_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "ROLL_ST2",
			index = 0,
			static_text = false,
			x = 19,
			y = 5,
		},
	},
	ROLL_ST3 = {
		{
			alignment = "LFT",
			pages = {
				"HARS",
			},
			id = "ROLL_ST3",
			index = 0,
			static_text = false,
			x = 19,
			y = 5,
		},
	},
	ROLL_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"HARS",
			},
			id = "ROLL_VAL",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
	},
	RPU = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "RPU",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	RPU4s = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "RPU4s",
			index = 0,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	RPU4s1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "RPU4s1",
			index = 0,
			static_text = false,
			x = 11,
			y = 5,
		},
	},
	RTR = {
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
				"UPDATE",
			},
			id = "RTR",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	RT_ADDR = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "RT_ADDR",
			index = 0,
			static_text = false,
			x = 13,
			y = 6,
		},
	},
	RWY = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "RWY",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	RWY_L_FEET = {
		{
			alignment = "RGHT",
			pages = {
				"FLDINFO",
			},
			id = "RWY_L_FEET",
			index = 0,
			static_text = true,
			x = 24,
			y = 6,
		},
	},
	SAT4 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "SAT4",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	SAT4s = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "SAT4s",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	SAT4s1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "SAT4s1",
			index = 0,
			static_text = false,
			x = 11,
			y = 4,
		},
	},
	SCALE = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "SCALE",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "SCALE",
			index = 1,
			static_text = true,
			x = 1,
			y = 5,
		},
	},
	ScratchBorders = {
		{
			alignment = "LFT",
			pages = {},
			id = "ScratchBorders",
			index = 0,
			static_text = false,
			x = 1,
			y = 10,
		},
	},
	ScratchString = {
		{
			alignment = "LFT",
			pages = {},
			id = "ScratchString",
			index = 0,
			static_text = false,
			x = 2,
			y = 10,
		},
	},
	SCS = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "SCS",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	SCS_ROTARY = {
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "SCS_ROTARY",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	SENSORS = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "SENSORS",
			index = 0,
			static_text = true,
			x = 10,
			y = 9,
		},
	},
	SEN_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "SEN_ST1",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	SEN_ST2 = {
		{
			alignment = "LFT",
			pages = {
				"INSSTAT",
			},
			id = "SEN_ST2",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	SERVICE = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "SERVICE",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	SFKEYSs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "SFKEYSs",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	SFKEYSs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "SFKEYSs1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	SFKEYSs2 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "SFKEYSs2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	SLASH1 = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "SLASH1",
			index = 0,
			static_text = true,
			x = 14,
			y = 9,
		},
	},
	SLASH2 = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "SLASH2",
			index = 0,
			static_text = true,
			x = 14,
			y = 10,
		},
	},
	SPHEROID = {
		{
			alignment = "RGHT",
			pages = {
				"WPMENU",
			},
			id = "SPHEROID",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	SPU = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "SPU",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	SPU_STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "SPU_STATUS",
			index = 0,
			static_text = true,
			x = 10,
			y = 3,
		},
	},
	ST3 = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "ST3",
			index = 0,
			static_text = true,
			x = 8,
			y = 7,
		},
	},
	ST5 = {
		{
			alignment = "LFT",
			pages = {
				"GPS",
			},
			id = "ST5",
			index = 0,
			static_text = true,
			x = 8,
			y = 6,
		},
	},
	START = {
		{
			alignment = "RGHT",
			pages = {
				"CDUTEST1",
			},
			id = "START",
			index = 0,
			static_text = true,
			x = 23,
			y = 5,
		},
	},
	STARTUPBIT = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
	},
	STARTUPBIT1 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT1",
			index = 0,
			static_text = false,
			x = 9,
			y = 3,
		},
	},
	STARTUPBIT10 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT10",
			index = 0,
			static_text = false,
			x = 9,
			y = 6,
		},
	},
	STARTUPBIT11 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT11",
			index = 0,
			static_text = false,
			x = 9,
			y = 6,
		},
	},
	STARTUPBIT12 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT12",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	STARTUPBIT13 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT13",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	STARTUPBIT14 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT14",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	STARTUPBIT15 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT15",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	STARTUPBIT16 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT16",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	STARTUPBIT17 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT17",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	STARTUPBIT18 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT18",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	STARTUPBIT19 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT19",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	STARTUPBIT2 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT2",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	STARTUPBIT20 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT20",
			index = 0,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	STARTUPBIT21 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT21",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STARTUPBIT22 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT22",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STARTUPBIT23 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT23",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STARTUPBIT24 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT24",
			index = 0,
			static_text = false,
			x = 9,
			y = 10,
		},
	},
	STARTUPBIT3 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT3",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	STARTUPBIT4 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT4",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	STARTUPBIT5 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT5",
			index = 0,
			static_text = false,
			x = 9,
			y = 4,
		},
	},
	STARTUPBIT6 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT6",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	STARTUPBIT7 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT7",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	STARTUPBIT8 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT8",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	STARTUPBIT9 = {
		{
			alignment = "LFT",
			pages = {
				"STARTUP_BIT",
			},
			id = "STARTUPBIT9",
			index = 0,
			static_text = false,
			x = 9,
			y = 6,
		},
	},
	START_SA = {
		{
			alignment = "RGHT",
			pages = {
				"CDUTEST1",
			},
			id = "START_SA",
			index = 0,
			static_text = false,
			x = 24,
			y = 5,
		},
	},
	STATUS = {
		{
			alignment = "LFT",
			pages = {
				"EGI2",
			},
			id = "STATUS",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	STATUS_LINE = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "STATUS_LINE",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	STATUS_LINE1 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "STATUS_LINE1",
			index = 0,
			static_text = true,
			x = 10,
			y = 3,
		},
	},
	STATUS_LINE2 = {
		{
			alignment = "LFT",
			pages = {
				"EGI1",
			},
			id = "STATUS_LINE2",
			index = 0,
			static_text = true,
			x = 18,
			y = 3,
		},
	},
	STEER = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "STEER",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"ATTRIB",
			},
			id = "STEER",
			index = 1,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	STEERPOINT = {
		{
			alignment = "LFT",
			pages = {
				"WPMENU",
			},
			id = "STEERPOINT",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	STEERPTIndicator = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "STEERPTIndicator",
			index = 0,
			static_text = false,
			x = 7,
			y = 3,
		},
	},
	STEER_PT = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STEER_PT",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	STOP_MSN = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "STOP_MSN",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	STOP_SA = {
		{
			alignment = "LFT",
			pages = {
				"EGITEST",
			},
			id = "STOP_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	STRBRGRAD = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRAD",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	STRBRGRAD1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRAD1",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	STRBRGRAD2 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRAD2",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	STRBRGRAD3 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRAD3",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	STRBRGRAD4 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRAD4",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	STRBRGRADMode = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRADMode",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	STRBRGRADMode1 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRADMode1",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	STRBRGRADRotary = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRBRGRADRotary",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	STRDIS = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRDIS",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
			},
			id = "STRDIS",
			index = 1,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "STRDIS",
			index = 2,
			static_text = false,
			x = 17,
			y = 4,
		},
	},
	STRDIS1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRDIS1",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRDIS1",
			index = 1,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "STRDIS1",
			index = 2,
			static_text = false,
			x = 17,
			y = 4,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRDIS1",
			index = 3,
			static_text = false,
			x = 23,
			y = 8,
		},
	},
	STRDIS2 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRDIS2",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRDIS2",
			index = 1,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRDIS2",
			index = 2,
			static_text = false,
			x = 23,
			y = 8,
		},
	},
	STRDIS3 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRDIS3",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRDIS3",
			index = 1,
			static_text = false,
			x = 23,
			y = 8,
		},
	},
	STRDISMH = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRDISMH",
			index = 0,
			static_text = true,
			x = 5,
			y = 9,
		},
	},
	STRDMH = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRDMH",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	STRDMH1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRDMH1",
			index = 0,
			static_text = false,
			x = 10,
			y = 4,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRDMH1",
			index = 1,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	STRDMH2 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRDMH2",
			index = 0,
			static_text = false,
			x = 10,
			y = 4,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRDMH2",
			index = 1,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	STRDMH3 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRDMH3",
			index = 0,
			static_text = false,
			x = 10,
			y = 4,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRDMH3",
			index = 1,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	STREL = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STREL",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
				"UPDATE",
			},
			id = "STREL",
			index = 1,
			static_text = true,
			x = 17,
			y = 9,
		},
	},
	STREL1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STREL1",
			index = 0,
			static_text = false,
			x = 10,
			y = 6,
		},
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "STREL1",
			index = 1,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	STREL2 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STREL2",
			index = 0,
			static_text = false,
			x = 10,
			y = 6,
		},
		{
			alignment = "RGHT",
			pages = {
				"UPDATE",
			},
			id = "STREL2",
			index = 1,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	STREL3 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STREL3",
			index = 0,
			static_text = false,
			x = 10,
			y = 6,
		},
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
				"UPDATE",
			},
			id = "STREL3",
			index = 1,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	STREL4 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STREL4",
			index = 0,
			static_text = false,
			x = 10,
			y = 6,
		},
	},
	STRGroundSpeed1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRGroundSpeed1",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	STRIAS1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRIAS1",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	STRIdent = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRIdent",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "STRIdent",
			index = 1,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	STRIdent1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
				"ANCHOR",
			},
			id = "STRIdent1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "STRIdent1",
			index = 1,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	STRIdent2 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
				"ANCHOR",
			},
			id = "STRIdent2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	STRIdent3 = {
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRIdent3",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	STRIdentEntry = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
				"ANCHOR",
			},
			id = "STRIdentEntry",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	STRMH1 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRMH1",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	STRMH2 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRMH2",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	STRNumber = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
				"UPDATE",
			},
			id = "STRNumber",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	STRNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
				"UPDATE",
			},
			id = "STRNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	STRNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRNumber2",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	STRNumber3 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRNumber3",
			index = 0,
			static_text = false,
			x = 3,
			y = 3,
		},
	},
	STRNumberIncDec = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRNumberIncDec",
			index = 0,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	STRReqGroundSpeed = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRReqGroundSpeed",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	STRReqIAS = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRReqIAS",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	STRReqSpeedMode = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRReqSpeedMode",
			index = 0,
			static_text = false,
			x = 19,
			y = 7,
		},
	},
	STRReqSpeedMode1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRReqSpeedMode1",
			index = 0,
			static_text = false,
			x = 19,
			y = 7,
		},
	},
	STRReqSpeedMode2 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRReqSpeedMode2",
			index = 0,
			static_text = false,
			x = 19,
			y = 7,
		},
	},
	STRReqSpeedRotary = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRReqSpeedRotary",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	STRReqTAS = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRReqTAS",
			index = 0,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	STRSpeedMode3 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRSpeedMode3",
			index = 0,
			static_text = false,
			x = 17,
			y = 9,
		},
	},
	STRSpeedMode4 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRSpeedMode4",
			index = 0,
			static_text = false,
			x = 19,
			y = 9,
		},
	},
	STRSpeedMode5 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRSpeedMode5",
			index = 0,
			static_text = false,
			x = 19,
			y = 9,
		},
	},
	STRSpeedMode6 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRSpeedMode6",
			index = 0,
			static_text = false,
			x = 19,
			y = 9,
		},
	},
	STRSpeedRotary1 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRSpeedRotary1",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	STRTAS1 = {
		{
			alignment = "RGHT",
			pages = {
				"STRINFO",
			},
			id = "STRTAS1",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	STRTOT = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTOT",
			index = 0,
			static_text = false,
			x = 16,
			y = 6,
		},
	},
	STRTOT1 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTOT1",
			index = 0,
			static_text = false,
			x = 16,
			y = 6,
		},
	},
	STRTOT2 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTOT2",
			index = 0,
			static_text = false,
			x = 16,
			y = 6,
		},
	},
	STRTOT3 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTOT3",
			index = 0,
			static_text = false,
			x = 16,
			y = 6,
		},
	},
	STRTOT4 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTOT4",
			index = 0,
			static_text = false,
			x = 16,
			y = 6,
		},
	},
	STRTTG = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTTG",
			index = 0,
			static_text = true,
			x = 12,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "STRTTG",
			index = 1,
			static_text = true,
			x = 7,
			y = 6,
		},
	},
	STRTTG1 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTTG1",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRTTG1",
			index = 1,
			static_text = false,
			x = 2,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "STRTTG1",
			index = 2,
			static_text = false,
			x = 11,
			y = 6,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRTTG1",
			index = 3,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STRTTG2 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTTG2",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRTTG2",
			index = 1,
			static_text = false,
			x = 2,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "STRTTG2",
			index = 2,
			static_text = false,
			x = 11,
			y = 6,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRTTG2",
			index = 3,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STRTTG3 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTTG3",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "STRTTG3",
			index = 1,
			static_text = false,
			x = 2,
			y = 8,
		},
		{
			alignment = "LFT",
			pages = {
				"UPDATE",
			},
			id = "STRTTG3",
			index = 2,
			static_text = false,
			x = 11,
			y = 6,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRTTG3",
			index = 3,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STRTTG4 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTTG4",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRTTG4",
			index = 1,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STRTTG5 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRTTG5",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"ANCHOR",
			},
			id = "STRTTG5",
			index = 1,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	STRWindDirection1 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRWindDirection1",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	STRWindDirection2 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRWindDirection2",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	STRWindSpeed1 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRWindSpeed1",
			index = 0,
			static_text = false,
			x = 21,
			y = 8,
		},
	},
	STRWindSpeed2 = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "STRWindSpeed2",
			index = 0,
			static_text = false,
			x = 21,
			y = 8,
		},
	},
	ST_ST = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "ST_ST",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	SUCCESSFUL = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "SUCCESSFUL",
			index = 0,
			static_text = true,
			x = 11,
			y = 6,
		},
	},
	SUFKEYS = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "SUFKEYS",
			index = 0,
			static_text = true,
			x = 13,
			y = 3,
		},
	},
	T = {
		{
			alignment = "LFT",
			pages = {
				"ALIGN",
				"ALTALGN",
			},
			id = "T",
			index = 0,
			static_text = true,
			x = 4,
			y = 8,
		},
	},
	TAC = {
		{
			alignment = "LFT",
			pages = {
				"FLDINFO",
			},
			id = "TAC",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	TARGET_MARK = {
		{
			alignment = "RGHT",
			pages = {
				"OFFSET",
			},
			id = "TARGET_MARK",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	TAS = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "TAS",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	TAS_ST = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "TAS_ST",
			index = 0,
			static_text = false,
			x = 21,
			y = 6,
		},
	},
	TAS_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "TAS_ST1",
			index = 0,
			static_text = false,
			x = 21,
			y = 6,
		},
	},
	TAS_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"CADC",
			},
			id = "TAS_VAL",
			index = 0,
			static_text = false,
			x = 15,
			y = 6,
		},
	},
	TEMP = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "TEMP",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	TEMP_ST = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "TEMP_ST",
			index = 0,
			static_text = false,
			x = 21,
			y = 9,
		},
	},
	TEMP_ST1 = {
		{
			alignment = "LFT",
			pages = {
				"CADC",
			},
			id = "TEMP_ST1",
			index = 0,
			static_text = false,
			x = 21,
			y = 9,
		},
	},
	TEMP_VAL = {
		{
			alignment = "RGHT",
			pages = {
				"CADC",
			},
			id = "TEMP_VAL",
			index = 0,
			static_text = false,
			x = 14,
			y = 9,
		},
	},
	TEST_MODE0 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "TEST_MODE0",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	TEST_MODE1 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "TEST_MODE1",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	TEST_MODE2 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "TEST_MODE2",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	TEST_MODE4 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "TEST_MODE4",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	TEST_SA = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "TEST_SA",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	TEST_SA1 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "TEST_SA1",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	TEST_SA2 = {
		{
			alignment = "LFT",
			pages = {
				"LRUTEST",
			},
			id = "TEST_SA2",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	TGTSYM_NEW_WPT = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "TGTSYM_NEW_WPT",
			index = 0,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	TIME = {
		{
			alignment = "LFT",
			pages = {
				"NAV",
			},
			id = "TIME",
			index = 0,
			static_text = true,
			x = 1,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"BITBALL",
			},
			id = "TIME",
			index = 1,
			static_text = true,
			x = 2,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"GPS",
			},
			id = "TIME",
			index = 2,
			static_text = true,
			x = 24,
			y = 7,
		},
	},
	TOT = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "TOT",
			index = 0,
			static_text = true,
			x = 12,
			y = 6,
		},
	},
	TTG = {
		{
			alignment = "LFT",
			pages = {
				"ANCHOR",
			},
			id = "TTG",
			index = 0,
			static_text = true,
			x = 2,
			y = 6,
		},
	},
	TempC = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "TempC",
			index = 0,
			static_text = false,
			x = 21,
			y = 9,
		},
	},
	TempF = {
		{
			alignment = "RGHT",
			pages = {
				"POSINFO",
			},
			id = "TempF",
			index = 0,
			static_text = false,
			x = 21,
			y = 9,
		},
	},
	TempRotary = {
		{
			alignment = "LFT",
			pages = {
				"POSINFO",
			},
			id = "TempRotary",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
	},
	UPDATE = {
		{
			alignment = "LFT",
			pages = {
				"NAV",
			},
			id = "UPDATE",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"INS",
			},
			id = "UPDATE",
			index = 1,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	UTC = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "UTC",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	UTCs = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "UTCs",
			index = 0,
			static_text = false,
			x = 11,
			y = 7,
		},
	},
	UTCs1 = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT1",
			},
			id = "UTCs1",
			index = 0,
			static_text = false,
			x = 11,
			y = 7,
		},
	},
	VANGLE = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "VANGLE",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "VANGLE",
			index = 1,
			static_text = false,
			x = 24,
			y = 5,
		},
	},
	VANGLEEntry = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "VANGLEEntry",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "VANGLEEntry",
			index = 1,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	VANGLEMode = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "VANGLEMode",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "VANGLEMode",
			index = 1,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	VANGLEMode1 = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "VANGLEMode1",
			index = 0,
			static_text = false,
			x = 23,
			y = 8,
		},
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "VANGLEMode1",
			index = 1,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	VANGLEValue = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "VANGLEValue",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "VANGLEValue",
			index = 1,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	VIEW1 = {
		{
			alignment = "LFT",
			pages = {
				"BBCTL",
			},
			id = "VIEW1",
			index = 0,
			static_text = true,
			x = 2,
			y = 3,
		},
	},
	VIEW2 = {
		{
			alignment = "LFT",
			pages = {
				"BBCTL",
			},
			id = "VIEW2",
			index = 0,
			static_text = true,
			x = 2,
			y = 5,
		},
	},
	VIEW3 = {
		{
			alignment = "LFT",
			pages = {
				"BBCTL",
			},
			id = "VIEW3",
			index = 0,
			static_text = true,
			x = 2,
			y = 7,
		},
	},
	VIEW4 = {
		{
			alignment = "LFT",
			pages = {
				"BBCTL",
			},
			id = "VIEW4",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	VIEW5 = {
		{
			alignment = "RGHT",
			pages = {
				"BBCTL",
			},
			id = "VIEW5",
			index = 0,
			static_text = true,
			x = 23,
			y = 3,
		},
	},
	VNAV_MODE = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "VNAV_MODE",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"ATTRIB",
			},
			id = "VNAV_MODE",
			index = 1,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	VPU = {
		{
			alignment = "LFT",
			pages = {
				"DTSAS",
			},
			id = "VPU",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	VRSN = {
		{
			alignment = "LFT",
			pages = {
				"DTSSTAT",
			},
			id = "VRSN",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	WARCODE = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
				"EGI4",
			},
			id = "WARCODE",
			index = 0,
			static_text = true,
			x = 17,
			y = 8,
		},
	},
	WARNING = {
		{
			alignment = "LFT",
			pages = {
				"EGI3",
				"EGI4",
			},
			id = "WARNING",
			index = 0,
			static_text = true,
			x = 14,
			y = 7,
		},
	},
	WAYPOINT = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
			},
			id = "WAYPOINT",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "WAYPOINT",
			index = 1,
			static_text = true,
			x = 1,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"WPMENU",
			},
			id = "WAYPOINT",
			index = 2,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	WAYPTClass = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass1 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass1",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass10 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass10",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass11 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass11",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass12 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass12",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass13 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass13",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass14 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass14",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass15 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass15",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass16 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass16",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass17 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass17",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass18 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass18",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass19 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass19",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass2 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass2",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass20 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass20",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass21 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass21",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass3 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass3",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass4 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass4",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass5 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass5",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass6 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass6",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass7 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass7",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass8 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass8",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTClass9 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTClass9",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WAYPTCoordFormat = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTCoordFormat",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
	},
	WAYPTCoordFormat1 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTCoordFormat1",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
	},
	WAYPTDATA_ENTRY = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTDATA_ENTRY",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	WAYPTDATA_ENTRY1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTDATA_ENTRY1",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	WAYPTIdent = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTIdent",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTIdent",
			index = 1,
			static_text = false,
			x = 12,
			y = 2,
		},
	},
	WAYPTIdent1 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
				"WAYPT1",
			},
			id = "WAYPTIdent1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTIdent1",
			index = 1,
			static_text = false,
			x = 12,
			y = 2,
		},
	},
	WAYPTIdent2 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "WAYPTIdent2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WAYPTLat = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
				"UPDATE",
				"WAYPT1",
			},
			id = "WAYPTLat",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	WAYPTLatUTM = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
				"UPDATE",
				"WAYPT1",
			},
			id = "WAYPTLatUTM",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	WAYPTLong = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
				"UPDATE",
				"WAYPT1",
			},
			id = "WAYPTLong",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	WAYPTLongMGRS = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
				"UPDATE",
				"WAYPT1",
			},
			id = "WAYPTLongMGRS",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	WAYPTMGRS = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
				"UPDATE",
				"WAYPT1",
			},
			id = "WAYPTMGRS",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	WAYPTNumber = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTNumber",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTNumber",
			index = 1,
			static_text = false,
			x = 6,
			y = 2,
		},
	},
	WAYPTNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
				"WAYPT1",
			},
			id = "WAYPTNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTNumber1",
			index = 1,
			static_text = false,
			x = 6,
			y = 2,
		},
	},
	WAYPTNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "WAYPTNumber2",
			index = 0,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	WAYPTScale = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTScale",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WAYPTScale1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTScale1",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WAYPTScale2 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTScale2",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WAYPTScale3 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTScale3",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WAYPTScale4 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTScale4",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WAYPTSteer = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTSteer",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WAYPTSteer1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTSteer1",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WAYPTSteer2 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTSteer2",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WAYPTSteer4 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTSteer4",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WAYPTUTM = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
				"UPDATE",
				"WAYPT1",
			},
			id = "WAYPTUTM",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	WAYPTVNavMode = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTVNavMode",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	WAYPTVNavMode1 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTVNavMode1",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	WAYPTVNavMode2 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPTVNavMode2",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	WAYPTWindDirection1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTWindDirection1",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	WAYPTWindDirection2 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTWindDirection2",
			index = 0,
			static_text = false,
			x = 17,
			y = 8,
		},
	},
	WAYPTWindSpeed1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTWindSpeed1",
			index = 0,
			static_text = false,
			x = 21,
			y = 8,
		},
	},
	WAYPTWindSpeed2 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPTWindSpeed2",
			index = 0,
			static_text = false,
			x = 21,
			y = 8,
		},
	},
	WAYPT_CR_FLAG = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPT_CR_FLAG",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WAYPT_CR_FLAG1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPT_CR_FLAG1",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WAYPT_DTOT = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPT_DTOT",
			index = 0,
			static_text = false,
			x = 18,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPT_DTOT",
			index = 1,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	WAYPT_DTOT1 = {
		{
			alignment = "RGHT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPT_DTOT1",
			index = 0,
			static_text = false,
			x = 18,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPT_DTOT1",
			index = 1,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	WAYPT_DTTG = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPT_DTTG",
			index = 0,
			static_text = false,
			x = 8,
			y = 7,
		},
	},
	WAYPT_DTTG1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT2",
			},
			id = "WAYPT_DTTG1",
			index = 0,
			static_text = false,
			x = 7,
			y = 7,
		},
	},
	WAYPT_EL1 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPT_EL1",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	WAYPT_EL2 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPT_EL2",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	WAYPT_EL3 = {
		{
			alignment = "LFT",
			pages = {
				"WAYPT1",
			},
			id = "WAYPT_EL3",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	WAYPT_INCR_DECR = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
				"WAYPT1",
			},
			id = "WAYPT_INCR_DECR",
			index = 0,
			static_text = true,
			x = 1,
			y = 3,
		},
	},
	WE = {
		{
			alignment = "LFT",
			pages = {
				"ACCREJ",
			},
			id = "WE",
			index = 0,
			static_text = true,
			x = 18,
			y = 6,
		},
	},
	WE_ERR = {
		{
			alignment = "RGHT",
			pages = {
				"ACCREJ",
			},
			id = "WE_ERR",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	WIND = {
		{
			alignment = "RGHT",
			pages = {
				"LASTE",
			},
			id = "WIND",
			index = 0,
			static_text = true,
			x = 24,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WIND",
			index = 1,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	WINDALT = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDALT",
			index = 0,
			static_text = false,
			x = 3,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDALT",
			index = 1,
			static_text = false,
			x = 3,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDALT",
			index = 2,
			static_text = false,
			x = 12,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDALT",
			index = 3,
			static_text = false,
			x = 12,
			y = 3,
		},
	},
	WINDALT1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDALT1",
			index = 0,
			static_text = false,
			x = 3,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDALT1",
			index = 1,
			static_text = false,
			x = 3,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDALT1",
			index = 2,
			static_text = false,
			x = 12,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDALT1",
			index = 3,
			static_text = false,
			x = 12,
			y = 5,
		},
	},
	WINDALT2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDALT2",
			index = 0,
			static_text = false,
			x = 3,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDALT2",
			index = 1,
			static_text = false,
			x = 3,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDALT2",
			index = 2,
			static_text = false,
			x = 12,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDALT2",
			index = 3,
			static_text = false,
			x = 12,
			y = 7,
		},
	},
	WINDALT3 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDALT3",
			index = 0,
			static_text = false,
			x = 3,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDALT3",
			index = 1,
			static_text = false,
			x = 12,
			y = 9,
		},
	},
	WINDCLRMODE = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDCLRMODE",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	WINDCLRMODE1 = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDCLRMODE1",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	WINDCLRMODE2 = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDCLRMODE2",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	WINDDATA_ENTRY = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDATA_ENTRY",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY",
			index = 1,
			static_text = false,
			x = 1,
			y = 3,
		},
	},
	WINDDATA_ENTRY1 = {
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDATA_ENTRY1",
			index = 0,
			static_text = false,
			x = 24,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY1",
			index = 1,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	WINDDATA_ENTRY2 = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDATA_ENTRY2",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY2",
			index = 1,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	WINDDATA_ENTRY3 = {
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDATA_ENTRY3",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY3",
			index = 1,
			static_text = false,
			x = 24,
			y = 5,
		},
	},
	WINDDATA_ENTRY4 = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDATA_ENTRY4",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY4",
			index = 1,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	WINDDATA_ENTRY5 = {
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDATA_ENTRY5",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY5",
			index = 1,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	WINDDATA_ENTRY6 = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY6",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	WINDDATA_ENTRY7 = {
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDATA_ENTRY7",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
	},
	WINDDIV = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDIV",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDIV",
			index = 1,
			static_text = false,
			x = 9,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDIV",
			index = 2,
			static_text = false,
			x = 5,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDIV",
			index = 3,
			static_text = false,
			x = 5,
			y = 3,
		},
	},
	WINDDIV1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDIV1",
			index = 0,
			static_text = false,
			x = 9,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDIV1",
			index = 1,
			static_text = false,
			x = 9,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDIV1",
			index = 2,
			static_text = false,
			x = 5,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDIV1",
			index = 3,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	WINDDIV2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDIV2",
			index = 0,
			static_text = false,
			x = 9,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDIV2",
			index = 1,
			static_text = false,
			x = 9,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDIV2",
			index = 2,
			static_text = false,
			x = 5,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDIV2",
			index = 3,
			static_text = false,
			x = 5,
			y = 7,
		},
	},
	WINDDIV3 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDIV3",
			index = 0,
			static_text = false,
			x = 9,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDIV3",
			index = 1,
			static_text = false,
			x = 5,
			y = 9,
		},
	},
	WINDDir = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDir",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	WINDDir1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDir1",
			index = 0,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	WINDDirSpeed = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDirSpeed",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed",
			index = 1,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDirSpeed",
			index = 2,
			static_text = false,
			x = 2,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed",
			index = 3,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	WINDDirSpeed1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDirSpeed1",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed1",
			index = 1,
			static_text = false,
			x = 6,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDirSpeed1",
			index = 2,
			static_text = false,
			x = 2,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed1",
			index = 3,
			static_text = false,
			x = 2,
			y = 3,
		},
	},
	WINDDirSpeed2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDirSpeed2",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed2",
			index = 1,
			static_text = false,
			x = 6,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDirSpeed2",
			index = 2,
			static_text = false,
			x = 2,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed2",
			index = 3,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	WINDDirSpeed3 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDDirSpeed3",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed3",
			index = 1,
			static_text = false,
			x = 6,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDirSpeed3",
			index = 2,
			static_text = false,
			x = 2,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed3",
			index = 3,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	WINDDirSpeed4 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed4",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDirSpeed4",
			index = 1,
			static_text = false,
			x = 2,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed4",
			index = 2,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	WINDDirSpeed5 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed5",
			index = 0,
			static_text = false,
			x = 6,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDDirSpeed5",
			index = 1,
			static_text = false,
			x = 2,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed5",
			index = 2,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	WINDDirSpeed6 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed6",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed6",
			index = 1,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	WINDDirSpeed7 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDDirSpeed7",
			index = 0,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDDirSpeed7",
			index = 1,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	WINDMODE = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDMODE",
			index = 0,
			static_text = true,
			x = 24,
			y = 3,
		},
	},
	WINDMODE1 = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDMODE1",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WINDMODE2 = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDMODE2",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WINDMODE3 = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDMODE3",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WINDMODE4 = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WINDMODE4",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WINDSpeed = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDSpeed",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed",
			index = 1,
			static_text = false,
			x = 10,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDSpeed",
			index = 2,
			static_text = false,
			x = 6,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed",
			index = 3,
			static_text = false,
			x = 6,
			y = 3,
		},
	},
	WINDSpeed1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDSpeed1",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed1",
			index = 1,
			static_text = false,
			x = 10,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDSpeed1",
			index = 2,
			static_text = false,
			x = 6,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed1",
			index = 3,
			static_text = false,
			x = 6,
			y = 3,
		},
	},
	WINDSpeed2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDSpeed2",
			index = 0,
			static_text = false,
			x = 10,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed2",
			index = 1,
			static_text = false,
			x = 10,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDSpeed2",
			index = 2,
			static_text = false,
			x = 6,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed2",
			index = 3,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	WINDSpeed3 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDSpeed3",
			index = 0,
			static_text = false,
			x = 10,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed3",
			index = 1,
			static_text = false,
			x = 10,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDSpeed3",
			index = 2,
			static_text = false,
			x = 6,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed3",
			index = 3,
			static_text = false,
			x = 6,
			y = 5,
		},
	},
	WINDSpeed4 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDSpeed4",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed4",
			index = 1,
			static_text = false,
			x = 10,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDSpeed4",
			index = 2,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed4",
			index = 3,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	WINDSpeed5 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDSpeed5",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed5",
			index = 1,
			static_text = false,
			x = 10,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDSpeed5",
			index = 2,
			static_text = false,
			x = 6,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed5",
			index = 3,
			static_text = false,
			x = 6,
			y = 7,
		},
	},
	WINDSpeed6 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed6",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed6",
			index = 1,
			static_text = false,
			x = 6,
			y = 9,
		},
	},
	WINDSpeed7 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDSpeed7",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDSpeed7",
			index = 1,
			static_text = false,
			x = 6,
			y = 9,
		},
	},
	WINDTemp = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
				"WNDEDIT",
			},
			id = "WINDTemp",
			index = 0,
			static_text = false,
			x = 24,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"DISABLE_WIND1",
			},
			id = "WINDTemp",
			index = 1,
			static_text = false,
			x = 13,
			y = 5,
			_comment = "these entries have DISABLE prefixing the page so that they aren't used. There seems to be a bug with this specific item where it appears twice on the same page in different locations.",
		},
		{
			alignment = "LFT",
			pages = {
				"DISABLE_WIND2",
			},
			id = "WINDTemp",
			index = 2,
			static_text = false,
			x = 13,
			y = 3,
		},
		{
			alignment = "RGHT",
			pages = {
				"DISABLE_WNDEDIT1",
			},
			id = "WINDTemp",
			index = 3,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"DISABLE_WNDEDIT2",
			},
			id = "WINDTemp",
			index = 4,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WINDTemp1 = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
				"WNDEDIT",
			},
			id = "WINDTemp1",
			index = 0,
			static_text = false,
			x = 24,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp1",
			index = 1,
			static_text = false,
			x = 13,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp1",
			index = 2,
			static_text = false,
			x = 13,
			y = 3,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp1",
			index = 3,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp1",
			index = 4,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WINDTemp10 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp10",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp10",
			index = 1,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	WINDTemp11 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp11",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp11",
			index = 1,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	WINDTemp12 = {
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp12",
			index = 0,
			static_text = false,
			x = 23,
			y = 9,
		},
	},
	WINDTemp2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp2",
			index = 0,
			static_text = false,
			x = 13,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp2",
			index = 1,
			static_text = false,
			x = 13,
			y = 3,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp2",
			index = 2,
			static_text = false,
			x = 23,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp2",
			index = 3,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	WINDTemp3 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp3",
			index = 0,
			static_text = false,
			x = 13,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp3",
			index = 1,
			static_text = false,
			x = 13,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp3",
			index = 2,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	WINDTemp4 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp4",
			index = 0,
			static_text = false,
			x = 13,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp4",
			index = 1,
			static_text = false,
			x = 13,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp4",
			index = 2,
			static_text = false,
			x = 23,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp4",
			index = 3,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	WINDTemp5 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp5",
			index = 0,
			static_text = false,
			x = 13,
			y = 7,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp5",
			index = 1,
			static_text = false,
			x = 13,
			y = 5,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp5",
			index = 2,
			static_text = false,
			x = 23,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp5",
			index = 3,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	WINDTemp6 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp6",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp6",
			index = 1,
			static_text = false,
			x = 13,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp6",
			index = 2,
			static_text = false,
			x = 23,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp6",
			index = 3,
			static_text = false,
			x = 23,
			y = 5,
		},
	},
	WINDTemp7 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp7",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp7",
			index = 1,
			static_text = false,
			x = 13,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp7",
			index = 2,
			static_text = false,
			x = 23,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp7",
			index = 3,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	WINDTemp8 = {
		{
			alignment = "LFT",
			pages = {
				"WIND1",
			},
			id = "WINDTemp8",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp8",
			index = 1,
			static_text = false,
			x = 13,
			y = 7,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT1",
			},
			id = "WINDTemp8",
			index = 2,
			static_text = false,
			x = 23,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp8",
			index = 3,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	WINDTemp9 = {
		{
			alignment = "LFT",
			pages = {
				"WIND2",
			},
			id = "WINDTemp9",
			index = 0,
			static_text = false,
			x = 13,
			y = 9,
		},
		{
			alignment = "RGHT",
			pages = {
				"WNDEDIT2",
			},
			id = "WINDTemp9",
			index = 1,
			static_text = false,
			x = 23,
			y = 7,
		},
	},
	WIND_ALT_TEMP = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT1",
			},
			id = "WIND_ALT_TEMP",
			index = 0,
			static_text = true,
			x = 2,
			y = 4,
		},
	},
	WND = {
		{
			alignment = "LFT",
			pages = {
				"STRINFO",
				"WAYPT1",
			},
			id = "WND",
			index = 0,
			static_text = true,
			x = 13,
			y = 8,
		},
	},
	WNDDIV = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
				"WNDEDIT",
			},
			id = "WNDDIV",
			index = 0,
			static_text = false,
			x = 17,
			y = 2,
		},
	},
	WNDEDIT = {
		{
			alignment = "RGHT",
			pages = {
				"WIND",
			},
			id = "WNDEDIT",
			index = 0,
			static_text = true,
			x = 24,
			y = 5,
		},
	},
	WNDEDWindDirection1 = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT",
			},
			id = "WNDEDWindDirection1",
			index = 0,
			static_text = false,
			x = 14,
			y = 2,
		},
	},
	WNDEDWindDirection2 = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT",
			},
			id = "WNDEDWindDirection2",
			index = 0,
			static_text = false,
			x = 14,
			y = 2,
		},
	},
	WNDEDWindSpeed1 = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT",
			},
			id = "WNDEDWindSpeed1",
			index = 0,
			static_text = false,
			x = 18,
			y = 2,
		},
	},
	WNDEDWindSpeed2 = {
		{
			alignment = "LFT",
			pages = {
				"WNDEDIT",
			},
			id = "WNDEDWindSpeed2",
			index = 0,
			static_text = false,
			x = 18,
			y = 2,
		},
	},
	WNDWindDirection1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "WNDWindDirection1",
			index = 0,
			static_text = false,
			x = 14,
			y = 2,
		},
	},
	WNDWindDirection2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "WNDWindDirection2",
			index = 0,
			static_text = false,
			x = 14,
			y = 2,
		},
	},
	WNDWindSpeed1 = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "WNDWindSpeed1",
			index = 0,
			static_text = false,
			x = 18,
			y = 2,
		},
	},
	WNDWindSpeed2 = {
		{
			alignment = "LFT",
			pages = {
				"WIND",
			},
			id = "WNDWindSpeed2",
			index = 0,
			static_text = false,
			x = 18,
			y = 2,
		},
	},
	WPActive = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	WPActive1 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive1",
			index = 0,
			static_text = false,
			x = 9,
			y = 5,
		},
	},
	WPActive2 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive2",
			index = 0,
			static_text = false,
			x = 9,
			y = 6,
		},
	},
	WPActive3 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive3",
			index = 0,
			static_text = false,
			x = 9,
			y = 7,
		},
	},
	WPActive4 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive4",
			index = 0,
			static_text = false,
			x = 9,
			y = 7,
		},
	},
	WPActive5 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive5",
			index = 0,
			static_text = false,
			x = 9,
			y = 8,
		},
	},
	WPActive6 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive6",
			index = 0,
			static_text = false,
			x = 9,
			y = 9,
		},
	},
	WPActive7 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPActive7",
			index = 0,
			static_text = false,
			x = 9,
			y = 9,
		},
	},
	WPFPNumber = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPFPNumber",
			index = 0,
			static_text = false,
			x = 2,
			y = 5,
		},
	},
	WPFPNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPFPNumber1",
			index = 0,
			static_text = false,
			x = 2,
			y = 7,
		},
	},
	WPFPNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPFPNumber2",
			index = 0,
			static_text = false,
			x = 2,
			y = 9,
		},
	},
	WPInput = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPInput",
			index = 0,
			static_text = false,
			x = 1,
			y = 5,
		},
	},
	WPInput1 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPInput1",
			index = 0,
			static_text = false,
			x = 1,
			y = 7,
		},
	},
	WPInput2 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPInput2",
			index = 0,
			static_text = false,
			x = 1,
			y = 9,
		},
	},
	WPN_EVENTS = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "WPN_EVENTS",
			index = 0,
			static_text = true,
			x = 2,
			y = 8,
		},
	},
	WPN_EVENTS1 = {
		{
			alignment = "RGHT",
			pages = {
				"LASTE",
			},
			id = "WPN_EVENTS1",
			index = 0,
			static_text = false,
			x = 16,
			y = 8,
		},
	},
	WPName = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
	},
	WPName1 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName1",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
	},
	WPName2 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName2",
			index = 0,
			static_text = false,
			x = 10,
			y = 6,
		},
	},
	WPName3 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName3",
			index = 0,
			static_text = false,
			x = 10,
			y = 7,
		},
	},
	WPName4 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName4",
			index = 0,
			static_text = false,
			x = 10,
			y = 7,
		},
	},
	WPName5 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName5",
			index = 0,
			static_text = false,
			x = 10,
			y = 8,
		},
	},
	WPName6 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName6",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
	},
	WPName7 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPName7",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
	},
	WPNewName = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNewName",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
	},
	WPNewName1 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNewName1",
			index = 0,
			static_text = false,
			x = 10,
			y = 5,
		},
	},
	WPNewName2 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNewName2",
			index = 0,
			static_text = false,
			x = 10,
			y = 7,
		},
	},
	WPNewName3 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNewName3",
			index = 0,
			static_text = false,
			x = 10,
			y = 7,
		},
	},
	WPNewName4 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNewName4",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
	},
	WPNewName5 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNewName5",
			index = 0,
			static_text = false,
			x = 10,
			y = 9,
		},
	},
	WPNumber = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	WPNumber1 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber1",
			index = 0,
			static_text = false,
			x = 5,
			y = 5,
		},
	},
	WPNumber2 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber2",
			index = 0,
			static_text = false,
			x = 5,
			y = 6,
		},
	},
	WPNumber3 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber3",
			index = 0,
			static_text = false,
			x = 5,
			y = 7,
		},
	},
	WPNumber4 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber4",
			index = 0,
			static_text = false,
			x = 5,
			y = 7,
		},
	},
	WPNumber5 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber5",
			index = 0,
			static_text = false,
			x = 5,
			y = 8,
		},
	},
	WPNumber6 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber6",
			index = 0,
			static_text = false,
			x = 5,
			y = 9,
		},
	},
	WPNumber7 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPNumber7",
			index = 0,
			static_text = false,
			x = 5,
			y = 9,
		},
	},
	WPT = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
				"WAYPT2",
			},
			id = "WPT",
			index = 0,
			static_text = false,
			x = 2,
			y = 2,
		},
	},
	WPTATT = {
		{
			alignment = "RGHT",
			pages = {
				"FPBUILD",
			},
			id = "WPTATT",
			index = 0,
			static_text = false,
			x = 24,
			y = 4,
		},
	},
	WPTATTBranch = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPTATTBranch",
			index = 0,
			static_text = false,
			x = 24,
			y = 5,
		},
	},
	WPTATTBranch1 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPTATTBranch1",
			index = 0,
			static_text = false,
			x = 24,
			y = 7,
		},
	},
	WPTATTBranch2 = {
		{
			alignment = "LFT",
			pages = {
				"FPBUILD",
			},
			id = "WPTATTBranch2",
			index = 0,
			static_text = false,
			x = 24,
			y = 9,
		},
	},
	WPTATTScale = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTScale",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WPTATTScale1 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTScale1",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WPTATTScale2 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTScale2",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WPTATTScale3 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTScale3",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WPTATTScale4 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTScale4",
			index = 0,
			static_text = false,
			x = 2,
			y = 4,
		},
	},
	WPTATTSteer = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTSteer",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WPTATTSteer1 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTSteer1",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WPTATTSteer2 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTSteer2",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WPTATTSteer4 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTSteer4",
			index = 0,
			static_text = false,
			x = 2,
			y = 6,
		},
	},
	WPTATTVNavMode = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTVNavMode",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	WPTATTVNavMode1 = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTVNavMode1",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	WPTATTVNavMode2 = {
		{
			alignment = "RGHT",
			pages = {
				"WPTATT",
			},
			id = "WPTATTVNavMode2",
			index = 0,
			static_text = false,
			x = 23,
			y = 6,
		},
	},
	WPTATT_DTOT = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_DTOT",
			index = 0,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	WPTATT_DTOT1 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_DTOT1",
			index = 0,
			static_text = false,
			x = 8,
			y = 9,
		},
	},
	WPTATT_DTOT_ST = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_DTOT_ST",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	WPTATT_DTTG = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_DTTG",
			index = 0,
			static_text = false,
			x = 7,
			y = 7,
		},
	},
	WPTATT_DTTG1 = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_DTTG1",
			index = 0,
			static_text = false,
			x = 7,
			y = 7,
		},
	},
	WPTATT_DTTG_ST = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_DTTG_ST",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	WPTATT_FP_Number = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_FP_Number",
			index = 0,
			static_text = false,
			x = 22,
			y = 3,
		},
	},
	WPTATT_WPT_Name = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_WPT_Name",
			index = 0,
			static_text = false,
			x = 11,
			y = 2,
		},
	},
	WPTATT_WPT_Number = {
		{
			alignment = "LFT",
			pages = {
				"WPTATT",
			},
			id = "WPTATT_WPT_Number",
			index = 0,
			static_text = false,
			x = 6,
			y = 2,
		},
	},
	WPTDIS1 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "WPTDIS1",
			index = 0,
			static_text = false,
			x = 20,
			y = 5,
		},
	},
	WPTDIS2 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "WPTDIS2",
			index = 0,
			static_text = false,
			x = 20,
			y = 5,
		},
	},
	WPTDISMH = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "WPTDISMH",
			index = 0,
			static_text = true,
			x = 19,
			y = 5,
		},
	},
	WPTMH1 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "WPTMH1",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
	},
	WPTMH2 = {
		{
			alignment = "LFT",
			pages = {
				"WPINFO",
			},
			id = "WPTMH2",
			index = 0,
			static_text = false,
			x = 16,
			y = 5,
		},
	},
	WPTTTG1 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "WPTTTG1",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WPTTTG2 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "WPTTTG2",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WPTTTG3 = {
		{
			alignment = "RGHT",
			pages = {
				"WPINFO",
			},
			id = "WPTTTG3",
			index = 0,
			static_text = false,
			x = 23,
			y = 4,
		},
	},
	WRITE = {
		{
			alignment = "LFT",
			pages = {
				"MXLOG",
			},
			id = "WRITE",
			index = 0,
			static_text = true,
			x = 2,
			y = 9,
		},
	},
	YEAR = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "YEAR",
			index = 0,
			static_text = true,
			x = 16,
			y = 3,
		},
	},
	YEAR_DE = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "YEAR_DE",
			index = 0,
			static_text = false,
			x = 24,
			y = 3,
		},
	},
	YEAR_TXT = {
		{
			alignment = "RGHT",
			pages = {
				"TIME",
			},
			id = "YEAR_TXT",
			index = 0,
			static_text = false,
			x = 23,
			y = 3,
		},
	},
	YES = {
		{
			alignment = "LFT",
			pages = {
				"LASTE",
			},
			id = "YES",
			index = 0,
			static_text = true,
			x = 11,
			y = 3,
		},
	},
	ZEROES1 = {
		{
			alignment = "LFT",
			pages = {
				"SYS2",
			},
			id = "ZEROES1",
			index = 0,
			static_text = true,
			x = 1,
			y = 7,
		},
	},
	ZEROES2 = {
		{
			alignment = "RGHT",
			pages = {
				"SYS2",
			},
			id = "ZEROES2",
			index = 0,
			static_text = true,
			x = 23,
			y = 7,
		},
	},
	ZEROIZE = {
		{
			alignment = "LFT",
			pages = {
				"GPSKEYS",
			},
			id = "ZEROIZE",
			index = 0,
			static_text = true,
			x = 1,
			y = 9,
		},
	},
	pName = {
		{
			alignment = "LFT",
			pages = {
				"GPSSTAT2",
			},
			id = "pName",
			index = 0,
			static_text = true,
			x = 2,
			y = 1,
		},
	},
}

return A_10C_CDU
