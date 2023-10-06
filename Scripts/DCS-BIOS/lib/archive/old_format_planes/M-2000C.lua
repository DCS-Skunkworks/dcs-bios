BIOS.protocol.beginModule("M-2000C", 0x7200)
BIOS.protocol.setExportModuleAircrafts({"M-2000C"})
--v1.39 by Ergo,Matchstick,MisterKnife,WarLord,Espresso29470
local inputProcessors = moduleBeingDefined.inputProcessors
local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineIndicatorLight = BIOS.util.defineIndicatorLight
local defineIndicatorLightInverted = BIOS.util.defineIndicatorLightInverted
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineTumb = BIOS.util.defineTumb
local define3PosTumb = BIOS.util.define3PosTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineString = BIOS.util.defineString
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

--remove Arg# Pilot 1000
--Get Displays Functions

-- parse radios
local vhfFrequency = ""
local uhfFrequency = ""

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local radios = parse_indication(7)
	if not radios then return end

	local vhf = coerce_nil_to_string(radios.text_COM_UHF1)
	if vhf then
		vhfFrequency = vhf:sub(1,3) .. vhf:sub(5,6)
	end

	local uhf = coerce_nil_to_string(radios.text_COM_UHF2)
	if uhf then
		uhfFrequency = uhf:sub(1,3) .. uhf:sub(5,6)
	end
end

-- parse fuel
local fuelFlow = ""
local fuelJauge = ""
local fuelTotal = ""
local FUEL_FLOW_LEN = 3

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function(dev0)
	local fuel = parse_indication(3)
	if not fuel then return end
	fuelFlow = padLeft(fuel.txt_fuel_g, FUEL_FLOW_LEN)
	local jauge_thous = BIOS.util.round(dev0:get_argument_value(349),1,true)
	local jauge_cents = BIOS.util.round(dev0:get_argument_value(350),1,true)
	local jauge_tens = BIOS.util.round(dev0:get_argument_value(351),1,true)
	fuelJauge = string.sub(jauge_thous,3,3) .. string.sub(jauge_cents,3,3)  .. string.sub(jauge_tens,3,3)  .. "0"
	local fuelTotal_thous = BIOS.util.round(dev0:get_argument_value(352),1,true)
	local fuelTotal_cents = BIOS.util.round(dev0:get_argument_value(353),1,true)
	local fuelTotal_tens = BIOS.util.round(dev0:get_argument_value(354),1,true)
	fuelTotal = string.sub(fuelTotal_thous,3,3) .. string.sub(fuelTotal_cents,3,3)  .. string.sub(fuelTotal_tens,3,3)  .. "0"
end

-- parse PCA upper
local pcaUpper1 = ""
local pcaUpper2 = ""
local pcaUpper3 = ""
local pcaUpper4 = ""
local pcaUpper5 = ""
local PCA_UPPER_LEN = 3

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local pcaUpper = parse_indication(4)
	if not pcaUpper then return end

	pcaUpper1 = padLeft(pcaUpper.PCA_LCD_1_0, PCA_UPPER_LEN)
	pcaUpper2 = padLeft(pcaUpper.PCA_LCD_1_1, PCA_UPPER_LEN)
	pcaUpper3 = padLeft(pcaUpper.PCA_LCD_1_2, PCA_UPPER_LEN)
	pcaUpper4 = padLeft(pcaUpper.PCA_LCD_1_3, PCA_UPPER_LEN)
	pcaUpper5 = padLeft(pcaUpper.PCA_LCD_1_4, PCA_UPPER_LEN)
end

-- parse PCA lower
local pcaLower1 = ""
local pcaLower2 = ""
local pcaLower3 = ""
local pcaLower4 = ""
local pcaLower5 = ""
local PCA_LOWER_LEN = 3

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local pcaLower = parse_indication(5)
	if not pcaLower then return end

	pcaLower1 = padLeft(pcaLower.PCA_LCD_2_0, PCA_LOWER_LEN)
	pcaLower2 = padLeft(pcaLower.PCA_LCD_2_1, PCA_LOWER_LEN)
	pcaLower3 = padLeft(pcaLower.PCA_LCD_2_2, PCA_LOWER_LEN)
	pcaLower4 = padLeft(pcaLower.PCA_LCD_2_3, PCA_LOWER_LEN)
	pcaLower5 = padLeft(pcaLower.PCA_LCD_2_4, PCA_LOWER_LEN)
end

-- parse PPA
local ppaQuantity = ""
local ppaInterval = ""
local PPA_LEN = 2

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local ppa = parse_indication(6)
	if not ppa then return end

	ppaQuantity = padLeft(ppa.text_PPA_QTY, PPA_LEN)
	ppaInterval = padLeft(ppa.text_PPA_INT, PPA_LEN)
end

-- parse PCN upper display
local pcnLeftDigits = ""
local pcnRightDigits = ""
local pcnRight1Digit = ""
local pcnRight2Digit = ""
local pcnLeft1Digit = ""
local pcnLeft2Digit = ""

-- todo: need to set blank strings when pcn is nil?
moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local pcn = parse_indication(9)
	if not pcn then return end

	pcnLeftDigits = padLeft(pcn.PCN_UL_DIGITS, 8)
	pcnRightDigits = padLeft(pcn.PCN_UR_DIGITS, 9)

	local pcnRight = ""
	if pcn.PCN_UR_E then pcnRight = pcnRight.."E" end
	if pcn.PCN_UR_W then pcnRight = pcnRight.."W" end
	if pcn.PCN_UR_P then pcnRight = pcnRight.."+" end
	if pcn.PCN_UR_M then pcnRight = pcnRight.."-" end

	if #pcnRight > 1 then
		pcnRight1Digit = "*"
	else
		pcnRight1Digit = pcnRight
	end
	pcnRight2Digit = pcnRight:sub(1,2)

	local pcnLeft = ""
	if pcn.PCN_UL_N then pcnLeft = pcnLeft.."N" end
	if pcn.PCN_UL_S then pcnLeft = pcnLeft.."S" end
	if pcn.PCN_UL_P then pcnLeft = pcnLeft.."+" end
	if pcn.PCN_UL_M then pcnLeft = pcnLeft.."-" end

	if #pcnLeft > 1 then
		pcnLeft1Digit = "*"
	else
		pcnLeft1Digit = pcnLeft
	end
	pcnLeft2Digit = pcnLeft:sub(1,2)
end

-- parse PCN lower display
local pcnPrep = ""
local pcnDest = ""

