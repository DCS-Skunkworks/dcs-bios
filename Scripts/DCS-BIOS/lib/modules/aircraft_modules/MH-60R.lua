module("MH-60R", package.seeall)

local Module = require("Scripts.DCS-BIOS.lib.modules.Module")

--- @class MH_60R: Module
local MH_60R = Module:new("MH-60R", 0xA400, { "MH-60R", "UH-60L" })

--Lighting Switches
MH_60R:defineFloat("LGHT_SW", 206, { 0.0, 1.0 }, "Lights", "Lighting_Switches")

--Caution Lights
MH_60R:defineIndicatorLight("CIS_PLT_HDG", 212, "CISP", "LIGHT_HDG_ON")
MH_60R:defineIndicatorLight("CIS_PLT_NAV", 213, "CISP", "LIGHT_NAV_ON")
MH_60R:defineIndicatorLight("CIS_PLT_ALT", 214, "CISP", "LIGHT_ALT_ON")
MH_60R:defineIndicatorLight("CIS_PLT_DPLR", 215, "CISP", "LIGHT_DPLRGPS")
MH_60R:defineIndicatorLight("CIS_PLT_VOR", 216, "CISP", "LIGHT_VOR_LGT")
MH_60R:defineIndicatorLight("CIS_PLT_ILS", 217, "CISP", "LIGHT_ILS_LGT")
MH_60R:defineIndicatorLight("CIS_PLT_BCKCRS", 218, "CISP", "LIGHT_BACKCRS")
MH_60R:defineIndicatorLight("CIS_PLT_FMHME", 219, "CISP", "LIGHT_FMHOME")
MH_60R:defineIndicatorLight("CIS_PLT_TRNRM", 220, "CISP", "LIGHT_TRNORM")
MH_60R:defineIndicatorLight("CIS_PLT_TRALT", 221, "CISP", "LIGHT_TRALT")
MH_60R:defineIndicatorLight("CIS_PLT_CRSHDGPLT", 222, "CISP", "LIGHT_HDGPLT")
MH_60R:defineIndicatorLight("CIS_PLT_CRSHDGCPLT", 223, "CISP", "LIGHT_HDGCPLT")
MH_60R:defineIndicatorLight("CIS_PLT_GYRNRM", 224, "CISP", "LIGHT_GYRONORM")
MH_60R:defineIndicatorLight("CIS_PLT_GYROALT", 225, "CISP", "LIGHT_GYROALT")
MH_60R:defineIndicatorLight("CIS_PLT_BRG2ADF", 226, "CISP", "LIGHT_BRG2ADF")
MH_60R:defineIndicatorLight("CIS_PLT_BRG2VOR", 227, "CISP", "LIGHT_BRG2VOR")

-- AFCS LIGHTS
MH_60R:defineIndicatorLight("AFC_BST_LGHT", 241, "AFCS", "LIGHT_AFCS_BOOST")
MH_60R:defineIndicatorLight("AFC_SS1_LGHT", 242, "AFCS", "LIGHT_AFCS_SAS1")
MH_60R:defineIndicatorLight("AFC_SS2_LGHT", 243, "AFCS", "LIGHT_AFCS_SAS2")
MH_60R:defineIndicatorLight("AFC_TRM_LGHT", 244, "AFCS", "LIGHT_AFCS_TRIM")
MH_60R:defineIndicatorLight("AFC_FPS_LGHT", 245, "AFCS", "LIGHT_AFCS_FPS")
MH_60R:defineIndicatorLight("AFC_STB_LGHT", 246, "AFCS", "LIGHT_AFCS_STABAUTO")

--MCP LAMPS
MH_60R:defineIndicatorLight("MST_CAUTION", 313, "MCP", "LIGHT_MCP_MC")

--MISC PANEL LIGHTS
MH_60R:defineIndicatorLight("WHL_LCK_LGT", 294, "Misc", "TAIL_WHEEL_LOCK")

--Electric System
MH_60R:defineToggleSwitch("BATT_SW", 27, 3013, 17, "Electric System", "Battery Switch OFF/ON")
MH_60R:defineSpringloaded_3PosTumb("EXT_PWR_SW", 27, 3014, 3021, 18, "Electric System", "External Power Switch RESET/OFF/ON")
MH_60R:defineSpringloaded_3PosTumb("APU_GEN_SW", 27, 3015, 3018, 19, "Electric System", "APU GEN Switch TEST/OFF/ON")
MH_60R:defineSpringloaded_3PosTumb("GEN1_SW", 27, 3016, 3019, 20, "Electric System", "GEN 1 Switch TEST/OFF/ON")
MH_60R:defineSpringloaded_3PosTumb("GEN2_SW", 27, 3017, 3020, 21, "Electric System", "GEN 2 Switch TEST/OFF/ON")

--Fuel and Engines
MH_60R:defineSpringloaded_3PosTumb("FUEL_PMP_SW", 27, 3022, 3022, 22, "Fuel and Engines", "FUEL PRIME/OFF/APU BOOST")
MH_60R:defineSpringloaded_3PosTumb("AIR_SRC_SW", 27, 3023, 3023, 23, "Fuel and Engines", "Air Source APU/OFF/ENG")
MH_60R:defineToggleSwitch("APU_CTRL_SW", 27, 3024, 24, "Fuel and Engines", "APU CONTROL OFF/ON")
MH_60R:defineToggleSwitch("FUEL1_BST_PMP", 27, 3044, 40, "Fuel and Engines", "Boost Pump 1 OFF/ON")

-- APU EXTINGUISH
MH_60R:definePotentiometer("ENG1_CTRL", 16, 3206, 26, { 0, 1 }, "APU Extinguish", "Engine 1 Control")
MH_60R:definePotentiometer("ENG2_CTRL", 16, 3207, 27, { 0, 1 }, "APU Extinguish", "Engine 2 Control")

