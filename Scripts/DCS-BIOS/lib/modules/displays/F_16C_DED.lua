module("F_16C_DED", package.seeall)

--- @type { [string]: TextDisplayItem[] }
local F_16C_DED = {
	["ACAL_ALEV"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_ALEV",
			x = 9,
			y = 3,
		},
	},
	["ACAL_ALT_DELTA"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_ALT_DELTA",
			x = 9,
			y = 4,
		},
	},
	["ACAL_ALT_DELTA_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_ALT_DELTA_label",
			x = 3,
			y = 4,
		},
	},
	["ACAL_ALT_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_ALT_label",
			x = 15,
			y = 1,
		},
	},
	["ACAL_AUTO_Sensors"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "ACAL_AUTO_Sensors",
			x = 13,
			y = 1,
		},
	},
	["ACAL_AUTO_Sensors_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "ACAL_AUTO_Sensors_inv",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["ACAL_MODE"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_MODE",
			x = 9,
			y = 2,
		},
	},
	["ACAL_POS_DELTA"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_POS_DELTA",
			x = 9,
			y = 5,
		},
	},
	["ACAL_POS_DELTA_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_POS_DELTA_label",
			x = 3,
			y = 5,
		},
	},
	["ACAL_SelectedSensors"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_SelectedSensors",
			x = 9,
			y = 1,
		},
	},
	["ACAL_SelectedSensors_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_SelectedSensors_inv",
			x = 9,
			y = 1,
			color = "i",
		},
	},
	["ACAL_SENSORS"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ACAL_SENSORS",
			x = 2,
			y = 1,
		},
	},
	["Active Frequency or Channe"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_2",
			},
			id = "Active Frequency or Channe",
			x = 3,
			y = 2,
		},
	},
	["Active Frequency or Channel"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
			},
			id = "Active Frequency or Channel",
			x = 3,
			y = 2,
		},
	},
	["Active Mode 3 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Active Mode 3 Code",
			x = 10,
			y = 5,
		},
	},
	["AG DL lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "AG DL lbl",
			x = 8,
			y = 1,
		},
	},
	["ALOW label"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "ALOW label",
			x = 11,
			y = 1,
		},
	},
	["Angles"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Angles",
			x = 11,
			y = 1,
		},
	},
	["Asterisks on Band_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Asterisks on Band_lhs",
			x = 18,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on Band_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Asterisks on Band_rhs",
			x = 21,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on CS Name_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on CS Name_lhs",
			x = 11,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on CS Name_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on CS Name_rhs",
			x = 14,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on CS Number_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on CS Number_lhs",
			x = 16,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on CS Number_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on CS Number_rhs",
			x = 19,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on ETR_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on ETR_lhs",
			x = 9,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on ETR_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on ETR_rhs",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on FC_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on FC_lhs",
			x = 6,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on FC_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on FC_rhs",
			x = 10,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on FL_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on FL_lhs",
			x = 16,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on FL_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on FL_rhs",
			x = 20,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on IPF_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on IPF_lhs",
			x = 14,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on IPF_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on IPF_rhs",
			x = 24,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on MC_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on MC_lhs",
			x = 6,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on MC_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on MC_rhs",
			x = 10,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on NTR_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on NTR_lhs",
			x = 9,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on NTR_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on NTR_rhs",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on Own_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on Own_lhs",
			x = 22,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on Own_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on Own_rhs",
			x = 24,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on PresetChannel_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Asterisks on PresetChannel_lhs",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on PresetChannel_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Asterisks on PresetChannel_rhs",
			x = 10,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on PresetFrequency_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Asterisks on PresetFrequency_lhs",
			x = 5,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on PresetFrequency_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Asterisks on PresetFrequency_rhs",
			x = 12,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on RESET_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "Asterisks on RESET_lhs",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on RESET_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "Asterisks on RESET_rhs",
			x = 18,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on SC_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on SC_lhs",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on SC_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on SC_rhs",
			x = 10,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on Scratchpad_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Asterisks on Scratchpad_lhs",
			x = 14,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"INS_INFLT_ALGN",
			},
			id = "Asterisks on Scratchpad_lhs",
			x = 16,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "Asterisks on Scratchpad_lhs",
			x = 12,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on Scratchpad_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
				"INS_INFLT_ALGN",
			},
			id = "Asterisks on Scratchpad_rhs",
			x = 21,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "Asterisks on Scratchpad_rhs",
			x = 15,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_1_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_1_lhs",
			x = 3,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_1_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_1_rhs",
			x = 2,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_2_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_2_lhs",
			x = 3,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_2_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_2_rhs",
			x = 2,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_3_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_3_lhs",
			x = 3,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_3_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_3_rhs",
			x = 2,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_4_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_4_lhs",
			x = 3,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_4_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_4_rhs",
			x = 2,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_5_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_5_lhs",
			x = 9,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_5_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_5_rhs",
			x = 2,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_6_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_6_lhs",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_6_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_6_rhs",
			x = 2,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_7_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_7_lhs",
			x = 9,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_7_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_7_rhs",
			x = 2,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_8_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_8_lhs",
			x = 9,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on STN TDOA_8_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN TDOA_8_rhs",
			x = 2,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on STN_1_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_1_lhs",
			x = 5,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN_1_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_1_rhs",
			x = 6,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN_2_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_2_lhs",
			x = 5,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN_2_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_2_rhs",
			x = 6,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN_3_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_3_lhs",
			x = 5,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN_3_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_3_rhs",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN_4_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_4_lhs",
			x = 5,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on STN_4_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_4_rhs",
			x = 6,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on STN_5_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_5_lhs",
			x = 11,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN_5_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_5_rhs",
			x = 6,
			y = 2,
			color = "i",
		},
	},
	["Asterisks on STN_6_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_6_lhs",
			x = 11,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN_6_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_6_rhs",
			x = 6,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on STN_7_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_7_lhs",
			x = 11,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN_7_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_7_rhs",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on STN_8_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_8_lhs",
			x = 11,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on STN_8_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Asterisks on STN_8_rhs",
			x = 6,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on SYNC_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on SYNC_lhs",
			x = 9,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on SYNC_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on SYNC_rhs",
			x = 16,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on TIME_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on TIME_lhs",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on TIME_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "Asterisks on TIME_rhs",
			x = 18,
			y = 3,
			color = "i",
		},
	},
	["Asterisks on XMT_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on XMT_lhs",
			x = 16,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on XMT_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "Asterisks on XMT_rhs",
			x = 21,
			y = 4,
			color = "i",
		},
	},
	["Asterisks on ZEROIZE_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "Asterisks on ZEROIZE_lhs",
			x = 6,
			y = 5,
			color = "i",
		},
	},
	["Asterisks on ZEROIZE_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "Asterisks on ZEROIZE_rhs",
			x = 18,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_ACAL_SelectedMode_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "Asterisks_ACAL_SelectedMode_lhs",
			x = 8,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_ACAL_SelectedMode_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "Asterisks_ACAL_SelectedMode_rhs",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_ACAL_SENSORS_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "Asterisks_ACAL_SENSORS_lhs",
			x = 8,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_ACAL_SENSORS_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "Asterisks_ACAL_SENSORS_rhs",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_AUTO_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "Asterisks_AUTO_lhs",
			x = 12,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_AUTO_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "Asterisks_AUTO_rhs",
			x = 17,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_AZ_ELAZ_EL_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "Asterisks_AZ_ELAZ_EL_lhs",
			x = 2,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_AZ_ELAZ_EL_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "Asterisks_AZ_ELAZ_EL_rhs",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_BRG_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_BRG_lhs",
			x = 8,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_BRG_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_BRG_rhs",
			x = 15,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_CKPT_BLANK_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_CKPT_BLANK_lhs",
			x = 2,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_CKPT_BLANK_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_CKPT_BLANK_rhs",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_CNVRT_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_CNVRT_lhs",
			x = 18,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_CNVRT_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_CNVRT_rhs",
			x = 24,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_COARSE_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "Asterisks_COARSE_lhs",
			x = 2,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_COARSE_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "Asterisks_COARSE_rhs",
			x = 9,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_DECLUTTER_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_DECLUTTER_lhs",
			x = 12,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_DECLUTTER_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_DECLUTTER_rhs",
			x = 18,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_DES_TOS_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "Asterisks_DES_TOS_lhs",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_DES_TOS_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "Asterisks_DES_TOS_rhs",
			x = 22,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_EAST/NORTH_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_EAST/NORTH_lhs",
			x = 12,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_EAST/NORTH_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_EAST/NORTH_rhs",
			x = 24,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_ELEV_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "Asterisks_ELEV_lhs",
			x = 16,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_ELEV_lhs",
			x = 8,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_ELEV_lhs",
			x = 8,
			y = 5,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_ELEV_lhs",
			x = 12,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_ELEV_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "Asterisks_ELEV_rhs",
			x = 24,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_ELEV_rhs",
			x = 16,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_ELEV_rhs",
			x = 17,
			y = 5,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_ELEV_rhs",
			x = 20,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_FIX_SENSORS_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "Asterisks_FIX_SENSORS_lhs",
			x = 11,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_FIX_SENSORS_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "Asterisks_FIX_SENSORS_rhs",
			x = 16,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_GRID_DIGIT_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_GRID_DIGIT_lhs",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_GRID_DIGIT_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_GRID_DIGIT_rhs",
			x = 16,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_GRID_SYMBOL_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_GRID_SYMBOL_lhs",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_GRID_SYMBOL_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_GRID_SYMBOL_rhs",
			x = 16,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_HOME_STPT_NUM_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "Asterisks_HOME_STPT_NUM_lhs",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_HOME_STPT_NUM_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "Asterisks_HOME_STPT_NUM_rhs",
			x = 18,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_HUD_BLANK_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_HUD_BLANK_lhs",
			x = 2,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_HUD_BLANK_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_HUD_BLANK_rhs",
			x = 11,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_LAT_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_LAT_lhs",
			x = 8,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_LAT_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_LAT_rhs",
			x = 21,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "Asterisks_lhs",
			x = 16,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_LON_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_LON_lhs",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_LON_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_LON_rhs",
			x = 21,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_NUM_STEERPOINT_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
				"DEST_UTM_DIR",
			},
			id = "Asterisks_NUM_STEERPOINT_lhs",
			x = 12,
			y = 1,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_NUM_STEERPOINT_lhs",
			x = 11,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_NUM_STEERPOINT_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
				"DEST_UTM_DIR",
			},
			id = "Asterisks_NUM_STEERPOINT_rhs",
			x = 16,
			y = 1,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_NUM_STEERPOINT_rhs",
			x = 15,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_on_DATE_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_DATE_lhs",
			x = 13,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_on_DATE_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_DATE_rhs",
			x = 22,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_on_DELTA_TOS_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_DELTA_TOS_lhs",
			x = 12,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_on_DELTA_TOS_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_DELTA_TOS_rhs",
			x = 22,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_on_HACK_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_HACK_lhs",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_on_HACK_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_HACK_rhs",
			x = 22,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_on_LAT_Scratchpad_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_LAT_Scratchpad_lhs",
			x = 7,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_on_LAT_Scratchpad_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_LAT_Scratchpad_rhs",
			x = 18,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_on_LNG_Scratchpad_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_LNG_Scratchpad_lhs",
			x = 7,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_on_LNG_Scratchpad_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_LNG_Scratchpad_rhs",
			x = 18,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_on_MAGV_Mode_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "Asterisks_on_MAGV_Mode_lhs",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_on_MAGV_Mode_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "Asterisks_on_MAGV_Mode_rhs",
			x = 18,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_on_MAGV_Scratchpad_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "Asterisks_on_MAGV_Scratchpad_lhs",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_on_MAGV_Scratchpad_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "Asterisks_on_MAGV_Scratchpad_rhs",
			x = 16,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_on_SALT_Scratchpad_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_SALT_Scratchpad_lhs",
			x = 8,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_on_SALT_Scratchpad_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_SALT_Scratchpad_rhs",
			x = 16,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_on_SYSTEM_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_SYSTEM_lhs",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_on_SYSTEM_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "Asterisks_on_SYSTEM_rhs",
			x = 22,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_on_THDG_Scratchpad_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_THDG_Scratchpad_lhs",
			x = 7,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_on_THDG_Scratchpad_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "Asterisks_on_THDG_Scratchpad_rhs",
			x = 14,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "Asterisks_rhs",
			x = 21,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_RNG_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_RNG_lhs",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_RNG_MODE_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
				"CRUS_HOME",
				"CRUS_RNG",
			},
			id = "Asterisks_RNG_MODE_lhs",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_RNG_MODE_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
				"CRUS_RNG",
			},
			id = "Asterisks_RNG_MODE_rhs",
			x = 17,
			y = 1,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "Asterisks_RNG_MODE_rhs",
			x = 18,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_RNG_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "Asterisks_RNG_rhs",
			x = 17,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_ROLL_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "Asterisks_ROLL_lhs",
			x = 2,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_ROLL_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "Asterisks_ROLL_rhs",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_RWR_DISPLAY_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_RWR_DISPLAY_lhs",
			x = 12,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_RWR_DISPLAY_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "Asterisks_RWR_DISPLAY_rhs",
			x = 16,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_SQUARE_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_SQUARE_lhs",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_SQUARE_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_SQUARE_rhs",
			x = 15,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_SQUARE2_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_SQUARE2_lhs",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_SQUARE2_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "Asterisks_SQUARE2_rhs",
			x = 15,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_STPT_NUMBER_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "Asterisks_STPT_NUMBER_lhs",
			x = 10,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_STPT_NUMBER_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "Asterisks_STPT_NUMBER_rhs",
			x = 14,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_T1_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T1_lhs",
			x = 18,
			y = 1,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T1_lhs",
			x = 3,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_T1_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T1_rhs",
			x = 22,
			y = 1,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T1_rhs",
			x = 8,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_T2_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T2_lhs",
			x = 18,
			y = 2,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T2_lhs",
			x = 3,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_T2_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T2_rhs",
			x = 22,
			y = 2,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T2_rhs",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_T3_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T3_lhs",
			x = 18,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T3_lhs",
			x = 3,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_T3_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T3_rhs",
			x = 22,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T3_rhs",
			x = 8,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_T4_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T4_lhs",
			x = 18,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T4_lhs",
			x = 3,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_T4_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T4_rhs",
			x = 22,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T4_rhs",
			x = 8,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_T5_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T5_lhs",
			x = 18,
			y = 5,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T5_lhs",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_T5_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "Asterisks_T5_rhs",
			x = 22,
			y = 5,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T5_rhs",
			x = 17,
			y = 2,
			color = "i",
		},
	},
	["Asterisks_T6_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T6_lhs",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_T6_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T6_rhs",
			x = 17,
			y = 3,
			color = "i",
		},
	},
	["Asterisks_T7_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T7_lhs",
			x = 12,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_T7_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T7_rhs",
			x = 17,
			y = 4,
			color = "i",
		},
	},
	["Asterisks_T8_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T8_lhs",
			x = 12,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_T8_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "Asterisks_T8_rhs",
			x = 17,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_TOS_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_TOS_lhs",
			x = 8,
			y = 5,
			color = "i",
		},
	},
	["Asterisks_TOS_MODE_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "Asterisks_TOS_MODE_lhs",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_TOS_MODE_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "Asterisks_TOS_MODE_rhs",
			x = 17,
			y = 1,
			color = "i",
		},
	},
	["Asterisks_TOS_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "Asterisks_TOS_rhs",
			x = 17,
			y = 5,
			color = "i",
		},
	},
	["ATP LASER MODE AA"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE AA",
			x = 14,
			y = 4,
		},
	},
	["ATP LASER MODE AG"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE AG",
			x = 2,
			y = 4,
		},
	},
	["ATP LASER MODE Asteriscs AA_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE Asteriscs AA_lhs",
			x = 18,
			y = 4,
			color = "i",
		},
	},
	["ATP LASER MODE Asteriscs AA_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE Asteriscs AA_rhs",
			x = 23,
			y = 4,
			color = "i",
		},
	},
	["ATP LASER MODE Asteriscs AG_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE Asteriscs AG_lhs",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["ATP LASER MODE Asteriscs AG_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE Asteriscs AG_rhs",
			x = 11,
			y = 4,
			color = "i",
		},
	},
	["ATP LASER MODE VALUE AA"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE VALUE AA",
			x = 19,
			y = 4,
		},
	},
	["ATP LASER MODE VALUE AA_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE VALUE AA_inv",
			x = 19,
			y = 4,
			color = "i",
		},
	},
	["ATP LASER MODE VALUE AG"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE VALUE AG",
			x = 7,
			y = 4,
		},
	},
	["ATP LASER MODE VALUE AG_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "ATP LASER MODE VALUE AG_inv",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["AUTO_ACAL"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "AUTO_ACAL",
			x = 2,
			y = 1,
		},
	},
	["BACKUP label"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_BACKUP",
			},
			id = "BACKUP label",
			x = 10,
			y = 3,
		},
	},
	["BACKUP lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
			},
			id = "BACKUP lbl",
			x = 3,
			y = 4,
		},
	},
	["Bandwidth"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Bandwidth",
			x = 19,
			y = 5,
		},
	},
	["Bandwidth_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Bandwidth_inv",
			x = 19,
			y = 5,
			color = "i",
		},
	},
	["BINGO Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "BINGO Asterisks_lhs",
			x = 11,
			y = 3,
			color = "i",
		},
	},
	["BINGO Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "BINGO Asterisks_rhs",
			x = 20,
			y = 3,
			color = "i",
		},
	},
	["BINGO IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "BINGO IncDecSymbol",
			x = 24,
			y = 1,
		},
	},
	["BINGO label"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "BINGO label",
			x = 10,
			y = 1,
		},
	},
	["BINGO Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "BINGO Scratchpad",
			x = 12,
			y = 3,
		},
	},
	["BINGO Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "BINGO Scratchpad_inv",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["BINGO STPT Num"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "BINGO STPT Num",
			x = 21,
			y = 1,
		},
	},
	["BRG"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "BRG",
			x = 9,
			y = 4,
		},
	},
	["BRG_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "BRG_inv",
			x = 9,
			y = 4,
			color = "i",
		},
	},
	["BULL POINT LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULL POINT LABEL",
			x = 7,
			y = 2,
		},
	},
	["BULLSEYE IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE IncDecSymbol",
			x = 17,
			y = 2,
		},
	},
	["BULLSEYE LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE LABEL",
			x = 7,
			y = 1,
		},
	},
	["BULLSEYE LABEL Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE LABEL Asteriscs_lhs",
			x = 6,
			y = 1,
			color = "i",
		},
	},
	["BULLSEYE LABEL Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE LABEL Asteriscs_rhs",
			x = 15,
			y = 1,
			color = "i",
		},
	},
	["BULLSEYE LABEL_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE LABEL_inv",
			x = 7,
			y = 1,
			color = "i",
		},
	},
	["BULLSEYE NUMBER"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE NUMBER",
			x = 13,
			y = 2,
		},
	},
	["BULLSEYE NUMBER_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE NUMBER_inv",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["BULLSEYE SEQUENCE Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE SEQUENCE Asteriscs_lhs",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["BULLSEYE SEQUENCE Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"BULLSEYE",
			},
			id = "BULLSEYE SEQUENCE Asteriscs_rhs",
			x = 16,
			y = 2,
			color = "i",
		},
	},
	["CallSign Name char1"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "CallSign Name char1",
			x = 12,
			y = 2,
		},
	},
	["CallSign Name char1_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "CallSign Name char1_inv",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["CallSign Name char2"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "CallSign Name char2",
			x = 13,
			y = 2,
		},
	},
	["CallSign Name char2_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "CallSign Name char2_inv",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["CallSign Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "CallSign Number",
			x = 17,
			y = 2,
		},
	},
	["CallSign Number_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "CallSign Number_inv",
			x = 17,
			y = 2,
			color = "i",
		},
	},
	["CARA ALOW Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "CARA ALOW Asterisks_lhs",
			x = 15,
			y = 3,
			color = "i",
		},
	},
	["CARA ALOW Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "CARA ALOW Asterisks_rhs",
			x = 23,
			y = 3,
			color = "i",
		},
	},
	["CARA ALOW label"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "CARA ALOW label",
			x = 4,
			y = 3,
		},
	},
	["CARA ALOW Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "CARA ALOW Scratchpad",
			x = 16,
			y = 3,
		},
	},
	["CARA ALOW Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "CARA ALOW Scratchpad_inv",
			x = 16,
			y = 3,
			color = "i",
		},
	},
	["CMDS_BI_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BI_Asterisks_lhs",
			x = 10,
			y = 3,
			color = "i",
		},
	},
	["CMDS_BI_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BI_Asterisks_rhs",
			x = 17,
			y = 3,
			color = "i",
		},
	},
	["CMDS_BI_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BI_lbl",
			x = 7,
			y = 3,
		},
	},
	["CMDS_BI_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BI_Scratchpad",
			x = 11,
			y = 3,
		},
	},
	["CMDS_BI_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BI_Scratchpad_inv",
			x = 11,
			y = 3,
			color = "i",
		},
	},
	["CMDS_BINGO_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_BINGO_Asterisks_lhs",
			x = 19,
			y = 5,
			color = "i",
		},
	},
	["CMDS_BINGO_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_BINGO_Asterisks_rhs",
			x = 23,
			y = 5,
			color = "i",
		},
	},
	["CMDS_BINGO_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_BINGO_label",
			x = 6,
			y = 1,
		},
	},
	["CMDS_BINGO_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_BINGO_lbl",
			x = 12,
			y = 5,
		},
	},
	["CMDS_BINGO_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_BINGO_value",
			x = 20,
			y = 5,
		},
	},
	["CMDS_BINGO_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_BINGO_value_inv",
			x = 20,
			y = 5,
			color = "i",
		},
	},
	["CMDS_BQ_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BQ_Asterisks_lhs",
			x = 10,
			y = 2,
			color = "i",
		},
	},
	["CMDS_BQ_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BQ_Asterisks_rhs",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["CMDS_BQ_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BQ_lbl",
			x = 7,
			y = 2,
		},
	},
	["CMDS_BQ_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BQ_Scratchpad",
			x = 11,
			y = 2,
		},
	},
	["CMDS_BQ_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_BQ_Scratchpad_inv",
			x = 11,
			y = 2,
			color = "i",
		},
	},
	["CMDS_CH_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_CH_Asterisks_lhs",
			x = 7,
			y = 2,
			color = "i",
		},
	},
	["CMDS_CH_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_CH_Asterisks_rhs",
			x = 10,
			y = 2,
			color = "i",
		},
	},
	["CMDS_CH_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_CH_lbl",
			x = 3,
			y = 2,
		},
	},
	["CMDS_CH_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_CH_Scratchpad",
			x = 8,
			y = 2,
		},
	},
	["CMDS_CH_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_CH_Scratchpad_inv",
			x = 8,
			y = 2,
			color = "i",
		},
	},
	["CMDS_CHAFF_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
			},
			id = "CMDS_CHAFF_label",
			x = 3,
			y = 1,
		},
	},
	["CMDS_FDBK_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FDBK_Asterisks_lhs",
			x = 19,
			y = 3,
			color = "i",
		},
	},
	["CMDS_FDBK_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FDBK_Asterisks_rhs",
			x = 23,
			y = 3,
			color = "i",
		},
	},
	["CMDS_FDBK_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FDBK_lbl",
			x = 12,
			y = 3,
		},
	},
	["CMDS_FDBK_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FDBK_value",
			x = 20,
			y = 3,
		},
	},
	["CMDS_FDBK_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FDBK_value_inv",
			x = 20,
			y = 3,
			color = "i",
		},
	},
	["CMDS_FL_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FL_Asterisks_lhs",
			x = 7,
			y = 3,
			color = "i",
		},
	},
	["CMDS_FL_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FL_Asterisks_rhs",
			x = 10,
			y = 3,
			color = "i",
		},
	},
	["CMDS_FL_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FL_lbl",
			x = 3,
			y = 3,
		},
	},
	["CMDS_FL_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FL_Scratchpad",
			x = 8,
			y = 3,
		},
	},
	["CMDS_FL_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_FL_Scratchpad_inv",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["CMDS_FLARE_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_FLARE",
			},
			id = "CMDS_FLARE_label",
			x = 3,
			y = 1,
		},
	},
	["CMDS_O1_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O1_Asterisks_lhs",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["CMDS_O1_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O1_Asterisks_rhs",
			x = 10,
			y = 4,
			color = "i",
		},
	},
	["CMDS_O1_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O1_lbl",
			x = 3,
			y = 4,
		},
	},
	["CMDS_O1_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O1_Scratchpad",
			x = 8,
			y = 4,
		},
	},
	["CMDS_O1_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O1_Scratchpad_inv",
			x = 8,
			y = 4,
			color = "i",
		},
	},
	["CMDS_O2_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O2_Asterisks_lhs",
			x = 7,
			y = 5,
			color = "i",
		},
	},
	["CMDS_O2_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O2_Asterisks_rhs",
			x = 10,
			y = 5,
			color = "i",
		},
	},
	["CMDS_O2_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O2_lbl",
			x = 3,
			y = 5,
		},
	},
	["CMDS_O2_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O2_Scratchpad",
			x = 8,
			y = 5,
		},
	},
	["CMDS_O2_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_O2_Scratchpad_inv",
			x = 8,
			y = 5,
			color = "i",
		},
	},
	["CMDS_OTHER1_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_OTHER_1",
			},
			id = "CMDS_OTHER1_label",
			x = 3,
			y = 1,
		},
	},
	["CMDS_OTHER2_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_OTHER_2",
			},
			id = "CMDS_OTHER2_label",
			x = 3,
			y = 1,
		},
	},
	["CMDS_Prog_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_Prog_IncDecSymbol",
			x = 24,
			y = 1,
		},
	},
	["CMDS_Prog_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_Prog_label",
			x = 16,
			y = 1,
		},
	},
	["CMDS_REQCTR_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_REQCTR_Asterisks_lhs",
			x = 19,
			y = 4,
			color = "i",
		},
	},
	["CMDS_REQCTR_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_REQCTR_Asterisks_rhs",
			x = 23,
			y = 4,
			color = "i",
		},
	},
	["CMDS_REQCTR_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_REQCTR_lbl",
			x = 12,
			y = 4,
		},
	},
	["CMDS_REQCTR_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_REQCTR_value",
			x = 20,
			y = 4,
		},
	},
	["CMDS_REQCTR_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_BINGO",
			},
			id = "CMDS_REQCTR_value_inv",
			x = 20,
			y = 4,
			color = "i",
		},
	},
	["CMDS_Selected_Program"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_Selected_Program",
			x = 22,
			y = 1,
		},
	},
	["CMDS_SI_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SI_Asterisks_lhs",
			x = 10,
			y = 5,
			color = "i",
		},
	},
	["CMDS_SI_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SI_Asterisks_rhs",
			x = 17,
			y = 5,
			color = "i",
		},
	},
	["CMDS_SI_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SI_lbl",
			x = 7,
			y = 5,
		},
	},
	["CMDS_SI_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SI_Scratchpad",
			x = 11,
			y = 5,
		},
	},
	["CMDS_SI_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SI_Scratchpad_inv",
			x = 11,
			y = 5,
			color = "i",
		},
	},
	["CMDS_SQ_Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SQ_Asterisks_lhs",
			x = 10,
			y = 4,
			color = "i",
		},
	},
	["CMDS_SQ_Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SQ_Asterisks_rhs",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["CMDS_SQ_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SQ_lbl",
			x = 7,
			y = 4,
		},
	},
	["CMDS_SQ_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SQ_Scratchpad",
			x = 11,
			y = 4,
		},
	},
	["CMDS_SQ_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CMDS_CHAFF",
				"CMDS_COMMON",
				"CMDS_FLARE",
				"CMDS_OTHER_1",
				"CMDS_OTHER_2",
			},
			id = "CMDS_SQ_Scratchpad_inv",
			x = 11,
			y = 4,
			color = "i",
		},
	},
	["Code Group State"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_TIM",
			},
			id = "Code Group State",
			x = 23,
			y = 1,
		},
	},
	["COM 1 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
			},
			id = "COM 1 Mode",
			x = 6,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"COM_1_GUARD",
			},
			id = "COM 1 Mode",
			x = 9,
			y = 1,
		},
	},
	["COM 1 Power Status"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1_GUARD",
			},
			id = "COM 1 Power Status",
			x = 14,
			y = 1,
		},
	},
	["COM 2 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_2",
			},
			id = "COM 2 Mode",
			x = 9,
			y = 1,
		},
	},
	["COM 2 Receiver Band"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_2_GUARD",
			},
			id = "COM 2 Receiver Band",
			x = 9,
			y = 3,
		},
	},
	["COM 2 Receiver Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_2_GUARD",
			},
			id = "COM 2 Receiver Mode",
			x = 14,
			y = 1,
		},
	},
	["COMM lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "COMM lbl",
			x = 13,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "COMM lbl",
			x = 14,
			y = 2,
		},
	},
	["COMM status"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "COMM status",
			x = 18,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "COMM status",
			x = 19,
			y = 2,
		},
	},
	["CRUS_MODE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_COMMON",
				"CRUS_EDR",
				"CRUS_HOME",
				"CRUS_RNG",
				"CRUS_TOS",
			},
			id = "CRUS_MODE",
			x = 8,
			y = 1,
		},
	},
	["DATA lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "DATA lbl",
			x = 13,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "DATA lbl",
			x = 14,
			y = 3,
		},
	},
	["DATA status"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "DATA status",
			x = 18,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "DATA status",
			x = 19,
			y = 3,
		},
	},
	["DATE_FORMAT_label"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DATE_FORMAT_label",
			x = 3,
			y = 5,
		},
	},
	["DATE_value"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DATE_value",
			x = 14,
			y = 5,
		},
	},
	["DATE_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DATE_value_inv",
			x = 14,
			y = 5,
			color = "i",
		},
	},
	["DAYS label"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "DAYS label",
			x = 17,
			y = 4,
		},
	},
	["Default Value Indication"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Default Value Indication",
			x = 12,
			y = 2,
		},
	},
	["DELTA"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "DELTA",
			x = 14,
			y = 3,
		},
	},
	["DELTA_ALT"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "DELTA_ALT",
			x = 17,
			y = 4,
		},
	},
	["DELTA_POS"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "DELTA_POS",
			x = 17,
			y = 5,
		},
	},
	["DELTA_TOS_label"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DELTA_TOS_label",
			x = 2,
			y = 4,
		},
	},
	["DELTA_TOS_value"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DELTA_TOS_value",
			x = 13,
			y = 4,
		},
	},
	["DELTA_TOS_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "DELTA_TOS_value_inv",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["DEST_DIR"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_DIR",
			x = 3,
			y = 1,
		},
	},
	["DEST_DIR_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_DIR_SelectedSteerpoint",
			x = 13,
			y = 1,
		},
	},
	["DEST_DIR_SelectedSteerpoint_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_DIR_SelectedSteerpoint_inv",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["DEST_DIR_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_DIR_STPT_IncDecSymbol",
			x = 17,
			y = 1,
		},
	},
	["DEST_ELEV"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_ELEV",
			x = 3,
			y = 4,
		},
	},
	["DEST_LAT"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_LAT",
			x = 4,
			y = 2,
		},
	},
	["DEST_LON"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_LON",
			x = 4,
			y = 3,
		},
	},
	["DEST_OA1"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "DEST_OA1",
			x = 3,
			y = 1,
		},
	},
	["DEST_OA1_BRG"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "DEST_OA1_BRG",
			x = 4,
			y = 4,
		},
	},
	["DEST_OA1_ELEV"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "DEST_OA1_ELEV",
			x = 3,
			y = 5,
		},
	},
	["DEST_OA1_RNG"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "DEST_OA1_RNG",
			x = 4,
			y = 3,
		},
	},
	["DEST_OA1_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "DEST_OA1_SelectedSteerpoint",
			x = 12,
			y = 1,
		},
	},
	["DEST_OA1_SelectedSteerpoint_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "DEST_OA1_SelectedSteerpoint_inv",
			x = 12,
			y = 1,
			color = "i",
		},
	},
	["DEST_OA1_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "DEST_OA1_STPT_IncDecSymbol",
			x = 16,
			y = 1,
		},
	},
	["DEST_OA2"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "DEST_OA2",
			x = 3,
			y = 1,
		},
	},
	["DEST_OA2_BRG"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "DEST_OA2_BRG",
			x = 4,
			y = 4,
		},
	},
	["DEST_OA2_ELEV"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "DEST_OA2_ELEV",
			x = 3,
			y = 5,
		},
	},
	["DEST_OA2_RNG"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "DEST_OA2_RNG",
			x = 4,
			y = 3,
		},
	},
	["DEST_OA2_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "DEST_OA2_SelectedSteerpoint",
			x = 12,
			y = 1,
		},
	},
	["DEST_OA2_SelectedSteerpoint_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "DEST_OA2_SelectedSteerpoint_inv",
			x = 12,
			y = 1,
			color = "i",
		},
	},
	["DEST_OA2_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "DEST_OA2_STPT_IncDecSymbol",
			x = 16,
			y = 1,
		},
	},
	["DEST_TOS"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "DEST_TOS",
			x = 4,
			y = 5,
		},
	},
	["DTS_ACCURACY_HPU_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "DTS_ACCURACY_HPU_label",
			x = 22,
			y = 4,
		},
	},
	["DTS_ACCURACY_HPU_value"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "DTS_ACCURACY_HPU_value",
			x = 24,
			y = 4,
		},
	},
	["DTS_ACCURACY_VPU_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "DTS_ACCURACY_VPU_label",
			x = 22,
			y = 5,
		},
	},
	["DTS_ACCURACY_VPU_value"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "DTS_ACCURACY_VPU_value",
			x = 24,
			y = 5,
		},
	},
	["DTS_STATUS_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "DTS_STATUS_label",
			x = 10,
			y = 4,
		},
	},
	["DTS_STATUS_value"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "DTS_STATUS_value",
			x = 15,
			y = 4,
		},
	},
	["EAST/NORTH"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "EAST/NORTH",
			x = 13,
			y = 4,
		},
	},
	["EAST/NORTH_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "EAST/NORTH_inv",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["EDR_INS_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_INS_SelectedSteerpoint",
			x = 13,
			y = 2,
		},
	},
	["EDR_INS_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_INS_STPT_IncDecSymbol",
			x = 17,
			y = 2,
		},
	},
	["EDR_MODE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_MODE",
			x = 14,
			y = 1,
		},
	},
	["EDR_MODE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_MODE_inv",
			x = 14,
			y = 1,
			color = "i",
		},
	},
	["EDR_OPT_MACH_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_OPT_MACH_label",
			x = 4,
			y = 4,
		},
	},
	["EDR_OPT_MACH_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_OPT_MACH_value",
			x = 14,
			y = 4,
		},
	},
	["EDR_STPT_NUM"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_STPT_NUM",
			x = 8,
			y = 2,
		},
	},
	["EDR_TO_BINGO_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_TO_BINGO_label",
			x = 5,
			y = 3,
		},
	},
	["EDR_TO_BINGO_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_TO_BINGO_value",
			x = 14,
			y = 3,
		},
	},
	["EDR_WIND_AT_ALTITUDE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_WIND_AT_ALTITUDE",
			x = 8,
			y = 5,
		},
	},
	["EDR_WIND_AT_ALTITUDE_Value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_EDR",
			},
			id = "EDR_WIND_AT_ALTITUDE_Value",
			x = 14,
			y = 5,
		},
	},
	["ELEV"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ELEV",
			x = 17,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "ELEV",
			x = 9,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "ELEV",
			x = 9,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "ELEV",
			x = 13,
			y = 5,
		},
	},
	["ELEV_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_MAN",
			},
			id = "ELEV_inv",
			x = 17,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "ELEV_inv",
			x = 9,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "ELEV_inv",
			x = 9,
			y = 5,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "ELEV_inv",
			x = 13,
			y = 5,
			color = "i",
		},
	},
	["Elevation"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
				"VRP",
			},
			id = "Elevation",
			x = 5,
			y = 5,
		},
	},
	["Elevation Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
				"VRP",
			},
			id = "Elevation Asteriscs_lhs",
			x = 10,
			y = 5,
			color = "i",
		},
	},
	["Elevation Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
				"VRP",
			},
			id = "Elevation Asteriscs_rhs",
			x = 19,
			y = 5,
			color = "i",
		},
	},
	["Elevation value"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
				"VRP",
			},
			id = "Elevation value",
			x = 11,
			y = 5,
		},
	},
	["Elevation value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
				"VRP",
			},
			id = "Elevation value_inv",
			x = 11,
			y = 5,
			color = "i",
		},
	},
	["EVENT - Time"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_TIM",
			},
			id = "EVENT - Time",
			x = 19,
			y = 4,
		},
	},
	["Event Occured"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "Event Occured",
			x = 19,
			y = 1,
		},
	},
	["FC lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "FC lbl",
			x = 4,
			y = 2,
		},
	},
	["FC value"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "FC value",
			x = 7,
			y = 2,
		},
	},
	["FC value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "FC value_inv",
			x = 7,
			y = 2,
			color = "i",
		},
	},
	["FILL lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "FILL lbl",
			x = 3,
			y = 4,
		},
	},
	["FILL status"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "FILL status",
			x = 8,
			y = 4,
		},
	},
	["FILTER MODE label"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "FILTER MODE label",
			x = 4,
			y = 3,
		},
	},
	["FILTER MODE value"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "FILTER MODE value",
			x = 17,
			y = 3,
		},
	},
	["FIX_DELTA"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "FIX_DELTA",
			x = 4,
			y = 3,
		},
	},
	["FIX_SelectedSensors"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "FIX_SelectedSensors",
			x = 12,
			y = 1,
		},
	},
	["FIX_SelectedSensors_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "FIX_SelectedSensors_inv",
			x = 12,
			y = 1,
			color = "i",
		},
	},
	["FIX_SENSORS"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "FIX_SENSORS",
			x = 7,
			y = 1,
		},
	},
	["FIX_STPT"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "FIX_STPT",
			x = 5,
			y = 2,
		},
	},
	["FL lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "FL lbl",
			x = 13,
			y = 3,
		},
	},
	["FL status"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "FL status",
			x = 17,
			y = 3,
		},
	},
	["GPS ACCURACY label"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "GPS ACCURACY label",
			x = 5,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "GPS ACCURACY label",
			x = 4,
			y = 3,
		},
	},
	["GPS ACCURACY value"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "GPS ACCURACY value",
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "GPS ACCURACY value",
			x = 15,
			y = 3,
		},
	},
	["GPS TIME lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "GPS TIME lbl",
			x = 1,
			y = 2,
		},
	},
	["GPS TIME status"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "GPS TIME status",
			x = 10,
			y = 2,
		},
	},
	["GPS_ACCURACY_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "GPS_ACCURACY_label",
			x = 4,
			y = 3,
		},
	},
	["GPS_ACCURACY_value"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "GPS_ACCURACY_value",
			x = 15,
			y = 3,
		},
	},
	["GPS_SYSTEM_label"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "GPS_SYSTEM_label",
			x = 1,
			y = 2,
		},
	},
	["GRID_DIGIT"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "GRID_DIGIT",
			x = 13,
			y = 2,
		},
	},
	["GRID_DIGIT_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "GRID_DIGIT_inv",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["GRID_SYMBOL"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "GRID_SYMBOL",
			x = 15,
			y = 2,
		},
	},
	["GRID_SYMBOL_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "GRID_SYMBOL_inv",
			x = 15,
			y = 2,
			color = "i",
		},
	},
	["Guard Label"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_2_GUARD",
			},
			id = "Guard Label",
			x = 13,
			y = 3,
		},
	},
	["Guard or Backup Frequency"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1_GUARD",
			},
			id = "Guard or Backup Frequency",
			x = 11,
			y = 5,
		},
	},
	["Guard or Backup Status"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1_GUARD",
			},
			id = "Guard or Backup Status",
			x = 10,
			y = 3,
		},
	},
	["Hack Time"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Hack Time",
			x = 16,
			y = 4,
		},
	},
	["HACK_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "HACK_IncDecSymbol",
			x = 23,
			y = 3,
		},
	},
	["HACK_label"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "HACK_label",
			x = 7,
			y = 3,
		},
	},
	["HACK_value"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "HACK_value",
			x = 14,
			y = 3,
		},
	},
	["HACK_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "HACK_value_inv",
			x = 14,
			y = 3,
			color = "i",
		},
	},
	["HARM"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "HARM",
			x = 2,
			y = 1,
		},
	},
	["HMCS_ALIGN_label"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "HMCS_ALIGN_label",
			x = 7,
			y = 1,
		},
	},
	["HMCS_AZ_EL"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "HMCS_AZ_EL",
			x = 3,
			y = 3,
		},
	},
	["HMCS_AZ_EL_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "HMCS_AZ_EL_inv",
			x = 3,
			y = 3,
			color = "i",
		},
	},
	["HMCS_CKPT_BLANK"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_CKPT_BLANK",
			x = 3,
			y = 3,
		},
	},
	["HMCS_CKPT_BLANK_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_CKPT_BLANK_inv",
			x = 3,
			y = 3,
			color = "i",
		},
	},
	["HMCS_COARSE"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "HMCS_COARSE",
			x = 3,
			y = 2,
		},
	},
	["HMCS_COARSE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "HMCS_COARSE_inv",
			x = 3,
			y = 2,
			color = "i",
		},
	},
	["HMCS_DECLUTTER"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_DECLUTTER",
			x = 3,
			y = 4,
		},
	},
	["HMCS_DECLUTTER_STATUS"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_DECLUTTER_STATUS",
			x = 17,
			y = 4,
		},
	},
	["HMCS_DISPLAY_label"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_DISPLAY_label",
			x = 7,
			y = 1,
		},
	},
	["HMCS_HUD_BLANK"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_HUD_BLANK",
			x = 3,
			y = 2,
		},
	},
	["HMCS_HUD_BLANK_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_HUD_BLANK_inv",
			x = 3,
			y = 2,
			color = "i",
		},
	},
	["HMCS_ROLL"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "HMCS_ROLL",
			x = 3,
			y = 4,
		},
	},
	["HMCS_ROLL_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_ALIGN",
			},
			id = "HMCS_ROLL_inv",
			x = 3,
			y = 4,
			color = "i",
		},
	},
	["HMCS_RWR_DISPLAY"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_RWR_DISPLAY",
			x = 3,
			y = 5,
		},
	},
	["HMCS_RWR_DISPLAY_STATUS"] = {
		{
			alignment = "LFT",
			pages = {
				"HMCS_DISPLAY",
			},
			id = "HMCS_RWR_DISPLAY_STATUS",
			x = 13,
			y = 5,
		},
	},
	["HOME_FUEL_REMANING"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_FUEL_REMANING",
			x = 8,
			y = 3,
		},
	},
	["HOME_FUEL_REMANING_Value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_FUEL_REMANING_Value",
			x = 13,
			y = 3,
		},
	},
	["HOME_INS_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_INS_SelectedSteerpoint",
			x = 13,
			y = 2,
		},
	},
	["HOME_INS_SelectedSteerpoint_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_INS_SelectedSteerpoint_inv",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["HOME_INS_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_INS_STPT_IncDecSymbol",
			x = 17,
			y = 2,
		},
	},
	["HOME_MODE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_MODE",
			x = 14,
			y = 1,
		},
	},
	["HOME_MODE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_MODE_inv",
			x = 14,
			y = 1,
			color = "i",
		},
	},
	["HOME_OPT_ALT_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_OPT_ALT_label",
			x = 5,
			y = 4,
		},
	},
	["HOME_OPT_ALT_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_OPT_ALT_value",
			x = 14,
			y = 4,
		},
	},
	["HOME_STPT_NUM"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_STPT_NUM",
			x = 8,
			y = 2,
		},
	},
	["HOME_WIND_AT_ALTITUDE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_WIND_AT_ALTITUDE",
			x = 8,
			y = 5,
		},
	},
	["HOME_WIND_AT_ALTITUDE_Value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_HOME",
			},
			id = "HOME_WIND_AT_ALTITUDE_Value",
			x = 14,
			y = 5,
		},
	},
	["HTS"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "HTS",
			x = 9,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS",
			x = 5,
			y = 1,
		},
	},
	["HTS_ELEV"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_ELEV",
			x = 8,
			y = 4,
		},
	},
	["HTS_ELEV_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_ELEV_lbl",
			x = 3,
			y = 4,
		},
	},
	["HTS_LAT"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_LAT",
			x = 8,
			y = 2,
		},
	},
	["HTS_LAT_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_LAT_lbl",
			x = 3,
			y = 2,
		},
	},
	["HTS_LNG"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_LNG",
			x = 8,
			y = 3,
		},
	},
	["HTS_LNG_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_LNG_lbl",
			x = 3,
			y = 3,
		},
	},
	["HTS_TOT"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_TOT",
			x = 8,
			y = 5,
		},
	},
	["HTS_TOT_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_SEAD",
			},
			id = "HTS_TOT_lbl",
			x = 3,
			y = 5,
		},
	},
	["IFF label"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_BACKUP",
			},
			id = "IFF label",
			x = 9,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "IFF label",
			x = 2,
			y = 1,
		},
	},
	["IFF Modes Enabled"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "IFF Modes Enabled",
			x = 3,
			y = 5,
		},
	},
	["IFF Modes Label"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "IFF Modes Label",
			x = 2,
			y = 5,
		},
	},
	["IFF Power Status"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "IFF Power Status",
			x = 6,
			y = 1,
		},
	},
	["IFF Status"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_BACKUP",
			},
			id = "IFF Status",
			x = 13,
			y = 1,
		},
	},
	["IFF Switching"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "IFF Switching",
			x = 15,
			y = 5,
		},
	},
	["ILS CMD STRG"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS CMD STRG",
			x = 16,
			y = 3,
		},
	},
	["ILS CMD STRG_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS CMD STRG_inv",
			x = 16,
			y = 3,
			color = "i",
		},
	},
	["ILS CRS Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS CRS Asterisks_lhs",
			x = 17,
			y = 5,
			color = "i",
		},
	},
	["ILS CRS Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS CRS Asterisks_rhs",
			x = 22,
			y = 5,
			color = "i",
		},
	},
	["ILS CRS Label"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS CRS Label",
			x = 13,
			y = 5,
		},
	},
	["ILS CRS Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS CRS Scratchpad",
			x = 18,
			y = 5,
		},
	},
	["ILS CRS Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS CRS Scratchpad_inv",
			x = 18,
			y = 5,
			color = "i",
		},
	},
	["ILS FRQ Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS FRQ Asterisks_lhs",
			x = 17,
			y = 4,
			color = "i",
		},
	},
	["ILS FRQ Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS FRQ Asterisks_rhs",
			x = 24,
			y = 4,
			color = "i",
		},
	},
	["ILS FRQ Label"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS FRQ Label",
			x = 13,
			y = 4,
		},
	},
	["ILS FRQ Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS FRQ Scratchpad",
			x = 18,
			y = 4,
		},
	},
	["ILS FRQ Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS FRQ Scratchpad_inv",
			x = 18,
			y = 4,
			color = "i",
		},
	},
	["ILS Label"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS Label",
			x = 14,
			y = 1,
		},
	},
	["ILS Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "ILS Mode",
			x = 19,
			y = 1,
		},
	},
	["IncDec Symbol"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "IncDec Symbol",
			x = 24,
			y = 1,
		},
	},
	["INS_AlignSlash"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_AlignSlash",
			x = 12,
			y = 1,
		},
	},
	["INS_AlignStatusCode"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_AlignStatusCode",
			x = 13,
			y = 1,
		},
	},
	["INS_AlignTime"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_AlignTime",
			x = 8,
			y = 1,
		},
	},
	["INS_COMPASS_HDG_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS_INFLT_ALGN",
			},
			id = "INS_COMPASS_HDG_lbl",
			x = 4,
			y = 3,
		},
	},
	["INS_CompassHdgScratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"INS_INFLT_ALGN",
			},
			id = "INS_CompassHdgScratchpad",
			x = 17,
			y = 3,
		},
	},
	["INS_CompassHdgScratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INS_INFLT_ALGN",
			},
			id = "INS_CompassHdgScratchpad_inv",
			x = 17,
			y = 3,
			color = "i",
		},
	},
	["INS_FIX_NECESSARY_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS_INFLT_ALGN",
			},
			id = "INS_FIX_NECESSARY_lbl",
			x = 4,
			y = 4,
		},
	},
	["INS_GS_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_GS_lbl",
			x = 17,
			y = 5,
		},
	},
	["INS_GS_value"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_GS_value",
			x = 21,
			y = 5,
		},
	},
	["INS_INFLT_ALGN_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS_INFLT_ALGN",
			},
			id = "INS_INFLT_ALGN_lbl",
			x = 9,
			y = 1,
		},
	},
	["INS_LAT_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_LAT_lbl",
			x = 3,
			y = 2,
		},
	},
	["INS_LAT_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_LAT_Scratchpad",
			x = 8,
			y = 2,
		},
	},
	["INS_LAT_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_LAT_Scratchpad_inv",
			x = 8,
			y = 2,
			color = "i",
		},
	},
	["INS_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_lbl",
			x = 3,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"INS_INFLT_ALGN",
			},
			id = "INS_lbl",
			x = 5,
			y = 1,
		},
	},
	["INS_LNG_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_LNG_lbl",
			x = 3,
			y = 3,
		},
	},
	["INS_LNG_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_LNG_Scratchpad",
			x = 8,
			y = 3,
		},
	},
	["INS_LNG_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_LNG_Scratchpad_inv",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["INS_MAGV_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "INS_MAGV_Scratchpad",
			x = 10,
			y = 3,
		},
	},
	["INS_MAGV_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "INS_MAGV_Scratchpad_inv",
			x = 10,
			y = 3,
			color = "i",
		},
	},
	["INS_Ready"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_Ready",
			x = 16,
			y = 1,
		},
	},
	["INS_SALT_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_SALT_lbl",
			x = 2,
			y = 4,
		},
	},
	["INS_SALT_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_SALT_Scratchpad",
			x = 9,
			y = 4,
		},
	},
	["INS_SALT_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_SALT_Scratchpad_inv",
			x = 9,
			y = 4,
			color = "i",
		},
	},
	["INS_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "INS_SelectedSteerpoint",
			x = 11,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
				"A_CAL_MAN",
				"CRUS_TOS",
				"HMCS_ALIGN",
				"HMCS_DISPLAY",
				"HTS_MAN",
				"INS",
				"INS_COMMON",
				"INS_INFLT_ALGN",
				"MAGV",
				"NAV_COMMANDS",
				"NAV_COMMON",
				"NAV_STATUS",
			},
			id = "INS_SelectedSteerpoint",
			x = 21,
			y = 1,
		},
	},
	["INS_SelectedSteerpoint_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "INS_SelectedSteerpoint_inv",
			x = 11,
			y = 2,
			color = "i",
		},
	},
	["INS_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "INS_STPT_IncDecSymbol",
			x = 15,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
				"A_CAL_MAN",
				"CRUS_TOS",
				"HMCS_ALIGN",
				"HMCS_DISPLAY",
				"HTS_MAN",
				"INS",
				"INS_COMMON",
				"INS_INFLT_ALGN",
				"MAGV",
				"NAV_COMMANDS",
				"NAV_COMMON",
				"NAV_STATUS",
			},
			id = "INS_STPT_IncDecSymbol",
			x = 24,
			y = 1,
		},
	},
	["INS_THDG_lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_THDG_lbl",
			x = 2,
			y = 5,
		},
	},
	["INS_THDG_Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_THDG_Scratchpad",
			x = 8,
			y = 5,
		},
	},
	["INS_THDG_Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INS",
			},
			id = "INS_THDG_Scratchpad_inv",
			x = 8,
			y = 5,
			color = "i",
		},
	},
	["INTG Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG Asterisks_lhs",
			x = 10,
			y = 5,
			color = "i",
		},
	},
	["INTG Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG Asterisks_rhs",
			x = 16,
			y = 5,
			color = "i",
		},
	},
	["INTG COUPLE Key"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG COUPLE Key",
			x = 21,
			y = 5,
		},
	},
	["INTG COUPLE Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG COUPLE Mode",
			x = 17,
			y = 5,
		},
	},
	["INTG IJAM Key"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG IJAM Key",
			x = 21,
			y = 4,
		},
	},
	["INTG IJAM Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG IJAM Mode",
			x = 16,
			y = 4,
		},
	},
	["INTG IJAM Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG IJAM Mode_inv",
			x = 16,
			y = 4,
			color = "i",
		},
	},
	["INTG INTG label"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG INTG label",
			x = 14,
			y = 1,
		},
	},
	["INTG INTG Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG INTG Mode",
			x = 9,
			y = 1,
		},
	},
	["INTG M1 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M1 Code",
			x = 5,
			y = 3,
		},
	},
	["INTG M1 Decoupled Status"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M1 Decoupled Status",
			x = 4,
			y = 3,
		},
	},
	["INTG M1 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M1 Mode",
			x = 1,
			y = 3,
		},
	},
	["INTG M1 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M1 Mode_inv",
			x = 1,
			y = 3,
			color = "i",
		},
	},
	["INTG M2 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M2 Code",
			x = 5,
			y = 4,
		},
	},
	["INTG M2 Decoupled Status"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M2 Decoupled Status",
			x = 4,
			y = 4,
		},
	},
	["INTG M2 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M2 Mode",
			x = 1,
			y = 4,
		},
	},
	["INTG M2 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M2 Mode_inv",
			x = 1,
			y = 4,
			color = "i",
		},
	},
	["INTG M3 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M3 Code",
			x = 5,
			y = 5,
		},
	},
	["INTG M3 Decoupled Status"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M3 Decoupled Status",
			x = 4,
			y = 5,
		},
	},
	["INTG M3 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M3 Mode",
			x = 1,
			y = 5,
		},
	},
	["INTG M3 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M3 Mode_inv",
			x = 1,
			y = 5,
			color = "i",
		},
	},
	["INTG M4 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M4 Code",
			x = 21,
			y = 3,
		},
	},
	["INTG M4 Decoupled Status"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M4 Decoupled Status",
			x = 20,
			y = 3,
		},
	},
	["INTG M4 Key"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M4 Key",
			x = 22,
			y = 3,
		},
	},
	["INTG M4 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M4 Mode",
			x = 17,
			y = 3,
		},
	},
	["INTG M4 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG M4 Mode_inv",
			x = 17,
			y = 3,
			color = "i",
		},
	},
	["INTG Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG Scratchpad",
			x = 11,
			y = 5,
		},
	},
	["INTG Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG Scratchpad_inv",
			x = 11,
			y = 5,
			color = "i",
		},
	},
	["INTG TIM Event"] = {
		{
			alignment = "LFT",
			pages = {
				"INTG",
			},
			id = "INTG TIM Event",
			x = 21,
			y = 1,
		},
	},
	["INTRAFLIGHT lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "INTRAFLIGHT lbl",
			x = 8,
			y = 1,
		},
	},
	["IPF Reset lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "IPF Reset lbl",
			x = 15,
			y = 2,
		},
	},
	["Keys Msg"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "Keys Msg",
			x = 4,
			y = 5,
		},
	},
	["Laser ST Time Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "Laser ST Time Asteriscs_lhs",
			x = 16,
			y = 5,
			color = "i",
		},
	},
	["Laser ST Time Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "Laser ST Time Asteriscs_rhs",
			x = 20,
			y = 5,
			color = "i",
		},
	},
	["Laser ST Time LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "Laser ST Time LABEL",
			x = 2,
			y = 5,
		},
	},
	["Laser ST Time VALUE"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "Laser ST Time VALUE",
			x = 17,
			y = 5,
		},
	},
	["Laser ST Time VALUE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "Laser ST Time VALUE_inv",
			x = 17,
			y = 5,
			color = "i",
		},
	},
	["LASR LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "LASR LABEL",
			x = 12,
			y = 1,
		},
	},
	["LAST lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "LAST lbl",
			x = 14,
			y = 5,
		},
	},
	["LAST value"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "LAST value",
			x = 19,
			y = 5,
		},
	},
	["LAT"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "LAT",
			x = 9,
			y = 2,
		},
	},
	["LAT_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "LAT_inv",
			x = 9,
			y = 2,
			color = "i",
		},
	},
	["LINK16 lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "LINK16 lbl",
			x = 10,
			y = 1,
		},
	},
	["LINK16 STN lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "LINK16 STN lbl",
			x = 8,
			y = 1,
		},
	},
	["List Item 0 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 0 Name",
			x = 20,
			y = 4,
		},
	},
	["List Item 0 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 0 Number",
			x = 19,
			y = 4,
			color = "i",
		},
	},
	["List Item 1 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 1 Name",
			x = 2,
			y = 2,
		},
	},
	["List Item 1 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 1 Number",
			x = 1,
			y = 2,
			color = "i",
		},
	},
	["List Item 2 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 2 Name",
			x = 8,
			y = 2,
		},
	},
	["List Item 2 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 2 Number",
			x = 7,
			y = 2,
			color = "i",
		},
	},
	["List Item 3 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 3 Name",
			x = 14,
			y = 2,
		},
	},
	["List Item 3 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 3 Number",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["List Item 4 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 4 Name",
			x = 2,
			y = 3,
		},
	},
	["List Item 4 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 4 Number",
			x = 1,
			y = 3,
			color = "i",
		},
	},
	["List Item 5 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 5 Name",
			x = 8,
			y = 3,
		},
	},
	["List Item 5 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 5 Number",
			x = 7,
			y = 3,
			color = "i",
		},
	},
	["List Item 6 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 6 Name",
			x = 14,
			y = 3,
		},
	},
	["List Item 6 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 6 Number",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["List Item 7 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 7 Name",
			x = 2,
			y = 4,
		},
	},
	["List Item 7 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 7 Number",
			x = 1,
			y = 4,
			color = "i",
		},
	},
	["List Item 8 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 8 Name",
			x = 8,
			y = 4,
		},
	},
	["List Item 8 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 8 Number",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["List Item 9 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 9 Name",
			x = 14,
			y = 4,
		},
	},
	["List Item 9 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item 9 Number",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["List Item E Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item E Name",
			x = 20,
			y = 3,
		},
	},
	["List Item E Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item E Number",
			x = 19,
			y = 3,
			color = "i",
		},
	},
	["List Item R Name"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item R Name",
			x = 20,
			y = 2,
		},
	},
	["List Item R Number"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "List Item R Number",
			x = 19,
			y = 2,
			color = "i",
		},
	},
	["LIST Label"] = {
		{
			alignment = "LFT",
			pages = {
				"LIST",
			},
			id = "LIST Label",
			x = 11,
			y = 1,
		},
	},
	["LON"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "LON",
			x = 9,
			y = 3,
		},
	},
	["LON_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "LON_inv",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["LST CODE Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "LST CODE Asteriscs_lhs",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["LST CODE Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "LST CODE Asteriscs_rhs",
			x = 18,
			y = 3,
			color = "i",
		},
	},
	["LST CODE LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "LST CODE LABEL",
			x = 2,
			y = 3,
		},
	},
	["LST CODE VALUE"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "LST CODE VALUE",
			x = 14,
			y = 3,
		},
	},
	["LST CODE VALUE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "LST CODE VALUE_inv",
			x = 14,
			y = 3,
			color = "i",
		},
	},
	["M1 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "M1 Code",
			x = 5,
			y = 3,
		},
	},
	["M1 Lockout Status"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M1 Lockout Status",
			x = 4,
			y = 3,
		},
	},
	["M1 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M1 Mode",
			x = 2,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M1 Mode",
			x = 1,
			y = 3,
		},
	},
	["M1 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M1 Mode_inv",
			x = 2,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M1 Mode_inv",
			x = 1,
			y = 3,
			color = "i",
		},
	},
	["M2 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
			},
			id = "M2 Code",
			x = 5,
			y = 4,
		},
	},
	["M2 Lockout Status"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M2 Lockout Status",
			x = 4,
			y = 4,
		},
	},
	["M2 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M2 Mode",
			x = 2,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M2 Mode",
			x = 1,
			y = 4,
		},
	},
	["M2 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M2 Mode_inv",
			x = 2,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M2 Mode_inv",
			x = 1,
			y = 4,
			color = "i",
		},
	},
	["M3 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "M3 Code",
			x = 5,
			y = 5,
		},
	},
	["M3 Lockout Status"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M3 Lockout Status",
			x = 4,
			y = 5,
		},
	},
	["M3 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M3 Mode",
			x = 2,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M3 Mode",
			x = 1,
			y = 5,
		},
	},
	["M3 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M3 Mode_inv",
			x = 2,
			y = 5,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M3 Mode_inv",
			x = 1,
			y = 5,
			color = "i",
		},
	},
	["M4 Code"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M4 Code",
			x = 13,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_TIM",
			},
			id = "M4 Code",
			x = 14,
			y = 3,
		},
	},
	["M4 Key"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "M4 Key",
			x = 15,
			y = 3,
		},
	},
	["M4 Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M4 Mode",
			x = 10,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M4 Mode",
			x = 9,
			y = 3,
		},
	},
	["M4 Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "M4 Mode_inv",
			x = 10,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M4 Mode_inv",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["M4 Monitoring"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M4 Monitoring",
			x = 10,
			y = 5,
		},
	},
	["M4 Monitoring Key"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "M4 Monitoring Key",
			x = 15,
			y = 5,
		},
	},
	["MAGV lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "MAGV lbl",
			x = 8,
			y = 1,
		},
	},
	["MAGV Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"MAGV",
			},
			id = "MAGV Mode",
			x = 14,
			y = 1,
		},
	},
	["MAN IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "MAN IncDecSymbol",
			x = 24,
			y = 1,
		},
	},
	["MAN Label"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "MAN Label",
			x = 11,
			y = 1,
		},
	},
	["MAN STPT Num"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "MAN STPT Num",
			x = 21,
			y = 1,
		},
	},
	["MARK"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK",
			x = 2,
			y = 1,
		},
	},
	["MARK EAST Value"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK EAST Value",
			x = 13,
			y = 5,
		},
	},
	["MARK EAST Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK EAST Value_inv",
			x = 13,
			y = 5,
			color = "i",
		},
	},
	["MARK Elevation"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Elevation",
			x = 2,
			y = 4,
		},
	},
	["MARK Elevation Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Elevation Asteriscs_lhs",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["MARK Elevation Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Elevation Asteriscs_rhs",
			x = 15,
			y = 4,
			color = "i",
		},
	},
	["MARK Elevation Value"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Elevation Value",
			x = 7,
			y = 4,
		},
	},
	["MARK Elevation Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Elevation Value_inv",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["MARK GRID DIGIT Value"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK GRID DIGIT Value",
			x = 7,
			y = 5,
		},
	},
	["MARK GRID DIGIT Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK GRID DIGIT Value_inv",
			x = 7,
			y = 5,
			color = "i",
		},
	},
	["MARK GRID SYMBOL Value"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK GRID SYMBOL Value",
			x = 9,
			y = 5,
		},
	},
	["MARK GRID SYMBOL Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK GRID SYMBOL Value_inv",
			x = 9,
			y = 5,
			color = "i",
		},
	},
	["MARK IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK IncDecSymbol",
			x = 18,
			y = 1,
		},
	},
	["MARK Latitude"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Latitude",
			x = 3,
			y = 2,
		},
	},
	["MARK Latitude Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Latitude Asteriscs_lhs",
			x = 6,
			y = 2,
			color = "i",
		},
	},
	["MARK Latitude Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Latitude Asteriscs_rhs",
			x = 19,
			y = 2,
			color = "i",
		},
	},
	["MARK Latitude Value"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Latitude Value",
			x = 7,
			y = 2,
		},
	},
	["MARK Latitude Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Latitude Value_inv",
			x = 7,
			y = 2,
			color = "i",
		},
	},
	["MARK Longitude"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Longitude",
			x = 3,
			y = 3,
		},
	},
	["MARK Longitude Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Longitude Asteriscs_lhs",
			x = 6,
			y = 3,
			color = "i",
		},
	},
	["MARK Longitude Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Longitude Asteriscs_rhs",
			x = 19,
			y = 3,
			color = "i",
		},
	},
	["MARK Longitude Value"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Longitude Value",
			x = 7,
			y = 3,
		},
	},
	["MARK Longitude Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Longitude Value_inv",
			x = 7,
			y = 3,
			color = "i",
		},
	},
	["MARK MGRS"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK MGRS",
			x = 2,
			y = 5,
		},
	},
	["MARK MGRS Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK MGRS Asteriscs_lhs",
			x = 6,
			y = 5,
			color = "i",
		},
	},
	["MARK MGRS Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK MGRS Asteriscs_rhs",
			x = 24,
			y = 5,
			color = "i",
		},
	},
	["MARK NORTH Value"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK NORTH Value",
			x = 19,
			y = 5,
		},
	},
	["MARK NORTH Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK NORTH Value_inv",
			x = 19,
			y = 5,
			color = "i",
		},
	},
	["MARK Number Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Number Asteriscs_lhs",
			x = 14,
			y = 1,
			color = "i",
		},
	},
	["MARK Number Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Number Asteriscs_rhs",
			x = 19,
			y = 1,
			color = "i",
		},
	},
	["MARK Slash"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK Slash",
			x = 18,
			y = 5,
		},
	},
	["MARK SOURCE"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK SOURCE",
			x = 8,
			y = 1,
		},
	},
	["MARK SOURCE Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK SOURCE Asteriscs_lhs",
			x = 7,
			y = 1,
			color = "i",
		},
	},
	["MARK SOURCE Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK SOURCE Asteriscs_rhs",
			x = 12,
			y = 1,
			color = "i",
		},
	},
	["MARK SQUARE Value1"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK SQUARE Value1",
			x = 10,
			y = 5,
		},
	},
	["MARK SQUARE Value1_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK SQUARE Value1_inv",
			x = 10,
			y = 5,
			color = "i",
		},
	},
	["MARK SQUARE Value2"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK SQUARE Value2",
			x = 11,
			y = 5,
		},
	},
	["MARK SQUARE Value2_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "MARK SQUARE Value2_inv",
			x = 11,
			y = 5,
			color = "i",
		},
	},
	["Master_mode"] = {
		{
			alignment = "LFT",
			pages = {
				"MODE",
			},
			id = "Master_mode",
			x = 11,
			y = 1,
		},
	},
	["Master_mode_ast_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MODE",
			},
			id = "Master_mode_ast_lhs",
			x = 10,
			y = 1,
			color = "i",
		},
	},
	["Master_mode_ast_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MODE",
			},
			id = "Master_mode_ast_rhs",
			x = 14,
			y = 1,
			color = "i",
		},
	},
	["Master_mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MODE",
			},
			id = "Master_mode_inv",
			x = 11,
			y = 1,
			color = "i",
		},
	},
	["Master_mode_label"] = {
		{
			alignment = "LFT",
			pages = {
				"MODE",
			},
			id = "Master_mode_label",
			x = 5,
			y = 1,
		},
	},
	["MBAL Label"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "MBAL Label",
			x = 11,
			y = 3,
		},
	},
	["MC Code"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "MC Code",
			x = 13,
			y = 4,
		},
	},
	["MC Key"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
			},
			id = "MC Key",
			x = 15,
			y = 4,
		},
	},
	["MC lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "MC lbl",
			x = 4,
			y = 3,
		},
	},
	["MC Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "MC Mode",
			x = 10,
			y = 4,
		},
	},
	["MC Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "MC Mode_inv",
			x = 10,
			y = 4,
			color = "i",
		},
	},
	["MC value"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "MC value",
			x = 7,
			y = 3,
		},
	},
	["MC value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "MC value_inv",
			x = 7,
			y = 3,
			color = "i",
		},
	},
	["Misc Item 0 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 0 Name",
			x = 20,
			y = 4,
		},
	},
	["Misc Item 0 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 0 Number",
			x = 19,
			y = 4,
			color = "i",
		},
	},
	["Misc Item 1 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 1 Name",
			x = 2,
			y = 2,
		},
	},
	["Misc Item 1 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 1 Number",
			x = 1,
			y = 2,
			color = "i",
		},
	},
	["Misc Item 2 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 2 Name",
			x = 8,
			y = 2,
		},
	},
	["Misc Item 2 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 2 Number",
			x = 7,
			y = 2,
			color = "i",
		},
	},
	["Misc Item 3 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 3 Name",
			x = 14,
			y = 2,
		},
	},
	["Misc Item 3 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 3 Number",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["Misc Item 4 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 4 Name",
			x = 2,
			y = 3,
		},
	},
	["Misc Item 4 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 4 Number",
			x = 1,
			y = 3,
			color = "i",
		},
	},
	["Misc Item 5 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 5 Name",
			x = 8,
			y = 3,
		},
	},
	["Misc Item 5 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 5 Number",
			x = 7,
			y = 3,
			color = "i",
		},
	},
	["Misc Item 6 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 6 Name",
			x = 14,
			y = 3,
		},
	},
	["Misc Item 6 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 6 Number",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["Misc Item 7 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 7 Name",
			x = 2,
			y = 4,
		},
	},
	["Misc Item 7 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 7 Number",
			x = 1,
			y = 4,
			color = "i",
		},
	},
	["Misc Item 8 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 8 Name",
			x = 8,
			y = 4,
		},
	},
	["Misc Item 8 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 8 Number",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["Misc Item 9 Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 9 Name",
			x = 14,
			y = 4,
		},
	},
	["Misc Item 9 Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item 9 Number",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["Misc Item E Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item E Name",
			x = 20,
			y = 3,
		},
	},
	["Misc Item E Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item E Number",
			x = 19,
			y = 3,
			color = "i",
		},
	},
	["Misc Item R Name"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item R Name",
			x = 20,
			y = 2,
		},
	},
	["Misc Item R Number"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "Misc Item R Number",
			x = 19,
			y = 2,
			color = "i",
		},
	},
	["MISC Label"] = {
		{
			alignment = "LFT",
			pages = {
				"MISC",
			},
			id = "MISC Label",
			x = 11,
			y = 1,
		},
	},
	["Mode Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "Mode Asterisks_lhs",
			x = 19,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "Mode Asterisks_lhs",
			x = 18,
			y = 2,
			color = "i",
		},
	},
	["Mode Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "Mode Asterisks_rhs",
			x = 24,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "Mode Asterisks_rhs",
			x = 24,
			y = 2,
			color = "i",
		},
	},
	["Mode Group State"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
			},
			id = "Mode Group State",
			x = 23,
			y = 1,
		},
	},
	["Mode label"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "Mode label",
			x = 13,
			y = 1,
		},
	},
	["Mode Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "Mode Scratchpad",
			x = 20,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "Mode Scratchpad",
			x = 19,
			y = 2,
		},
	},
	["Mode Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_TIM",
			},
			id = "Mode Scratchpad_inv",
			x = 20,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "Mode Scratchpad_inv",
			x = 19,
			y = 2,
			color = "i",
		},
	},
	["MS Code"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
			},
			id = "MS Code",
			x = 21,
			y = 5,
		},
	},
	["MS Key"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
			},
			id = "MS Key",
			x = 22,
			y = 5,
		},
	},
	["MS Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "MS Mode",
			x = 19,
			y = 5,
		},
	},
	["MS Mode_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
				"IFF_MAIN_STAT",
				"IFF_MAIN_TIM",
			},
			id = "MS Mode_inv",
			x = 19,
			y = 5,
			color = "i",
		},
	},
	["MSL FLOOR Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "MSL FLOOR Asterisks_lhs",
			x = 15,
			y = 4,
			color = "i",
		},
	},
	["MSL FLOOR Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "MSL FLOOR Asterisks_rhs",
			x = 23,
			y = 4,
			color = "i",
		},
	},
	["MSL FLOOR label"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "MSL FLOOR label",
			x = 4,
			y = 4,
		},
	},
	["MSL FLOOR Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "MSL FLOOR Scratchpad",
			x = 16,
			y = 4,
		},
	},
	["MSL FLOOR Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
			},
			id = "MSL FLOOR Scratchpad_inv",
			x = 16,
			y = 4,
			color = "i",
		},
	},
	["MSN DUR label"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "MSN DUR label",
			x = 4,
			y = 4,
		},
	},
	["NAV Status lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "NAV Status lbl",
			x = 7,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "NAV Status lbl",
			x = 8,
			y = 1,
		},
	},
	["NAV_FILTER_label"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "NAV_FILTER_label",
			x = 3,
			y = 2,
		},
	},
	["NAV_FILTER_mode"] = {
		{
			alignment = "LFT",
			pages = {
				"A_CAL_AUTO",
			},
			id = "NAV_FILTER_mode",
			x = 15,
			y = 2,
		},
	},
	["NET STATUS lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "NET STATUS lbl",
			x = 6,
			y = 1,
		},
	},
	["NTR lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "NTR lbl",
			x = 6,
			y = 4,
		},
	},
	["NTR status"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "NTR status",
			x = 10,
			y = 4,
		},
	},
	["NUM lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "NUM lbl",
			x = 21,
			y = 3,
		},
	},
	["OWN lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "OWN lbl",
			x = 4,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "OWN lbl",
			x = 15,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "OWN lbl",
			x = 21,
			y = 2,
		},
	},
	["Own num value"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Own num value",
			x = 23,
			y = 3,
		},
	},
	["Own num value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "Own num value_inv",
			x = 23,
			y = 3,
			color = "i",
		},
	},
	["OWN value"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "OWN value",
			x = 8,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "OWN value",
			x = 19,
			y = 4,
		},
	},
	["P1 lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
				"NET_STATUS",
			},
			id = "P1 lbl",
			x = 22,
			y = 5,
		},
	},
	["P2 lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "P2 lbl",
			x = 22,
			y = 5,
		},
	},
	["P2lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "P2lbl",
			x = 22,
			y = 5,
		},
	},
	["P3 lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "P3 lbl",
			x = 22,
			y = 5,
		},
	},
	["P3lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
			},
			id = "P3lbl",
			x = 22,
			y = 5,
		},
	},
	["P4lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA2",
			},
			id = "P4lbl",
			x = 22,
			y = 5,
		},
	},
	["P5 lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "P5 lbl",
			x = 22,
			y = 5,
		},
	},
	["P6 lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "P6 lbl",
			x = 22,
			y = 5,
		},
	},
	["POS EVENT - Number"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
			},
			id = "POS EVENT - Number",
			x = 23,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "POS EVENT - Number",
			x = 23,
			y = 3,
		},
	},
	["POS EVENT - OF"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
			},
			id = "POS EVENT - OF",
			x = 21,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "POS EVENT - OF",
			x = 21,
			y = 3,
		},
	},
	["POS EVENT - Side"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_POS",
			},
			id = "POS EVENT - Side",
			x = 20,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "POS EVENT - Side",
			x = 20,
			y = 3,
		},
	},
	["Preset Channel Number"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1_GUARD",
			},
			id = "Preset Channel Number",
			x = 8,
			y = 5,
		},
	},
	["Preset Frequency"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Preset Frequency",
			x = 6,
			y = 5,
		},
	},
	["Preset Frequency_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Preset Frequency_inv",
			x = 6,
			y = 5,
			color = "i",
		},
	},
	["Preset Label"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Preset Label",
			x = 3,
			y = 4,
		},
	},
	["Preset Number"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Preset Number",
			x = 8,
			y = 4,
		},
	},
	["Preset Number_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Preset Number_inv",
			x = 8,
			y = 4,
			color = "i",
		},
	},
	["PRTL lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "PRTL lbl",
			x = 13,
			y = 4,
		},
	},
	["PRTL status"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "PRTL status",
			x = 18,
			y = 4,
		},
	},
	["Range"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
				"VRP",
			},
			id = "Range",
			x = 6,
			y = 4,
		},
	},
	["Range Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Range Asteriscs_lhs",
			x = 12,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Range Asteriscs_lhs",
			x = 10,
			y = 4,
			color = "i",
		},
	},
	["Range Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Range Asteriscs_rhs",
			x = 17,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Range Asteriscs_rhs",
			x = 19,
			y = 4,
			color = "i",
		},
	},
	["Range NM"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Range NM",
			x = 18,
			y = 4,
		},
	},
	["Range value"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Range value",
			x = 13,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Range value",
			x = 11,
			y = 4,
		},
	},
	["Range value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Range value_inv",
			x = 13,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Range value_inv",
			x = 11,
			y = 4,
			color = "i",
		},
	},
	["Receiver Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
			},
			id = "Receiver Mode",
			x = 14,
			y = 1,
		},
	},
	["Receiver Power Status"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_2",
			},
			id = "Receiver Power Status",
			x = 14,
			y = 1,
		},
	},
	["RESET GPS label"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "RESET GPS label",
			x = 7,
			y = 4,
		},
	},
	["RESET GPS label_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "RESET GPS label_inv",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["RNG"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "RNG",
			x = 9,
			y = 3,
		},
	},
	["RNG Data"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "RNG Data",
			x = 12,
			y = 4,
		},
	},
	["RNG FT"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "RNG FT",
			x = 19,
			y = 4,
		},
	},
	["RNG Label"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "RNG Label",
			x = 9,
			y = 4,
		},
	},
	["RNG_FUEL_REMANING"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_FUEL_REMANING",
			x = 8,
			y = 3,
		},
	},
	["RNG_FUEL_REMANING_Value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_FUEL_REMANING_Value",
			x = 13,
			y = 3,
		},
	},
	["RNG_INS_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_INS_SelectedSteerpoint",
			x = 13,
			y = 2,
		},
	},
	["RNG_INS_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_INS_STPT_IncDecSymbol",
			x = 17,
			y = 2,
		},
	},
	["RNG_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_OA1",
				"DEST_OA2",
			},
			id = "RNG_inv",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["RNG_MODE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_MODE",
			x = 14,
			y = 1,
		},
	},
	["RNG_MODE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_MODE_inv",
			x = 14,
			y = 1,
			color = "i",
		},
	},
	["RNG_STPT_NUM"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_STPT_NUM",
			x = 8,
			y = 2,
		},
	},
	["RNG_WIND_AT_ALTITUDE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_WIND_AT_ALTITUDE",
			x = 8,
			y = 5,
		},
	},
	["RNG_WIND_AT_ALTITUDE_Value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_RNG",
			},
			id = "RNG_WIND_AT_ALTITUDE_Value",
			x = 14,
			y = 5,
		},
	},
	["SC lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "SC lbl",
			x = 4,
			y = 4,
		},
	},
	["SC value"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "SC value",
			x = 7,
			y = 4,
		},
	},
	["SC value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "SC value_inv",
			x = 7,
			y = 4,
			color = "i",
		},
	},
	["Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Scratchpad",
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "Scratchpad",
			x = 13,
			y = 4,
		},
	},
	["Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Scratchpad_inv",
			x = 15,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "Scratchpad_inv",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["Secure Voice"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
				"COM_2",
			},
			id = "Secure Voice",
			x = 2,
			y = 1,
		},
	},
	["Selected Steerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
				"CMDS_BINGO",
				"CNI",
				"LASER",
				"LINK16",
				"LINK16_STN",
				"LIST",
				"MISC",
				"MODE",
				"NET_STATUS",
			},
			id = "Selected Steerpoint",
			x = 21,
			y = 1,
		},
	},
	["Selected UHF Frequency"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Selected UHF Frequency",
			x = 7,
			y = 1,
		},
	},
	["Selected VHF Frequency"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Selected VHF Frequency",
			x = 7,
			y = 3,
		},
	},
	["SET label"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "SET label",
			x = 7,
			y = 3,
		},
	},
	["SQUARE"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "SQUARE",
			x = 13,
			y = 3,
		},
	},
	["SQUARE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "SQUARE_inv",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["SQUARE2"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "SQUARE2",
			x = 14,
			y = 3,
		},
	},
	["SQUARE2_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "SQUARE2_inv",
			x = 14,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT CNVRT Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT CNVRT Asteriscs_lhs",
			x = 17,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT CNVRT Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT CNVRT Asteriscs_rhs",
			x = 23,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT EAST NORTH"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT EAST NORTH",
			x = 1,
			y = 4,
		},
	},
	["STEERPOINT EAST NORTH Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT EAST NORTH Asteriscs_lhs",
			x = 12,
			y = 4,
			color = "i",
		},
	},
	["STEERPOINT EAST NORTH Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT EAST NORTH Asteriscs_rhs",
			x = 24,
			y = 4,
			color = "i",
		},
	},
	["STEERPOINT EAST NORTH Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT EAST NORTH Value",
			x = 13,
			y = 4,
		},
	},
	["STEERPOINT EAST NORTH Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT EAST NORTH Value_inv",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["STEERPOINT Elevation"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Elevation",
			x = 3,
			y = 4,
		},
	},
	["STEERPOINT Elevation Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Elevation Asteriscs_lhs",
			x = 8,
			y = 4,
			color = "i",
		},
	},
	["STEERPOINT Elevation Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Elevation Asteriscs_rhs",
			x = 17,
			y = 4,
			color = "i",
		},
	},
	["STEERPOINT Elevation Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Elevation Value",
			x = 9,
			y = 4,
		},
	},
	["STEERPOINT Elevation Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Elevation Value_inv",
			x = 9,
			y = 4,
			color = "i",
		},
	},
	["STEERPOINT ElevationMGRS"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT ElevationMGRS",
			x = 7,
			y = 5,
		},
	},
	["STEERPOINT ElevationMGRS Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT ElevationMGRS Asteriscs_lhs",
			x = 12,
			y = 5,
			color = "i",
		},
	},
	["STEERPOINT ElevationMGRS Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT ElevationMGRS Asteriscs_rhs",
			x = 21,
			y = 5,
			color = "i",
		},
	},
	["STEERPOINT ElevationMGRS Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT ElevationMGRS Value",
			x = 12,
			y = 5,
		},
	},
	["STEERPOINT ElevationMGRS Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT ElevationMGRS Value_inv",
			x = 12,
			y = 5,
			color = "i",
		},
	},
	["STEERPOINT GRID"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID",
			x = 7,
			y = 2,
		},
	},
	["STEERPOINT GRID CNVRT"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID CNVRT",
			x = 18,
			y = 2,
		},
	},
	["STEERPOINT GRID CNVRT_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID CNVRT_inv",
			x = 18,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT GRID DIGIT Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID DIGIT Asteriscs_lhs",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT GRID DIGIT Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID DIGIT Asteriscs_rhs",
			x = 16,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT GRID DIGIT Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID DIGIT Value",
			x = 13,
			y = 2,
		},
	},
	["STEERPOINT GRID DIGIT Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID DIGIT Value_inv",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT GRID SYMBOL Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID SYMBOL Asteriscs_lhs",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT GRID SYMBOL Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID SYMBOL Asteriscs_rhs",
			x = 16,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT GRID SYMBOL Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID SYMBOL Value",
			x = 15,
			y = 2,
		},
	},
	["STEERPOINT GRID SYMBOL Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT GRID SYMBOL Value_inv",
			x = 15,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT IncDecSymbol",
			x = 17,
			y = 1,
		},
	},
	["STEERPOINT LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT LABEL",
			x = 7,
			y = 1,
		},
	},
	["STEERPOINT Latitude"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Latitude",
			x = 4,
			y = 2,
		},
	},
	["STEERPOINT Latitude Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Latitude Asteriscs_lhs",
			x = 8,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT Latitude Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Latitude Asteriscs_rhs",
			x = 21,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT Latitude Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Latitude Value",
			x = 9,
			y = 2,
		},
	},
	["STEERPOINT Latitude Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Latitude Value_inv",
			x = 9,
			y = 2,
			color = "i",
		},
	},
	["STEERPOINT Longitude"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Longitude",
			x = 4,
			y = 3,
		},
	},
	["STEERPOINT Longitude Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Longitude Asteriscs_lhs",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT Longitude Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Longitude Asteriscs_rhs",
			x = 21,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT Longitude Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Longitude Value",
			x = 9,
			y = 3,
		},
	},
	["STEERPOINT Longitude Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Longitude Value_inv",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT NUMBER"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT NUMBER",
			x = 13,
			y = 1,
		},
	},
	["STEERPOINT NUMBER Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT NUMBER Asteriscs_lhs",
			x = 12,
			y = 1,
			color = "i",
		},
	},
	["STEERPOINT NUMBER Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT NUMBER Asteriscs_rhs",
			x = 16,
			y = 1,
			color = "i",
		},
	},
	["STEERPOINT NUMBER_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT NUMBER_inv",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["STEERPOINT SEQUENCE"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SEQUENCE",
			x = 19,
			y = 1,
		},
	},
	["STEERPOINT SEQUENCE Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SEQUENCE Asteriscs_lhs",
			x = 18,
			y = 1,
			color = "i",
		},
	},
	["STEERPOINT SEQUENCE Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SEQUENCE Asteriscs_rhs",
			x = 23,
			y = 1,
			color = "i",
		},
	},
	["STEERPOINT SQUARE"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE",
			x = 5,
			y = 3,
		},
	},
	["STEERPOINT SQUARE Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE Asteriscs_lhs",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT SQUARE Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE Asteriscs_rhs",
			x = 15,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT SQUARE Value1"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE Value1",
			x = 13,
			y = 3,
		},
	},
	["STEERPOINT SQUARE Value1_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE Value1_inv",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT SQUARE Value2"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE Value2",
			x = 14,
			y = 3,
		},
	},
	["STEERPOINT SQUARE Value2_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE Value2_inv",
			x = 14,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT SQUARE2 Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE2 Asteriscs_lhs",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT SQUARE2 Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT SQUARE2 Asteriscs_rhs",
			x = 15,
			y = 3,
			color = "i",
		},
	},
	["STEERPOINT Time over current STP"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT Time over current STP",
			x = 4,
			y = 5,
		},
	},
	["STEERPOINT TOS Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT TOS Asteriscs_lhs",
			x = 8,
			y = 5,
			color = "i",
		},
	},
	["STEERPOINT TOS Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT TOS Asteriscs_rhs",
			x = 17,
			y = 5,
			color = "i",
		},
	},
	["STEERPOINT TOS Value"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT TOS Value",
			x = 9,
			y = 5,
		},
	},
	["STEERPOINT TOS Value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT TOS Value_inv",
			x = 9,
			y = 5,
			color = "i",
		},
	},
	["Steerpoint Use"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Steerpoint Use",
			x = 15,
			y = 1,
		},
	},
	["STEERPOINT UTM LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"STPT",
			},
			id = "STEERPOINT UTM LABEL",
			x = 3,
			y = 1,
		},
	},
	["STN id lbl_1"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_1",
			x = 2,
			y = 2,
		},
	},
	["STN id lbl_2"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_2",
			x = 2,
			y = 3,
		},
	},
	["STN id lbl_3"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_3",
			x = 2,
			y = 4,
		},
	},
	["STN id lbl_4"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_4",
			x = 2,
			y = 5,
		},
	},
	["STN id lbl_5"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_5",
			x = 8,
			y = 2,
		},
	},
	["STN id lbl_6"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_6",
			x = 8,
			y = 3,
		},
	},
	["STN id lbl_7"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_7",
			x = 8,
			y = 4,
		},
	},
	["STN id lbl_8"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN id lbl_8",
			x = 8,
			y = 5,
		},
	},
	["STN id lbl1"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl1",
			x = 1,
			y = 2,
		},
	},
	["STN id lbl2"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl2",
			x = 1,
			y = 3,
		},
	},
	["STN id lbl3"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl3",
			x = 1,
			y = 4,
		},
	},
	["STN id lbl4"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl4",
			x = 1,
			y = 5,
		},
	},
	["STN id lbl5"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl5",
			x = 11,
			y = 2,
		},
	},
	["STN id lbl6"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl6",
			x = 11,
			y = 3,
		},
	},
	["STN id lbl7"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl7",
			x = 11,
			y = 4,
		},
	},
	["STN id lbl8"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN id lbl8",
			x = 11,
			y = 5,
		},
	},
	["STN TDOA value_1"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_1",
			x = 4,
			y = 2,
		},
	},
	["STN TDOA value_2"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_2",
			x = 4,
			y = 3,
		},
	},
	["STN TDOA value_3"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_3",
			x = 4,
			y = 4,
		},
	},
	["STN TDOA value_4"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_4",
			x = 4,
			y = 5,
		},
	},
	["STN TDOA value_5"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_5",
			x = 10,
			y = 2,
		},
	},
	["STN TDOA value_6"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_6",
			x = 10,
			y = 3,
		},
	},
	["STN TDOA value_7"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_7",
			x = 10,
			y = 4,
		},
	},
	["STN TDOA value_8"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN TDOA value_8",
			x = 10,
			y = 5,
		},
	},
	["STN value_1"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_1",
			x = 6,
			y = 2,
		},
	},
	["STN value_1_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_1_inv",
			x = 6,
			y = 2,
			color = "i",
		},
	},
	["STN value_2"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_2",
			x = 6,
			y = 3,
		},
	},
	["STN value_2_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_2_inv",
			x = 6,
			y = 3,
			color = "i",
		},
	},
	["STN value_3"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_3",
			x = 6,
			y = 4,
		},
	},
	["STN value_3_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_3_inv",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["STN value_4"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_4",
			x = 6,
			y = 5,
		},
	},
	["STN value_4_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_4_inv",
			x = 6,
			y = 5,
			color = "i",
		},
	},
	["STN value_5"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_5",
			x = 12,
			y = 2,
		},
	},
	["STN value_5_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_5_inv",
			x = 12,
			y = 2,
			color = "i",
		},
	},
	["STN value_6"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_6",
			x = 12,
			y = 3,
		},
	},
	["STN value_6_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_6_inv",
			x = 12,
			y = 3,
			color = "i",
		},
	},
	["STN value_7"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_7",
			x = 12,
			y = 4,
		},
	},
	["STN value_7_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_7_inv",
			x = 12,
			y = 4,
			color = "i",
		},
	},
	["STN value_8"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_8",
			x = 12,
			y = 5,
		},
	},
	["STN value_8_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16_STN",
			},
			id = "STN value_8_inv",
			x = 12,
			y = 5,
			color = "i",
		},
	},
	["STN value1"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value1",
			x = 4,
			y = 2,
		},
	},
	["STN value2"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value2",
			x = 4,
			y = 3,
		},
	},
	["STN value3"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value3",
			x = 4,
			y = 4,
		},
	},
	["STN value4"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value4",
			x = 4,
			y = 5,
		},
	},
	["STN value5"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value5",
			x = 14,
			y = 2,
		},
	},
	["STN value6"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value6",
			x = 14,
			y = 3,
		},
	},
	["STN value7"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value7",
			x = 14,
			y = 4,
		},
	},
	["STN value8"] = {
		{
			alignment = "LFT",
			pages = {
				"INTRAFLIGHT",
			},
			id = "STN value8",
			x = 14,
			y = 5,
		},
	},
	["STPT"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "STPT",
			x = 20,
			y = 1,
		},
	},
	["STPT NUMBER"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "STPT NUMBER",
			x = 15,
			y = 1,
		},
	},
	["STPT NUMBER_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "STPT NUMBER_inv",
			x = 15,
			y = 1,
			color = "i",
		},
	},
	["STPT_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"MARK",
			},
			id = "STPT_inv",
			x = 20,
			y = 1,
			color = "i",
		},
	},
	["SYNC lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "SYNC lbl",
			x = 5,
			y = 5,
		},
	},
	["SYNC status"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "SYNC status",
			x = 10,
			y = 5,
		},
	},
	["SYS ACCURACY label"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "SYS ACCURACY label",
			x = 5,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "SYS ACCURACY label",
			x = 4,
			y = 2,
		},
	},
	["SYS ACCURACY value"] = {
		{
			alignment = "LFT",
			pages = {
				"FIX",
			},
			id = "SYS ACCURACY value",
			x = 15,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"NAV_STATUS",
			},
			id = "SYS ACCURACY value",
			x = 15,
			y = 2,
		},
	},
	["System Time"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "System Time",
			x = 16,
			y = 3,
		},
	},
	["SYSTEM_label"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "SYSTEM_label",
			x = 5,
			y = 2,
		},
	},
	["SYSTEM_value"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "SYSTEM_value",
			x = 14,
			y = 2,
		},
	},
	["SYSTEM_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "SYSTEM_value_inv",
			x = 14,
			y = 2,
			color = "i",
		},
	},
	["T1"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T1",
			x = 15,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T1",
			x = 2,
			y = 2,
		},
	},
	["T1_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T1_code",
			x = 19,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T1_code",
			x = 4,
			y = 2,
		},
	},
	["T1_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T1_code_inv",
			x = 19,
			y = 1,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T1_code_inv",
			x = 4,
			y = 2,
			color = "i",
		},
	},
	["T2"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T2",
			x = 15,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T2",
			x = 2,
			y = 3,
		},
	},
	["T2_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T2_code",
			x = 19,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T2_code",
			x = 4,
			y = 3,
		},
	},
	["T2_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T2_code_inv",
			x = 19,
			y = 2,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T2_code_inv",
			x = 4,
			y = 3,
			color = "i",
		},
	},
	["T3"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T3",
			x = 15,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T3",
			x = 2,
			y = 4,
		},
	},
	["T3_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T3_code",
			x = 19,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T3_code",
			x = 4,
			y = 4,
		},
	},
	["T3_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T3_code_inv",
			x = 19,
			y = 3,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T3_code_inv",
			x = 4,
			y = 4,
			color = "i",
		},
	},
	["T4"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T4",
			x = 15,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T4",
			x = 2,
			y = 5,
		},
	},
	["T4_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T4_code",
			x = 19,
			y = 4,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T4_code",
			x = 4,
			y = 5,
		},
	},
	["T4_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T4_code_inv",
			x = 19,
			y = 4,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T4_code_inv",
			x = 4,
			y = 5,
			color = "i",
		},
	},
	["T5"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T5",
			x = 15,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T5",
			x = 11,
			y = 2,
		},
	},
	["T5_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T5_code",
			x = 19,
			y = 5,
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T5_code",
			x = 13,
			y = 2,
		},
	},
	["T5_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "T5_code_inv",
			x = 19,
			y = 5,
			color = "i",
		},
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T5_code_inv",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["T6"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T6",
			x = 11,
			y = 3,
		},
	},
	["T6_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T6_code",
			x = 13,
			y = 3,
		},
	},
	["T6_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T6_code_inv",
			x = 13,
			y = 3,
			color = "i",
		},
	},
	["T7"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T7",
			x = 11,
			y = 4,
		},
	},
	["T7_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T7_code",
			x = 13,
			y = 4,
		},
	},
	["T7_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T7_code_inv",
			x = 13,
			y = 4,
			color = "i",
		},
	},
	["T8"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T8",
			x = 11,
			y = 5,
		},
	},
	["T8_code"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T8_code",
			x = 13,
			y = 5,
		},
	},
	["T8_code_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"HTS_MAN",
			},
			id = "T8_code_inv",
			x = 13,
			y = 5,
			color = "i",
		},
	},
	["TACAN A-A Distance"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "TACAN A-A Distance",
			x = 20,
			y = 5,
		},
	},
	["TACAN A-A Distance_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "TACAN A-A Distance_inv",
			x = 20,
			y = 5,
			color = "i",
		},
	},
	["TACAN Band"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "TACAN Band",
			x = 24,
			y = 5,
		},
	},
	["TACAN Channel"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "TACAN Channel",
			x = 21,
			y = 5,
		},
	},
	["TACAN Label"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "TACAN Label",
			x = 20,
			y = 5,
		},
	},
	["Target bearing"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target bearing",
			x = 5,
			y = 3,
		},
	},
	["Target bearing Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target bearing Asteriscs_lhs",
			x = 10,
			y = 3,
			color = "i",
		},
	},
	["Target bearing Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target bearing Asteriscs_rhs",
			x = 17,
			y = 3,
			color = "i",
		},
	},
	["Target bearing value"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target bearing value",
			x = 11,
			y = 3,
		},
	},
	["Target bearing value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target bearing value_inv",
			x = 11,
			y = 3,
			color = "i",
		},
	},
	["Target number"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target number",
			x = 6,
			y = 2,
		},
	},
	["Target number Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target number Asteriscs_lhs",
			x = 10,
			y = 2,
			color = "i",
		},
	},
	["Target number Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target number Asteriscs_rhs",
			x = 14,
			y = 2,
			color = "i",
		},
	},
	["Target number up down arrows"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target number up down arrows",
			x = 15,
			y = 2,
		},
	},
	["Target number value"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target number value",
			x = 11,
			y = 2,
		},
	},
	["Target number value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target number value_inv",
			x = 11,
			y = 2,
			color = "i",
		},
	},
	["Target to VRP Label"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target to VRP Label",
			x = 7,
			y = 1,
		},
	},
	["Target to VRP Label Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target to VRP Label Asteriscs_lhs",
			x = 6,
			y = 1,
			color = "i",
		},
	},
	["Target to VRP Label Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target to VRP Label Asteriscs_rhs",
			x = 17,
			y = 1,
			color = "i",
		},
	},
	["Target to VRP Label_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VRP",
			},
			id = "Target to VRP Label_inv",
			x = 7,
			y = 1,
			color = "i",
		},
	},
	["TblNum"] = {
		{
			alignment = "LFT",
			pages = {
				"HARM",
			},
			id = "TblNum",
			x = 7,
			y = 1,
		},
	},
	["TCN BAND Key"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN BAND Key",
			x = 7,
			y = 5,
		},
	},
	["TCN BAND Label"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN BAND Label",
			x = 1,
			y = 5,
		},
	},
	["TCN BAND XY"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN BAND XY",
			x = 6,
			y = 5,
		},
	},
	["TCN BCN ID"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN BCN ID",
			x = 5,
			y = 3,
		},
	},
	["TCN BCN Label"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN BCN Label",
			x = 1,
			y = 3,
		},
	},
	["TCN CHAN Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN CHAN Asterisks_lhs",
			x = 5,
			y = 4,
			color = "i",
		},
	},
	["TCN CHAN Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN CHAN Asterisks_rhs",
			x = 9,
			y = 4,
			color = "i",
		},
	},
	["TCN CHAN Label"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN CHAN Label",
			x = 1,
			y = 4,
		},
	},
	["TCN CHAN Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN CHAN Scratchpad",
			x = 6,
			y = 4,
		},
	},
	["TCN CHAN Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_PRIMARY",
			},
			id = "TCN CHAN Scratchpad_inv",
			x = 6,
			y = 4,
			color = "i",
		},
	},
	["TCN Label"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "TCN Label",
			x = 2,
			y = 1,
		},
	},
	["TCN Mode"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "TCN Mode",
			x = 6,
			y = 1,
		},
	},
	["TGP CODE Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "TGP CODE Asteriscs_lhs",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["TGP CODE Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "TGP CODE Asteriscs_rhs",
			x = 18,
			y = 2,
			color = "i",
		},
	},
	["TGP CODE LABEL"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "TGP CODE LABEL",
			x = 2,
			y = 2,
		},
	},
	["TGP CODE VALUE"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "TGP CODE VALUE",
			x = 14,
			y = 2,
		},
	},
	["TGP CODE VALUE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"LASER",
			},
			id = "TGP CODE VALUE_inv",
			x = 14,
			y = 2,
			color = "i",
		},
	},
	["TILS Asterisks_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "TILS Asterisks_lhs",
			x = 8,
			y = 3,
			color = "i",
		},
	},
	["TILS Asterisks_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "TILS Asterisks_rhs",
			x = 15,
			y = 3,
			color = "i",
		},
	},
	["TILS Scratchpad"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "TILS Scratchpad",
			x = 9,
			y = 3,
		},
	},
	["TILS Scratchpad_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"T_ILS_BACKUP",
				"T_ILS_COMMON",
				"T_ILS_PRIMARY",
			},
			id = "TILS Scratchpad_inv",
			x = 9,
			y = 3,
			color = "i",
		},
	},
	["TIM EVENT - Time"] = {
		{
			alignment = "LFT",
			pages = {
				"IFF_MAIN_STAT",
			},
			id = "TIM EVENT - Time",
			x = 19,
			y = 4,
		},
	},
	["TIME lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "TIME lbl",
			x = 5,
			y = 3,
		},
	},
	["TIME value"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "TIME value",
			x = 10,
			y = 3,
		},
	},
	["TIME value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"NET_STATUS",
			},
			id = "TIME value_inv",
			x = 10,
			y = 3,
			color = "i",
		},
	},
	["TIME_label"] = {
		{
			alignment = "LFT",
			pages = {
				"TIME",
			},
			id = "TIME_label",
			x = 10,
			y = 1,
		},
	},
	["TOD Label"] = {
		{
			alignment = "LFT",
			pages = {
				"COM_1",
			},
			id = "TOD Label",
			x = 18,
			y = 4,
		},
	},
	["TODO remove label"] = {
		{
			alignment = "LFT",
			pages = {
				"CORR_CAMERA",
				"CORR_COMMON_1_5",
				"CORR_COMMON_6_9",
				"CORR_COMMON_ANGLES",
				"CORR_CTVS_1",
				"CORR_CTVS_2",
				"CORR_FCR",
				"CORR_FLIR",
				"CORR_HUD_1",
				"CORR_HUD_2",
				"CORR_INS",
				"CORR_LT_HDPT",
				"CORR_RT_HDPT",
				"DRNG",
				"GPS_INIT_1",
				"GPS_INIT_2",
				"INSM",
				"OFP_1",
				"OFP_2",
				"OFP_COMMON",
				"STPT_BACKUP",
			},
			id = "TODO remove label",
			x = 5,
			y = 4,
		},
	},
	["TODO remove lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"CORR_CAMERA",
				"CORR_COMMON_1_5",
				"CORR_COMMON_6_9",
				"CORR_COMMON_ANGLES",
				"CORR_CTVS_1",
				"CORR_CTVS_2",
				"CORR_FCR",
				"CORR_FLIR",
				"CORR_HUD_1",
				"CORR_HUD_2",
				"CORR_INS",
				"CORR_LT_HDPT",
				"CORR_RT_HDPT",
				"DRNG",
				"GPS_INIT_1",
				"GPS_INIT_2",
				"INSM",
				"OFP_1",
				"OFP_2",
				"OFP_COMMON",
				"STPT_BACKUP",
			},
			id = "TODO remove lbl",
			x = 5,
			y = 2,
		},
	},
	["TOF Data"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "TOF Data",
			x = 12,
			y = 5,
		},
	},
	["TOF Label"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "TOF Label",
			x = 9,
			y = 5,
		},
	},
	["TOF SEC"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "TOF SEC",
			x = 18,
			y = 5,
		},
	},
	["TOS"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "TOS",
			x = 9,
			y = 5,
		},
	},
	["TOS_DES_TOS_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_DES_TOS_label",
			x = 5,
			y = 3,
		},
	},
	["TOS_DES_TOS_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_DES_TOS_value",
			x = 14,
			y = 3,
		},
	},
	["TOS_DES_TOS_value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_DES_TOS_value_inv",
			x = 14,
			y = 3,
			color = "i",
		},
	},
	["TOS_ETA_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_ETA_label",
			x = 9,
			y = 4,
		},
	},
	["TOS_ETA_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_ETA_value",
			x = 14,
			y = 4,
		},
	},
	["TOS_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_DIR",
			},
			id = "TOS_inv",
			x = 9,
			y = 5,
			color = "i",
		},
	},
	["TOS_MODE"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_MODE",
			x = 14,
			y = 1,
		},
	},
	["TOS_MODE_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_MODE_inv",
			x = 14,
			y = 1,
			color = "i",
		},
	},
	["TOS_REQ_GS_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_REQ_GS_label",
			x = 5,
			y = 5,
		},
	},
	["TOS_REQ_GS_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_REQ_GS_value",
			x = 14,
			y = 5,
		},
	},
	["TOS_SYSTEM_TIME_label"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_SYSTEM_TIME_label",
			x = 8,
			y = 2,
		},
	},
	["TOS_SYSTEM_TIME_value"] = {
		{
			alignment = "LFT",
			pages = {
				"CRUS_TOS",
			},
			id = "TOS_SYSTEM_TIME_value",
			x = 14,
			y = 2,
		},
	},
	["TOTAL label"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "TOTAL label",
			x = 5,
			y = 4,
		},
	},
	["TOTAL LBS label"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "TOTAL LBS label",
			x = 17,
			y = 4,
		},
	},
	["TOTAL value"] = {
		{
			alignment = "LFT",
			pages = {
				"BINGO",
			},
			id = "TOTAL value",
			x = 12,
			y = 4,
		},
	},
	["UHF IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "UHF IncDecSymbol",
			x = 6,
			y = 1,
		},
	},
	["UHF Mode Rotary"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "UHF Mode Rotary",
			x = 2,
			y = 1,
		},
	},
	["UHF Mode Rotary_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "UHF Mode Rotary_inv",
			x = 2,
			y = 1,
			color = "i",
		},
	},
	["UHF Status"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "UHF Status",
			x = 2,
			y = 2,
		},
	},
	["UTM_DEST"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST",
			x = 3,
			y = 1,
		},
	},
	["UTM_DEST_CNVRT"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_CNVRT",
			x = 19,
			y = 2,
		},
	},
	["UTM_DEST_CNVRT_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_CNVRT_inv",
			x = 19,
			y = 2,
			color = "i",
		},
	},
	["UTM_DEST_EAST/NORTH"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_EAST/NORTH",
			x = 1,
			y = 4,
		},
	},
	["UTM_DEST_ELEV"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_ELEV",
			x = 7,
			y = 5,
		},
	},
	["UTM_DEST_GRID"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_GRID",
			x = 7,
			y = 2,
		},
	},
	["UTM_DEST_SelectedSteerpoint"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_SelectedSteerpoint",
			x = 13,
			y = 1,
		},
	},
	["UTM_DEST_SelectedSteerpoint_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_SelectedSteerpoint_inv",
			x = 13,
			y = 1,
			color = "i",
		},
	},
	["UTM_DEST_SQUARE"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_SQUARE",
			x = 5,
			y = 3,
		},
	},
	["UTM_DEST_STPT_IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"DEST_UTM_DIR",
			},
			id = "UTM_DEST_STPT_IncDecSymbol",
			x = 17,
			y = 1,
		},
	},
	["VCS IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "VCS IncDecSymbol",
			x = 15,
			y = 2,
		},
	},
	["VHF IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "VHF IncDecSymbol",
			x = 6,
			y = 3,
		},
	},
	["VHF Label"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "VHF Label",
			x = 2,
			y = 3,
		},
		{
			alignment = "LFT",
			pages = {
				"COM_2_GUARD",
			},
			id = "VHF Label",
			x = 9,
			y = 1,
		},
	},
	["VHF Label_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "VHF Label_inv",
			x = 2,
			y = 3,
			color = "i",
		},
	},
	["VHF Status"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "VHF Status",
			x = 2,
			y = 4,
		},
	},
	["VIP bearing"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP bearing",
			x = 5,
			y = 3,
		},
	},
	["VIP bearing Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP bearing Asteriscs_lhs",
			x = 10,
			y = 3,
			color = "i",
		},
	},
	["VIP bearing Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP bearing Asteriscs_rhs",
			x = 17,
			y = 3,
			color = "i",
		},
	},
	["VIP bearing value"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP bearing value",
			x = 11,
			y = 3,
		},
	},
	["VIP bearing value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP bearing value_inv",
			x = 11,
			y = 3,
			color = "i",
		},
	},
	["VIP number Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP number Asteriscs_lhs",
			x = 10,
			y = 2,
			color = "i",
		},
	},
	["VIP number Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP number Asteriscs_rhs",
			x = 14,
			y = 2,
			color = "i",
		},
	},
	["VIP number up down arrows"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP number up down arrows",
			x = 15,
			y = 2,
		},
	},
	["VIP number value"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP number value",
			x = 11,
			y = 2,
		},
	},
	["VIP number value_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP number value_inv",
			x = 11,
			y = 2,
			color = "i",
		},
	},
	["VIP to TGT Label Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP to TGT Label Asteriscs_lhs",
			x = 6,
			y = 1,
			color = "i",
		},
	},
	["VIP to TGT Label Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "VIP to TGT Label Asteriscs_rhs",
			x = 17,
			y = 1,
			color = "i",
		},
	},
	["Visual initial point number"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Visual initial point number",
			x = 6,
			y = 2,
		},
	},
	["Visual initial point to TGT Label"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Visual initial point to TGT Label",
			x = 7,
			y = 1,
		},
	},
	["Visual initial point to TGT Label_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"VIP",
			},
			id = "Visual initial point to TGT Label_inv",
			x = 7,
			y = 1,
			color = "i",
		},
	},
	["Wind Magnetic Direction"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Wind Magnetic Direction",
			x = 17,
			y = 2,
		},
	},
	["Wind Speed"] = {
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "Wind Speed",
			x = 21,
			y = 2,
		},
	},
	["WPT IncDecSymbol"] = {
		{
			alignment = "LFT",
			pages = {
				"ALOW",
				"CMDS_BINGO",
				"LASER",
				"LINK16",
				"LINK16_STN",
				"LIST",
				"MISC",
				"MODE",
				"NET_STATUS",
			},
			id = "WPT IncDecSymbol",
			x = 24,
			y = 1,
		},
		{
			alignment = "LFT",
			pages = {
				"CNI",
			},
			id = "WPT IncDecSymbol",
			x = 20,
			y = 1,
		},
	},
	["WSPAN Asteriscs_lhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "WSPAN Asteriscs_lhs",
			x = 13,
			y = 2,
			color = "i",
		},
	},
	["WSPAN Asteriscs_rhs"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "WSPAN Asteriscs_rhs",
			x = 19,
			y = 2,
			color = "i",
		},
	},
	["WSPAN DATA"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "WSPAN DATA",
			x = 14,
			y = 2,
		},
	},
	["WSPAN Label"] = {
		{
			alignment = "LFT",
			pages = {
				"MAN",
			},
			id = "WSPAN Label",
			x = 7,
			y = 2,
		},
	},
	["XMT lbl"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "XMT lbl",
			x = 4,
			y = 2,
		},
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "XMT lbl",
			x = 12,
			y = 4,
		},
	},
	["XMT status"] = {
		{
			alignment = "LFT",
			pages = {
				"LINK16",
			},
			id = "XMT status",
			x = 17,
			y = 4,
		},
	},
	["XMT value"] = {
		{
			alignment = "LFT",
			pages = {
				"AG_DL",
			},
			id = "XMT value",
			x = 8,
			y = 2,
		},
	},
	["ZEROIZE GPS label"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "ZEROIZE GPS label",
			x = 7,
			y = 5,
		},
	},
	["ZEROIZE GPS label_inv"] = {
		{
			alignment = "LFT",
			pages = {
				"NAV_COMMANDS",
			},
			id = "ZEROIZE GPS label_inv",
			x = 7,
			y = 5,
			color = "i",
		},
	},
}

return F_16C_DED
