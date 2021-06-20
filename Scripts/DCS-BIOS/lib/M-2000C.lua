-----------------------------------------------------------                                         
--     LIBRARY     	:    Mirage 2000C RAZBAM orginal by Exo7
--     VERSION     	:    v1.32 by Ergo, Matchstick, MisterKnife, WarLord, Espresso29470
-----------------------------------------------------------
BIOS.protocol.beginModule("M-2000C", 0x7200)
BIOS.protocol.setExportModuleAircrafts({"M-2000C"})

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
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch
local defineFloat = BIOS.util.defineFloat
local defineString = BIOS.util.defineString
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineIntegerFromGetter = BIOS.util.defineIntegerFromGetter

----------------------- Get Displays Functions

local function getUHFFrequency()
	local li = list_indication(7)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "text_COM_UHF2"
			then
			value = "      "..value
			return value:sub(7,9) .. value:sub(11,12)
		end
    end
return "         "
end
 
 local function getVHFFrequency()
	local li = list_indication(7)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
		local name, value = m()
        if not name then break end
		if name == "text_COM_UHF1"
			then
			value = "      "..value
			return value:sub(7,9) .. value:sub(11,12)
		end
    end
return "         "
 end

 local function getFuelFlow()
	local li = list_indication(3)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "txt_fuel_g"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCAUR1Disp()
	local li = list_indication(4)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_1_0"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCAUR2Disp()
	local li = list_indication(4)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_1_1"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCAUR3Disp()
	local li = list_indication(4)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_1_2"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCAUR4Disp()
	local li = list_indication(4)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_1_3"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCAUR5Disp()
	local li = list_indication(4)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_1_4"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end


local function getPCABR1Disp()
	local li = list_indication(5)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_2_0"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCABR2Disp()
	local li = list_indication(5)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_2_1"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCABR3Disp()
	local li = list_indication(5)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_2_2"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCABR4Disp()
	local li = list_indication(5)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_2_3"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPCABR5Disp()
	local li = list_indication(5)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "PCA_LCD_2_4"
        then
        value = "   "..value
        return value:sub(-3)
      end
    end
return "         "
end

local function getPPAQtyDisp()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "text_PPA_QTY"
        then
        value = "  "..value
        return value:sub(-2)
      end
    end
return "         "	
end

local function getPPAIntDisp()
	local li = list_indication(6)
	local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
	while true do
        local name, value = m()
        if not name then break end
		if name == "text_PPA_INT"
        then
        value = "  "..value
        return value:sub(-2)
      end
    end
return "         "	
end

----------------------- by Ergo fixed by Espresso29470
local function getPCNDispL() 
   local li = list_indication(9)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   while true do
        local name, value = m()
        if not name then break end
      if name:sub(0,13) == "PCN_UL_DIGITS"        
        then
        value = "        "..value
        return value:sub(-8)
      end
    end
return "         "
end

local function getPCNDispR() 
   local li = list_indication(9)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   while true do
        local name, value = m()
        if not name then break end
      if name:sub(0,13) == "PCN_UR_DIGITS"		
        then
        value = "        "..value
        return value:sub(-9)
      end
    end
return "         "
end

local function getPCNDigitR()
   local li = list_indication(9)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   local count = 0
   local ret = " "
   while true do
        local name, value = m()
        if not name then break end
      if name == "PCN_UR_E"								
        then
        count = count + 1
        ret="E"
      end
      if name == "PCN_UR_W"								
        then
        count = count + 1
        ret="W"
      end
      if name == "PCN_UR_P"								
        then
        count = count + 1
        ret="+"
      end
      if name == "PCN_UR_M"								
        then
        count = count + 1
        ret="-"
      end
    end
    if count > 1 then ret = "*" end
return ret
end

local function getPCNDigitL()
   local li = list_indication(9)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   local count = 0
   local ret = " "
   while true do
        local name, value = m()
        if not name then break end
      if name == "PCN_UL_N"
        then
        count = count + 1
        ret="N"
      end
      if name == "PCN_UL_S"
        then
        count = count + 1
        ret="S"
      end
      if name == "PCN_UL_P"
        then
        count = count + 1
        ret="+"
      end
      if name == "PCN_UL_M"
        then
        count = count + 1
        ret="-"
      end
    end
    if count > 1 then ret = "*" end
return ret
end

local function getPCN2DigitR()
   local li = list_indication(9)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   local east = ""
   local west = ""
   local plus = ""
   local minus = ""
   while true do
        local name, value = m()
        if not name then break end
      if name == "PCN_UR_E"
        then
        east="E"
      end
      if name == "PCN_UR_O"
        then
        west="W"
      end
      if name == "PCN_UR_P"
        then
        plus="+"
      end
      if name == "PCN_UR_M"
        then
        minus="-"
      end
    end
	return string.format("%-2s", string.sub(east..west..plus..minus,1,2))
end

local function getPCN2DigitL()
   local li = list_indication(9)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   local north = ""
   local south = ""
   local plus = ""
   local minus = ""
   while true do
        local name, value = m()
        if not name then break end
      if name == "PCN_UL_N"
        then
        north="N"
      end
      if name == "PCN_UL_S"
        then
        south="S"
      end
      if name == "PCN_UL_P"
        then
        plus="+"
      end
      if name == "PCN_UL_M"
        then
        minus="-"
      end
    end
	return string.format("%-2s", string.sub(north..south..plus..minus,1,2))
end

local function getPCNDispDest()
   local li = list_indication(10)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   while true do
        local name, value = m()
        if not name then break end
      if name == "PCN_BR_DIGITS"
        then
        value = "  "..value
        return value:sub(-2)
      end
    end
return "         "
end

local function getPCNDispPrep()
   local li = list_indication(10)
   local m = li:gmatch("-----------------------------------------\n([^\n]+)\n([^\n]*)\n")
   while true do
        local name, value = m()
        if not name then break end
      if name == "PCN_BL_DIGITS"
        then
        value = "  "..value
        return value:sub(-2)
      end
    end
return "         "
end
----------------------- by Ergo fixed by Espresso29470 -- END

-- ADI
defineToggleSwitch("ADI_CAGE_LEV", 1, 3314, 314, "ADI", "I - ADI - Cage Lever")
defineToggleSwitch("ADI_BKL_SW", 1, 3315, 315, "ADI", "I - ADI - Backlight Switch")
defineFloat("ADI_PITCH", 316, {-1, 1}, "ADI", "O - ADI - Pitch Position")
defineFloat("ADI_ROLL", 317, {-1, 1}, "ADI", "O - ADI - Roll Position")
defineFloat("ADI_COMPAS", 318, {-1, 1}, "ADI", "O - ADI - Compass Position")
defineFloat("ADI_FLAG", 319, {0, 1}, "ADI", "O - ADI - Flag")
defineFloat("ADI_LIGHT", 321, {0, 1}, "ADI", "O - ADI - Voyant Ambre sous")
defineFloat("ADI_ILS_V", 322, {-1, 1}, "ADI", "O - ADI - Vertical ILS Needle")
defineFloat("ADI_ILS_H", 323, {-1, 1}, "ADI", "O - ADI - Horizontal ILS Needle")
defineFloat("ADI_BILLE", 320, {-1, 1}, "ADI", "O - ADI - Bille")

-- AIR FLOW PANEL (BECS, PELLES, SOURIS)
defineToggleSwitch("INTAKE_SLATS_OP_SW", 3, 3460, 460, "AIR FLOW PANEL", "I - Intake Slats Operation Switch (PELLES)")
defineToggleSwitch("CONES_OP_SW", 3, 3461, 461, "AIR FLOW PANEL", "I - Intake Cones Operation Switch (SOURIS)")
defineTumb("SLATS_OP_SW", 14, 3462, 462, 1, {-1, 1}, nil, false, "AIR FLOW PANEL", "I - Slats Operation Switch (BECS)")

-- ALTIMETER
defineRotary("BARO_PRESS_CALIB", 1, 3309, 309, "ALTIMETER", "I - ALT - Barometric Pressure Calibration")
defineFloat("ALT_NEEDLE", 305, {0, 1}, "ALTIMETER", "O - ALT - Needle")
defineFloat("ALT_KCENTS", 306, {0, 1}, "ALTIMETER", "O - ALT - x10 000 ft display")
defineFloat("ALT_THOUS", 307, {0, 1}, "ALTIMETER", "O - ALT - x1000 ft display")
defineFloat("ALT_CENTS", 308, {0, 1}, "ALTIMETER", "O - ALT - x100 ft display")
defineFloat("ALT_BARO_THOUS", 310, {0, 1}, "ALTIMETER", "O - ALT - x1000 Baro Press display")
defineFloat("ALT_BARO_CENTS", 311, {0, 1}, "ALTIMETER", "O - ALT - x100 Baro Press display")
defineFloat("ALT_BARO_TENS", 312, {0, 1}, "ALTIMETER", "O - ALT - x10 Baro Press display")
defineFloat("ALT_BARO_ONES", 313, {0, 1}, "ALTIMETER", "O - ALT - x1 Baro Press display")