MH_60R:defineMultipositionSwitch("ENG1_FSS", 16, 3208, 28, 3, 0.5, "APU Extinguish", "Engine 1 FSS OFF/DIR/XFD") --3, 1/2, false, 0, 1, false)
MH_60R:defineMultipositionSwitch("ENG2_FSS", 16, 3209, 29, 3, 0.5, "APU Extinguish", "Engine 2 FSS OFF/DIR/XFD") --3, 1/2, false, 0, 1, false)
MH_60R:defineToggleSwitch("ENG1_START", 16, 3210, 30, "APU Extinguish", "Engine 1 Starter")
MH_60R:defineToggleSwitch("ENG2_START", 16, 3211, 31, "APU Extinguish", "Engine 2 Starter")
MH_60R:defineTumb("ENG1_CTR_LVL", 16, 3204, 42, 1, { -1, 0 }, nil, false, "ECQ", "Engine 1 Control Level OFF/IDLE")
MH_60R:defineTumb("ENG2_CTR_LVL", 16, 3205, 43, 1, { -1, 0 }, nil, false, "ECQ", "Engine 2 Control Level OFF/IDLE")

-- STAB PANEL
MH_60R:defineSpringloaded_3PosTumb("STAB_MAN_SLW", 17, 3228, 3229, 32, "STAB Panel", "Manual Slew UP")
MH_60R:definePushButton("STAB_AUTO", 17, 3222, 33, "STAB Panel", "STAB OFF/ON")
MH_60R:definePushButton("SAS1", 17, 3223, 34, "STAB Panel", "SAS 1 OFF/ON")
MH_60R:definePushButton("SAS2", 17, 3224, 35, "STAB Panel", "SAS 2 OFF/ON")
MH_60R:definePushButton("TRIM", 17, 3225, 36, "STAB Panel", "Trim OFF/ON")
MH_60R:definePushButton("FPS", 17, 3226, 37, "STAB Panel", "FPS OFF/ON")
MH_60R:definePushButton("SAS_BST", 17, 3227, 38, "STAB Panel", "SAS Boost OFF/ON")
--MH_60R:definePushButton("AUTO_TRIM1",52, 3452, 39, "STAB Panel", "Auto Trim ON/OFF")

-- -- PARKING BRAKE
MH_60R:defineToggleSwitch("PRK_BRK", 27, 3402, 80, "General", "Parking Brake")

-- -- PILOT BARO ALTIMETER
-- elements["PNT-063"]	= default_axis(_("Barometric Scale Set"),  devices.PLTAAU32A, device_commands.pilotBarometricScaleSet, 63, 0, 0.1, false, true)

-- -- COPILOT BARO ALTIMETER
-- elements["PNT-073"]	= default_axis(_("Barometric Scale Set"),  devices.CPLTAAU32A, device_commands.copilotBarometricScaleSet, 73, 0, 0.1, false, true)

-- -- PILOT HSI
-- --default_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_,cycled_,attach_left_,attach_right_)
-- elements["PNT-130"]	= default_axis(_("Heading Set"),	devices.PLTCISP, device_commands.pilotHSIHdgSet, 130, 0, 0.1, false, true)
-- elements["PNT-131"]	= default_axis(_("Course Set"),	devices.PLTCISP, device_commands.pilotHSICrsSet, 131, 0, 0.1, false, true)

-- -- COPILOT HSI
-- --default_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_,cycled_,attach_left_,attach_right_)
-- elements["PNT-150"]	= default_axis(_("Heading Set"),	devices.CPLTCISP, device_commands.copilotHSIHdgSet, 150, 0, 0.1, false, true)
-- elements["PNT-151"]	= default_axis(_("Course Set"),	    devices.CPLTCISP, device_commands.copilotHSICrsSet, 151, 0, 0.1, false, true)

-- -- MISC
MH_60R:defineToggleSwitch("TAIL_WHL_LCK", 46, 3410, 291, "Misc", "Tail Wheel LOCK/UNLOCK")

-- -- CAUTION/DISPLAY PANELS
MH_60R:definePushButton("CDU_TST", 25, 3230, 301, "Vids", "CDU Lamp Test")
MH_60R:definePushButton("PDU1_TST", 25, 3231, 302, "Vids", "PDU Test Pilot")
--MH_60R:definePushButton("PDU2_TST",		25, 3232, "Vids", "PDU Test CoPilot")

MH_60R:defineTumb("CAP_TST", 24, 3219, 304, 1, { -1, 0 }, nil, false, "Caution Display Panel", "CAP Lamp TEST")
MH_60R:defineToggleSwitch("CAP_BRGT", 24, 3220, 304, "Caution Display Panel", "CAP Lamp BRIGHTNESS")
MH_60R:definePushButton("MST_CAUT_RST", 24, 3221, 305, "Caution Display Panel", "Master Caution Reset")