moduleBeingDefined.exportHooks[#moduleBeingDefined.exportHooks+1] = function()
	local pcn = parse_indication(10)
	if not pcn then return end

	pcnPrep = padLeft(pcn.PCN_BL_DIGITS, 2)
	pcnDest = padLeft(pcn.PCN_BR_DIGITS, 2)
end

local function getvtbRange()
    local vtb = parse_indication(1)
    if vtb == nil then return "   " end
    local vtbRv = vtb["vtb-rdr-range"]
    return vtbRv
end

--ADI
defineToggleSwitch("ADI_CAGE_LEV", 1, 3314, 314, "ADI", "I - ADI - Cage Lever")
defineToggleSwitch("ADI_BKL_SW", 1, 3315, 315, "ADI", "I - ADI - Backlight Switch")
defineFloat("ADI_PITCH", 316, {-1, 1}, "ADI", "O - ADI - Pitch Position")
defineFloat("ADI_ROLL", 317, {-1, 1}, "ADI", "O - ADI - Roll Position")
defineFloat("ADI_COMPAS", 318, {-1, 1}, "ADI", "O - ADI - Compass Position")
defineFloat("ADI_FLAG", 319, {0, 1}, "ADI", "O - ADI - Flag")
defineIndicatorLight("ADI_LIGHT", 321, "ADI", "O - ADI - Marker Light (yellow)")
defineFloat("ADI_ILS_V", 322, {-1, 1}, "ADI", "O - ADI - Vertical ILS Needle")
defineFloat("ADI_ILS_H", 323, {-1, 1}, "ADI", "O - ADI - Horizontal ILS Needle")
defineFloat("ADI_BILLE", 320, {-1, 1}, "ADI", "O - ADI - Bille")

--AIR FLOW PANEL (BECS, PELLES, SOURIS)
defineToggleSwitch("INTAKE_SLATS_OP_SW", 3, 3460, 460, "AIR FLOW PANEL", "I - Intake Slats Operation Switch (PELLES)")
defineToggleSwitch("CONES_OP_SW", 3, 3461, 461, "AIR FLOW PANEL", "I - Intake Cones Operation Switch (SOURIS)")
define3PosTumb("SLATS_OP_SW", 14, 3462, 462, "AIR FLOW PANEL", "I - Slats Operation Switch (BECS)")

--ALTIMETER
defineRotary("BARO_PRESS_CALIB", 1, 3309, 309, "ALTIMETER", "I - ALT - Barometric Pressure Calibration")
defineFloat("ALT_NEEDLE", 305, {0, 1}, "ALTIMETER", "O - ALT - Needle")
defineFloat("ALT_KCENTS", 306, {0, 1}, "ALTIMETER", "O - ALT - x10 000 ft display")
defineFloat("ALT_THOUS", 307, {0, 1}, "ALTIMETER", "O - ALT - x1000 ft display")
defineFloat("ALT_CENTS", 308, {0, 1}, "ALTIMETER", "O - ALT - x100 ft display")
defineFloat("ALT_BARO_THOUS", 310, {0, 1}, "ALTIMETER", "O - ALT - x1000 Baro Press display")
defineFloat("ALT_BARO_CENTS", 311, {0, 1}, "ALTIMETER", "O - ALT - x100 Baro Press display")
defineFloat("ALT_BARO_TENS", 312, {0, 1}, "ALTIMETER", "O - ALT - x10 Baro Press display")
defineFloat("ALT_BARO_ONES", 313, {0, 1}, "ALTIMETER", "O - ALT - x1 Baro Press display")

--AOA
defineFloat("AOA_POS", 331, {0, 1}, "AOA", "O - AOA - Indicator")
defineFloat("AOA_FLAG", 332, {0, 1}, "AOA", "O - AOA - Flag")

--AUDIO PANEL
defineToggleSwitch("AMPLIS_SEL_KNOB", 16, 3700, 700, "AUDIO PANEL", "I - AMPLIS Selector Knob")
definePotentiometer("VORILS_VOL_KNOB", 16, 3701, 701, {0, 1}, "AUDIO PANEL", "I - VOR/ILS Volume Knob")
definePotentiometer("TAC_VOL_KNOB", 16, 3702, 702, {0, 1}, "AUDIO PANEL", "I - TACAN Volume Knob")
definePotentiometer("MAGIC_TONE_VOL_KNOB", 16, 3703, 703, {0, 1}, "AUDIO PANEL", "I - MAGIC Tone Volume Knob")
definePotentiometer("TB_APP_VOL_KNOB", 16, 3704, 704, {0, 1}, "AUDIO PANEL", "I - TB APP Volume Knob")
definePotentiometer("MRK_SIG_VOL_KNOB", 16, 3705, 705, {0, 1}, "AUDIO PANEL", "I - Marker Signal Volume Knob")
definePotentiometer("UHF_RADIO_VOL_KNOB", 16, 3706, 706, {0, 1}, "AUDIO PANEL", "I - UHF - Radio Volume Knob")
definePotentiometer("VUHF_RADIO_VOL_KNOB", 16, 3707, 707, {0, 1}, "AUDIO PANEL", "I - U/VHF - Radio Volume Knob")

--AUTOPILOT
definePushButton("AP_MASTER_BTN", 17, 3282, 282, "AUTOPILOT", "I - Autopilot Master Button")
definePushButton("ALT_HOLD_BTN", 17, 3285, 285, "AUTOPILOT", "I - Altitude Hold Button")
definePushButton("SEL_ALT_HOLD_BTN", 17, 3288, 288, "AUTOPILOT", "I - Selected Altitude Hold Button")
definePushButton("APP_HOLD_BTN", 17, 3294, 294, "AUTOPILOT", "I - Approach Hold Button")
defineMultipositionSwitch("ALT_10K_FT_SEL", 17, 3299, 299, 6, 0.1, "AUTOPILOT", "I - BCD - Altitude 10000 ft Selector")
defineMultipositionSwitch("ALT_1K_FT_SEL", 17, 3300, 300, 10, 0.1, "AUTOPILOT", "I - Altitude 1000 ft Selector")
defineMultipositionSwitch("ALT_100_FT_SEL", 17, 3301, 301, 10, 0.1, "AUTOPILOT", "I - Altitude 100 ft Selector")
definePushButton("AP_LGT_TEST_BTN", 17, 3302, 302, "AUTOPILOT", "I - Autopilot Lights Test Button")
defineIndicatorLight("AP_MASTER_AMBRE", 283, "AUTOPILOT", "O - AP - Master Amber Light (yellow)")
defineIndicatorLight("AP_MASTER_VERT", 284, "AUTOPILOT", "O - AP - Master Green Light (green)")
defineIndicatorLight("AP_ALT_VERT", 286, "AUTOPILOT", "O - AP - Alt Hold Green Light (green)")
defineIndicatorLight("AP_ALT_AMBRE", 287, "AUTOPILOT", "O - AP - Alt Hold Amber Light (yellow)")
defineIndicatorLight("AP_SELECT_ALT_VERT", 289, "AUTOPILOT", "O - AP - Sel Alt Hold Green Light (green)")
defineIndicatorLight("AP_SELECT_ALT_AMBRE", 290, "AUTOPILOT", "O - AP - Sel Alt Hold Amber Light (yellow)")
defineIndicatorLight("AP_NC_VERT", 292, "AUTOPILOT", "O - AP - Free Green Light (green)")
defineIndicatorLight("AP_NC_AMBRE", 293, "AUTOPILOT", "O - AP - Free Amber Light (yellow)")
defineIndicatorLight("AP_L_VERT", 295, "AUTOPILOT", "O - AP - L Green Light (green)")
defineIndicatorLight("AP_L_AMBRE", 296, "AUTOPILOT", "O - AP - L Amber Light (yellow)")
defineIndicatorLight("AP_G_VERT", 297, "AUTOPILOT", "O - AP - G Green Light (green)")
defineIndicatorLight("AP_G_AMBRE", 298, "AUTOPILOT", "O - AP - G Amber Light (yellow)")

--BACKUP ADI
defineToggleSwitch("SB_ADI_CAGE_SW", 1, 3325, 325, "BACKUP ADI", "I - BKADI - UNCAGE")
defineRotary("SB_ADI_ROT", 1, 3328, 328, "BACKUP ADI", "I - BKADI - Set")
defineFloat("SB_ADI_ROLL", 326, {-1, 1}, "BACKUP ADI", "O - BKADI - Roll Position")
defineFloat("SB_ADI_PITCH", 327, {-1, 1}, "BACKUP ADI", "O - BKADI - Pitch Position")
defineFloat("SB_ADI_FLAG", 329, {0, 1}, "BACKUP ADI", "O - BKADI - Flag")

--CAUTION LIGHT PANEL
defineIndicatorLight("CLP_BATT", 525, "CAUTION LIGHT PANEL", "O - CLP - BATT Indicator Indicator Light (yellow)")
defineIndicatorLight("CLP_TRN", 526, "CAUTION LIGHT PANEL", "O - CLP - TR Indicator Indicator Light (yellow)")
defineIndicatorLight("CLP_ALT_1", 527, "CAUTION LIGHT PANEL", "O - CLP - ALT.1 Indicator Indicator Light (yellow)")
defineIndicatorLight("CLP_ALT_2", 528, "CAUTION LIGHT PANEL", "O - CLP - ALT.2 Indicator Indicator Light (yellow)")
defineIndicatorLight("CLP_HUILE", 529, "CAUTION LIGHT PANEL", "O - CLP - HUILE Indicator Indicator Light (red)")
defineIndicatorLight("CLP_T7", 530, "CAUTION LIGHT PANEL", "O - CLP - T7 Indicator Indicator Light (red)")
defineIndicatorLight("CLP_CALC", 531, "CAUTION LIGHT PANEL", "O - CLP - CALC Indicator Light (yellow)")
defineIndicatorLight("CLP_SOURIS", 532, "CAUTION LIGHT PANEL", "O - CLP - SOURIS Indicator Light (yellow)")
defineIndicatorLight("CLP_PELLES", 533, "CAUTION LIGHT PANEL", "O - CLP - PELLES Indicator Light (yellow)")
defineIndicatorLight("CLP_BP", 534, "CAUTION LIGHT PANEL", "O - CLP - BP Indicator Light (red)")
defineIndicatorLight("CLP_BP_G", 535, "CAUTION LIGHT PANEL", "O - CLP - BP G Indicator Light (yellow)")
defineIndicatorLight("CLP_BP_D", 536, "CAUTION LIGHT PANEL", "O - CLP - BP D Indicator Light (yellow)")
defineIndicatorLight("CLP_TRANSF", 537, "CAUTION LIGHT PANEL", "O - CLP - TRANSF Indicator Light (yellow)")
defineIndicatorLight("CLP_NIVEAU", 538, "CAUTION LIGHT PANEL", "O - CLP - NIVEAU Indicator Light (yellow)")
defineIndicatorLight("CLP_HYD_1", 539, "CAUTION LIGHT PANEL", "O - CLP - HYD.1 Indicator Light (yellow)")
defineIndicatorLight("CLP_HYD_2", 540, "CAUTION LIGHT PANEL", "O - CLP - HYD.2 Indicator Light (yellow)")
defineIndicatorLight("CLP_HYD_S", 541, "CAUTION LIGHT PANEL", "O - CLP - HYD.S Indicator Light (red)")
defineIndicatorLight("CLP_EP", 542, "CAUTION LIGHT PANEL", "O - CLP - EP Indicator Light (yellow)")
defineIndicatorLight("CLP_BINGO", 543, "CAUTION LIGHT PANEL", "O - CLP - BINGO Indicator Light (yellow)")
defineIndicatorLight("CLP_P_CAB", 544, "CAUTION LIGHT PANEL", "O - CLP - P.CAB Indicator Light (red)")
defineIndicatorLight("CLP_TEMP", 545, "CAUTION LIGHT PANEL", "O - CLP - TEMP Indicator Light (yellow)")
defineIndicatorLight("CLP_REG_O2", 546, "CAUTION LIGHT PANEL", "O - CLP - REG O2 Indicator Light (red)")
defineIndicatorLight("CLP_5MN_O2", 547, "CAUTION LIGHT PANEL", "O - CLP - 5mn O2 Indicator Light (yellow)")
defineIndicatorLight("CLP_O2_HA", 548, "CAUTION LIGHT PANEL", "O - CLP - O2 HA Indicator Light (yellow)")
defineIndicatorLight("CLP_ANEMO", 549, "CAUTION LIGHT PANEL", "O - CLP - ANEMO Indicator Light (yellow)")
defineIndicatorLight("CLP_CC", 550, "CAUTION LIGHT PANEL", "O - CLP - CC Indicator Light (yellow)")
defineIndicatorLight("CLP_DSV", 551, "CAUTION LIGHT PANEL", "O - CLP - DSV Indicator Light (red)")
defineIndicatorLight("CLP_CONDIT", 552, "CAUTION LIGHT PANEL", "O - CLP - CONDIT Indicator Light (red)")
defineIndicatorLight("CLP_CONF", 553, "CAUTION LIGHT PANEL", "O - CLP - CONF Indicator Light (yellow)")
defineIndicatorLight("CLP_PA", 554, "CAUTION LIGHT PANEL", "O - CLP - PA Indicator Light (red)")
defineIndicatorLight("CLP_MAN", 555, "CAUTION LIGHT PANEL", "O - CLP - MAN Indicator Light (yellow)")
defineIndicatorLight("CLP_DOM", 556, "CAUTION LIGHT PANEL", "O - CLP - DOM Indicator Light (red)")
defineIndicatorLight("CLP_BECS", 557, "CAUTION LIGHT PANEL", "O - CLP - BECS Indicator Light (yellow)")
defineIndicatorLight("CLP_US_EL", 558, "CAUTION LIGHT PANEL", "O - CLP - U.S EL Indicator Light (red)")
defineIndicatorLight("CLP_INCIDENCE", 559, "CAUTION LIGHT PANEL", "O - CLP - INCIDENCE Indicator Light (yellow)")
defineIndicatorLight("CLP_GAIN", 560, "CAUTION LIGHT PANEL", "O - CLP - GAIN Indicator Light (red)")
defineIndicatorLight("CLP_RPM", 561, "CAUTION LIGHT PANEL", "O - CLP - RPM Indicator Light (red)")
defineIndicatorLight("CLP_DECOL", 562, "CAUTION LIGHT PANEL", "O - CLP - DECOL Indicator Light (red)")
defineIndicatorLight("CLP_PARK", 563, "CAUTION LIGHT PANEL", "O - CLP - PARK Indicator Light (yellow)")

--ELECTRIC PANEL
defineToggleSwitch("MAIN_BATT_SW", 8, 3520, 520, "ELECTRIC PANEL", "I - Main Battery Switch")
defineToggleSwitch("ELEC_PWR_TRANSF_SW", 8, 3521, 521, "ELECTRIC PANEL", "I - Electric Power Transfer Switch")
defineToggleSwitch("ALT_1_SW", 8, 3522, 522, "ELECTRIC PANEL", "I - Alternator 1 Switch")
defineToggleSwitch("ALT_2_SW", 8, 3523, 523, "ELECTRIC PANEL", "I - Alternator 2 Switch")
define3PosTumb("LGT_TEST_SW", 8, 3524, 524, "ELECTRIC PANEL", "I - Lights Test Switch")

--CLOCK
defineToggleSwitch("COC_CLOCK", 22, 3400, 400, "CLOCK", "I - CLOCK - Cockpit Clock Position")
defineFloat("CLK_H", 401, {0, 1}, "CLOCK", "O - CLOCK - Hours Needle")
defineFloat("CLK_M", 402, {0, 1}, "CLOCK", "O - CLOCK - Minutes Needle")
defineFloat("CLK_S", 403, {0, 1}, "CLOCK", "O - CLOCK - Seconds Needle")

--CONFIGURATION PANEL
defineIndicatorLight("CONF_A", 410, "CONFIGURATION PANEL", "O - CONF - A Light (yellow)")
defineIndicatorLight("CONF_F", 411, "CONFIGURATION PANEL", "O - CONF - F Light (yellow)")
defineIndicatorLight("CONF_DIRAV", 412, "CONFIGURATION PANEL", "O - CONF - DIRAV Light (blue)")
defineIndicatorLight("CONF_FREIN", 413, "CONFIGURATION PANEL", "O - CONF - FREIN Light (yellow)")
defineIndicatorLight("CONF_CROSS", 414, "CONFIGURATION PANEL", "O - CONF - CROSS Light (yellow)")
defineIndicatorLight("CONF_SPAD", 415, "CONFIGURATION PANEL", "O - CONF - SPAD Light (yellow)")
defineIndicatorLight("CONF_ROUGE", 416, "CONFIGURATION PANEL", "O - CONF - Landing Gear Light (red)")
defineIndicatorLight("CONF_G", 417, "CONFIGURATION PANEL", "O - CONF - Left Landing Gear Light (green)")
defineIndicatorLight("CONF_AUX", 418, "CONFIGURATION PANEL", "O - CONF - Aux Landing Gear Light (green)")
defineIndicatorLight("CONF_D", 419, "CONFIGURATION PANEL", "O - CONF - Right Landing Gear Light (green)")

--ECM BOX
definePushButton("ECM_BOX_BLT_SW", 28, 3990, 990, "ECM BOX", "I - ECM Box Clear Button")
defineIndicatorLight("ECM_BOX_LL", 991, "ECM BOX", "O - ECM Box LL Light (green)")
defineIndicatorLight("ECM_BOX_EM", 992, "ECM BOX", "O - ECM Box EM EM Light (yellow)")
defineIndicatorLight("ECM_BOX_IR", 993, "ECM BOX", "O - ECM Box IR Light (yellow)")
defineIndicatorLight("ECM_BOX_EO", 994, "ECM BOX", "O - ECM Box EO Light (yellow)")

--ENVIRONMENT CONTROL PANEL
defineToggleSwitch("ECS_MAIN_MODE_SW", 25, 3630, 630, "ECS PANEL", "I - ECS Main Mode Switch")
defineToggleSwitch("ECS_C_BTN", 25, 3631, 631, "ECS PANEL", "I - ECS C Button")
defineToggleSwitch("ECS_F_BTN", 25, 3633, 633, "ECS PANEL", "I - ECS F Button")
defineToggleSwitch("ECS_COND_SW", 25, 3635, 635, "ECS PANEL", "I - ECS Cond Switch")
defineToggleSwitch("ECS_AIR_EXCH_SW", 25, 3636, 636, "ECS PANEL", "I - ECS Air Exchange Switch")
defineRotary("ECS_TEMP_SELECT_KNOB", 25, 3637, 637, "ECS PANEL", "I - ECS Temperature Select Knob")
defineToggleSwitch("ECS_DEFOG_SW", 25, 3638, 638, "ECS PANEL", "I - ECS Defog Switch")
defineIndicatorLight("CLIM_C", 632, "ECS PANEL", "O - ECS - C Light (yellow)")
defineIndicatorLight("CLIM_F", 634, "ECS PANEL", "O - ECS - F Light (yellow)")

--ENGINE GAUGE
defineFloat("N_RPM", 369, {0, 1}, "ENGINE GAUGE", "O - ENG - RPM Needle")
defineFloat("T7_NEEDLE", 370, {0, 1}, "ENGINE GAUGE", "O - ENG - Tt7 Needle")
defineFloat("RPM_TENS", 371, {0, 1}, "ENGINE GAUGE", "O - ENG - x10 RPM display")
defineFloat("RPM_ONES", 372, {0, 1}, "ENGINE GAUGE", "O - ENG - x1 RPM display")

--ENGINE START PANEL
definePushButton("ENG_SHUTDOWN_BTN", 7, 3467, 467, "ENGINE START PANEL", "I - Engine Shutdown Button")
defineToggleSwitch("ENG_START_SW_COV", 7, 3645, 645, "ENGINE START PANEL", "I - Engine Start Switch Cover")
defineToggleSwitch("START_FUEL_PUMP_SW", 7, 3646, 646, "ENGINE START PANEL", "I - Starter Fuel Pump Switch")
defineToggleSwitch("ENG_FUEL_L_PUMP_SW", 4, 3647, 647, "ENGINE START PANEL", "I - Engine Fuel Left Boost Pump Switch")
defineToggleSwitch("ENG_FUEL_R_PUMP_SW", 4, 3648, 648, "ENGINE START PANEL", "I - Engine Fuel Right Boost Pump Switch")
definePushButton("ENG_START_SW", 7, 3649, 649, "ENGINE START PANEL", "I - Engine Start Switch")
defineToggleSwitch("FUEL_CUTOFF_SW_COV", 7, 3651, 651, "ENGINE START PANEL", "I - Fuel Cutoff Switch Cover")
defineToggleSwitch("FUEL_CUTOFF_SW", 7, 3652, 652, "ENGINE START PANEL", "I - Fuel Cutoff Switch")
defineTumb("INGIT_SEL_SW", 7, 3650, 650, 0.5, {0, 1}, nil, false, "ENGINE START PANEL", "I - Igniter Selector Switch")

--ELECTRONIC WAR PANEL
defineTumb("BR_PWR_SW", 13, 3606, 606, 0.5, {0, 1}, nil, false, "EW PANEL", "I - BR Power Switch")
defineTumb("RWR_PWR_SW", 13, 3607, 607, 0.5, {0, 1}, nil, false, "EW PANEL", "I - RWR Power Switch")
defineTumb("D2M_PWR_SW", 13, 3608, 608, 0.5, {0, 1}, nil, false, "EW PANEL", "I - D2M Power Switch")
defineTumb("DECOY_REL_MODE_SW", 13, 3609, 609, 0.5, {0, 1}, nil, false, "EW PANEL", "I - Decoy Release Mode Switch")
defineTumb("DECOY_REL_PGM_KNOB", 13, 3610, 610, 0.1, {0, 1}, nil, false, "EW PANEL", "I - Decoy Release Program Knob")
define3PosTumb("EW_MODE_SEL_SW", 13, 3605, 605, "EW PANEL", "I - EW Mode Selector Switch")

--EXTERIOR LIGHTS
defineToggleSwitch("POLICE_LGT_SW", 16, 3449, 449, "EXT LIGHTS", "I - Police Lights Switch")
defineToggleSwitch("ANTI_COL_LGT_SW", 16, 3453, 453, "EXT LIGHTS", "I - Anti-Collision Lights Switch")
defineToggleSwitch("NAV_LGT_SW", 16, 3454, 454, "EXT LIGHTS", "I - Navigation Lights Switch")
defineToggleSwitch("FORM_LGT_SW", 16, 3455, 455, "EXT LIGHTS", "I - Formation Lights Switch")
definePotentiometer("REFUEL_LGT_BRIGHT_KNOB", 16, 3920, 920, {0, 1}, "EXT LIGHTS", "I - Refuel Lights Brightness Knob")
defineTumb("LDG_LGT_SW", 16, 3450, 450, 0.5, {0, 1}, nil, false, "EXT LIGHTS", "I - Landing Lights Switch")

--FUEL SYSTEM
defineMultipositionSwitch("AAR_SW", 7, 3193, 193, 3, 0.5, "FUEL SYSTEM", "I - Air Refuel Transfer Switch")
defineToggleSwitch("FUEL_DETOT_SW", 4, 3355, 355, "FUEL SYSTEM", "I - DETOT Switch")
defineToggleSwitch("FUEL_CROF_SW", 4, 3357, 357, "FUEL SYSTEM", "I - Fuel Crossfeeed Switch")
defineMultipositionSwitch("BINGO_FUEL_1K_KG_SEL", 4, 3360, 360, 10, 0.1, "FUEL SYSTEM", "I - Bingo Fuel 1000 kg Selector")
defineMultipositionSwitch("BINGO_FUEL_100_KG_SEL", 4, 3361, 361, 10, 0.1, "FUEL SYSTEM", "I - Bingo Fuel 100 kg Selector")
defineToggleSwitch("FUEL_DMP_SW_COV", 4, 3477, 477, "FUEL SYSTEM", "I - FUEL - Dump Switch Cover")
defineToggleSwitch("FUEL_DMP_SW", 4, 3478, 478, "FUEL SYSTEM", "I - FUEL - Dump Switch")

defineTumb("FUEL_TRANSF_SW", 0, 3356, 356, 0.5, {0, 1}, nil, false, "FUEL SYSTEM", "I - Transfer Switch")
defineFloat("FUEL_JAUG_THOUS", 349, {0, 1}, "FUEL SYSTEM", "O - FUEL - x1000 JAUGE display")
defineFloat("FUEL_JAUG_CENTS", 350, {0, 1}, "FUEL SYSTEM", "O - FUEL - x100 JAUGE display")
defineFloat("FUEL_JAUG_TENS", 351, {0, 1}, "FUEL SYSTEM", "O - FUEL - x10 JAUGE display")
defineFloat("FUEL_DETOT_THOUS", 352, {0, 1}, "FUEL SYSTEM", "O - FUEL - x1000 DETOT display")
defineFloat("FUEL_DETOT_CENTS", 353, {0, 1}, "FUEL SYSTEM", "O - FUEL - x100 DETOT display")
defineFloat("FUEL_DETOT_TENS", 354, {0, 1}, "FUEL SYSTEM", "O - FUEL - x10 DETOT display")
defineFloat("FUEL_JAUG_G", 358, {0, 1}, "FUEL SYSTEM", "O - FUEL - LEFT JAUGE display")
defineFloat("FUEL_JAUG_D", 359, {0, 1}, "FUEL SYSTEM", "O - FUEL - RIGHT JAUGE display")

defineIndicatorLight("FUEL_RL_G", 362, "FUEL SYSTEM", "O - FUEL - Left RL Light (yellow)")
defineIndicatorLight("FUEL_RL_M", 363, "FUEL SYSTEM", "O - FUEL - Center RL Light (yellow)")
defineIndicatorLight("FUEL_RL_D", 364, "FUEL SYSTEM", "O - FUEL - Right RL Light (yellow)")
defineIndicatorLight("FUEL_AV_G", 365, "FUEL SYSTEM", "O - FUEL - Left AV Light (yellow)")
defineIndicatorLight("FUEL_AV_D", 366, "FUEL SYSTEM", "O - FUEL - Right AV Light (yellow)")
defineIndicatorLight("FUEL_V_G", 367, "FUEL SYSTEM", "O - FUEL - Left V Light (yellow)")
defineIndicatorLight("FUEL_V_D", 368, "FUEL SYSTEM", "O - FUEL - Right V Light (yellow)")
defineString("FUEL_FLOW", function() return fuelFlow end, FUEL_FLOW_LEN, "FUEL SYSTEM", "O - FUEL - Fuel Flow Display")

--ACCELEROMETER
defineFloat("GMETER_NEEDLE", 347, {-1, 1}, "G-METER", "O - ACC - G Needle")

--HSI
define3PosTumb("HSI_VAD_SEL", 2, 3340, 340, "HSI", "I - HSI - VAD Selector")
defineTumb("HSI_MODE_SEL_SW", 2, 3341, 341, 0.1, {0, 1}, nil, false, "HSI", "I - HSI - Mode Selector Switch")
defineFloat("HSI_HDG", 333, {0, 1}, "HSI", "O - HSI - AP Heading (Green Arrow)")
defineFloat("HSI_D_NEEDLE", 334, {0, 1}, "HSI", "O - HSI - COURSE (Double Needle)")
defineFloat("HSI_NEEDLE", 335, {0, 1}, "HSI", "O - HSI - VAD (Simple Needle)")
defineFloat("HSI_DIST_CENTS", 336, {0, 0.99}, "HSI", "O - HSI x100 Distance display")
defineFloat("HSI_DIST_TENS", 337, {0, 0.99}, "HSI", "O - HSI x10 Distance display")
defineFloat("HSI_DIST_ONES", 338, {0, 0.99}, "HSI", "O - HSI x1 Distance display")
defineFloat("HSI_DIST_DEC", 339, {0, 0.99}, "HSI", "O - HSI x.1 Distance display")
defineFloat("HSI_COMPAS", 342, {0, 1}, "HSI", "O - HSI - Compass")
defineFloat("HSI_FLAG_DIST", 343, {0, 1}, "HSI", "O - HSI - Distance Flag")
defineFloat("HSI_FLAG_G", 344, {0, 1}, "HSI", "O - HSI - Left Flag")
defineFloat("HSI_FLAG_D", 345, {0, 1}, "HSI", "O - HSI - Right Flag")
defineFloat("HSI_FLAG_M", 346, {0, 1}, "HSI", "O - HSI - Center Flag")

--IFF
defineMultipositionSwitch("RAD_IFF_MODE_SW", 11, 3598, 598, 6, 0.2, "IFF", "I - IFF INT -  Mode Switch")
defineMultipositionSwitch("RAD_IFF_POW_SW", 11, 3600, 600, 3, 0.5, "IFF", "I - IFF INT -  Power Switch")
defineToggleSwitch("RAD_IFF_L_R_SEL", 11, 3599, 599, "IFF", "I - IFF INT -  L/R Selector")

defineTumb("RAD_IFF_CODE4_SEL", 11, 3601, 601, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF INT -  Code-4 Selector")
defineTumb("RAD_IFF_CODE3_SEL", 11, 3602, 602, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF INT -  Code-3 Selector")
defineTumb("RAD_IFF_CODE2_SEL", 11, 3603, 603, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF INT -  Code-2 Selector")
defineTumb("RAD_IFF_CODE1_SEL", 11, 3604, 604, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF INT -  Code-1 Selector")

defineTumb("MODE_1_10_SEL", 4, 3377, 377, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF REP - Mode-1 Tens Selector")
defineTumb("MODE_1_1_SEL", 4, 3378, 378, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF REP - Mode-1 Ones Selector")
defineTumb("MODE_A_1K_SEL", 4, 3379, 379, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF REP - Mode-3A Thousands Selector")
defineTumb("MODE_3A_100_SEL", 4, 3380, 380, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF REP - Mode-3A Hundreds Selector")
defineTumb("MODE_3A_10_SEL", 4, 3381, 381, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF REP - Mode-3A Tens Selector")
defineTumb("MODE_3A_1_SEL", 4, 3382, 382, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF REP - Mode-3A Ones Selector")

defineToggleSwitch("IDENT_PWR_SW", 4, 3383, 383, "IFF", "I - IFF REP - Ident Power Switch")
defineToggleSwitch("MODE_1_SW", 4, 3384, 384, "IFF", "I - IFF REP - Mode-1 Switch")
defineToggleSwitch("MODE_2_SW", 4, 3385, 385, "IFF", "I - IFF REP - Mode-2 Switch")
defineToggleSwitch("MODE_3A_SW", 4, 3386, 386, "IFF", "I - IFF REP - Mode-3A Switch")
defineToggleSwitch("MODE_C_SW", 4, 3387, 387, "IFF", "I - IFF REP - Mode-C Switch")
defineToggleSwitch("IFF_M4_SW", 4, 3390, 390, "IFF", "I - IFF REP - ON/OUT MODE 4 Switch")
defineIndicatorLight("IFF_ON", 388, "IFF", "O - IFF REP - ON Light (green)")
defineIndicatorLight("IFF_FAULT", 394, "IFF", "O - IFF REP - Fault Light (yellow)")

--INTERIOR LIGHTS
definePotentiometer("LGT_BRIGHT_CTRL_TEST", 9, 3575, 575, {0, 1}, "INT LIGHTS", "I - PCN Brightnes/Test")
definePotentiometer("DASH_UV_LGT_KNOB", 16, 3639, 639, {0, 1}, "INT LIGHTS", "I - Dashboard U.V. Lights Knob")
definePotentiometer("DASH_PANEL_LGT_KNOB", 16, 3640, 640, {0, 1}, "INT LIGHTS", "I - Dashboard Panel Lights Knob")
definePotentiometer("RED_FLOOD_LGT_KNOB", 16, 3641, 641, {0, 1}, "INT LIGHTS", "I - Red Flood Lights Knob")
definePotentiometer("CONS_PANEL_LGT_KNOB", 16, 3642, 642, {0, 1}, "INT LIGHTS", "I - Console Panel Lights Knob")
definePotentiometer("CAUT_ADV_LGT", 16, 3643, 643, {0, 1}, "INT LIGHTS", "I - Caution/Advisory Lights Rheostat")
definePotentiometer("WH_FLOOD_LGT_KNOB", 16, 3644, 644, {0, 1}, "INT LIGHTS", "I - White Flood Lights Knob")

--LEFT CONSOLE
defineToggleSwitch("EMER_THROTTLE_COV", 7, 3464, 464, "LEFT CONSOLE", "I - Emergency Throttle Cover")
defineToggleSwitch("EMER_THROTTLE_HAND", 7, 3465, 465, "LEFT CONSOLE", "I - Emergency Throttle")
definePushButton("ENG_INFLGT_START_SW", 7, 3468, 468, "LEFT CONSOLE", "I - Engine In-Flight Start Switch")
defineToggleSwitch("AB_EMER_CUTOFF_SW_COV", 4, 3471, 471, "LEFT CONSOLE", "I - A/B Emergency Cutoff Switch Cover")
defineToggleSwitch("AB_EMER_CUTOFF_SW", 4, 3472, 472, "LEFT CONSOLE", "I - A/B Emergency Cutoff Switch")
defineToggleSwitch("SEC_HUILE_SW_COVER", 7, 3473, 473, "LEFT CONSOLE", "I - Secours Huile Switch Cover")
defineToggleSwitch("SEC_HUILE_SW", 7, 3474, 474, "LEFT CONSOLE", "I - Secours Huile Switch")
defineToggleSwitch("ENG_EMER_CTRL_COV", 7, 3475, 475, "LEFT CONSOLE", "I - Engine Emergency Control Cover")
defineToggleSwitch("ENG_EMER_CTRL_SW", 7, 3476, 476, "LEFT CONSOLE", "I - Engine Emergency Control Switch")
defineToggleSwitch("FBW_CH_5_SW_COV", 17, 3479, 479, "LEFT CONSOLE", "I - FBW - Channel 5 Switch Cover")
defineToggleSwitch("FBW_CH_5_SW", 17, 3480, 480, "LEFT CONSOLE", "I - FBW - Channel 5 Switch")
defineToggleSwitch("ANTI_SKID_SW_COV", 22, 3458, 458, "LEFT CONSOLE", "I - Anti-Skid Switch Cover")
defineToggleSwitch("ANTI_SKID_SW", 22, 3459, 459, "LEFT CONSOLE", "I - Anti-Skid Switch")
defineToggleSwitch("SERPAM_REC_SW", 16, 3452, 452, "LEFT CONSOLE", "I - SERPAM Recorder Switch")

definePushButton("RAD_VALI_CHAN_CHANGE", 11, 3489, 489, "RADAR", "I - Validate Channel Change")

--LEFT PANEL
defineToggleSwitch("FBW_SPIN_MODE_SW", 3, 3330, 330, "LEFT PANEL", "I - FBW - Spin Mode Switch")
defineToggleSwitch("LDG_LEV", 4, 3404, 404, "LEFT PANEL", "I - LDG - Landing Gear Lever")
defineToggleSwitch("SAFE_GND_SW", 0, 3407, 407, "LEFT PANEL", "I - LDG - Safety Ground Override")
defineToggleSwitch("LDG_EMER_REL_LEV", 4, 3408, 408, "LEFT PANEL", "I - LDG - Landing Gear Emergency Release Lever")
defineToggleSwitch("FBW_GAIN_MODE_SW_COV", 3, 3420, 420, "LEFT PANEL", "I - FBW - Gain Mode Switch Cover")
defineToggleSwitch("FBW_GAIN_MODE_SW", 3, 3421, 421, "LEFT PANEL", "I - FBW - Gain Mode Switch")
defineToggleSwitch("FBW_GLIM_SW", 3, 3422, 422, "LEFT PANEL", "I - FBW - G-Limiter Switch")
defineToggleSwitch("FBW_RESET_BTN", 17, 3423, 423, "LEFT PANEL", "I - FBW - Reset Button")
defineIndicatorLightInverted("LANDING_GEAR_LEVER_LIGHT", 405, "LEFT PANEL", "O - LDG - Landing Gear Lever Light (red)")
definePushButton("EMER_JETT", 6, 3409, 409, "LEFT PANEL", "I - Emergency Jettison Button")
defineToggleSwitch("GUN_ARM_SW", 6, 3463, 463, "LEFT PANEL", "I - Gun Arm/Safe Switch")
defineFloat("PSV_EL_G_EXT", 424, {0, 1}, "LEFT PANEL", "O - PSV - Left Ext Elevon Position display")
defineFloat("PSV_EL_G_INT", 425, {0, 1}, "LEFT PANEL", "O - PSV - Left Int Elevon Position display")
defineFloat("PSV_DERIVE", 426, {0, 1}, "LEFT PANEL", "O - PSV - Rudder Position display")
defineFloat("PSV_EL_D_EXT", 427, {0, 1}, "LEFT PANEL", "O - PSV - Right Ext Elevon Position display")
defineFloat("PSV_EL_D_INT", 428, {0, 1}, "LEFT PANEL", "O - PSV - Right Int Elevon Position display")

--MAIN PANEL
defineIndicatorLight("LIM_IND", 185, "MAIN PANEL", "O - LIM Indicator Light (red)")
defineIndicatorLight("IFF_IND", 186, "MAIN PANEL", "O - IFF Indicator Light (red)")
definePushButton("AUDIO_WARN_RESET", 16, 3191, 191, "MAIN PANEL", "I - AL - Audio Warning Reset Button (PANNEL)")
defineIndicatorLight("MC_AMBRE", 199, "MAIN PANEL", "O - AL - Upper PANNE Button Light (yellow)")
defineIndicatorLight("MC_ROUGE", 200, "MAIN PANEL", "O - AL - Lower PANNE Button Light (red)")
defineIndicatorLight("PC", 373, "MAIN PANEL", "O - AL - PC Light (green)")
defineIndicatorLight("FEU_SEC", 374, "MAIN PANEL", "O - AL - FEU SEC Light (red)")
defineIndicatorLight("FEU_PC", 375, "MAIN PANEL", "O - AL - FEU PC Light (red)")
defineIndicatorLight("DEM", 376, "MAIN PANEL", "O - AL - DEMARRAGE Light (red)")

--MISCELANEOUS
defineFloat("PRESS_NEEDLE", 399, {0, 1}, "MISCELANEOUS", "O - CAB - Cabine Press Needle")
defineToggleSwitch("HYD_SYS_SEL", 14, 3395, 395, "MISCELANEOUS", "I - Hydraulic System Selector")
defineToggleSwitch("NWS_IFF_INTERR_BTN", 22, 3807, 807, "MISCELANEOUS", "I - Nose Wheel Steering / IFF Interrogation Button")
defineFloat("HYD_G_NEEDLE", 397, {0, 1}, "MISCELANEOUS", "O - HYD - Left Hyd Needle (Circuit #1 - Main)")
defineFloat("HYD_D_NEEDLE", 398, {0, 1}, "MISCELANEOUS", "O - HYD - Right Hyd Needle (Circuit #2 - Emer)")
defineMultipositionSwitch("CNPY_LK_N_LOW_LEV", 40, 3656, 656, 3, 0.5, "CANOPY", "I - Canopy Lock/Neutral/Lower Lever")
defineToggleSwitch("PEDAL_ADJUST_LEV", 14, 3396, 396, "MISCELANEOUS", "I - Pedal Adjustment Lever")
defineToggleSwitch("CNPY_JETT", 40, 3456, 456, "CANOPY", "I - Canopy Jettison")
defineToggleSwitch("DRAG_CHUTE_LEV", 22, 3457, 457, "MISCELANEOUS", "I - Drag Chute Lever")
defineToggleSwitch("CNPY_HAND1", 40, 3907, 907, "CANOPY", "I - Canopy Handle 1")
defineToggleSwitch("CNPY_HAND2", 40, 3908, 908, "CANOPY", "I - Canopy Handle 2")
defineToggleSwitch("MIRROR_TOGGLE", 40, 3909, 909, "CANOPY", "I - Mirror Rendering Toggle")
define3PosTumb("CNPY_REST", 40, 3655, 655, "CANOPY", "I - Canopy Rest")
define3PosTumb("SEAT_ADJUST_SW", 22, 3900, 900, "MISCELANEOUS", "I - Seat Adjustment Switch")

--PCA
defineToggleSwitch("MASTER_ARM_SW", 6, 3234, 234, "PCA", "I - PCA - Master Arm Switch")
definePushButton("PCA_BTN_1", 6, 3235, 235, "PCA", "I - PCA - Button 1")
definePushButton("PCA_BTN_2", 6, 3237, 237, "PCA", "I - PCA - Button 2")
definePushButton("PCA_BTN_3", 6, 3239, 239, "PCA", "I - PCA - Button 3")
definePushButton("PCA_BTN_4", 6, 3241, 241, "PCA", "I - PCA - Button 4")
definePushButton("PCA_BTN_5", 6, 3243, 243, "PCA", "I - PCA - Button 5")
definePushButton("GUN_MODE_BTN", 6, 3245, 245, "PCA", "I - PCA - Gun Mode Button")
defineToggleSwitch("SEL_JETT_SW_COV", 6, 3248, 248, "PCA", "I - PCA - Selective Jettison Switch Cover")
defineToggleSwitch("SEL_JETT_SW", 6, 3249, 249, "PCA", "I - PCA - Selective Jettison Switch")
definePushButton("WPS_SEL_BTN_1", 6, 3250, 250, "PCA", "I - PCA - Weapons Selector Button 1")
definePushButton("WPS_SEL_BTN_2", 6, 3253, 253, "PCA", "I - PCA - Weapons Selector Button 2")
definePushButton("WPS_SEL_BTN_3", 6, 3256, 256, "PCA", "I - PCA - Weapons Selector Button 3")
definePushButton("WPS_SEL_BTN_4", 6, 3259, 259, "PCA", "I - PCA - Weapons Selector Button 4")
definePushButton("WPS_SEL_BTN_5", 6, 3262, 262, "PCA", "I - PCA - Weapons Selector Button 5")
defineIndicatorLight("PCA_BUTTON_1_S", 236, "PCA", "O - PCA - Button 1 S Light (yellow)")
defineIndicatorLight("PCA_BUTTON_2_S", 238, "PCA", "O - PCA - Button 2 S Light (yellow)")
defineIndicatorLight("PCA_BUTTON_3_S", 240, "PCA", "O - PCA - Button 3 S Light (yellow)")
defineIndicatorLight("PCA_BUTTON_4_S", 242, "PCA", "O - PCA - Button 4 S Light (yellow)")
defineIndicatorLight("PCA_BUTTON_5_S", 244, "PCA", "O - PCA - Button 5 S Light (yellow)")
defineIndicatorLight("GUN_MODE_KL1", 246, "PCA", "O - PCA - Gun Mode Button KL1 Light (yellow)")
defineIndicatorLight("GUN_MODE_KL2", 247, "PCA", "O - PCA - Gun Mode Button KL2 Light (yellow)")
defineIndicatorLight("WEAPON_1_S", 251, "PCA", "O - PCA - Weapons Button 1 S Light (yellow)")
defineIndicatorLight("WEAPON_1_P", 252, "PCA", "O - PCA - Weapons Button 1 P Light (yellow)")
defineIndicatorLight("WEAPON_2_S", 254, "PCA", "O - PCA - Weapons Button 2 S Light (yellow)")
defineIndicatorLight("WEAPON_2_P", 255, "PCA", "O - PCA - Weapons Button 2 P Light (yellow)")
defineIndicatorLight("WEAPON_3_S", 257, "PCA", "O - PCA - Weapons Button 3 S Light (yellow)")
defineIndicatorLight("WEAPON_3_P", 258, "PCA", "O - PCA - Weapons Button 3 P Light (yellow)")
defineIndicatorLight("WEAPON_4_S", 260, "PCA", "O - PCA - Weapons Button 4 S Light (yellow)")
defineIndicatorLight("WEAPON_4_P", 261, "PCA", "O - PCA - Weapons Button 4 P Light (yellow)")
defineIndicatorLight("WEAPON_5_S", 263, "PCA", "O - PCA - Weapons Button 5 S Light (yellow)")
defineIndicatorLight("WEAPON_5_P", 264, "PCA", "O - PCA - Weapons Button 5 P Light (yellow)")
defineString("PCA_UR1_DISP", function() return pcaUpper1 end, PCA_UPPER_LEN, "PCA", "O - PCA Upper #1 Display")
defineString("PCA_UR2_DISP", function() return pcaUpper2 end, PCA_UPPER_LEN, "PCA", "O - PCA Upper #2 Display")
defineString("PCA_UR3_DISP", function() return pcaUpper3 end, PCA_UPPER_LEN, "PCA", "O - PCA Upper #3 Display")
defineString("PCA_UR4_DISP", function() return pcaUpper4 end, PCA_UPPER_LEN, "PCA", "O - PCA Upper #4 Display")
defineString("PCA_UR5_DISP", function() return pcaUpper5 end, PCA_UPPER_LEN, "PCA", "O - PCA Upper #5 Display")
defineString("PCA_BR1_DISP", function() return pcaLower1 end, PCA_LOWER_LEN, "PCA", "O - PCA Bottom #1 Display")
defineString("PCA_BR2_DISP", function() return pcaLower2 end, PCA_LOWER_LEN, "PCA", "O - PCA Bottom #2 Display")
defineString("PCA_BR3_DISP", function() return pcaLower3 end, PCA_LOWER_LEN, "PCA", "O - PCA Bottom #3 Display")
defineString("PCA_BR4_DISP", function() return pcaLower4 end, PCA_LOWER_LEN, "PCA", "O - PCA Bottom #4 Display")
defineString("PCA_BR5_DISP", function() return pcaLower5 end, PCA_LOWER_LEN, "PCA", "O - PCA Bottom #5 Display")

--PCN
defineSetCommandTumb("INS_PARAM_SEL", 9, 3574, 574, 0.1, {0, 1.1}, nil, true, "PCN", " I - PCN - INS Parameter Selector - Rotary Variant")
definePushButton("INS_PREP_SW", 9, 3570, 570, "PCN", "I - PCN - PREP Switch")
definePushButton("INS_DEST_SW", 9, 3572, 572, "PCN", "I - PCN - DEST Switch")
defineToggleSwitch("OFFSET_WP_TGT", 9, 3576, 576, "PCN", "I - PCN - Offset Waypoint/Target (BAD)")
defineToggleSwitch("INS_UPDATE", 9, 3578, 578, "PCN", "I - PCN - INS Update (REC)")
defineToggleSwitch("VAL_DATA_ENTRY", 9, 3580, 580, "PCN", "I - PCN - Validate Data Entry (VAL)")
defineToggleSwitch("MRK_POS", 9, 3582, 582, "PCN", "I - PCN - Mark Position (MRC)")
definePushButton("INS_BTN_1", 9, 3584, 584, "PCN", "I - PCN - Button 1")
definePushButton("INS_BTN_2", 9, 3585, 585, "PCN", "I - PCN - Button 2")
definePushButton("INS_BTN_3", 9, 3586, 586, "PCN", "I - PCN - Button 3")
definePushButton("INS_BTN_4", 9, 3587, 587, "PCN", "I - PCN - Button 4")
definePushButton("INS_BTN_5", 9, 3588, 588, "PCN", "I - PCN - Button 5")
definePushButton("INS_BTN_6", 9, 3589, 589, "PCN", "I - PCN - Button 6")
definePushButton("INS_BTN_7", 9, 3590, 590, "PCN", "I - PCN - Button 7")
definePushButton("INS_BTN_8", 9, 3591, 591, "PCN", "I - PCN - Button 8")
definePushButton("INS_BTN_9", 9, 3592, 592, "PCN", "I - PCN - Button 9")
definePushButton("INS_BTN_0", 9, 3593, 593, "PCN", "I - PCN - Button 0")
definePushButton("INS_CLR_BTN", 9, 3594, 594, "PCN", "I - PCN - EFF Button")
definePushButton("INS_ENTER_BTN", 9, 3596, 596, "PCN", "I - PCN - INS Button")
definePushButton("INS_NEXT_WP_BTN", 9, 3110, 110, "PCN", "I - PCN - INS Next Waypoint Button")
definePushButton("INS_PREV_WP_BTN", 9, 3111, 111, "PCN", "I - PCN - INS Previous Waypoint Button")
defineString("PCN_DISP_DEST", function() return pcnDest end, 2, "PCN", "O - PCN - DEST Display")
defineString("PCN_DISP_L", function() return pcnLeftDigits end, 8, "PCN", "O - PCN - Left Display")
defineString("PCN_DISP_PREP", function() return pcnPrep end, 2, "PCN", "O - PCN - PREP Display")
defineString("PCN_DISP_R", function() return pcnRightDigits end, 9, "PCN", "O - PCN - Right Display")
defineString("PCN_DIS_DL", function() return pcnLeft1Digit end, 1, "PCN", "PCN Digit Left Display")
defineString("PCN_DIS_DR", function() return pcnRight1Digit end, 1, "PCN", "PCN Digit Right Display")
defineString("PCN_DIS_2DL", function() return pcnLeft2Digit end, 2, "PCN", "PCN Digit Left Display (Multi Character)")
defineString("PCN_DIS_2DR", function() return pcnRight2Digit end, 2, "PCN", "PCN Digit Right Display (Multi Character)")
defineIndicatorLight("PCN_PRET", 564, "PCN", "O - PCN - PRET Indicator Light (green)")
defineIndicatorLight("PCN_ALN", 565, "PCN", "O - PCN - ALN Indicator Light (yellow)")
defineIndicatorLight("PCN_MIP", 566, "PCN", "O - PCN - MIP Indicator Light (yellow)")
defineIndicatorLight("PCN_NDEG", 567, "PCN", "O - PCN - N.DEG Indicator Light (yellow)")
defineIndicatorLight("PCN_SEC", 568, "PCN", "O - PCN - SEC Indicator Light (yellow)")
defineIndicatorLight("PCN_UNI", 569, "PCN", "O - PCN - UNI Indicator Light (red)")
defineIndicatorLight("INS_PREP_SW_LIGHT", 571, "PCN", "O - PCN - PREP Button Light (yellow)")
defineIndicatorLight("INS_DEST_SW_LIGHT", 573, "PCN", "O - PCN - DEST Button Light (yellow)")
defineIndicatorLight("PCN_BAD", 577, "PCN", "O - PCN - BAD Button Light (yellow)")
defineIndicatorLight("PCN_REC", 579, "PCN", "O - PCN - REC Button Light (yellow)")
defineIndicatorLight("INS_EFF_SW_LIGHT", 595, "PCN", "O - PCN - EFF Button Light (yellow)")
defineIndicatorLight("INS_INS_SW_LIGHT", 597, "PCN", "O - PCN - INS Button Light (yellow)")
defineIndicatorLight("PCN_VAL_SW_LIGHT", 581, "PCN", "O - PCN - VAL Button Light (yellow)")
defineIndicatorLight("PCN_MRQ_SW_LIGHT", 583, "PCN", "O - PCN - MRQ Button Light (yellow)")
defineIndicatorLight("EVF_LIGHTS", 726, "EVF", "I - EVF - Panel Lights (yellow/green)")
defineIndicatorLight("PCN_M91_LIGHT", 669, "PCN", "O - PCN - M91 Indicator Light (green)")
defineIndicatorLight("PCN_M92_LIGHT", 670, "PCN", "O - PCN - M92 Indicator Light (green)")
defineIndicatorLight("PCN_M93_LIGHT", 671, "PCN", "O - PCN - M93 Indicator Light (green)")

--PPA
defineTumb("BOMB_FUZE_SEL_SW", 6, 3276, 276, 0.5, {0, 1}, nil, false, "PPA", "I - PPA - Bomb Fuze Selector Switch")
definePushButton("S530_STANDBY", 6, 3266, 266, "PPA", "I - PPA - S530 Standby Button")
definePushButton("AUTO_MAN_BTN", 6, 3269, 269, "PPA", "I - PPA - AUTO/MAN Button")
definePushButton("MAGIC_STANDBY", 6, 3272, 272, "PPA", "I - PPA - MAGIC Standby Button")
define3PosTumb("MIS_SEL_SW", 6, 3265, 265, "PPA", "I - PPA - Missile Selector Switch")
define3PosTumb("PPA_TEST_SW", 6, 3275, 275, "PPA", "I - PPA - Test/Pres Switch")
define3PosTumb("BOMB_REL_QTY_SEL_SW", 6, 3277, 277, "PPA", "I - PPA - Bomb Release Quantity Selector Switch")
define3PosTumb("BOMB_REL_INT_SEL_SW", 6, 3278, 278, "PPA", "I - PPA - Bomb Release Interval Selector Switch")
definePushButton("FIRING_MODE_SEL", 6, 3279, 279, "PPA", "I - PPA - 530D/Rockets/Guns Firing Mode Selector Button")
defineIndicatorLight("PPA_S530_P", 267, "PPA", "O - PPA - S530 P Light (yellow)")
defineIndicatorLight("PPA_S530_MIS", 268, "PPA", "O - PPA - S530 MIS Light (yellow)")
defineIndicatorLight("PPA_AUTO", 270, "PPA", "O - PPA - AUTO Light (yellow)")
defineIndicatorLight("PPA_MAN", 271, "PPA", "O - PPA - MAN Light (yellow)")
defineIndicatorLight("PPA_MAGIC_P", 273, "PPA", "O - PPA - MAGIC Light (yellow)")
defineIndicatorLight("PPA_MAGIC_MIS", 274, "PPA", "O - PPA - MAGIC MAG Light (yellow)")
defineIndicatorLight("PPA_GUN_ROCKET_PAP", 280, "PPA", "O - PPA - Gun/Rockets Mode PAR Indicator Light (yellow)")
defineIndicatorLight("PPA_GUN_ROCKET_TOT", 281, "PPA", "O - PPA - Gun/Rockets Mode TOT Indicator Light (yellow)")
defineString("PPA_QTY_DISP", function() return ppaQuantity end, PPA_LEN, "PPA", "O - PPA Quantity Display")
defineString("PPA_INT_DISP", function() return ppaInterval end, PPA_LEN, "PPA", "O - PPA Interval Display")

--PSM
defineTumb("INS_OPAL_MODE", 9, 3629, 629, 0.1, {0, 0.4}, nil, false, "PSM", "I - PSM - INS Operational Mode")
defineTumb("INS_MODE_SEL", 9, 3627, 627, 0.1, {0, 0.7}, nil, false, "PSM", "I - PSM - INS Mode Selector")

--RADAR
defineTumb("RAD_CHAN_A", 11, 3481, 481, 2/12, {-0.95, 0.95}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12"}, true, "RADAR", "I - Change Radar Channel A")
defineTumb("RAD_PWR_SEL", 11, 3486, 486, 0.33, {0, 1}, nil, false, "RADAR", "I - Radar Power Selector")
defineTumb("RAD_SCAN_LINES_SEL", 11, 3502, 502, 0.5, {0, 1}, nil, false, "RADAR", "I - Radar Scan Lines Selector")
defineTumb("RAD_AZ_SEL", 11, 3506, 506, 0.5, {0, 1}, nil, false, "RADAR", "I - Radar Azimuth Selector")
defineToggleSwitch("RAD_WOW_EM_AUT_SW", 5, 3470, 470, "RADAR", "I - Radar WOW Emitter Authorize Switch")
definePushButton("RAD_TEST_BTN", 11, 3482, 482, "RADAR", "I - Radar Test Button")
definePushButton("RAD_REARM_BTN", 11, 3483, 483, "RADAR", "I - Radar Rearm Button")
define3PosTumb("RAD_DOP_REJ_SW", 11, 3484, 484, "RADAR", "I - Radar Doppler Reject Switch")
defineTumb("RAD_CHAN_B", 11, 3485, 485, 2/12, {-0.95, 0.95}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12"}, true, "RADAR", "I - Change Radar Channel B")
definePotentiometer("RAD_GAIN_DIAL", 11, 3488, 488, {0, 1}, "RADAR", "I - Radar Gain Dial")
definePushButton("AG_RAD_A_MODE_BTN", 11, 3491, 491, "RADAR", "I - Hardened Clutter Gate Mode Button")
definePushButton("AG_RAD_DEC_MODE_BTN", 11, 3493, 493, "RADAR", "I - A/G Radar DEC Mode Button")
definePushButton("AG_RAD_VISU_MODE_BTN", 11, 3495, 495, "RADAR", "I - A/G Radar VISU Mode Button")
defineToggleSwitch("RAD_GRID_SEL_SW", 11, 3499, 499, "RADAR", "I - Radar Grid Selector Switch")
defineToggleSwitch("TGT_MEM_TIME_SEL_SW", 11, 3500, 500, "RADAR", "I - Target Memory Time Selector Switch")
definePushButton("RAD_STT_SEL_BTN", 11, 3504, 504, "RADAR", "I - PSIC/STT Mode Button")
defineToggleSwitch("TDC_MODE_SW", 11, 3710, 710, "RADAR", "I - TDC Mode Switch")
define3PosTumb("RAD_PRF_SW", 11, 3109, 109, "RADAR", "I - Radar PRF Switch")
define3PosTumb("RAD_RNG_SEL_SW", 11, 3503, 503, "RADAR", "I - Radar Range Selector Switch")
defineIndicatorLight("RAD_VAL", 490, "RADAR", "O - RAD - VAL Button Light (red)")
defineIndicatorLight("RAD_A", 492, "RADAR", "O - RAD - A Button Light (red)")
defineIndicatorLight("RAD_DEC", 494, "RADAR", "O - RAD - DEC Button Light (red)")
defineIndicatorLight("RAD_VISU", 496, "RADAR", "O - RAD - VISU Button Light (red)")
defineIndicatorLight("RAD_PSIC", 505, "RADAR", "O - RAD - PSIC Button Light (red)")

--RIGHT CONSOLE
defineToggleSwitch("AUDIO_WARN_SW", 16, 3658, 658, "RIGHT CONSOLE", "I - AL - Audio Warning Switch")
defineTumb("EMER_HYD_PUMP_SW", 3, 3657, 657, 0.5, {0, 1}, nil, false, "RIGHT CONSOLE", "I - Emergency Hydraulic Pump Switch")
defineToggleSwitch("PITOT_HEAT_COV", 22, 3659, 659, "RIGHT CONSOLE", "I - Pitot Heat Cover")
defineToggleSwitch("PITOT_HEAT_SW", 22, 3660, 660, "RIGHT CONSOLE", "I - Pitot Heat Switch")
defineToggleSwitch("PKG_BRAKE_LEV", 22, 3666, 666, "RIGHT CONSOLE", "I - Parking Brake Lever")
defineToggleSwitch("EMER_COMPASS", 9, 3905, 905, "RIGHT CONSOLE", "I - Emergency Compass")
defineMultipositionSwitch("INS_AUX_HD_HOR", 1, 3665, 665, 3, 0.5, "RIGHT CONSOLE", "I - Backup ADI Switch")

--RIGHT PANEL
defineToggleSwitch("QRA_SW", 8, 3654, 654, "RIGHT PANEL", "I - Alert Network (QRA)")
defineToggleSwitch("LOX_DIL_LEV", 25, 3910, 910, "RIGHT PANEL", "I - LOX Dilution Lever")
defineToggleSwitch("LOX_EMER_SUP", 25, 3912, 912, "RIGHT PANEL", "I - LOX Emergency Supply")
defineFloat("OXY_NEEDLE", 518, {0, 1}, "RIGHT PANEL", "O - LOX - Needle")
defineFloat("OXY_FLOW_IND", 519, {0, 1}, "RIGHT PANEL", "O - LOX - Oxygen Flow Indicator")

--RWR
definePotentiometer("RWR_LGT_BRIGHT_CTRL", 16, 3228, 228, {0, 1}, "RWR", "I - RWR Light Brightnes Control")
defineIndicatorLight("RWR_V", 229, "RWR", "O - RWR - V Indicator Indicator Light (yellow)")
defineIndicatorLight("RWR_BR", 230, "RWR", "O - RWR - BR Indicator Indicator Light (yellow)")
defineIndicatorLight("RWR_DA", 231, "RWR", "O - RWR - DA Indicator Indicator Light (yellow)")
defineIndicatorLight("RWR_D2M", 232, "RWR", "O - RWR - D2M Indicator Indicator Light (yellow)")
defineIndicatorLight("RWR_LL", 233, "RWR", "O - RWR - LL Indicator Indicator Light (yellow)")

--SPEED INDICATOR
defineFloat("SPEED_KTS_NEED", 303, {0, 1}, "SPEED", "O - SPEED - Speed Needle")
defineFloat("SPEED_MACH", 304, {0, 1}, "SPEED", "O - SPEED - Mach")

--TACAN
defineTumb("TAC_CH_10_SEL", 23, 3623, 623, 0.076923, {0, 0.923077}, nil, true, "TACAN", "I - TACAN Channel 10 Selector")
defineTumb("TAC_MODE_SEL", 23, 3626, 626, 1.0/3.0, {0, 1}, nil, false, "TACAN", "I - TACAN Mode Select")
defineToggleSwitch("TAC_X_Y_SEL", 23, 3624, 624, "TACAN", "I - TACAN X/Y Select")
defineTumb("TAC_CH_1_SEL", 23, 3625, 625, 0.1, {0, 0.9}, nil, true, "TACAN", "I - TACAN Channel 1 Selector")

--TEST PANEL
defineMultipositionSwitch("FBW_TEST_SW", 17, 3517, 517, 3, 0.5, "TEST PANEL", "I - TEST - FBW Test Switch")
defineToggleSwitch("AP_TEST_SW_COV", 17, 3514, 514, "TEST PANEL", "I - TEST - Autopilot Test Switch Cover")
defineToggleSwitch("AP_TEST_SW", 17, 3515, 515, "TEST PANEL", "I - TEST - Autopilot Test Switch")
defineToggleSwitch("FBW_TEST_SW_COV", 17, 3516, 516, "TEST PANEL", "I - TEST - FBW Test Switch Cover")
defineIndicatorLight("ELEC_FAIL", 510, "TEST PANEL", "O - TEST - ELEC Indicator Light (white)")
defineIndicatorLight("HYD_FAIL", 511, "TEST PANEL", "O - TEST - HYD Indicator Light (white)")
defineIndicatorLight("TEST_ROUGE", 512, "TEST PANEL", "O - TEST - Upper Indicator Light (red)")
defineIndicatorLight("TEST_VERT", 513, "TEST PANEL", "O - TEST - Lower Indicator Light (green)")

--VHF RADIO
defineMultipositionSwitch("VHF_MODE", 19, 3950, 950,  7, 0.10, "VHF RADIO", "I - VHF - MODE Switch")
defineTumb("VHF_CH_SEL", 19, 3951, 951, 0.05, {0, 0.95}, {"001", "002", "003", "004", "005", "006", "007", "008", "009", "010", "011", "012", "013", "014", "015", "016", "017", "018", "019", "020"}, true, "VHF RADIO", "I - VHF - Channel Selector")
definePushButton("VHF_MEM_CLR", 19, 3952, 952, "VHF RADIO", "I - VHF - MEM/CLR Button")
definePushButton("VHF_VLD_XFR", 19, 3953, 953, "VHF RADIO", "I - VHF -  VLD/XFR Button")
definePushButton("VHF_1_READ", 19, 3954, 954, "VHF RADIO", "I - VHF - 1/READ Button")
definePushButton("VHF_2_SQL", 19, 3955, 955, "VHF RADIO", "I - VHF - 2/SQL Button")
definePushButton("VHF_3_GR",	19,	3956, 956, "VHF RADIO", "I - VHF - 3/GR Button")
definePushButton("VHF_4", 19, 3957, 957, "VHF RADIO", "I - VHF - 4 Button")
definePushButton("VHF_5_20_LOW",	19,	3958, 958, "VHF RADIO", "I - VHF - 5/20/LOW Button")
definePushButton("VHF_6_TONE", 19, 3959, 959, "VHF RADIO", "I - VHF - 6/TONE Button")
definePushButton("VHF_7", 19, 3960, 960, "VHF RADIO", "I - VHF - 7 Button")
definePushButton("VHF_8_TOD", 19, 3961, 961, "VHF RADIO", "I - VHF - 8/TOD Button")
definePushButton("VHF_9_ZERO", 19, 3962, 962, "VHF RADIO", "I - VHF - 9/ZERO Button")
definePushButton("VHF_0", 19, 3963, 963, "VHF RADIO", "I - VHF - 0 Button")
definePushButton("VHF_CONF", 19, 3964, 964, "VHF RADIO", "I - VHF - CONF Button")
defineString("VHF_FREQUENCY", function() return vhfFrequency end, 5, "VHF RADIO", "O - VHF - Frequency Report Display")

--UHF RADIO
defineTumb("UHF_MODE_SW", 20, 3433, 433, 0.1, {0, 1}, nil, false, "UHF RADIO", "I - UHF - Mode Selector")
defineToggleSwitch("UHF_PWR_5W_25W_SW", 20, 3429, 429, "UHF RADIO", "I - UHF - Power 5W/25W Switch")
defineToggleSwitch("UHF_SIL_SW", 20, 3430, 430, "UHF RADIO", "I - UHF - SIL Switch")
defineToggleSwitch("UHF_CDE_SW", 20, 3432, 432, "UHF RADIO", "I - UHF - CDE Switch")
definePushButton("UHF_TEST_SW", 20, 3434, 434, "UHF RADIO", "I - UHF - TEST Switch")
defineSetCommandTumb("UHF_PRESET_KNOB", 20, 3435, 435, 0.05, {0, 0.95}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, true, "UHF RADIO", "Preset Knob UHF")
define3PosTumb("UHF_EA2_SW", 20, 3431, 431, "UHF RADIO", "I - UHF - E+A2 Switch")
defineFloat("UHF_PRESET", 436, {0, 1}, "UHF RADIO", "O - UHF - PRESET Display")
defineString("UHF_FREQUENCY", function() return uhfFrequency end, 5, "UHF RADIO", "O - UHF - Frequency Report Display")

--VOR/ILS
defineMultipositionSwitch("VORILS_FREQ_WHOLE", 24, 3616, 616, 10, 0.1, "VOR / ILS", "I - VOR/ILS Frequency Change Whole")
defineToggleSwitch("VORILS_PWR_DIAL", 24, 3617, 617, "VOR / ILS", "I - VOR/ILS Power Dial")
defineTumb("VORILS_FREQ_DECIMAL", 24, 3618, 618, 0.05, {0, 0.95}, nil, true, "VOR / ILS", "I - VOR/ILS Frequency Change Decimal")
defineTumb("VORILS_TEST_DIAL", 24, 3619, 619, 0.5, {0, 1}, nil, false, "VOR / ILS", "I - VOR/ILS Test Dial")

--VTB
defineToggleSwitch("VTB_PWR_SW", 5, 3221, 221, "VTB", "I - VTB - Power Switch")
defineToggleSwitch("VTB_DEC", 5, 3222, 222, "VTB", "I - VTB - Declutter (ALLEG)")
defineToggleSwitch("VTB_OR_SEL", 5, 3223, 223, "VTB", "I - VTB - Orientation Selector (CADR)")
defineMultipositionSwitch("VTB_MARK_BRIGHT", 5, 3224, 224, 8, 0.1, "VTB", "I - VTB - Markers Brightness (MRQ)")
defineMultipositionSwitch("VTB_MAIN_BRIGHT", 5, 3225, 225, 8, 0.1, "VTB", "I - VTB - Main Brightness (LUM GEN)")
defineMultipositionSwitch("VTB_VIDEO_BRIGHT", 5, 3226, 226, 8, 0.1, "VTB", "I - VTB - Video Brightness (CONTRAST)")
defineMultipositionSwitch("VTB_DISP_BRIGHT", 5, 3227, 227, 8, 0.1, "VTB", "I - VTB - Cavalier Brightness (LUM CAV)")
define3PosTumb("TGT_DATA_MNL_ENTRY", 5, 3213, 213, "VTB", "I - VTB - Target Data Manual Entry Begin/End (DEB/FIN)")
define3PosTumb("BE_WP_SEL", 5, 3214, 214, "VTB", "I - VTB - Bullseye Waypoint Selector (N)")
define3PosTumb("TGT_RNG_BE", 5, 3215, 215, "VTB", "I - VTB - Target Range from Bullseye (Rho)")
define3PosTumb("TGT_BEAR_BE", 5, 3216, 216, "VTB", "I - VTB - Target Bearing from Bullseye (Theta)")
define3PosTumb("TGT_HD", 5, 3217, 217, "VTB", "I - VTB - Target Heading ( C )")
define3PosTumb("TGT_ALT", 5, 3218, 218, "VTB", "I - VTB - Target Altitude (Z)")
define3PosTumb("TGT_MACH_NUM", 5, 3219, 219, "VTB", "I - VTB - Target Mach Number (M)")
define3PosTumb("TGT_AGE", 5, 3220, 220, "VTB", "I - VTB - Target Age (T)")

--HUD/VTH
defineRotary("MIN_ALT_SEL", 38, 3192, 192, "VTH", "I - HUD - Minimum Altitude Selector")
defineToggleSwitch("HUD_DEC_SW", 36, 3203, 203, "VTH", "I - HUD - Declutter Switch")
defineTumb("AUX_GUNSIGHT", 36, 3206, 206, 0.5, {0.5, 1}, nil, false, "VTH", "I - HUD - Auxiliary Gunsight")
defineRotary("AUX_GUNSIGHT_DEFL", 36, 3207, 207, "VTH", "I - HUD - Auxiliary Gunsight Deflection")
defineToggleSwitch("AG_GUN_RET_SW", 36, 3208, 208, "VTH", "I - HUD - A/G Gun Reticle Switch")
definePotentiometer("TGT_WINGSPAN_KNOB", 36, 3209, 209, {0, 1}, "VTH", "I - HUD - Target Wingspan Knob")
definePushButton("HUD_CLR_BTN", 36, 3210, 210, "VTH", "I - HUD - EFF Button")
defineTumb("HUD_PWR_SW", 36, 3201, 201, 0.5, {0, 1}, nil, false, "VTH", "I - HUD - Power Switch")
defineTumb("RAD_RALT_SEL_SW", 38, 3204, 204, 0.5, {0, 1}, nil, false, "VTH", "I - HUD - Radar Altimeter Mode Switch")
defineTumb("RAD_RALT_PWR_SW", 38, 3205, 205, 0.5, {0, 1}, nil, false, "VTH", "I - HUD - Radar Altimeter Power Switch")
defineIndicatorLight("HUD_REC", 212, "VTH", "O - HUD - Recording Indicator Light (green)")

--VVI
defineFloat("VARIO_NEEDLE", 324, {-1, 1}, "VVI", "O - VVI - Needle")

--NVG
defineToggleSwitch("NVG_HELMET_MOUNT", 31, 3002, 1, "NVG", "I - NVG - Mount/Unmount NVG on Helmet")
defineToggleSwitch("NVG_STOW", 31, 3001, 2, "NVG", "I - NVG - STOW/UNSTOW NVG")
defineToggleSwitch("NVG_LIGHT_FILTER_SW", 16, 3672, 672, "NVG", "I - NVG - NVG Lights Filter Switch")

defineIndicatorLight("UHF_REP_L_1", 187, "UHF RADIO", "UHF Repeater COM1 Light (green)")
defineIndicatorLight("UHF_REP_L_2", 188, "UHF RADIO", "UHF Repeater COM2 Light (green)")
defineIndicatorLight("UHF_TEST_L", 676, "UHF RADIO", "UHF TEST Light (yellow)")
defineIndicatorLight("UHF_SECURE_L", 677, "UHF RADIO", "UHF Secure Channel Light (green)")
defineIndicatorLight("AIR_REFUEL_L", 198, "FUEL SYSTEM", "Air Refueling Light (yellow)")

defineFloat("VORILS_100_DRUM", 611, {0, 1}, "VOR / ILS", "VOR/ILS Drum 100")
defineFloat("VORILS_10_DRUM", 612, {0, 1}, "VOR / ILS", "VOR/ILS Drum 10")
defineFloat("VORILS_1_DRUM", 613, {0, 1}, "VOR / ILS", "VOR/ILS Drum 1")
defineFloat("VORILS_01_DRUM", 614, {0, 1}, "VOR / ILS", "VOR/ILS Drum 0.1")
defineFloat("VORILS_001_DRUM", 615, {0, 1}, "VOR / ILS", "VOR/ILS Drum 0.01")

defineFloat("VTAC_X_Y_DRUM", 620, {0, 1}, "TACAN", "TACAN X/Y Drum")
defineFloat("VTAC_10_DRUM", 621, {0, 1}, "TACAN", "TACAN 10 Drum")
defineFloat("VTAC_1_DRUM", 621, {0, 1}, "TACAN", "TACAN 1 Drum")

definePushButton("G_RESET", 1, 3348, 348, "MISCELANEOUS", "G-Meter Reset")
definePotentiometer("HUD_BRIGHT_KNOB", 36, 3202, 202, {0, 1}, "VTH", "I - HUD - Brightness Knob")

--EVF
defineTumb("EVF_CHAN_SEL", 39, 3968, 1004, 0.05, {0, 0.95}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, true, "EVF", "I - EVF - Channel Selector")
definePushButton("EVF_TEST_BTN", 39, 3970, 1006, "EVF", "I - EVF - Panel Test")

defineString("RAD_VTB_RANGE", getvtbRange, 3, "RADAR", "O - VTB Display Radar Range")
defineToggleSwitch("MIP_DATA_SLOT", 9, 3629, 628, "PSM", "I - PSM - MIP Datacartridge Slot")
defineFloat("DTC_CART_PRE", 674, {0, 1}, "PSM", "DTC Cartridge Presence")
defineFloat("DTC_CART_MOVE", 673, {-1, 1}, "PSM", "DTC Cartridge Position")

--Externals
defineIntegerFromGetter("EXT_SPEED_BRAKE_RIGHT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(184)*65535)
end, 65535, "External Aircraft Model", "Right Speed Brake")
defineIntegerFromGetter("EXT_SPEED_BRAKE_LEFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(182)*65535)
end, 65535, "External Aircraft Model", "Left Speed Brake")
defineIntegerFromGetter("EXT_POSITION_LIGHT_LEFT", function()
	if LoGetAircraftDrawArgumentValue(190) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Left Position Light (red)")
defineIntegerFromGetter("EXT_POSITION_LIGHT_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(192) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Right Position Light (green)")
defineIntegerFromGetter("EXT_STROBE_TOP", function()
	if LoGetAircraftDrawArgumentValue(83) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Top Strobe Light")
defineIntegerFromGetter("EXT_STROBE_BOTTOM", function()
	if LoGetAircraftDrawArgumentValue(802) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Bottom Strobe Light")
defineIntegerFromGetter("EXT_FORMATION_LIGHTS_FRONT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(200)*65535)
end, 65535, "External Aircraft Model", "Front Formation Lights")
defineIntegerFromGetter("EXT_FORMATION_LIGHTS_AFT", function()
	return math.floor(LoGetAircraftDrawArgumentValue(201)*65535)
end, 65535, "External Aircraft Model", "Aft Formation Lights")
defineIntegerFromGetter("EXT_WOW_NOSE", function()
	if LoGetAircraftDrawArgumentValue(1) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Nose Gear")
defineIntegerFromGetter("EXT_WOW_RIGHT", function()
	if LoGetAircraftDrawArgumentValue(4) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Right Gear")
defineIntegerFromGetter("EXT_WOW_LEFT", function()
	if LoGetAircraftDrawArgumentValue(6) > 0 then return 1 else return 0 end
end, 1, "External Aircraft Model", "Weight ON Wheels Left Gear")

defineFloat("CANOPY_POS", 38, {0, 1}, "Cockpit", "Canopy Position")
definePushButton("LDG_GEAR_TONE", 4, 3926, 926, "LEFT PANEL", "I - LDG - Landing Gear Tone")
defineFloat("LIGHT_BACK_FRONT", 721, {0, 1}, "Cockpit", "Backlight Front Panels (red)")
defineFloat("LIGHT_BACK_R", 723, {0, 1}, "Cockpit", "Backlight Right Panel (red)")
defineFloat("LIGHT_INT1_FRONT", 721, {0, 1}, "Cockpit", "Internal Light 1 Front Panels (green)")
defineFloat("LIGHT_INT2_FRONT", 721, {0, 1}, "Cockpit", "Internal Light 2 Front Panels (white)")
defineFloat("LIGHT_INT_SIDES", 724, {0, 1}, "Cockpit", "Internal Light Side Panels (green)")
defineFloat("SEAT_POS", 901, {0, 1}, "Cockpit", "Seat Position")
defineIndicatorLight("PCN_BAD_SW_LIGHT2", 437, "PCN", "O - PCN - BAD Button Light 2 (green)")
defineIndicatorLight("PCN_REC_SW_LIGHT2", 438, "PCN", "O - PCN - REC Button Light 2 (green)")
defineIndicatorLight("PCN_VAL_SW_LIGHT2", 439, "PCN", "O - PCN - VAL Button Light 2 (green)")
defineIndicatorLight("PCN_MRQ_SW_LIGHT2", 440, "PCN", "O - PCN - MRQ Button Light 2 (green)")
defineFloat("FOLD_INFO_PAGE_1", 443, {0, 1}, "Cockpit", "Foldable Info Register 1")
defineFloat("FOLD_INFO_PAGE_2", 444, {0, 1}, "Cockpit", "Foldable Info Register 2")
defineFloat("FOLD_INFO_PAGE_3", 445, {0, 1}, "Cockpit", "Foldable Info Register 3")
defineFloat("FOLD_INFO_PAGE_4", 446, {0, 1}, "Cockpit", "Foldable Info Register 4")

definePotentiometer("MIRROR_ORIENT", 40, 3009, 9, {0, 1}, "CANOPY", "I - Mirror Orientation")
defineRotary("COC_CLOCK_ROT", 2, 3922, 922, "CLOCK", "I - CLOCK - Clock Rewind/Adjust")
defineToggleSwitch("COC_CLOCK_BTN", 2, 3923, 923, "CLOCK", "I - CLOCK - Clock Start/Stop/Reset")
defineToggleSwitch("COC_CLOCK_ADJ", 2, 3924, 924, "CLOCK", "I - CLOCK - Clock time adjustment knob")
defineString("FUEL_JAUGE", function() return fuelJauge end, 4, "FUEL SYSTEM", "O - FUEL - JAUGE Display")
defineString("FUEL_TOTAL", function() return fuelTotal end, 4, "FUEL SYSTEM", "O - FUEL - Total Display")

BIOS.protocol.endModule()