-- AOA
defineFloat("AOA_POS", 331, {0, 1}, "AOA", "O - AOA - Indicator")
defineFloat("AOA_FLAG", 332, {0, 1}, "AOA", "O - AOA - Flag")

-- AUDIO PANEL
defineToggleSwitch("AMPLIS_SEL_KNOB", 16, 3700, 700, "AUDIO PANEL", "I - AMPLIS Selector Knob")
definePotentiometer("VORILS_VOL_KNOB", 16, 3701, 701, {0, 1}, "AUDIO PANEL", "I - VOR/ILS Volume Knob")
definePotentiometer("TAC_VOL_KNOB", 16, 3702, 702, {0, 1}, "AUDIO PANEL", "I - TACAN Volume Knob")
definePotentiometer("MAGIC_TONE_VOL_KNOB", 16, 3703, 703, {0, 1}, "AUDIO PANEL", "I - MAGIC Tone Volume Knob")
definePotentiometer("TB_APP_VOL_KNOB", 16, 3704, 704, {0, 1}, "AUDIO PANEL", "I - TB APP Volume Knob")
definePotentiometer("MRK_SIG_VOL_KNOB", 16, 3705, 705, {0, 1}, "AUDIO PANEL", "I - Marker Signal Volume Knob")
definePotentiometer("UHF_RADIO_VOL_KNOB", 16, 3706, 706, {0, 1}, "AUDIO PANEL", "I - UHF - Radio Volume Knob")
definePotentiometer("VUHF_RADIO_VOL_KNOB", 16, 3707, 707, {0, 1}, "AUDIO PANEL", "I - U/VHF - Radio Volume Knob")

-- AUTOPILOT
definePushButton("AP_MASTER_BTN", 17, 3282, 282, "AUTOPILOT", "I - Autopilot Master Button")
definePushButton("ALT_HOLD_BTN", 17, 3285, 285, "AUTOPILOT", "I - Altitude Hold Button")
definePushButton("SEL_ALT_HOLD_BTN", 17, 3288, 288, "AUTOPILOT", "I - Selected Altitude Hold Button")
definePushButton("APP_HOLD_BTN", 17, 3294, 294, "AUTOPILOT", "I - Approach Hold Button")
defineMultipositionSwitch("ALT_10K_FT_SEL", 17, 3299, 299, 6, 0.1, "AUTOPILOT", "I - BCD - Altitude 10000 ft Selector")
defineMultipositionSwitch("ALT_1K_FT_SEL", 17, 3300, 300, 10, 0.1, "AUTOPILOT", "I - Altitude 1000 ft Selector")
defineMultipositionSwitch("ALT_100_FT_SEL", 17, 3301, 301, 10, 0.1, "AUTOPILOT", "I - Altitude 100 ft Selector")
definePushButton("AP_LGT_TEST_BTN", 17, 3302, 302, "AUTOPILOT", "I - Autopilot Lights Test Button")
defineIndicatorLight("AP_MASTER_AMBRE", 283, "AUTOPILOT", "O - AP - Master Amber Light")
defineIndicatorLight("AP_MASTER_VERT", 284, "AUTOPILOT", "O - AP - Master Green Light")
defineIndicatorLight("AP_ALT_VERT", 286, "AUTOPILOT", "O - AP - Alt Hold Green Light")
defineIndicatorLight("AP_ALT_AMBRE", 287, "AUTOPILOT", "O - AP - Alt Hold Amber Light")
defineIndicatorLight("AP_SELECT_ALT_VERT", 289, "AUTOPILOT", "O - AP - Sel Alt Hold Green Light")
defineIndicatorLight("AP_SELECT_ALT_AMBRE", 290, "AUTOPILOT", "O - AP - Sel Alt Hold Amber Light")
defineIndicatorLight("AP_NC_VERT", 292, "AUTOPILOT", "O - AP - Free Green Light")
defineIndicatorLight("AP_NC_AMBRE", 293, "AUTOPILOT", "O - AP - Free Amber Light")
defineIndicatorLight("AP_L_VERT", 295, "AUTOPILOT", "O - AP - L Green Light")
defineIndicatorLight("AP_L_AMBRE", 296, "AUTOPILOT", "O - AP - L Amber Light")
defineIndicatorLight("AP_G_VERT", 297, "AUTOPILOT", "O - AP - G Green Light")
defineIndicatorLight("AP_G_AMBRE", 298, "AUTOPILOT", "O - AP - G Amber Light")

-- BACKUP ADI
defineToggleSwitch("SB_ADI_CAGE_SW", 1, 3325, 325, "BACKUP ADI", "I - BKADI - UNCAGE")
defineRotary("SB_ADI_ROT", 1, 3328, 328, "BACKUP ADI", "I - BKADI - Set")
defineFloat("SB_ADI_ROLL", 326, {-1, 1}, "BACKUP ADI", "O - BKADI - Roll Position")
defineFloat("SB_ADI_PITCH", 327, {-1, 1}, "BACKUP ADI", "O - BKADI - Pitch Position")
defineFloat("SB_ADI_FLAG", 329, {0, 1}, "BACKUP ADI", "O - BKADI - Flag")