-- -- AN/ASN-128B
MH_60R:defineMultipositionSwitch("128B_DISPLAY", 23, 3236, 500, 7, 0.01, "AN/ASN-128B", "AN/ASN-128B Select Display")
MH_60R:defineMultipositionSwitch("128B_MODE", 23, 3235, 501, 6, 0.01, "AN/ASN-128B", "AN/ASN-128B Select Mode")
MH_60R:definePushButton("128B_KYBD", 23, 3237, 502, "AN/ASN-128B", "AN/ASN-128B Select Button KYBD")
MH_60R:definePushButton("128B_LTR_LFT", 23, 3238, 503, "AN/ASN-128B", "AN/ASN-128B Select Button LTR Left")
MH_60R:definePushButton("128B_LTR_MID", 23, 3239, 504, "AN/ASN-128B", "AN/ASN-128B Select Button LTR Mid")
MH_60R:definePushButton("128B_LTR_RGHT", 23, 3240, 505, "AN/ASN-128B", "AN/ASN-128B Select Button LTR Right")
MH_60R:definePushButton("128B_F1", 23, 3241, 506, "AN/ASN-128B", "AN/ASN-128B Select Button F1")
MH_60R:definePushButton("128B_1", 23, 3242, 507, "AN/ASN-128B", "AN/ASN-128B Select Button 1")
MH_60R:definePushButton("128B_2", 23, 3243, 508, "AN/ASN-128B", "AN/ASN-128B Select Button 2")
MH_60R:definePushButton("128B_3", 23, 3244, 509, "AN/ASN-128B", "AN/ASN-128B Select Button 3")
MH_60R:definePushButton("128B_TGT_STR", 23, 3245, 510, "AN/ASN-128B", "AN/ASN-128B Select Button TGT STR")
MH_60R:definePushButton("128B_4", 23, 3246, 511, "AN/ASN-128B", "AN/ASN-128B Select Button 4")
MH_60R:definePushButton("128B_5", 23, 3247, 512, "AN/ASN-128B", "AN/ASN-128B Select Button 5")
MH_60R:definePushButton("128B_6", 23, 3248, 513, "AN/ASN-128B", "AN/ASN-128B Select Button 6")
MH_60R:definePushButton("128B_INC", 23, 3249, 514, "AN/ASN-128B", "AN/ASN-128B Select Button INC")
MH_60R:definePushButton("128B_7", 23, 3250, 515, "AN/ASN-128B", "AN/ASN-128B Select Button 7")
MH_60R:definePushButton("128B_8", 23, 3251, 516, "AN/ASN-128B", "AN/ASN-128B Select Button 8")
MH_60R:definePushButton("128B_9", 23, 3252, 517, "AN/ASN-128B", "AN/ASN-128B Select Button 9")
MH_60R:definePushButton("128B_DEC", 23, 3253, 518, "AN/ASN-128B", "AN/ASN-128B Select Button DEC")
MH_60R:definePushButton("128B_CLR", 23, 3254, 519, "AN/ASN-128B", "AN/ASN-128B Select Button CLR")
MH_60R:definePushButton("128B_0", 23, 3255, 520, "AN/ASN-128B", "AN/ASN-128B Select Button 0")
MH_60R:definePushButton("128B_ENT", 23, 3256, 521, "AN/ASN-128B", "AN/ASN-128B Select Button ENT")

-- -- CISP
MH_60R:definePushButton("CIS_HDG", 39, 3369, 930, "CISP", "CISP Pilot HDG OFF/ON")
MH_60R:definePushButton("CIS_NAV", 39, 3370, 931, "CISP", "CISP Pilot NAV OFF/ON")
MH_60R:definePushButton("CIS_ALT", 39, 3371, 932, "CISP", "CISP Pilot ALT OFF/ON")

MH_60R:definePushButton("NAV_DPLR", 37, 3372, 933, "CISP", "CISP Pilot DLPR GPS OFF/ON")
MH_60R:definePushButton("NAV_VOR", 37, 3373, 934, "CISP", "CISP Pilot VOR ILS OFF/ON")
MH_60R:definePushButton("NAV_BACK", 37, 3374, 935, "CISP", "CISP Pilot BACK CRS OFF/ON")
MH_60R:definePushButton("NAV_FM", 37, 3375, 936, "CISP", "CISP Pilot FM HOME OFF/ON")
MH_60R:definePushButton("TRN_RATE", 37, 3376, 937, "CISP", "CISP Pilot TURN RATE NORM/ALTR")
MH_60R:definePushButton("CRS_HDG", 37, 3377, 938, "CISP", "CISP Pilot CRS HDG - PLT/CPLT")
MH_60R:definePushButton("VRT_GYRO", 37, 3378, 939, "CISP", "CISP Pilot VERT GYRO NORM/ALTR")
MH_60R:definePushButton("BRG2", 37, 3379, 940, "CISP", "CISP Pilot BRG2 ADF/VOR")

-- -- AN/AVS-7 PANEL
MH_60R:defineTumb("AVS_ON", 30, 3257, 1100, 1, { -1, 1 }, nil, false, "AN/AVS-7 HUD", "AN/AVS-7 OFF/ON/ADJ")
MH_60R:defineSpringloaded_3PosTumb("AVS_DIM", 30, 3259, 3258, 1106, "AN/AVS-7 HUD", "AN/AVS-7 DIM/BRIGHT")

-- -- AN/ARC-164
-- elements["PNT-050"]	= multiposition_switch(_("AN/ARC-164 Mode"),	            devices.ARC164, device_commands.arc164_mode,        50, 4,  0.01, false, 0, 100, false)
-- elements["PNT-051"]	= default_axis(_("AN/ARC-164 Volume"),    	                devices.ARC164, device_commands.arc164_volume,      51)
-- elements["PNT-052"]	= multiposition_switch(_("AN/ARC-164 Manual/Preset/Guard"), devices.ARC164, device_commands.arc164_xmitmode,    52, 4,  0.01, false, 0, 100, false)
-- elements["PNT-053"]	= multiposition_switch(_("AN/ARC-164 100s"),    	        devices.ARC164, device_commands.arc164_freq_Xooooo, 53, 2,  0.1, false, 0, 100, false)
-- elements["PNT-054"]	= multiposition_switch(_("AN/ARC-164 10s"),    	            devices.ARC164, device_commands.arc164_freq_oXoooo, 54, 10, 0.1, false, 0, 100, false)
-- elements["PNT-055"]	= multiposition_switch(_("AN/ARC-164 1s"),    	            devices.ARC164, device_commands.arc164_freq_ooXooo, 55, 10, 0.1, false, 0, 100, false)
-- elements["PNT-056"]	= multiposition_switch(_("AN/ARC-164 .1s"),    	            devices.ARC164, device_commands.arc164_freq_oooXoo, 56, 10, 0.1, false, 0, 100, false)
-- elements["PNT-057"]	= multiposition_switch(_("AN/ARC-164 .010s"),               devices.ARC164, device_commands.arc164_freq_ooooXX, 57, 4,  0.1, false, 0, 100, false)
-- elements["PNT-058"]	= multiposition_switch(_("AN/ARC-164 Preset"),              devices.ARC164, device_commands.arc164_preset,      58, 20, 0.05, false, 0, 100, false)

-- -- Pilot APN-209 Radar Altimeter
-- --default_axis(hint_,device_,command_,arg_, default_, gain_,updatable_,relative_,cycled_,attach_left_,attach_right_)
-- elements["PNT-170"]	= default_axis(_("Low Altitude Set"),  devices.PLTAPN209, device_commands.apn209PilotLoSet, 170, 0, 20, true, true, true)
-- elements["PNT-171"]	= default_axis(_("High Altitude Set"), devices.PLTAPN209, device_commands.apn209PilotHiSet, 171, 0, 20, true, true, true)

-- elements["PNT-183"]	= default_axis(_("Low Altitude Set"),  devices.CPLTAPN209, device_commands.apn209CopilotLoSet, 183, 0, 20, true, true, true)
-- elements["PNT-184"]	= default_axis(_("High Altitude Set"), devices.CPLTAPN209, device_commands.apn209CopilotHiSet, 184, 0, 20, true, true, true)

-- -- Lighting
MH_60R:definePotentiometer("GLR_SHLD", 20, 3272, 251, { 0, 1 }, "Lights", "Glareshield Lights OFF/BRT")
MH_60R:defineSpringloaded_3PosTumb("POS_LGHT_DIM", 20, 3281, 3281, 252, "Lights", "Position Lights DIM/OFF/BRT")
MH_60R:defineTumb("POS_LGTH_MOD", 20, 3282, 253, 1, { 0, 1 }, nil, false, "Lights", "Position Lights STEADY/FLASH")
MH_60R:defineSpringloaded_3PosTumb("ANTI_LGHT_UP", 20, 3283, 3283, 254, "Lights", "Anticollision Lights UPPER/BOTH/LOWER")
MH_60R:defineSpringloaded_3PosTumb("ANTI_LGHT_DAY", 20, 3284, 3284, 255, "Lights", "Anticollision Lights DAY/OFF/NIGHT")
MH_60R:defineTumb("NAV_LGTH_MOD", 20, 3285, 256, 1, { 0, 1 }, nil, false, "Lights", "Nav Lights NORM/IR")
MH_60R:defineSpringloaded_3PosTumb("POS_LGHT", 20, 3286, 3286, 257, "Lights", "Cabin Lights BLUE/OFF/WHITE")
MH_60R:definePotentiometer("LGHT_SWTCH", 20, 3274, 260, { 0, 1 }, "Lights", "Lighted Switches OFF/BRT")
MH_60R:defineMultipositionSwitch("FORM_LGHT", 20, 3275, 261, 6, 0.2, "Lights", "Formation Lights OFF/1/2/3/4/5")

MH_60R:definePotentiometer("UPP_BRT", 20, 3276, 262, { 0, 1 }, "Lights", "Upper Console Lights OFF/BRT")
MH_60R:definePotentiometer("LWR_BRT", 20, 3277, 263, { 0, 1 }, "Lights", "Lower Console Lights OFF/BRT")
MH_60R:definePotentiometer("PLT_INST_BRT", 20, 3278, 264, { 0, 1 }, "Lights", "Pilot Flight Instrument Lights OFF/BRT")
MH_60R:definePotentiometer("CPLT_INST_BRT", 20, 3273, 259, { 0, 1 }, "Lights", "CoPilot Flight Instrument Lights OFF/BRT")
MH_60R:definePotentiometer("LGHT_BRT", 20, 3279, 265, { 0, 1 }, "Lights", "Non Flight Instrument Lights OFF/BRT")
MH_60R:definePotentiometer("RDR_DIM", 20, 3289, 266, { 0, 1 }, "Lights", "Radar Altimeter DIM")

MH_60R:defineTumb("CMP_LGTH_MOD", 20, 3280, 268, 1, { 0, 1 }, nil, false, "Lights", "Magnetic Compass Light OFF/ON")
MH_60R:defineSpringloaded_3PosTumb("CKPT_LGHT_DAY", 20, 3287, 3287, 269, "Lights", "Cockpit Lights BLUE/OFF/WHITE")

-- -- AN/APR-39
-- elements["PNT-270"]	= default_2_position_tumb(_("AN/APR-39 Power ON/OFF"),	            devices.APR39, device_commands.apr39Power, 270, 8)
-- elements["PNT-271"]	= short_way_button(_("AN/APR-39 Self Test (Inop.)"),	            devices.APR39, device_commands.apr39SelfTest, 271)
-- elements["PNT-272"]	= default_2_position_tumb(_("AN/APR-39 Altitude HIGH/LOW (Inop.)"),	devices.APR39, device_commands.apr39Altitude, 272, 8)
-- elements["PNT-273"]	= default_axis(_("AN/APR-39 Volume"),    	                        devices.APR39, device_commands.apr39Volume, 273)
-- elements["PNT-274"]	= default_axis(_("AN/APR-39 Brilliance"),    	                    devices.APR39, device_commands.apr39Brightness, 274)

-- -- PILOT LC6 CHRONOMETER
-- elements["PNT-280"]	= default_button(_("Pilot's Chronometer RESET/SET Button"), devices.PLTLC6, device_commands.resetSetBtn, 280)
-- elements["PNT-281"]	= default_button(_("Pilot's Chronometer MODE Button"), devices.PLTLC6, device_commands.modeBtn, 281)
-- elements["PNT-282"]	= default_button(_("Pilot's Chronometer START/STOP/ADVANCE Button"), devices.PLTLC6, device_commands.startStopAdvBtn, 282)

-- -- COPILOT LC6 CHRONOMETER
-- elements["PNT-283"]	= default_button(_("Copilot's Chronometer RESET/SET Button"), devices.CPLTLC6, device_commands.resetSetBtn, 283)
-- elements["PNT-284"]	= default_button(_("Copilot's Chronometer MODE Button"), devices.CPLTLC6, device_commands.modeBtn, 284)
-- elements["PNT-285"]	= default_button(_("Copilot's Chronometer START/STOP/ADVANCE Button"), devices.CPLTLC6, device_commands.startStopAdvBtn, 285)