-- CAUTION LIGHT PANEL
defineIndicatorLight("CLP_BATT", 525, "CAUTION LIGHT PANEL", "O - CLP - BATT Indicator Indicator Light")
defineIndicatorLight("CLP_TRN", 526, "CAUTION LIGHT PANEL", "O - CLP - TR Indicator Indicator Light")
defineIndicatorLight("CLP_ALT_1", 527, "CAUTION LIGHT PANEL", "O - CLP - ALT.1 Indicator Indicator Light")
defineIndicatorLight("CLP_ALT_2", 528, "CAUTION LIGHT PANEL", "O - CLP - ALT.2 Indicator Indicator Light")
defineIndicatorLight("CLP_HUILE", 529, "CAUTION LIGHT PANEL", "O - CLP - HUILE Indicator Indicator Light")
defineIndicatorLight("CLP_T7", 530, "CAUTION LIGHT PANEL", "O - CLP - T7 Indicator Indicator Light")
defineIndicatorLight("CLP_CALC", 531, "CAUTION LIGHT PANEL", "O - CLP - CALC Indicator Light")
defineIndicatorLight("CLP_SOURIS", 532, "CAUTION LIGHT PANEL", "O - CLP - SOURIS Indicator Light")
defineIndicatorLight("CLP_PELLES", 533, "CAUTION LIGHT PANEL", "O - CLP - PELLES Indicator Light")
defineIndicatorLight("CLP_BP", 534, "CAUTION LIGHT PANEL", "O - CLP - BP Indicator Light")
defineIndicatorLight("CLP_BP_G", 535, "CAUTION LIGHT PANEL", "O - CLP - BP G Indicator Light")
defineIndicatorLight("CLP_BP_D", 536, "CAUTION LIGHT PANEL", "O - CLP - BP D Indicator Light")
defineIndicatorLight("CLP_TRANSF", 537, "CAUTION LIGHT PANEL", "O - CLP - TRANSF Indicator Light")
defineIndicatorLight("CLP_NIVEAU", 538, "CAUTION LIGHT PANEL", "O - CLP - NIVEAU Indicator Light")
defineIndicatorLight("CLP_HYD_1", 539, "CAUTION LIGHT PANEL", "O - CLP - HYD.1 Indicator Light")
defineIndicatorLight("CLP_HYD_2", 540, "CAUTION LIGHT PANEL", "O - CLP - HYD.2 Indicator Light")
defineIndicatorLight("CLP_HYD_S", 541, "CAUTION LIGHT PANEL", "O - CLP - HYD.S Indicator Light")
defineIndicatorLight("CLP_EP", 542, "CAUTION LIGHT PANEL", "O - CLP - EP Indicator Light")
defineIndicatorLight("CLP_BINGO", 543, "CAUTION LIGHT PANEL", "O - CLP - BINGO Indicator Light")
defineIndicatorLight("CLP_P_CAB", 544, "CAUTION LIGHT PANEL", "O - CLP - P.CAB Indicator Light")
defineIndicatorLight("CLP_TEMP", 545, "CAUTION LIGHT PANEL", "O - CLP - TEMP Indicator Light")
defineIndicatorLight("CLP_REG_O2", 546, "CAUTION LIGHT PANEL", "O - CLP - REG O2 Indicator Light")
defineIndicatorLight("CLP_5MN_O2", 547, "CAUTION LIGHT PANEL", "O - CLP - 5mn O2 Indicator Light")
defineIndicatorLight("CLP_O2_HA", 548, "CAUTION LIGHT PANEL", "O - CLP - O2 HA Indicator Light")
defineIndicatorLight("CLP_ANEMO", 549, "CAUTION LIGHT PANEL", "O - CLP - ANEMO Indicator Light")
defineIndicatorLight("CLP_CC", 550, "CAUTION LIGHT PANEL", "O - CLP - CC Indicator Light")
defineIndicatorLight("CLP_DSV", 551, "CAUTION LIGHT PANEL", "O - CLP - DSV Indicator Light")
defineIndicatorLight("CLP_CONDIT", 552, "CAUTION LIGHT PANEL", "O - CLP - CONDIT Indicator Light")
defineIndicatorLight("CLP_CONF", 553, "CAUTION LIGHT PANEL", "O - CLP - CONF Indicator Light")
defineIndicatorLight("CLP_PA", 554, "CAUTION LIGHT PANEL", "O - CLP - PA Indicator Light")
defineIndicatorLight("CLP_MAN", 555, "CAUTION LIGHT PANEL", "O - CLP - MAN Indicator Light")
defineIndicatorLight("CLP_DOM", 556, "CAUTION LIGHT PANEL", "O - CLP - DOM Indicator Light")
defineIndicatorLight("CLP_BECS", 557, "CAUTION LIGHT PANEL", "O - CLP - BECS Indicator Light")
defineIndicatorLight("CLP_US_EL", 558, "CAUTION LIGHT PANEL", "O - CLP - U.S EL Indicator Light")
defineIndicatorLight("CLP_INCIDENCE", 559, "CAUTION LIGHT PANEL", "O - CLP - INCIDENCE Indicator Light")
defineIndicatorLight("CLP_GAIN", 560, "CAUTION LIGHT PANEL", "O - CLP - GAIN Indicator Light")
defineIndicatorLight("CLP_RPM", 561, "CAUTION LIGHT PANEL", "O - CLP - RPM Indicator Light")
defineIndicatorLight("CLP_DECOL", 562, "CAUTION LIGHT PANEL", "O - CLP - DECOL Indicator Light")
defineIndicatorLight("CLP_PARK", 563, "CAUTION LIGHT PANEL", "O - CLP - PARK Indicator Light")

-- ELECTRIC PANEL
defineToggleSwitch("MAIN_BATT_SW", 8, 3520, 520, "ELECTRIC PANEL", "I - Main Battery Switch")
defineToggleSwitch("ELEC_PWR_TRANSF_SW", 8, 3521, 521, "ELECTRIC PANEL", "I - Electric Power Transfer Switch")
defineToggleSwitch("ALT_1_SW", 8, 3522, 522, "ELECTRIC PANEL", "I - Alternator 1 Switch")
defineToggleSwitch("ALT_2_SW", 8, 3523, 523, "ELECTRIC PANEL", "I - Alternator 2 Switch")
defineTumb("LGT_TEST_SW", 8, 3524, 524, 1, {-1, 1}, nil, false, "ELECTRIC PANEL", "I - Lights Test Switch")

-- CLOCK
defineToggleSwitch("COC_CLOCK", 22, 3400, 400, "CLOCK", "I - CLOCK - Cockpit Clock Position")
defineFloat("CLK_H", 401, {0, 1}, "CLOCK", "O - CLOCK - Hours Needle")
defineFloat("CLK_M", 402, {0, 1}, "CLOCK", "O - CLOCK - Minutes Needle")
defineFloat("CLK_S", 403, {0, 1}, "CLOCK", "O - CLOCK - Seconds Needle")

-- CONFIGURATION PANEL
defineIndicatorLight("CONF_A", 410, "CONFIGURATION PANEL", "O - CONF - A Light")
defineIndicatorLight("CONF_F", 411, "CONFIGURATION PANEL", "O - CONF - F Light")
defineIndicatorLight("CONF_DIRAV", 412, "CONFIGURATION PANEL", "O - CONF - DIRAV Light")
defineIndicatorLight("CONF_FREIN", 413, "CONFIGURATION PANEL", "O - CONF - FREIN Light")
defineIndicatorLight("CONF_CROSS", 414, "CONFIGURATION PANEL", "O - CONF - CROSS Light")
defineIndicatorLight("CONF_SPAD", 415, "CONFIGURATION PANEL", "O - CONF - SPAD Light")
defineIndicatorLight("CONF_ROUGE", 416, "CONFIGURATION PANEL", "O - CONF - Red Landing Gear Light")
defineIndicatorLight("CONF_G", 417, "CONFIGURATION PANEL", "O - CONF - Left Landing Gear Light")
defineIndicatorLight("CONF_AUX", 418, "CONFIGURATION PANEL", "O - CONF - Aux Landing Gear Light")
defineIndicatorLight("CONF_D", 419, "CONFIGURATION PANEL", "O - CONF - Right Landing Gear Light")

-- ECM BOX
-- 04 Apr 2020 - ECM BOX modified in recent versions of M2000 module cockpit so old items removed and replaced with current ones
--defineToggleSwitch("ECM_BOX_SW", 13, 3195, 195, "ECM BOX", "I - ECM Box Switch")
--defineToggleSwitch("ECM_BOX_LGT_SW", 13, 3196, 196, "ECM BOX", "I - ECM Box Lights Switch")
--defineTumb("ECM_BOX_MODE_SW", 13, 3194, 194, 0.5, {0, 1}, nil, false, "ECM BOX", "I - ECM Box Mode Switch")
--definePotentiometer("ECM_BOX_LCD_BRIGHT", 13, 3197, 197, {0, 1}, "ECM BOX", "I - ECM Box LCD Display Brightness")
--defineString("ECM_FLR_DISP", getIRDisp, 3, "ECM BOX", "O - ECM Box FLR Display")
--defineString("ECM_EM_DISP", getEMDisp, 3, "ECM BOX", "O - ECM Box EM Display")
definePushButton("ECM_BOX_BLT_SW", 13, 3990, 990, "ECM BOX", "I - ECM Box Clear Button")
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
defineIndicatorLight("CLIM_C", 632, "ECS PANEL", "O - ECS - C Light")
defineIndicatorLight("CLIM_F", 634, "ECS PANEL", "O - ECS - F Light")

-- ENGINE GAUGE
defineFloat("N_RPM", 369, {0, 1}, "ENGINE GAUGE", "O - ENG - RPM Needle")
defineFloat("T7_NEEDLE", 370, {0, 1}, "ENGINE GAUGE", "O - ENG - Tt7 Needle")
defineFloat("RPM_TENS", 371, {0, 1}, "ENGINE GAUGE", "O - ENG - x10 RPM display")
defineFloat("RPM_ONES", 372, {0, 1}, "ENGINE GAUGE", "O - ENG - x1 RPM display")

-- ENGINE START PANEL
defineToggleSwitch("ENG_SHUTDOWN_BTN", 7, 3467, 467, "ENGINE START PANEL", "I - Engine Shutdown Button")
defineToggleSwitch("ENG_START_SW_COV", 7, 3645, 645, "ENGINE START PANEL", "I - Engine Start Switch Cover")
defineToggleSwitch("START_FUEL_PUMP_SW", 7, 3646, 646, "ENGINE START PANEL", "I - Starter Fuel Pump Switch")
defineToggleSwitch("ENG_FUEL_L_PUMP_SW", 4, 3647, 647, "ENGINE START PANEL", "I - Engine Fuel Left Boost Pump Switch")
defineToggleSwitch("ENG_FUEL_R_PUMP_SW", 4, 3648, 648, "ENGINE START PANEL", "I - Engine Fuel Right Boost Pump Switch")
definePushButton("ENG_START_SW", 7, 3649, 649, "ENGINE START PANEL", "I - Engine Start Switch")
defineToggleSwitch("FUEL_CUTOFF_SW_COV", 7, 3651, 651, "ENGINE START PANEL", "I - Fuel Cutoff Switch Cover")
defineToggleSwitch("FUEL_CUTOFF_SW", 7, 3652, 652, "ENGINE START PANEL", "I - Fuel Cutoff Switch")
defineTumb("VENT_SEL_SW", 7, 3650, 650, 0.5, {0, 1}, nil, false, "ENGINE START PANEL", "I - Ventilation Selector Switch")