-- -- PILOT ICS PANEL
-- --multiposition_switch_relative(hint_,device_,command_,arg_,count_,delta_,inversed_,min_,animation_speed_,cycled_)
-- elements["PNT-400"]	= multiposition_switch(_("Pilot ICP XMIT Selector"),            devices.BASERADIO, device_commands.pilotICPXmitSelector, 400, 6,  1/5,  false, 0, 16, false)
-- elements["PNT-401"]	= default_axis_limited(_("Pilot ICP RCV Volume"),               devices.PLT_ICP, device_commands.pilotICPSetVolume, 401, 0, 0.1, true, false, {0,1})
-- elements["PNT-402"]	= default_2_position_tumb(_("Pilot ICP Hot Mike (Inop.)"),      devices.PLT_ICP, device_commands.foo, 402, 8)
-- elements["PNT-403"]	= default_2_position_tumb(_("Pilot ICP RCV FM1"),               devices.PLT_ICP, device_commands.pilotICPToggleFM1, 403, 8)
-- elements["PNT-404"]	= default_2_position_tumb(_("Pilot ICP RCV UHF"),               devices.PLT_ICP, device_commands.pilotICPToggleUHF, 404, 8)
-- elements["PNT-405"]	= default_2_position_tumb(_("Pilot ICP RCV VHF"),               devices.PLT_ICP, device_commands.pilotICPToggleVHF, 405, 8)
-- elements["PNT-406"]	= default_2_position_tumb(_("Pilot ICP RCV FM2"),               devices.PLT_ICP, device_commands.pilotICPToggleFM2, 406, 8)
-- elements["PNT-407"]	= default_2_position_tumb(_("Pilot ICP RCV HF"),                devices.PLT_ICP, device_commands.pilotICPToggleHF, 407, 8)
-- elements["PNT-408"]	= default_2_position_tumb(_("Pilot ICP RCV VOR/LOC"),           devices.PLT_ICP, device_commands.pilotICPToggleVOR, 408, 8)
-- elements["PNT-409"]	= default_2_position_tumb(_("Pilot ICP RCV ADF"),               devices.PLT_ICP, device_commands.pilotICPToggleADF, 409, 8)

-- -- TODO OTHER ICS PANELS?

-- -- ARC-186 VHF
-- elements["PNT-410"]	= default_axis_limited(_("AN/ARC-186 Volume"),                      devices.ARC186, device_commands.arc186Volume, 410, 0, 0.1, true, false, {0,1})
-- elements["PNT-411"]	= default_button_tumb_v2_inverted(_("AN/ARC-186 Tone (Inop.)"),	    devices.ARC186, device_commands.arc186Tone, device_commands.arc186Tone, 411)
-- elements["PNT-412"]	= multiposition_switch(_("AN/ARC-186 10MHz Selector"),              devices.ARC186, device_commands.arc186Selector10MHz, 412, 13,  1/12,  false, 0, 16, true)
-- elements["PNT-413"]	= multiposition_switch(_("AN/ARC-186 1MHz Selector"),               devices.ARC186, device_commands.arc186Selector1MHz, 413, 10,  0.1,  false, 0, 16, true)
-- elements["PNT-414"]	= multiposition_switch(_("AN/ARC-186 100KHz Selector"),             devices.ARC186, device_commands.arc186Selector100KHz, 414, 10,  0.1,  false, 0, 16, true)
-- elements["PNT-415"]	= multiposition_switch(_("AN/ARC-186 25KHz Selector"),              devices.ARC186, device_commands.arc186Selector25KHz, 415, 4,  0.25,  false, 0, 16, true)
-- elements["PNT-416"]	= multiposition_switch(_("AN/ARC-186 Frequency Control Selector"),  devices.ARC186, device_commands.arc186FreqSelector, 416, 4,  1/3,  false, 0, 16, false)
-- elements["PNT-417"]	= default_button(_("AN/ARC-186 Load Pushbutton"),                   devices.ARC186, device_commands.arc186Load, 417)
-- elements["PNT-418"]	= multiposition_switch(_("AN/ARC-186 Preset Channel Selector"),     devices.ARC186, device_commands.arc186PresetSelector, 418, 20,  0.05,  false, 0, 16, true)
-- elements["PNT-419"]	= multiposition_switch(_("AN/ARC-186 Mode Selector"),               devices.ARC186, device_commands.arc186ModeSelector, 419, 3,  0.5,  false, 0, 16, false)

-- -- AFMS
-- elements["PNT-460"]	= default_3_position_tumb(_("Aux Fuel Transfer Mode MAN/OFF/AUTO"),         devices.AFMS, device_commands.afmcpXferMode, 460)
-- elements["PNT-461"]	= default_3_position_tumb(_("Aux Fuel Manual Transfer RIGHT/BOTH/LEFT"),    devices.AFMS, device_commands.afmcpManXfer,461)
-- elements["PNT-462"]	= default_2_position_tumb(_("Aux Fuel Transfer From RIGHT/LEFT"),           devices.AFMS, device_commands.afmcpXferFrom, 462, 8)
-- elements["PNT-463"]	= multiposition_switch(_("Aux Fuel Pressurization Selector"),               devices.AFMS, device_commands.afmcpPress, 463, 4,  1/3,  false, 0, 16, false)

--DOORS
MH_60R:defineToggleSwitch("CPLT_DOOR", 46, 3403, 470, "Misc", "Copilot Door OPEN/CLOSE")
MH_60R:defineToggleSwitch("PLT_DOOR", 46, 3404, 471, "Misc", "Pilot Door OPEN/CLOSE")
MH_60R:defineToggleSwitch("LFT_GUN_WIN", 46, 3405, 472, "Misc", "Left Gunner Door OPEN/CLOSE")
MH_60R:defineToggleSwitch("RGT_GUN_WIN", 46, 3406, 473, "Misc", "Right Gunner Door OPEN/CLOSE")
MH_60R:defineToggleSwitch("LFT_CRG_DOOR", 46, 3407, 474, "Misc", "Left Cargo Door OPEN/CLOSE")
MH_60R:defineToggleSwitch("RGT_CRG_DOOR", 46, 3408, 475, "Misc", "Right Cargo Door OPEN/CLOSE")

-- M130 CM System
MH_60R:defineToggleSwitch("FLR_DSP_CVR", 32, 3308, 550, "M130 CM", "Flare Dispenser Mode Cover OPEN/CLOSE")
MH_60R:defineToggleSwitch("FLR_DSP_SW", 32, 3421, 551, "M130 CM", "Flare Dispenser Switch OFF/ON")

--FlareDispenseMode
--elements["PNT-552"]	= multiposition_switch_relative(_("Flare Counter"), devices.M130, device_commands.cmFlareCounterDial, 552, 10, 1/9, false, 0, 16, true)
--elements["PNT-553"]	= multiposition_switch_relative(_("Chaff Counter"), devices.M130, device_commands.cmChaffCounterDial, 553, 10, 1/9, false, 0, 16, true)
MH_60R:defineToggleSwitch("CM_ARM_SW", 32, 3311, 559, "M130 CM", "Countermeasures Arming Switch OFF/ON")
MH_60R:defineMultipositionSwitch("CHAFF_MOD_SEL", 32, 3313, 560, 3, 0.5, "M130 CM", "Chaff Mode Selector") --3, 1/2, false, 0, 16, false)
MH_60R:definePushButton("CHAF_DISP", 32, 3314, 561, "M130 CM", "Chaff Dispense")

-- -- ARC-201 FM1
-- elements["PNT-600"]	= multiposition_switch(_("AN/ARC-201 (FM1) PRESET Selector"),   devices.ARC201_FM1, device_commands.fm1PresetSelector, 600, 8,  0.01,  false, 0, 16, false)
-- elements["PNT-601"]	= multiposition_switch(_("AN/ARC-201 (FM1) FUNCTION Selector"), devices.ARC201_FM1, device_commands.fm1FunctionSelector, 601, 9,  0.01,  false, 0, 16, false)
-- elements["PNT-602"]	= multiposition_switch(_("AN/ARC-201 (FM1) PWR Selector"),      devices.ARC201_FM1, device_commands.fm1PwrSelector, 602, 4,  0.01,  false, 0, 16, false)
-- elements["PNT-603"]	= multiposition_switch(_("AN/ARC-201 (FM1) MODE Selector"),     devices.ARC201_FM1, device_commands.fm1ModeSelector, 603, 4,  0.01,  false, 0, 16, false)
-- elements["PNT-604"]	= default_axis_limited(_("AN/ARC-201 (FM1) Volume"),            devices.ARC201_FM1, device_commands.fm1Volume, 604, 0, 0.1, true, false, {0,1})

-- elements["PNT-605"]	= default_button(_("AN/ARC-201 (FM1) Btn 1"),        devices.ARC201_FM1, device_commands.fm1Btn1, 605)
-- elements["PNT-606"]	= default_button(_("AN/ARC-201 (FM1) Btn 2"),        devices.ARC201_FM1, device_commands.fm1Btn2, 606)
-- elements["PNT-607"]	= default_button(_("AN/ARC-201 (FM1) Btn 3"),        devices.ARC201_FM1, device_commands.fm1Btn3, 607)
-- elements["PNT-608"]	= default_button(_("AN/ARC-201 (FM1) Btn 4"),        devices.ARC201_FM1, device_commands.fm1Btn4, 608)
-- elements["PNT-609"]	= default_button(_("AN/ARC-201 (FM1) Btn 5"),        devices.ARC201_FM1, device_commands.fm1Btn5, 609)
-- elements["PNT-610"]	= default_button(_("AN/ARC-201 (FM1) Btn 6"),        devices.ARC201_FM1, device_commands.fm1Btn6, 610)
-- elements["PNT-611"]	= default_button(_("AN/ARC-201 (FM1) Btn 7"),        devices.ARC201_FM1, device_commands.fm1Btn7, 611)
-- elements["PNT-612"]	= default_button(_("AN/ARC-201 (FM1) Btn 8"),        devices.ARC201_FM1, device_commands.fm1Btn8, 612)
-- elements["PNT-613"]	= default_button(_("AN/ARC-201 (FM1) Btn 9"),        devices.ARC201_FM1, device_commands.fm1Btn9, 613)
-- elements["PNT-614"]	= default_button(_("AN/ARC-201 (FM1) Btn 0"),        devices.ARC201_FM1, device_commands.fm1Btn0, 614)
-- elements["PNT-615"]	= default_button(_("AN/ARC-201 (FM1) Btn CLR"),      devices.ARC201_FM1, device_commands.fm1BtnClr, 615)
-- elements["PNT-616"]	= default_button(_("AN/ARC-201 (FM1) Btn ENT"),      devices.ARC201_FM1, device_commands.fm1BtnEnt, 616)
-- elements["PNT-617"]	= default_button(_("AN/ARC-201 (FM1) Btn FREQ"),     devices.ARC201_FM1, device_commands.fm1BtnFreq, 617)
-- elements["PNT-618"]	= default_button(_("AN/ARC-201 (FM1) Btn ERF/OFST"), devices.ARC201_FM1, device_commands.fm1BtnErfOfst, 618)
-- elements["PNT-619"]	= default_button(_("AN/ARC-201 (FM1) Btn TIME"),     devices.ARC201_FM1, device_commands.fm1BtnTime, 619)