-- ELECTRONIC WAR PANEL
defineTumb("BR_PWR_SW", 13, 3606, 606, 0.5, {0, 1}, nil, false, "EW PANEL", "I - BR Power Switch")
defineTumb("RWR_PWR_SW", 13, 3607, 607, 0.5, {0, 1}, nil, false, "EW PANEL", "I - RWR Power Switch")
defineTumb("D2M_PWR_SW", 13, 3608, 608, 0.5, {0, 1}, nil, false, "EW PANEL", "I - D2M Power Switch")
defineTumb("DECOY_REL_MODE_SW", 13, 3609, 609, 0.5, {0, 1}, nil, false, "EW PANEL", "I - Decoy Release Mode Switch")
defineTumb("DECOY_REL_PGM_KNOB", 13, 3610, 610, 0.1, {0, 1}, nil, false, "EW PANEL", "I - Decoy Release Program Knob")
defineTumb("EW_MODE_SEL_SW", 13, 3605, 605, 1, {-1, 1}, nil, false, "EW PANEL", "I - EW Mode Selector Switch")

-- EXTERIOR LIGHTS
defineToggleSwitch("POLICE_LGT_SW", 16, 3449, 449, "EXT LIGHTS", "I - Police Lights Switch")
defineToggleSwitch("ANTI-COL_LGT_SW", 16, 3453, 453, "EXT LIGHTS", "I - Anti-Collision Lights Switch")
defineToggleSwitch("NAV_LGT_SW", 16, 3454, 454, "EXT LIGHTS", "I - Navigation Lights Switch")
defineToggleSwitch("FORM_LGT_SW", 16, 3455, 455, "EXT LIGHTS", "I - Formation Lights Switch")
definePotentiometer("REFUEL_LGT_BRIGHT_KNOB", 16, 3920, 920, {0, 1}, "EXT LIGHTS", "I - Refuel Lights Brightness Knob")
defineTumb("LDG_LGT_SW", 16, 3450, 450, 0.5, {0, 1}, nil, false, "EXT LIGHTS", "I - Landing Lights Switch")

-- FUEL SYSTEM
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

defineIndicatorLight("FUEL_RL_G", 362, "FUEL SYSTEM", "O - FUEL - Left RL Light")
defineIndicatorLight("FUEL_RL_M", 363, "FUEL SYSTEM", "O - FUEL - Center RL Light")
defineIndicatorLight("FUEL_RL_D", 364, "FUEL SYSTEM", "O - FUEL - Right RL Light")
defineIndicatorLight("FUEL_AV_G", 365, "FUEL SYSTEM", "O - FUEL - Left AV Light")
defineIndicatorLight("FUEL_AV_D", 366, "FUEL SYSTEM", "O - FUEL - Right AV Light")
defineIndicatorLight("FUEL_V_G", 367, "FUEL SYSTEM", "O - FUEL - Left V Light")
defineIndicatorLight("FUEL_V_D", 368, "FUEL SYSTEM", "O - FUEL - Right V Light")
defineString("FUEL_FLOW", getFuelFlow, 3, "FUEL SYSTEM", "O - FUEL - Fuel Flow Display")

-- ACCELEROMETER
defineFloat("GMETER_NEEDLE", 347, {-1, 1}, "G-METER", "O - ACC - G Needle")

-- HSI
defineTumb("HSI_VAD_SEL", 2, 3340, 340, 1, {-1, 1}, nil, false, "HSI", "I - HSI - VAD Selector")
defineTumb("HSI_MODE_SEL_SW", 2, 3341, 341, 0.1, {0, 1}, nil, false, "HSI", "I - HSI - Mode Selector Switch")
defineFloat("HSI_HDG", 333, {0, 1}, "HSI", "O - HSI - AP Heading (Green Arrow)")
defineFloat("HSI_D_NEEDLE", 334, {0, 1}, "HSI", "O - HSI - COURSE (Double Needle)")
defineFloat("HSI_NEEDLE", 335, {0, 1}, "HSI", "O - HSI - VAD (Simple Needle)")
defineFloat("HSI_DIST_CENTS", 336, {0, 1}, "HSI", "O - HSI x100 Distance display")
defineFloat("HSI_DIST_TENS", 337, {0, 1}, "HSI", "O - HSI x10 Distance display")
defineFloat("HSI_DIST_ONES", 338, {0, 1}, "HSI", "O - HSI x1 Distance display")
defineFloat("HSI_DIST_DEC", 339, {0, 1}, "HSI", "O - HSI x.1 Distance display")
defineFloat("HSI_COMPAS", 342, {0, 1}, "HSI", "O - HSI - Compass")
defineFloat("HSI_FLAG_DIST", 343, {0, 1}, "HSI", "O - HSI - Distance Flag")
defineFloat("HSI_FLAG_G", 344, {0, 1}, "HSI", "O - HSI - Left Flag")
defineFloat("HSI_FLAG_D", 345, {0, 1}, "HSI", "O - HSI - Right Flag")
defineFloat("HSI_FLAG_M", 346, {0, 1}, "HSI", "O - HSI - Center Flag")

-- IFF
defineMultipositionSwitch("RAD_IFF_MODE_SW", 11, 3598, 598, 6, 0.2, "IFF", "I - IFF_INT -  Mode Switch")
defineMultipositionSwitch("RAD_IFF_POW_SW", 11, 3600, 600, 3, 0.5, "IFF", "I - IFF_INT -  Power Switch")
defineToggleSwitch("RAD_IFF_L_R_SEL", 11, 3599, 599, "IFF", "I - IFF_INT -  L/R Selector")

defineTumb("RAD_IFF_CODE-4_SEL", 11, 3601, 601, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_INT -  Code-4 Selector")
defineTumb("RAD_IFF_CODE-3_SEL", 11, 3602, 602, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_INT -  Code-3 Selector")
defineTumb("RAD_IFF_CODE-2_SEL", 11, 3603, 603, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_INT -  Code-2 Selector")
defineTumb("RAD_IFF_CODE-1_SEL", 11, 3604, 604, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_INT -  Code-1 Selector")

defineTumb("MODE-1_10_SEL", 4, 3377, 377, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_REP - Mode-1 Tens Selector")
defineTumb("MODE-1_1_SEL", 4, 3378, 378, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_REP - Mode-1 Ones Selector")
defineTumb("MODE-3A_1K_SEL", 4, 3379, 379, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_REP - Mode-3A Thousands Selector")
defineTumb("MODE-3A_100_SEL", 4, 3380, 380, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_REP - Mode-3A Hundreds Selector")
defineTumb("MODE-3A_10_SEL", 4, 3381, 381, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_REP - Mode-3A Tens Selector")
defineTumb("MODE-3A_1_SEL", 4, 3382, 382, 0.1, {0, 0.9}, nil, false, "IFF", "I - IFF_REP - Mode-3A Ones Selector")

defineToggleSwitch("IDENT_PWR_SW", 4, 3383, 383, "IFF", "I - IFF_REP - Ident Power Switch")
defineToggleSwitch("MODE-1_SW", 4, 3384, 384, "IFF", "I - IFF_REP - Mode-1 Switch")
defineToggleSwitch("MODE-2_SW", 4, 3385, 385, "IFF", "I - IFF_REP - Mode-2 Switch")
defineToggleSwitch("MODE-3A_SW", 4, 3386, 386, "IFF", "I - IFF_REP - Mode-3A Switch")
defineToggleSwitch("MODE-C_SW", 4, 3387, 387, "IFF", "I - IFF_REP - Mode-C Switch")
defineToggleSwitch("IFF_M4_SW", 4, 3390, 390, "IFF", "I - IFF_REP - ON/OUT MODE 4 Switch")
defineIndicatorLight("IFF_RED", 388, "IFF", "O - IFF_REP - Red Light")
defineIndicatorLight("IFF_FAULT", 394, "IFF", "O - IFF_REP - Fault Light")

-- INTERIOR LIGHTS
definePotentiometer("LGT_BRIGHT_CTRL_TEST", 9, 3575, 575, {0, 1}, "INT LIGHTS", "I - Light Brightnes Control/Test")
definePotentiometer("DASH_U.V._LGT_KNOB", 16, 3639, 639, {0, 1}, "INT LIGHTS", "I - Dashboard U.V. Lights Knob")
definePotentiometer("DASH_PANEL_LGT_KNOB", 16, 3640, 640, {0, 1}, "INT LIGHTS", "I - Dashboard Panel Lights Knob")
definePotentiometer("RED_FLOOD_LGT_KNOB", 16, 3641, 641, {0, 1}, "INT LIGHTS", "I - Red Flood Lights Knob")
definePotentiometer("CONS_PANEL_LGT_KNOB", 16, 3642, 642, {0, 1}, "INT LIGHTS", "I - Console Panel Lights Knob")
definePotentiometer("CAUT_ADV_LGT", 16, 3643, 643, {0, 1}, "INT LIGHTS", "I - Caution/Advisory Lights Rheostat")
definePotentiometer("WH_FLOOD_LGT_KNOB", 16, 3644, 644, {0, 1}, "INT LIGHTS", "I - White Flood Lights Knob")

-- LEFT CONSOLE
defineToggleSwitch("EMER_THROTTLE_COV", 7, 3464, 464, "LEFT CONSOLE", "I - Emergency Throttle Cover")
defineToggleSwitch("EMER_THROTTLE_HAND", 7, 3465, 465, "LEFT CONSOLE", "I - Emergency Throttle Handle")
defineToggleSwitch("ENG_IN-FLGT_START_SW", 7, 3468, 468, "LEFT CONSOLE", "I - Engine In-Flight Start Switch")
defineToggleSwitch("AB_EMER_CUTOFF_SW_COV", 4, 3471, 471, "LEFT CONSOLE", "I - A/B Emergency Cutoff Switch Cover")
defineToggleSwitch("AB_EMER_CUTOFF_SW", 4, 3472, 472, "LEFT CONSOLE", "I - A/B Emergency Cutoff Switch")
defineToggleSwitch("SEC_HUILE_SW_COVER", 7, 3473, 473, "LEFT CONSOLE", "I - Secours Huile Switch Cover")
defineToggleSwitch("SEC_HUILE_SW", 7, 3474, 474, "LEFT CONSOLE", "I - Secours Huile Switch")
defineToggleSwitch("ENG_EMER_CTRL_COV", 7, 3475, 475, "LEFT CONSOLE", "I - Engine Emergency Control Cover")
defineToggleSwitch("ENG_EMER_CTRL_SW", 7, 3476, 476, "LEFT CONSOLE", "I - Engine Emergency Control Switch")
defineToggleSwitch("FBW_CH_5_SW_COV", 17, 3479, 479, "LEFT CONSOLE", "I - FBW - Channel 5 Switch Cover")
defineToggleSwitch("FBW_CH_5_SW", 17, 3480, 480, "LEFT CONSOLE", "I - FBW - Channel 5 Switch")
defineToggleSwitch("ANTI-SKID_SW_COV", 22, 3458, 458, "LEFT CONSOLE", "I - Anti-Skid Switch Cover")
defineToggleSwitch("ANTI-SKID_SW", 22, 3459, 459, "LEFT CONSOLE", "I - Anti-Skid Switch")
defineToggleSwitch("SERPAM_REC_SW", 16, 3452, 452, "LEFT CONSOLE", "I - SERPAM Recorder Switch")
--Doesn't exist??
defineToggleSwitch("MAGNETO_SW", 0, 3469, 469, "LEFT CONSOLE", "I - Magneto Switch")

-- LEFT PANEL
defineToggleSwitch("FBW_SPIN_MODE_SW", 3, 3330, 330, "LEFT PANEL", "I - FBW - Spin Mode Switch")
defineToggleSwitch("LDG_LEV", 4, 3404, 404, "LEFT PANEL", "I - LDG - Landing Gear Lever")
defineToggleSwitch("SAFE_GND_SW", 0, 3407, 407, "LEFT PANEL", "I - LDG - Safety Ground Override")
defineToggleSwitch("LDG_EMER_REL_LEV", 4, 3408, 408, "LEFT PANEL", "I - LDG - Landing Gear Emergency Release Lever")
defineToggleSwitch("FBW_GAIN_MODE_SW_COV", 3, 3420, 420, "LEFT PANEL", "I - FBW - Gain Mode Switch Cover")
defineToggleSwitch("FBW_GAIN_MODE_SW", 3, 3421, 421, "LEFT PANEL", "I - FBW - Gain Mode Switch")
defineToggleSwitch("FBW_G-LIM_SW", 3, 3422, 422, "LEFT PANEL", "I - FBW - G-Limiter Switch")
defineToggleSwitch("FBW_RESET_BTN", 17, 3423, 423, "LEFT PANEL", "I - FBW - Reset Button")
defineIndicatorLightInverted("LANDING_GEAR_LEVER_LIGHT", 405, "LEFT PANEL", "O - LDG - Landing Gear Lever Light")
definePushButton("EMER_JETT", 6, 3409, 409, "LEFT PANEL", "I - Emergency Jettison Button")
defineToggleSwitch("GUN_ARM_SW", 6, 3463, 463, "LEFT PANEL", "I - Gun Arm/Safe Switch")
defineFloat("PSV_EL_G_EXT", 424, {0, 1}, "LEFT PANEL", "O - PSV - Left Ext Elevon Position display")
defineFloat("PSV_EL_G_INT", 425, {0, 1}, "LEFT PANEL", "O - PSV - Left Int Elevon Position display")
defineFloat("PSV_DERIVE", 426, {0, 1}, "LEFT PANEL", "O - PSV - Rudder Position display")
defineFloat("PSV_EL_D_EXT", 427, {0, 1}, "LEFT PANEL", "O - PSV - Right Ext Elevon Position display")
defineFloat("PSV_EL_D_INT", 428, {0, 1}, "LEFT PANEL", "O - PSV - Right Int Elevon Position display")

-- MAIN PANEL
defineIndicatorLight("LIM_IND", 185, "MAIN PANEL", "O - LIM Indicator Light")
defineIndicatorLight("IFF_IND", 186, "MAIN PANEL", "O - IFF Indicator Light")
definePushButton("AUDIO_WARN_RESET", 16, 144, 191, "MAIN PANEL", "I - AL - Audio Warning Reset Button (PANNEL)")
defineIndicatorLight("MC_AMBRE", 199, "MAIN PANEL", "O - AL - Amber PANNE Button Light")
defineIndicatorLight("MC_ROUGE", 200, "MAIN PANEL", "O - AL - Red PANNE Button Light")
defineIndicatorLight("PC", 373, "MAIN PANEL", "O - AL - PC Light")
defineIndicatorLight("FEU_SEC", 374, "MAIN PANEL", "O - AL - FEU SEC Light")
defineIndicatorLight("FEU_PC", 375, "MAIN PANEL", "O - AL - FEU PC Light")
defineIndicatorLight("DEM", 376, "MAIN PANEL", "O - AL - DEMARRAGE Light")

-- MISCELANEOUS
defineFloat("PRESS_NEEDLE", 399, {0, 1}, "MISCELANEOUS", "O - CAB - Cabine Press Needle")
defineToggleSwitch("HYD_SYS_SEL", 14, 3395, 395, "MISCELANEOUS", "I - Hydraulic System Selector")
defineToggleSwitch("NWS_IFF_INTERR_BTN", 22, 3807, 807, "MISCELANEOUS", "I - Nose Wheel Steering / IFF Interrogation Button")
defineFloat("HYD_G_NEEDLE", 397, {0, 1}, "MISCELANEOUS", "O - HYD - Left Hyd Needle (Circuit #1 - Main)")
defineFloat("HYD_D_NEEDLE", 398, {0, 1}, "MISCELANEOUS", "O - HYD - Right Hyd Needle (Circuit #2 - Emer)")
defineMultipositionSwitch("CNPY_LK_N_LOW_LEV", 14, 3656, 656, 3, 0.5, "MISCELANEOUS", "I - Canopy Lock/Neutral/Lower Lever")
defineToggleSwitch("PEDAL_ADJUST_LEV", 14, 3396, 396, "MISCELANEOUS", "I - Pedal Adjustment Lever")
defineToggleSwitch("CNPY_JETT", 14, 3456, 456, "MISCELANEOUS", "I - Canopy Jettison")
defineToggleSwitch("DRAG_CHUTE_LEV", 22, 3457, 457, "MISCELANEOUS", "I - Drag Chute Lever")
defineToggleSwitch("CNPY_HAND1", 14, 3907, 907, "MISCELANEOUS", "I - Canopy Handle")
defineToggleSwitch("CNPY_HAND2", 14, 3908, 908, "MISCELANEOUS", "I - Canopy Handle")
defineToggleSwitch("MIRROR_TOGGLE", 22, 3909, 909, "MISCELANEOUS", "I - Mirror Rendering Toggle")
defineTumb("CNPY_REST", 14, 3655, 655, 1, {-1, 1}, nil, false, "MISCELANEOUS", "I - Canopy Rest")
defineTumb("SEAT_ADJUST_SW", 22, 3900, 900, 1, {-1, 1}, nil, false, "MISCELANEOUS", "I - Seat Adjustment Switch")

-- PCA
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
defineIndicatorLight("PCA_BUTTON_1_S", 236, "PCA", "O - PCA - Button 1 S Light")
defineIndicatorLight("PCA_BUTTON_2_S", 238, "PCA", "O - PCA - Button 2 S Light")
defineIndicatorLight("PCA_BUTTON_3_S", 240, "PCA", "O - PCA - Button 3 S Light")
defineIndicatorLight("PCA_BUTTON_4_S", 242, "PCA", "O - PCA - Button 4 S Light")
defineIndicatorLight("PCA_BUTTON_5_S", 244, "PCA", "O - PCA - Button 5 S Light")
defineIndicatorLight("GUN_MODE_KL1", 246, "PCA", "O - PCA - Gun Mode Button KL1 Light")
defineIndicatorLight("GUN_MODE_KL2", 247, "PCA", "O - PCA - Gun Mode Button KL2 Light")
defineIndicatorLight("WEAPON_1_S", 251, "PCA", "O - PCA - Weapons Button 1 S Light")
defineIndicatorLight("WEAPON_1_R", 252, "PCA", "O - PCA - Weapons Button 1 R Light")
defineIndicatorLight("WEAPON_2_S", 254, "PCA", "O - PCA - Weapons Button 2 S Light")
defineIndicatorLight("WEAPON_2_R", 255, "PCA", "O - PCA - Weapons Button 2 R Light")
defineIndicatorLight("WEAPON_3_S", 257, "PCA", "O - PCA - Weapons Button 3 S Light")
defineIndicatorLight("WEAPON_3_R", 258, "PCA", "O - PCA - Weapons Button 3 R Light")
defineIndicatorLight("WEAPON_4_S", 260, "PCA", "O - PCA - Weapons Button 4 S Light")
defineIndicatorLight("WEAPON_4_R", 261, "PCA", "O - PCA - Weapons Button 4 R Light")
defineIndicatorLight("WEAPON_5_S", 263, "PCA", "O - PCA - Weapons Button 5 S Light")
defineIndicatorLight("WEAPON_5_R", 264, "PCA", "O - PCA - Weapons Button 5 R Light")
defineString("PCA_UR1_DISP", getPCAUR1Disp, 3, "PCA", "O - PCA Upper #1 Display")
defineString("PCA_UR2_DISP", getPCAUR2Disp, 3, "PCA", "O - PCA Upper #2 Display")
defineString("PCA_UR3_DISP", getPCAUR3Disp, 3, "PCA", "O - PCA Upper #3 Display")
defineString("PCA_UR4_DISP", getPCAUR4Disp, 3, "PCA", "O - PCA Upper #4 Display")
defineString("PCA_UR5_DISP", getPCAUR5Disp, 3, "PCA", "O - PCA Upper #5 Display")
defineString("PCA_BR1_DISP", getPCABR1Disp, 3, "PCA", "O - PCA Bottom #1 Display")
defineString("PCA_BR2_DISP", getPCABR2Disp, 3, "PCA", "O - PCA Bottom #2 Display")
defineString("PCA_BR3_DISP", getPCABR3Disp, 3, "PCA", "O - PCA Bottom #3 Display")
defineString("PCA_BR4_DISP", getPCABR4Disp, 3, "PCA", "O - PCA Bottom #4 Display")
defineString("PCA_BR5_DISP", getPCABR5Disp, 3, "PCA", "O - PCA Bottom #5 Display")

-- PCN
defineMultipositionSwitch("INS_PARAM_SEL", 9, 3574, 574, 11, 0.1, "PCN", "I - PCN - INS Parameter Selector - MP_SW Variant")
defineSetCommandTumb("INS_PARAM_SEL", 9, 3574, 574, 0.1, {0, 1.1}, nil, true, "PCN", " I - PCN - INS Parameter Selector - Rotary Variant") -- by Ergo
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
defineString("PCN_DISP_DEST", getPCNDispDest, 2, "PCN", "O - PCN - DEST Display") -- by Ergo
defineString("PCN_DISP_L", getPCNDispL, 8, "PCN", "O - PCN - Left Display") -- by Ergo
defineString("PCN_DISP_PREP", getPCNDispPrep, 2, "PCN", "O - PCN - PREP Display") -- by Ergo
defineString("PCN_DISP_R", getPCNDispR, 9, "PCN", "O - PCN - Right Display") -- by Ergo
defineString("PCN_DIS_DL", getPCNDigitL, 1, "PCN", "PCN Digit Left Display") -- by Ergo
defineString("PCN_DIS_DR", getPCNDigitR, 1, "PCN", "PCN Digit Right Display") -- by Ergo
defineString("PCN_DIS_2DL", getPCN2DigitL, 2, "PCN", "PCN Digit Left Display (Multi Character)")
defineString("PCN_DIS_2DR", getPCN2DigitR, 2, "PCN", "PCN Digit Right Display (Multi Character)")
defineIndicatorLight("PCN_PRET", 564, "PCN", "O - PCN - PRET Indicator Light")
defineIndicatorLight("PCN_ALN", 565, "PCN", "O - PCN - ALN Indicator Light")
defineIndicatorLight("PCN_MIP", 566, "PCN", "O - PCN - MIP Indicator Light")
defineIndicatorLight("PCN_NDEG", 567, "PCN", "O - PCN - N.DEG Indicator Light")
defineIndicatorLight("PCN_SEC", 568, "PCN", "O - PCN - SEC Indicator Light")
defineIndicatorLight("PCN_UNI", 569, "PCN", "O - PCN - UNI Indicator Light")
defineIndicatorLight("INS_PREP_SW_LIGHT", 571, "PCN", "O - PCN - PREP Button Light")
defineIndicatorLight("INS_DEST_SW_LIGHT", 573, "PCN", "O - PCN - DEST Button Light")
defineIndicatorLight("PCN_BAD", 577, "PCN", "O - PCN - BAD Button Light")
defineIndicatorLight("PCN_REC", 579, "PCN", "O - PCN - REC Button Light")
defineIndicatorLight("INS_EFF_SW_LIGHT", 595, "PCN", "O - PCN - EFF Button Light")
defineIndicatorLight("INS_INS_SW_LIGHT", 597, "PCN", "O - PCN - INS Button Light")
defineIndicatorLight("PCN_VAL_SW_LIGHT", 581, "PCN", "O - PCN - VAL Button Light")
defineIndicatorLight("PCN_MRQ_SW_LIGHT", 583, "PCN", "O - PCN - MRQ Button Light")
defineIndicatorLight("PCN_ENC_SW_LIGHT", 668, "PCN", "O - PCN - ENC Button Light")
defineIndicatorLight("PCN_M91_LIGHT", 669, "PCN", "O - PCN - M91 Indicator Light")
defineIndicatorLight("PCN_M92_LIGHT", 670, "PCN", "O - PCN - M92 Indicator Light")
defineIndicatorLight("PCN_M93_LIGHT", 671, "PCN", "O - PCN - M93 Indicator Light")

-- PPA
defineTumb("BOMB_FUZE_SEL_SW", 6, 3276, 276, 0.5, {0, 1}, nil, false, "PPA", "I - PPA - Bomb Fuze Selector Switch")
definePushButton("S530_STANDBY", 6, 3266, 266, "PPA", "I - PPA - S530 Standby Button")
definePushButton("AUTO_MAN_BTN", 6, 3269, 269, "PPA", "I - PPA - AUTO/MAN Button")
definePushButton("MAGIC_STANDBY", 6, 3272, 272, "PPA", "I - PPA - MAGIC Standby Button")
defineTumb("MIS_SEL_SW", 6, 3265, 265, 1, {-1, 1}, nil, false, "PPA", "I - PPA - Missile Selector Switch")
defineTumb("PPA_TEST_SW", 6, 3275, 275, 1, {-1, 1}, nil, false, "PPA", "I - PPA - Test/Pres Switch")
defineTumb("BOMB_REL_QTY_SEL_SW", 6, 3277, 277, 1, {-1, 1}, nil, false, "PPA", "I - PPA - Bomb Release Quantity Selector Switch")
defineTumb("BOMB_REL_INT_SEL_SW", 6, 3278, 278, 1, {-1, 1}, nil, false, "PPA", "I - PPA - Bomb Release Interval Selector Switch")
definePushButton("FIRING_MODE_SEL", 6, 3279, 279, "PPA", "I - PPA - 530D/Rockets/Guns Firing Mode Selector Button")
defineIndicatorLight("PPA_S530_P", 267, "PPA", "O - PPA - S530 P Light")
defineIndicatorLight("PPA_S530_MIS", 268, "PPA", "O - PPA - S530 MIS Light")
defineIndicatorLight("PPA_AUTO", 270, "PPA", "O - PPA - AUTO Light")
defineIndicatorLight("PPA_MAN", 271, "PPA", "O - PPA - MAN Light")
defineIndicatorLight("PPA_MAGIC_P", 273, "PPA", "O - PPA - MAGIC Light")
defineIndicatorLight("PPA_MAGIC_MIS", 274, "PPA", "O - PPA - MAGIC MAG Light")
defineIndicatorLight("PPA_GUN_ROCKET_PAP", 280, "PPA", "O - PPA - Gun/Rockets Mode PAR Indicator Light")
defineIndicatorLight("PPA_GUN_ROCKET_TOT", 281, "PPA", "O - PPA - Gun/Rockets Mode TOT Indicator Light")
defineString("PPA_QTY_DISP", getPPAQtyDisp, 2, "PPA", "O - PPA Quantity Display")
defineString("PPA_INT_DISP", getPPAIntDisp, 2, "PPA", "O - PPA Interval Display")

-- PSM
defineTumb("INS_OPAL_MODE", 9, 3629, 629, 0.1, {0, 0.4}, nil, false, "PSM", "I - PSM - INS Operational Mode")
defineTumb("INS_MODE_SEL", 9, 3627, 627, 0.1, {0, 0.7}, nil, false, "PSM", "I - PSM - INS Mode Selector")


-- RADAR
defineTumb("RAD_ILLUM_SW", 11, 3481, 481, 0.5, {0, 1}, nil, false, "RADAR", "I - Radar Illumination Switch")
defineTumb("RAD_PWR_SEL", 11, 3486, 486, 0.33, {0, 1}, nil, false, "RADAR", "I - Radar Power Selector")
defineTumb("RAD_SCAN_LINES_SEL", 11, 3502, 502, 0.5, {0, 1}, nil, false, "RADAR", "I - Radar Scan Lines Selector")
defineTumb("RAD_AZ_SEL", 11, 3506, 506, 0.5, {0, 1}, nil, false, "RADAR", "I - Radar Azimuth Selector")
defineToggleSwitch("RAD_WOW_EM_AUT_SW", 5, 3470, 470, "RADAR", "I - Radar WOW Emitter Authorize Switch")
definePushButton("RAD_TEST_BTN", 11, 3482, 482, "RADAR", "I - Radar Test Button")
definePushButton("RAD_REARM_BTN", 11, 3483, 483, "RADAR", "I - Radar Rearm Button")
defineToggleSwitch("RAD_DOP_REJ_SW", 11, 3484, 484, "RADAR", "I - Radar Doppler Reject Switch")
definePotentiometer("RAD_CONTRAST_SW", 11, 3485, 485, {0, 1}, "RADAR", "I - Radar Contrast Switch")
definePotentiometer("RAD_GAIN_DIAL", 11, 3485, 488, {0, 1}, "RADAR", "I - Radar Gain Dial")
definePushButton("AG_RAD_A_MODE_SW", 11, 3491, 491, "RADAR", "I - A/G Radar A Mode Switch")
definePushButton("AG_RAD_DEC_MODE_SW", 11, 3493, 493, "RADAR", "I - A/G Radar DEC Mode Switch")
definePushButton("AG_RAD_VISU_MODE_SW", 11, 3495, 495, "RADAR", "I - A/G Radar VISU Mode Switch")
defineToggleSwitch("RAD_GRID_SEL_SW", 11, 3499, 499, "RADAR", "I - Radar Grid Selector Switch")
defineToggleSwitch("TGT_MEM_TIME_SEL_SW", 11, 3500, 500, "RADAR", "I - Target Memory Time Selector Switch")
definePushButton("AA_RAD_STT_SEL_BTN", 11, 3504, 504, "RADAR", "I - A/A Radar STT Selector Button")
defineToggleSwitch("TDC_MODE_SW", 11, 3710, 710, "RADAR", "I - TDC Mode Switch")
defineTumb("RAD_PRF_SW", 11, 3109, 109, 1, {-1, 1}, nil, false, "RADAR", "I - Radar PRF Switch")
defineTumb("RAD_RNG_SEL_SW", 11, 3503, 503, 1, {-1, 1}, nil, false, "RADAR", "I - Radar Range Selector Switch")
defineIndicatorLight("RAD_VAL", 490, "RADAR", "O - RAD - VAL Button Light")
defineIndicatorLight("RAD_A", 492, "RADAR", "O - RAD - A Button Light")
defineIndicatorLight("RAD_DEC", 494, "RADAR", "O - RAD - DEC Button Light")
defineIndicatorLight("RAD_VISU", 496, "RADAR", "O - RAD - VISU Button Light")
defineIndicatorLight("RAD_PSIC", 505, "RADAR", "O - RAD - PSIC Button Light")

-- RIGHT CONSOLE
defineToggleSwitch("AUDIO_WARN_SW", 16, 3658, 658, "RIGHT CONSOLE", "I - AL - Audio Warning Switch")
defineToggleSwitch("EMER_HYD_PUMP_SW", 3, 3657, 657, "RIGHT CONSOLE", "I - Emergency Hydraulic Pump Switch")
defineToggleSwitch("PITOT_HEAT_COV", 22, 3659, 659, "RIGHT CONSOLE", "I - Pitot Heat Cover")
defineToggleSwitch("PITOT_HEAT_SW", 22, 3660, 660, "RIGHT CONSOLE", "I - Pitot Heat Switch")
defineToggleSwitch("PKG_BRAKE_LEV", 22, 3666, 666, "RIGHT CONSOLE", "I - Parking Brake Lever")
defineToggleSwitch("EMER_COMPASS", 9, 3905, 905, "RIGHT CONSOLE", "I - Emergency Compass")
defineMultipositionSwitch("INS_AUX_HD_HOR", 9, 3665, 665, 3, 0.5, "RIGHT CONSOLE", "I - Backup Gyro Switch")

-- RIGHT PANEL
defineToggleSwitch("QRA_SW", 8, 3654, 654, "RIGHT PANEL", "I - Alert Network (QRA)")
defineToggleSwitch("LOX_DIL_LEV", 25, 3910, 910, "RIGHT PANEL", "I - LOX Dilution Lever")
defineToggleSwitch("LOX_EMER_SUP", 25, 3912, 912, "RIGHT PANEL", "I - LOX Emergency Supply")
defineFloat("OXY_NEEDLE", 518, {0, 1}, "RIGHT PANEL", "O - LOX - Needle")
defineFloat("OXY_FLOW_IND", 519, {0, 1}, "RIGHT PANEL", "O - LOX - Oxygen Flow Indicator")

-- RWR
definePotentiometer("RWR_LGT_BRIGHT_CTRL", 16, 3228, 228, {0, 1}, "RWR", "I - RWR Light Brightnes Control")
defineIndicatorLight("RWR_V", 229, "RWR", "O - RWR - V Indicator Indicator Light")
defineIndicatorLight("RWR_BR", 230, "RWR", "O - RWR - BR Indicator Indicator Light")
defineIndicatorLight("RWR_DA", 231, "RWR", "O - RWR - DA Indicator Indicator Light")
defineIndicatorLight("RWR_D2M", 232, "RWR", "O - RWR - D2M Indicator Indicator Light")
defineIndicatorLight("RWR_LL", 233, "RWR", "O - RWR - LL Indicator Indicator Light")

--SPEED INDICATOR
defineFloat("SPEED_KTS_NEED", 303, {0, 1}, "SPEED", "O - SPEED - Speed Needle")
defineFloat("SPEED_MACH", 304, {0, 1}, "SPEED", "O - SPEED - Mach")

-- TACAN
defineTumb("TAC_CH_10_SEL", 23, 3623, 623, 0.076923, {0, 0.923077}, nil, true, "TACAN", "I - TACAN Channel 10 Selector")
defineTumb("TAC_MODE_SEL", 23, 3626, 626, 1.0/3.0, {0, 1}, nil, false, "TACAN", "I - TACAN Mode Select")
defineToggleSwitch("TAC_X_Y_SEL", 23, 3624, 624, "TACAN", "I - TACAN X/Y Select")
defineTumb("TAC_CH_1_SEL", 23, 3625, 625, 0.1, {0, 0.9}, nil, true, "TACAN", "I - TACAN Channel 1 Selector")

-- TEST PANEL
defineMultipositionSwitch("FBW_TEST_SW", 17, 3517, 517, 3, 0.5, "TEST PANEL", "I - TEST - FBW Test Switch")
defineToggleSwitch("AP_TEST_SW_COV", 17, 3514, 514, "TEST PANEL", "I - TEST - Autopilot Test Switch Cover")
defineToggleSwitch("AP_TEST_SW", 17, 3515, 515, "TEST PANEL", "I - TEST - Autopilot Test Switch")
defineToggleSwitch("FBW_TEST_SW_COV", 17, 3516, 516, "TEST PANEL", "I - TEST - FBW Test Switch Cover")
defineIndicatorLight("ELEC_FAIL", 510, "TEST PANEL", "O - TEST - ELEC Indicator Light")
defineIndicatorLight("HYD_FAIL", 511, "TEST PANEL", "O - TEST - HYD Indicator Light")
defineIndicatorLight("TEST_ROUGE", 512, "TEST PANEL", "O - TEST - Red Indicator Light")
defineIndicatorLight("TEST_VERT", 513, "TEST PANEL", "O - TEST - Green Indicator Light")

-- VHF RADIO
defineMultipositionSwitch("VHF_MODE", 19, 3950, 950,  7, 0.10, "VHF RADIO", "I - VHF - MODE Switch")
defineTumb("VHF_CH_SEL", 19, 3951, 951, 0.05, {0, 0.95}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, true, "VHF RADIO", "I - VHF - Channel Selector")
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
defineString("VHF_FREQUENCY", getVHFFrequency, 5, "VHF RADIO", "O - VHF - Frequency Report Display")

-- UHF RADIO
defineTumb("UHF_MODE_SW", 20, 3433, 433, 0.1, {0, 1}, nil, false, "UHF RADIO", "I - UHF - Mode Selector")
defineToggleSwitch("UHF_PWR_5W_25W_SW", 20, 3429, 429, "UHF RADIO", "I - UHF - Power 5W/25W Switch")
defineToggleSwitch("UHF_SIL_SW", 20, 3430, 430, "UHF RADIO", "I - UHF - SIL Switch")
defineToggleSwitch("UHF_CDE_SW", 20, 3432, 432, "UHF RADIO", "I - UHF - CDE Switch")
definePushButton("UHF_TEST_SW", 20, 3434, 434, "UHF RADIO", "I - UHF - TEST Switch")
defineSetCommandTumb("UHF_PRESET_KNOB", 20, 3435, 435, 0.05, {0, 1}, {" 1", " 2", " 3", " 4", " 5", " 6", " 7", " 8", " 9", "10", "11", "12", "13", "14", "15", "16", "17", "18", "19", "20"}, true, "UHF RADIO", "Preset Knob UHF")
defineTumb("UHF_E+A2_SW", 20, 3431, 431, 1, {-1, 1}, nil, false, "UHF RADIO", "I - UHF - E+A2 Switch")
defineFloat("UHF_PRESET", 436, {0, 1}, "UHF RADIO", "O - UHF - PRESET Display")
defineString("UHF_FREQUENCY", getUHFFrequency, 5, "UHF RADIO", "O - UHF - Frequency Report Display")

-- VOR / ILS
defineMultipositionSwitch("VORILS_FREQ_WHOLE", 24, 3616, 616, 10, 0.1, "VOR / ILS", "I - VOR/ILS Frequency Change Whole")
defineToggleSwitch("VORILS_PWR_DIAL", 24, 3617, 617, "VOR / ILS", "I - VOR/ILS Power Dial")
defineTumb("VORILS_FREQ_DECIMAL", 24, 3618, 618, 0.05, {0, 0.95}, nil, true, "VOR / ILS", "I - VOR/ILS Frequency Change Decimal")
defineToggleSwitch("VORILS_TEST_DIAL", 24, 3619, 619, "VOR / ILS", "I - VOR/ILS Test Dial")

-- VTB
defineToggleSwitch("VTB_PWR_SW", 5, 3221, 221, "VTB", "I - VTB - Power Switch")
defineToggleSwitch("VTB_DEC", 5, 3222, 222, "VTB", "I - VTB - Declutter (ALLEG)")
defineToggleSwitch("VTB_OR_SEL", 5, 3223, 223, "VTB", "I - VTB - Orientation Selector (CADR)")
defineMultipositionSwitch("VTB_ICONS_BRIGHT", 5, 3224, 224, 8, 0.1, "VTB", "I - VTB - Icons and Rulers Brightness (MRQ)")
defineMultipositionSwitch("VTB_VIDEO_BRIGHT", 5, 3225, 225, 8, 0.1, "VTB", "I - VTB - Video Brightness (LUM GEN)")
defineMultipositionSwitch("VTB_DISP_CONTRAST", 5, 3226, 226, 8, 0.1, "VTB", "I - VTB - Display Contrast (CONTRAST)")
defineMultipositionSwitch("VTB_DISP_BRIGHT", 5, 3227, 227, 8, 0.1, "VTB", "I - VTB - Display Brightness (LUM CAV)")
defineTumb("TGT_DATA_MNL_ENTRY", 5, 3213, 213, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Target Data Manual Entry Begin/End (DEB/FIN)")
defineTumb("BE_WP_SEL", 5, 3214, 214, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Bullseye Waypoint Selector (N)")
defineTumb("TGT_RNG_BE", 5, 3215, 215, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Target Range from Bullseye (Rho)")
defineTumb("TGT_BEAR_BE", 5, 3216, 216, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Target Bearing from Bullseye (Theta)")
defineTumb("TGT_HD", 5, 3217, 217, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Target Heading ( C )")
defineTumb("TGT_ALT", 5, 3218, 218, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Target Altitude (Z)")
defineTumb("TGT_MACH_NUM", 5, 3219, 219, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Target Mach Number (M)")
defineTumb("TGT_AGE", 5, 3220, 220, 1, {-1, 1}, nil, false, "VTB", "I - VTB - Target Age (T)")

-- HUD / VTH
defineRotary("MIN_ALT_SEL", 5, 3192, 192, "VTH", "I - HUD - Minimum Altitude Selector")
defineToggleSwitch("HUD_DEC_SW", 5, 3203, 203, "VTH", "I - HUD - Declutter Switch")
defineToggleSwitch("AUX_GUNSIGHT", 5, 3206, 206, "VTH", "I - HUD - Auxiliary Gunsight")
defineRotary("AUX_GUNSIGHT_DEFL", 5, 3207, 207, "VTH", "I - HUD - Auxiliary Gunsight Deflection")
defineToggleSwitch("AG_GUN_RET_SW", 5, 3208, 208, "VTH", "I - HUD - A/G Gun Reticle Switch")
definePotentiometer("TGT_WINGSPAN_KNOB", 5, 3209, 209, {0, 1}, "VTH", "I - HUD - Target Wingspan Knob")
definePushButton("HUD_CLR_BTN", 5, 3210, 210, "VTH", "I - HUD - EFF Button")
defineTumb("HUD_PWR_SW", 5, 3201, 201, 0.5, {0, 1}, nil, false, "VTH", "I - HUD - Power Switch")
defineTumb("HUD_RALT_SEL_SW", 5, 3204, 204, 0.5, {0, 1}, nil, false, "VTH", "I - HUD - Altimeter Selector Switch")
defineTumb("RAD_RALT_PWR_SW", 5, 3205, 205, 0.5, {0, 1}, nil, false, "VTH", "I - HUD - Radar Altimeter Power Switch")
defineIndicatorLight("HUD_REC", 212, "VTH", "O - HUD - Recording Indicator Light")

-- VVI
defineFloat("VARIO_NEEDLE", 324, {-1, 1}, "VVI", "O - VVI - Needle")

-- NVG
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

BIOS.protocol.endModule()