-- -- AN/ARN-149
-- elements["PNT-620"]	= multiposition_switch(_("AN/ARN-149 PRESET Selector"),     devices.ARN149, device_commands.arn149Preset, 620, 3,  0.5,  false, 0, 100, false)
-- elements["PNT-621"]	= default_3_position_tumb(_("AN/ARN-149 TONE/OFF/TEST"),       devices.ARN149, device_commands.arn149ToneTest, 621, 8)
-- elements["PNT-622"]	= default_axis_limited(_("AN/ARN-149 Volume"),              devices.ARN149, device_commands.arn149Volume, 622, 0, 0.1, true, false, {0,1})
-- elements["PNT-623"]	= default_2_position_tumb(_("AN/ARN-149 TAKE CMD (Inop.)"),    devices.ARN149, device_commands.foo, 623, 8)
-- elements["PNT-624"]	= multiposition_switch(_("AN/ARN-149 POWER Selector"),      devices.ARN149, device_commands.arn149Power, 624, 3,  0.5,  false, 0, 100, false)
-- elements["PNT-625"]	= multiposition_switch(_("AN/ARN-149 1000s Khz Selector"),  devices.ARN149, device_commands.arn149thousands, 625, 3,  0.5,  false, 0, 100, false)
-- elements["PNT-626"]	= multiposition_switch(_("AN/ARN-149 100s Khz Selector"),   devices.ARN149, device_commands.arn149hundreds, 626, 10,  0.1,  false, 0, 100, true)
-- elements["PNT-627"]	= multiposition_switch(_("AN/ARN-149 10s Khz Selector"),    devices.ARN149, device_commands.arn149tens, 627, 10,  0.1,  false, 0, 100, true)
-- elements["PNT-628"]	= multiposition_switch(_("AN/ARN-149 1s Khz Selector"),     devices.ARN149, device_commands.arn149ones, 628, 10,  0.1,  false, 0, 100, true)
-- elements["PNT-629"]	= multiposition_switch(_("AN/ARN-149 .1s Khz Selector"),    devices.ARN149, device_commands.arn149tenths, 629, 10,  0.1,  false, 0, 100, true)

-- -- AN/ARN-147
-- elements["PNT-650"]	= multiposition_switch_relative(_("AN/ARN-147 MHz Selector"), devices.ARN147, device_commands.arn147MHz, 650, 10,  0.1,  false, 0, 100, true)
-- elements["PNT-651"]	= multiposition_switch_relative(_("AN/ARN-147 KHz Selector"), devices.ARN147, device_commands.arn147KHz, 651, 10,  0.1,  false, 0, 100, true)
-- elements["PNT-652"]	= default_2_position_tumb(_("AN/ARN-147 Marker Beacon HI/LO (Inop.)"),  devices.ARN147, device_commands.foo, 652, 8)
-- elements["PNT-653"]	= default_3_position_tumb(_("AN/ARN-147 Power Selector OFF/ON/TEST"),   devices.ARN147, device_commands.arn147Power, 653, 8)

-- -- WIPERS
MH_60R:defineTumb("WPRS", 46, 3288, 631, 0.5, { -0.5, 1 }, nil, false, "Misc", "Wipers PARK/OFF/LOW/HI")

-- -- ARC-201 FM2
-- elements["PNT-700"]	= multiposition_switch(_("AN/ARC-201 (FM2) PRESET Selector"),   devices.ARC201_FM2, device_commands.fm2PresetSelector, 700, 8,  0.01,  false, 0, 16, false)
-- elements["PNT-701"]	= multiposition_switch(_("AN/ARC-201 (FM2) FUNCTION Selector"), devices.ARC201_FM2, device_commands.fm2FunctionSelector, 701, 9,  0.01,  false, 0, 16, false)
-- elements["PNT-702"]	= multiposition_switch(_("AN/ARC-201 (FM2) PWR Selector"),      devices.ARC201_FM2, device_commands.fm2PwrSelector, 702, 4,  0.01,  false, 0, 16, false)
-- elements["PNT-703"]	= multiposition_switch(_("AN/ARC-201 (FM2) MODE Selector"),     devices.ARC201_FM2, device_commands.fm2ModeSelector, 703, 4,  0.01,  false, 0, 16, false)
-- elements["PNT-704"]	= default_axis_limited(_("AN/ARC-201 (FM2) Volume"),            devices.ARC201_FM2, device_commands.fm2Volume, 704, 0, 0.1, true, false, {0,1})

-- elements["PNT-705"]	= default_button(_("AN/ARC-201 (FM2) Btn 1"),        devices.ARC201_FM2, device_commands.fm2Btn1, 705)
-- elements["PNT-706"]	= default_button(_("AN/ARC-201 (FM2) Btn 2"),        devices.ARC201_FM2, device_commands.fm2Btn2, 706)
-- elements["PNT-707"]	= default_button(_("AN/ARC-201 (FM2) Btn 3"),        devices.ARC201_FM2, device_commands.fm2Btn3, 707)
-- elements["PNT-708"]	= default_button(_("AN/ARC-201 (FM2) Btn 4"),        devices.ARC201_FM2, device_commands.fm2Btn4, 708)
-- elements["PNT-709"]	= default_button(_("AN/ARC-201 (FM2) Btn 5"),        devices.ARC201_FM2, device_commands.fm2Btn5, 709)
-- elements["PNT-710"]	= default_button(_("AN/ARC-201 (FM2) Btn 6"),        devices.ARC201_FM2, device_commands.fm2Btn6, 710)
-- elements["PNT-711"]	= default_button(_("AN/ARC-201 (FM2) Btn 7"),        devices.ARC201_FM2, device_commands.fm2Btn7, 711)
-- elements["PNT-712"]	= default_button(_("AN/ARC-201 (FM2) Btn 8"),        devices.ARC201_FM2, device_commands.fm2Btn8, 712)
-- elements["PNT-713"]	= default_button(_("AN/ARC-201 (FM2) Btn 9"),        devices.ARC201_FM2, device_commands.fm2Btn9, 713)
-- elements["PNT-714"]	= default_button(_("AN/ARC-201 (FM2) Btn 0"),        devices.ARC201_FM2, device_commands.fm2Btn0, 714)
-- elements["PNT-715"]	= default_button(_("AN/ARC-201 (FM2) Btn CLR"),      devices.ARC201_FM2, device_commands.fm2BtnClr, 715)
-- elements["PNT-716"]	= default_button(_("AN/ARC-201 (FM2) Btn ENT"),      devices.ARC201_FM2, device_commands.fm2BtnEnt, 716)
-- elements["PNT-717"]	= default_button(_("AN/ARC-201 (FM2) Btn FREQ"),     devices.ARC201_FM2, device_commands.fm2BtnFreq, 717)
-- elements["PNT-718"]	= default_button(_("AN/ARC-201 (FM2) Btn ERF/OFST"), devices.ARC201_FM2, device_commands.fm2BtnErfOfst, 718)
-- elements["PNT-719"]	= default_button(_("AN/ARC-201 (FM2) Btn TIME"),     devices.ARC201_FM2, device_commands.fm2BtnTime, 719)

-- AUX SYSTEM CONTROL PANEL
MH_60R:defineToggleSwitch("MST_SNR_CVR", 49, 3534, 1998, "Aux System Panel", "Master Sonar Cover OPEN/CLOSE")
MH_60R:defineToggleSwitch("MST_ARM_SNR", 49, 3535, 1999, "Aux System Panel", "Master Arm Sonar OFF/ON")
MH_60R:defineToggleSwitch("MST_ARM_SON", 49, 3532, 2000, "Aux System Panel", "Master Arm Sonobuoys OFF/ON")
MH_60R:defineToggleSwitch("SONO_DISP", 49, 3533, 2001, "Aux System Panel", "Sonobuoy Dispense OFF/ON")
MH_60R:defineSpringloaded_3PosTumb("SNR_WNCH", 49, 3536, 3536, 2002, "Aux System Panel", "Winch Sonar DOWN/STOP/UP")
MH_60R:defineToggleSwitch("MST_SON_CVR", 49, 3531, 2003, "Aux System Panel", "Master Sonobuoys Cover OPEN/CLOSE")

-- WEAPONS SYSTEM CONTROL PANEL
MH_60R:defineToggleSwitch("MST_ARM_WPN", 49, 3423, 2004, "Weapons System Panel", "Master Arm Weapons OFF/ON")
MH_60R:defineMultipositionSwitch("SLV_SELC", 49, 3424, 2005, 7, 0.1, "Weapons System Panel", "Select SALVE")
MH_60R:defineToggleSwitch("MST_ARM_CVR", 49, 3425, 2006, "Weapons System Panel", "Master Arm Cover OPEN/CLOSE")

MH_60R:defineToggleSwitch("STA_LFT_PYL", 49, 3426, 2007, "Weapons System Panel", "Stat. Left Pyl. OFF/ON")
MH_60R:defineToggleSwitch("STA_LFT_SID", 49, 3427, 2008, "Weapons System Panel", "Stat. Left Side OFF/ON")
MH_60R:defineToggleSwitch("STA_RGT_SID", 49, 3428, 2009, "Weapons System Panel", "Stat. Right Side OFF/ON")
MH_60R:defineToggleSwitch("STA_RGT_PYL", 49, 3429, 2010, "Weapons System Panel", "Stat. Right Pyl. OFF/ON")

-- JETTISON
MH_60R:defineToggleSwitch("JET_SLC_SW", 49, 3437, 2011, "Jettison Panel", "Select Jett. Switch OFF/ON")
MH_60R:defineToggleSwitch("JET_SLC_CVR", 49, 3435, 2012, "Jettison Panel", "Select Jett. Cover OPEN/CLOSE")
MH_60R:defineToggleSwitch("JET_ALL_CVR", 49, 3434, 2013, "Jettison Panel", "All Jett. Cover OPEN/CLOSE")
MH_60R:defineToggleSwitch("JET_ALL", 49, 3436, 2014, "Jettison Panel", "All Jett. Switch OFF/ON")
MH_60R:defineMultipositionSwitch("JET_SELC", 49, 3433, 2016, 8, 0.1, "Jettison Panel", "Select STATIONS")

-- GUNSIGHT
MH_60R:defineMultipositionSwitch("GUN_COLR", 50, 3550, 2025, 3, 0.5, "GunSight", "GunSight COLOR")
MH_60R:definePotentiometer("GUN_MOVE", 50, 3551, 2026, { -1, 1 }, "GunSight", "GunSight Move UP/DOWN")

-- RADAR
MH_60R:definePotentiometer("RANGE_RDR", 49, 3539, 2023, { -1, 1 }, "Radar", "Range -/+")
MH_60R:definePotentiometer("SECT_RDR", 49, 3540, 2020, { -0.8, 0.9 }, "Radar", "Sector -/+")
MH_60R:defineMultipositionSwitch("MODE_RDR", 49, 3541, 2027, 4, 0.33, "Radar", "Mode OFF/ON/INT./SOL.")
MH_60R:defineSpringloaded_3PosTumb("SON_SELC", 49, 3542, 3542, 2028, "Radar", "Sonobuoys SURFACE/OFF/IMMERSION")
MH_60R:defineMultipositionSwitch("COAL_SELC", 49, 3543, 2029, 4, 0.33, "Radar", "Coalition Select ALL/NEUTRAL/FRIENDLY/ENEMY")
MH_60R:defineMultipositionSwitch("FAC_RANGE", 49, 3545, 2030, 2, 0.66, "Radar", "Range FACTOR")
MH_60R:defineMultipositionSwitch("CAT_SELC", 49, 3544, 2031, 2, 0.66, "Radar", "Category Select SEA/GROUND")
MH_60R:definePotentiometer("OFFSET_RDR", 49, 3546, 2032, { -0.9, 0.9 }, "Radar", "Rotation Sector <-/->")
MH_60R:defineToggleSwitch("LCK_TGT", 49, 3548, 2037, "Radar", "Lock Target OFF/ON")
MH_60R:definePushButton("RST_ROT", 49, 3547, 2039, "Radar", "Rotation Radar RESET")

return MH_60R
