local success1 = pcall(dofile, lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/devices.lua")
local success2 = pcall(dofile, lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/command_defs.lua")
if success1 and success2 then -- only define module if Mig-21 is installed

BIOS.protocol.beginModule("MiG-21Bis", 0x2200)
BIOS.protocol.setExportModuleAircrafts({"MiG-21Bis"})

local documentation = moduleBeingDefined.documentation

local document = BIOS.util.document

local parse_indication = BIOS.util.parse_indication

local defineFloat = BIOS.util.defineFloat
local defineIndicatorLight = BIOS.util.defineIndicatorLight
local definePushButton = BIOS.util.definePushButton
local definePotentiometer = BIOS.util.definePotentiometer
local defineRotary = BIOS.util.defineRotary
local defineSetCommandTumb = BIOS.util.defineSetCommandTumb
local defineTumb = BIOS.util.defineTumb
local defineToggleSwitch = BIOS.util.defineToggleSwitch
local defineToggleSwitchToggleOnly = BIOS.util.defineToggleSwitchToggleOnly
local defineFixedStepTumb = BIOS.util.defineFixedStepTumb
local defineFixedStepInput = BIOS.util.defineFixedStepInput
local defineVariableStepTumb = BIOS.util.defineVariableStepTumb
local defineString = BIOS.util.defineString
local defineRockerSwitch = BIOS.util.defineRockerSwitch
local defineMultipositionSwitch = BIOS.util.defineMultipositionSwitch

dofile(lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/devices.lua")
dofile(lfs.currentdir().."mods/aircraft/Mig-21bis/Cockpit/command_defs.lua")

--Right Vertical Panel
defineToggleSwitch("BAT_HTR", devices.DC_BUS, device_commands.BatteryHeat, 155, "Right Vertical", "Battery Heat On/Off")
defineToggleSwitch("PO7502", devices.AC_BUS, device_commands.PO7502, 154, "Right Vertical", "PO-750 Inverter #2 On/Off")
defineToggleSwitch("PO7501", devices.AC_BUS, device_commands.PO7501, 153, "Right Vertical", "PO-750 Inverter #1 On/Off")
defineTumb("NAV_LIGHTS", devices.LIGHTS, device_commands.NavLights, 194, 0.33, {0.0, 0.99}, nil, true, "Right Vertical", "Nav Lights Off/Dim/Med/Bright")
definePushButton("FUEL_WARN_LIGHT_TEST", devices.LIGHTS_WARNING, device_commands.CheckWarningLights10, 369, "Right Vertical", "Fuel Warn Lights Test")
defineToggleSwitch("FUEL_WARN_LIGHTS_BRT", devices.LIGHTS_WARNING, device_commands.CheckWarningLights11, 195, "Right Vertical", "Fuel Warn Lights Brightness")
definePushButton("MAIN_WARN_LIGHT_TEST", devices.LIGHTS_WARNING, device_commands.CheckWarningLights20, 370, "Right Vertical", "Main Warn Lights Test")
defineToggleSwitch("MAIN_WARN_LIGHTS_BRT", devices.LIGHTS_WARNING, device_commands.CheckWarningLights21, 196, "Right Vertical", "Main Warn Lights Brightness")
defineToggleSwitch("RAD_PWR", devices.RADIO, device_commands.RadioOn, 173, "Right Vertical", "Radio On/Off")
defineToggleSwitch("RAD_CPS", devices.RADIO, device_commands.RadioCompassSound, 208, "Right Vertical", "Radio/Compass Audio")
defineToggleSwitch("RAD_SQL", devices.RADIO, device_commands.Squelch, 209, "Right Vertical", "Radio Squelch")
definePotentiometer("RAD_VOL", devices.RADIO, device_commands.RadioVolume, 210, {0, 1}, "Right Vertical", "Radio Volume")
defineTumb("RAD_CHAN", devices.RADIO, device_commands.RadioChannel, 211, 0.05, {0.0, 0.95}, nil, true, "Right Vertical", "Radio Channel") --May be a better way to do this?
definePotentiometer("WHITE_LIGHT", devices.LIGHTS, device_commands.WhiteLightsMain_axis, 222, {0, 1}, "Right Vertical", "White Lights")
defineToggleSwitch("ARC_PWR", devices.ARK, device_commands.ARKon, 174, "Right Vertical", "ARC On/Off")
definePotentiometer("ARC_VOL", devices.ARK, device_commands.ARKsound, 198, {0, 1}, "Right Vertical", "ARC Volume")
definePushButton("ARC_CHG", devices.ARK, device_commands.ARKpereklucenie, 212, "Right Vertical", "ARC Change")
defineTumb("ARC_CHAN", devices.ARK, device_commands.ARKchannel, 213, 0.1, {0.1, 0.9}, nil, true, "Right Vertical", "ARC Channel") --Split up into individual channels?
defineTumb("ARC_ZONE", devices.ARK, device_commands.ARKzone, 189, 0.14, {0, 0.98}, nil, false, "Right Vertical", "ARC Zones")
defineToggleSwitch("ARC_CMP", devices.ARK, device_commands.ARKantenaCompass, 197, "Right Vertical", "ARC Antenna/Compass")
defineToggleSwitch("RSBN_PWR", devices.RSBN, device_commands.RSBNon, 176, "Right Vertical", "RSBN On/Off")

--Right Horizontal Panel
defineToggleSwitch("BAT_PWR", devices.DC_BUS, device_commands.BatteryOn, 165, "Right Horizontal", "Battery On/Off")
defineToggleSwitch("DC_GEN", devices.DC_BUS, device_commands.DCGenerator, 166, "Right Horizontal", "DC Generator On/Off")
defineToggleSwitch("AC_GEN", devices.AC_BUS, device_commands.ACGenerator, 169, "Right Horizontal", "AC Generator On/Off")
defineToggleSwitch("AUX_INV", devices.AC_BUS, device_commands.EmergencyInverter, 164, "Right Horizontal", "Emergency Inverter On/Off")
defineToggleSwitch("GYRO_1", devices.GYRO_DEVICES, device_commands.Giro1, 162, "Right Horizontal", "Gyro, NPP, SAU, RLS Signal, KPP Power On/Off")
defineToggleSwitch("GYRO_2", devices.GYRO_DEVICES, device_commands.Giro2, 163, "Right Horizontal", "DA-200 Signal, Gyro, NPP, RLS, SAU Power On/Off")
defineToggleSwitch("PUMP_GR3", devices.FUEL_PUMPS, device_commands.Pump3, 159, "Right Horizontal", "Fuel Pump Group 3 On/Off")
defineToggleSwitch("PUMP_GR1", devices.FUEL_PUMPS, device_commands.Pump1, 160, "Right Horizontal", "Fuel Pump Group 1 On/Off")
defineToggleSwitch("DRN_PUMP", devices.FUEL_PUMPS, device_commands.PumpRashod, 161, "Right Horizontal", "Drain Fuel Pump On/Off")
definePotentiometer("TXT_LIGHT", devices.LIGHTS, device_commands.TextBacklight_axis, 612, {0, 1}, "Right Horizontal", "Text Backlights")
definePotentiometer("GAUGE_LIGHT", devices.LIGHTS, device_commands.InstrumentsBacklight_axis, 156, {0, 1}, "Right Horizontal", "Gauge Backlights")
definePotentiometer("RED_LIGHT", devices.LIGHTS, device_commands.RedLightsMain_axis, 157, {0, 1}, "Right Horizontal", "Red Lights")


--Center Upper Panel
definePushButton("ACC_RESET", devices.ACCELEROMETER, device_commands.AccelReset, 228, "Center Upper", "Accelerometer Reset")
defineToggleSwitch("PIT_SEL", devices.PITOT_TUBES, device_commands.PitoSelect, 229, "Center Upper", "Pitot Main/Emergency Select")
defineTumb("RSBN_MODE", devices.RSBN, device_commands.RSBNmode, 240, 0.5, {0, 1}, nil, false, "Center Upper", "RSBN Mode")

--Center Middle Panel
definePotentiometer("FUEL_QTY_SEL", devices.FUEL_SYSTEM, device_commands.FuelQt, 274, {0, 1}, "Center Middle", "Adjust Fuel Quantity")
definePotentiometer("VARI_SET", devices.DA_200, device_commands.DA200set, 261, {-1, 1}, "Center Middle", "Adjust Variometer")
definePushButton("CTR_WARN_LIGHT_TEST", devices.LIGHTS_WARNING, device_commands.CheckWarningLights30, 371, "Center Middle", "Center Warn Lights Test")
defineToggleSwitch("CTR_WARN_LIGHTS_BRT", devices.LIGHTS_WARNING, device_commands.CheckWarningLights31, 273, "Center Middle", "Center Warn Lights Brightness")
definePushButton("MASTER_WARN_LIGHT_TEST", devices.LIGHTS_WARNING, device_commands.SORC, 255, "Center Middle", "Master Warn Light Test/Acknowledge")
defineToggleSwitch("MASTER_WARN_LIGHT_BRT", devices.LIGHTS_WARNING, device_commands.SORCNightDay, 657, "Center Middle", "Master Warn Light Brightness")
defineToggleSwitch("ARC_MRK", devices.ARK, device_commands.ARKfarNear, 254, "Center Middle", "ARC Marker Far/Near")

--Center Lower Panel
defineToggleSwitch("PIT_HEAT_MAIN", devices.PITOT_TUBES, device_commands.PitoHeatMain, 279, "Center Lower", "Pitot, Clock, Periscope Heat")
defineToggleSwitch("PIT_HEAT_AUX", devices.PITOT_TUBES, device_commands.PitoHeatAux, 280, "Center Lower", "Secondary Pitot Heat")
definePushButton("PYL_EMPTY_WARN_LIGHT_TEST", devices.LIGHTS_WARNING, device_commands.CheckWarningLights40, 372, "Center Lower", "Pylon Empty Warn Lights Test")
defineToggleSwitch("PYL_EMPTY_WARN_LIGHTS_BRT", devices.LIGHTS_WARNING, device_commands.CheckWarningLights41, 282, "Center Lower", "Pylon Empty Warn Lights Brightness")
definePushButton("PYL_LD_WARN_LIGHT_TEST", devices.LIGHTS_WARNING, device_commands.CheckWarningLights50, 373, "Center Lower", "Pylon Loaded Warn Lights Test")
defineToggleSwitch("PYL_LD_WARN_LIGHTS_BRT", devices.LIGHTS_WARNING, device_commands.CheckWarningLights51, 283, "Center Lower", "Pylon Loaded Warn Lights Brightness")

--Left Vertical Panel
defineToggleSwitch("APU_PWR", devices.ENGINE_START_DEVICE, device_commands.Zazig, 302, "Left Vertical", "APU On/Off")
defineToggleSwitch("ENG_START_TYPE", devices.ENGINE_START_DEVICE, device_commands.HotStart, 288, "Left Vertical", "Engine Normal/Cold Start Select")
defineToggleSwitch("ENG_AIR_START", devices.ENGINE_START_DEVICE, device_commands.AirStart, 301, "Left Vertical", "Engine Air Start")
definePushButton("ENG_START", devices.ENGINE_START_DEVICE, device_commands.StartButton, 289, "Left Vertical", "Engine Starter")
defineToggleSwitch("SURGE_DOOR", devices.ENGINE, device_commands.SurgeDoors, 308, "Left Vertical", "Surge Doors Auto/Manual")
defineToggleSwitch("AFB_PWR", devices.ENGINE, device_commands.ForsMax, 300, "Left Vertical", "Afterburner On/Off")
defineToggleSwitch("FIRE_EXT_PWR", devices.FIRE_EXTINGUISHER, device_commands.PozarOborud, 303, "Left Vertical", "Fire Extinguisher On/Off")
defineToggleSwitch("FIRE_EXT_CVR", devices.FIRE_EXTINGUISHER, device_commands.PozarSafetyCover, 324, "Left Vertical", "Fire Extinguisher Cover")
definePushButton("FIRE_EXT", devices.FIRE_EXTINGUISHER, device_commands.Ognetushitel, 325, "Left Vertical", "Fire Extinguisher")
defineTumb("LND_LIGHT", devices.LIGHTS, device_commands.LandingLights, 323, 0.5, {0.0, 1}, nil, false, "Left Vertical", "Landing Lights Land/Taxi/Off/Dim/Med/Bright")
definePushButton("GEAR_WARN_LIGHT_TEST", devices.LIGHTS_WARNING, device_commands.CheckWarningLights60, 374, "Left Vertical", "Gear Warn Lights Test")
defineToggleSwitch("GEAR_WARN_LIGHTS_BRT", devices.LIGHTS_WARNING, device_commands.CheckWarningLights61, 322, "Left Vertical", "Gear Warn Lights Brightness")
defineToggleSwitch("RSBN_ARC_SEL", devices.RSBN, device_commands.RSBNARK, 340, "Left Vertical", "RSBN/ARC Select")
definePushButton("RSBN_IDENT", devices.RSBN, device_commands.RSBNident, 294, "Left Vertical", "RSBN Identify")
definePushButton("RSBN_Test", devices.RSBN, device_commands.RSBNtest, 347, "Left Vertical", "RSBN Self-Test")
definePotentiometer("RSBN_VOL", devices.RSBN, device_commands.RSBNsound, 345, {0, 1}, "Left Vertical", "RSBN Volume")
defineTumb("RSBN_CHAN", devices.RSBN, device_commands.RSBNnav, 351, 0.01, {0, 0.99}, nil, true, "Left Vertical", "RSBN Channel")
defineTumb("PRMG_CHAN", devices.RSBN, device_commands.RSBNland, 352, 0.01, {0, 0.99}, nil, true, "Left Vertical", "PRMG Channel")
definePushButton("RSBN_RST", devices.RSBN, device_commands.RSBNreset, 366, "Left Vertical", "RSBN Reset")
defineToggleSwitch("RSBN_DIST", devices.RSBN, device_commands.RSBNfar, 368, "Left Vertical", "RSBN Distance")
defineToggleSwitch("RSBN_BRG", devices.RSBN, device_commands.RSBNbearing, 367, "Left Vertical", "RSBN Bearing")


--Left Horizontal Panel
defineToggleSwitch("ENG_STOP", devices.ENGINE_START_DEVICE, device_commands.RUDStop_lock, 616, "Left Horizontal", "Engine Stop/Throttle Lock")
defineToggleSwitch("EMR_AFB_PWR", devices.ENGINE, device_commands.Chr, 320, "Left Horizontal", "Emergency Afterburner")
definePushButton("RAD_PTT", devices.INTERCOM, device_commands.RadioINTERCOM, 315, "Left Horizontal", "Radio PTT")

-- SAU
defineToggleSwitch("SAU_PWR", devices.SAU, device_commands.SAUon, 179, "Right Vertical", "SAU On/Off")
defineToggleSwitch("SAU_PITCH_PWR", devices.SAU, device_commands.SAUpitchOn, 180, "Right Vertical", "SAU Pitch On/Off")
definePushButton("SAU_STAB", devices.SAU, device_commands.SAUstabil, 343, "Left Vertical", "SAU Stabilization Mode")
definePushButton("SAU_CANCEL", devices.SAU, device_commands.SAUcancel, 376, "Stick", "SAU Cancel Current Mode")
definePushButton("SAU_RECOVERY", devices.SAU, device_commands.SAUprivedenie, 377, "Stick", "SAU Recovery Mode")
defineToggleSwitch("SAU_LOW", devices.SAU, device_commands.SAUlowAltOn, 344, "Left Vertical", "SAU Limit Altitude")
definePushButton("SAU_LAND_CMD", devices.SAU, device_commands.SAUlandingControlCommand, 341, "Left Vertical", "SAU Command Landing Mode")
definePushButton("SAU_LAND_AUTO", devices.SAU, device_commands.SAUlandingControlAuto, 342, "Left Vertical", "SAU Auto Landing Mode")
definePushButton("SAU_RST", devices.SAU, device_commands.SAUresetOff, 348, "Left Vertical", "SAU Reset/Off")

-- SPO
defineToggleSwitch("SPO_PWR", devices.SPO, device_commands.SPOon, 202, "Right Vertical", "SPO On/Off")
definePushButton("SPO_TEST", devices.SPO, device_commands.SPOtest, 226, "Center Upper", "SPO Test")
defineToggleSwitch("SPO_DAY", devices.SPO, device_commands.SPOdayNight, 227, "Center Upper", "SPO Day/Night")
definePotentiometer("SPO_VOL", devices.SPO, device_commands.SPOvolume, 225, {0, 1}, "Center Upper", "SPO Volume")

-- SRZO
defineToggleSwitch("SRZO_PWR", devices.SRZO, device_commands.SRZOvopros, 188, "Right Vertical", "SRZO IFF Coder/Decoder On/Off")
defineTumb("SRZO_CODE", devices.SRZO, device_commands.SRZOcodes, 192, 0.08, {0.0, 0.88}, nil, true, "Right Vertical", "SRZO Codes")
defineToggleSwitch("SRZO_81_PWR", devices.SRZO, device_commands.SRZOon, 346, "Right Vertical", "SRZO Type 81 On/Off")
defineToggleSwitch("SRZO_EM_TX_CVR", devices.SRZO, device_commands.EmergTransmitSafetyCover, 190, "Right Vertical", "SRZO Emergency Transmit Cover")
defineToggleSwitch("SRZO_EM_TX", devices.SRZO, device_commands.EmergTransmitOn, 191, "Right Vertical", "SRZO Emergency Transmit")
defineToggleSwitch("SRZO_DEST_CVR", devices.SRZO, device_commands.SRZODestrCover, 427, "Right Vertical", "SRZO Self Destruct Cover")
definePushButton("SRZO_DEST", devices.SRZO, device_commands.SRZODestr, 428, "Right Vertical", "SRZO Self Destruct")

-- SOD (increase radar signal for ATC radar, most likely won't be implemented)
defineToggleSwitch("SOD_PWR", devices.SOD, device_commands.SODon, 200, "Right Vertical", "SOD IFF On/Off")
definePushButton("SOD_IDENT", devices.SOD, device_commands.SODident, 199, "Right Vertical", "SOD Identify")
defineTumb("SOD_WAVE", devices.SOD, device_commands.SODvolni, 201, 0.5, {0, 1}, nil, false, "Right Vertical", "SOD Wave Selector 3/1/2")
defineTumb("SOD_MODE", devices.SOD, device_commands.SODmode, 204, .25, {0, 1}, nil, false, "Right Vertical", "SOD Mode Select")

--RADAR
defineTumb("RADAR_PWR", devices.RADAR, device_commands.RADARon, 205, 0.5, {0, 1}, nil, false, "Right Vertical", "RADAR On/Standby/Off")
defineTumb("RADAR_LOW_ALT", devices.RADAR, device_commands.RADARlowAlt, 206, 0.5, {0, 1}, nil, false, "Right Vertical", "RADAR Low Altitude Off/Comp/On")
defineToggleSwitch("RADAR_BEAM", devices.RADAR, device_commands.RADARfixBeam, 207, "Right Vertical", "RADAR Fixed Beam On/Off")
definePushButton("RADAR_DISP_RST", devices.RADAR, device_commands.RADARmgnStir, 266, "Center Middle", "RADAR Screen Magnetic Reset")
definePushButton("RADAR_CNT", devices.RADAR, device_commands.RADARjamCont, 330, "Center Middle", "RADAR Interferes - Continues")
definePushButton("RADAR_TEMP", devices.RADAR, device_commands.RADARjamTmp, 331, "Center Middle", "RADAR Interferes - Temporary")
definePushButton("RADAR_PASS", devices.RADAR, device_commands.RADARjamPass, 332, "Center Middle", "RADAR Interferes - Passive")
definePushButton("RADAR_WX", devices.RADAR, device_commands.RADARjamMeteo, 333, "Center Middle", "RADAR Interferes - Weather")
definePushButton("RADAR_IFF", devices.RADAR, device_commands.RADARvopros, 334, "Center Middle", "RADAR Interferes - IFF")
definePushButton("RADAR_LOW", devices.RADAR, device_commands.RADARjamLowSpeed, 335, "Center Middle", "RADAR Interferes - Low Speed")
definePushButton("RADAR_TEST", devices.RADAR, device_commands.RADARkontrol, 336, "Center Middle", "RADAR Interferes - Self-Test")
definePushButton("RADAR_RST", devices.RADAR, device_commands.RADARreset, 337, "Center Middle", "RADAR Interferes - Reset")
definePushButton("RADAR_LOCK", devices.RADAR, device_commands.Zahvat, 378, "Stick", "RADAR Lock Target")
definePotentiometer("RADAR_FLT", devices.RADAR, device_commands.RADARFilter, 623, {0, 1}, "Center Middle", "RADAR Polar Filter")

--SPRD/RATO
defineToggleSwitch("SPRD_PWR", devices.SPRD, device_commands.SPRDstartOn, 167, "Right Horizontal", "SPRD On/Off")
defineToggleSwitch("SPRD_DROP_PWR", devices.SPRD, device_commands.SPRDdropOn, 168, "Right Horizontal", "SPRD Drop System On/Off")
defineToggleSwitch("SPRD_START_COVER", devices.SPRD, device_commands.SPRDstartSafetyCover, 252, "Center Middle", "SPRD Start Cover")
definePushButton("SPRD_START", devices.SPRD, device_commands.SPRDstart, 253, "Center Middle", "SPRD Start")
defineToggleSwitch("SPRD_DROP_COVER", devices.SPRD, device_commands.SPRDdropSafetyCover, 317, "Left Horizontal", "SPRD/Flare Drop Cover")
definePushButton("SPRD_DROP", devices.SPRD, device_commands.SPRDdrop, 318, "Left Horizontal", "SPRD/Flare Drop")

--SPS
defineToggleSwitch("SPS_PWR", devices.SPS, device_commands.SPSon, 293, "Left Vertical", "SPS System On/Off")

--ARU
defineToggleSwitch("ARU_MODE", devices.ARU, device_commands.ARUmanAuto, 295, "Left Vertical", "ARU Auto/Manual")
defineTumb("ARU_SPD", devices.ARU, device_commands.ARUhighSpeed, 296, 1, {-1, 1}, nil, false, "Left Vertical", "ARU Low/Neutral/High speed") --Momentary 3 position switch

--Airbrake
defineToggleSwitch("AIR_BRK", devices.AIRBRAKE, device_commands.Airbrakes, 316, "Left Horizontal", "Airbrakes")

--Wheelbrakes
defineToggleSwitch("ABS_ON", devices.GEAR_BRAKES, device_commands.ABSon, 299, "Left Vertical", "ABS On/Off")
defineToggleSwitch("NW_BRK", devices.GEAR_BRAKES, device_commands.NosegearBrake, 238, "Center Upper", "Nosegear Brake On/Off")
defineToggleSwitch("EM_BRK", devices.GEAR_BRAKES, device_commands.EmergBrakes, 237, "Center Middle", "Emergency Brake")

--Gear
defineToggleSwitch("GEAR_LOCK", devices.GEARS, device_commands.GearHandleFixator, 326, "Left Vertical", "Gear Handle Lock")
defineTumb("GEAR_LVR", devices.GEARS, device_commands.GearLever, 327, 1, {-1, 1}, nil, false, "Left Vertical", "Gear Down/Neutral/Up")
definePotentiometer("EM_GEAR_REL", devices.GEARS, device_commands.EmergGearsMain, 223, {0, 1}, "Right Vertical", "Emergency Gear Release")
defineToggleSwitch("EM_NOSE_GEAR_REL", devices.GEARS, device_commands.EmergGearsNose, 281, "Center Lower", "Emergency Nose Gear Release")

--Flaps
defineToggleSwitch("FLAPS_NEUT", devices.FLAPS, device_commands.Flaps0, 311, "Left Horizontal", "Flaps Neutral")
defineToggleSwitch("FLAPS_TO", devices.FLAPS, device_commands.Flaps25, 312, "Left Horizontal", "Flaps Take-off")
defineToggleSwitch("FLAPS_LDG", devices.FLAPS, device_commands.Flaps45, 313, "Left Horizontal", "Flaps Landing")
definePushButton("FLAPS_RST", devices.FLAPS, device_commands.FlapsReset, 314, "Left Horizontal", "Flaps Reset")

--Drogue Chute
definePushButton("CHUTE_REL", devices.CHUTE, device_commands.DragChute, 298, "Left Vertical", "Drogue Chute Release")
defineToggleSwitch("CHUTE_DROP_CVR", devices.CHUTE, device_commands.DragChuteSafetyCover, 304, "Left Horizontal", "Drogue Chute Drop Cover")
definePushButton("CHUTE_DROP", devices.CHUTE, device_commands.DragChuteDisconnect, 305, "Left Horizontal", "Drogue Chute Drop")

--Trimmer
defineToggleSwitch("TRM_PWR", devices.TRIMER, device_commands.TrimmerOn, 172, "Right Vertical", "Trimmer On/Off")
defineTumb("TRM_ADJ", devices.TRIMER, device_commands.TrimmerBtnUp, 379, 1, {-1, 1}, nil, false, "Stick", "Trimmer Adjust")

--Nosecone
defineToggleSwitch("CONE_PWR", devices.KONUS, device_commands.KonusOn, 170, "Right Vertical", "Nosecone On/Off")
defineToggleSwitch("CONE_MODE", devices.KONUS, device_commands.KonusManAuto, 309, "Left Vertical", "Nosecone Auto/Manual control")
definePotentiometer("CONE_ADJ", devices.KONUS, device_commands.KonusButton, 236, {0, 1}, "Center Upper", "Nosecone Manual Adjust")

--SOPLO
defineToggleSwitch("NOZ_POS", devices.SOPLO, device_commands.Soplo2xPoz, 291, "Left Vertical", "Emergency Nozzle Position Control")

--Main and buster hydro
defineToggleSwitch("EMR_HYD_PUMP", devices.MAIN_HYDRO, device_commands.NR27on, 171, "Right Vertical", "Emergency Main Hydraulic Pump On/Off")
defineToggleSwitch("AIL_BST", devices.MAIN_HYDRO, device_commands.AileronBoosters, 319, "Left Horizontal", "Aileron Boosters On/Off")

--KPP
defineToggleSwitch("KPP_MAIN_EMR", devices.KPP, device_commands.KPPon, 177, "Right Vertical", "KPP Main/Emergency")
definePushButton("KPP_CGE", devices.KPP, device_commands.KPParretir, 259, "Center Middle", "KPP Cage")
definePotentiometer("KPP_SET", devices.KPP, device_commands.KPPsetPitch, 260, {-1, 1}, "Center Middle", "KPP Set Pitch")

--IAS/TAS/KSI (NPP)
defineToggleSwitch("NPP_PWR", devices.KSI, device_commands.NPPon, 178, "Right Vertical", "NPP On/Off")
definePushButton("NPP_ADJ", devices.KSI, device_commands.NPPnastrojka, 258, "Center Middle", "NPP Adjust")
definePotentiometer("NPP_CRS", devices.KSI, device_commands.NPPsetCourse, 263, {0, 1}, "Center Middle", "NPP Course Set")

--ALT and RALT
defineToggleSwitch("RALT_PWR", devices.RADIO_ALTIMETER, device_commands.RadioAltOn, 175, "Right Vertical", "Radio Altimeter On")
defineTumb("ALT_WARN", devices.RADIO_ALTIMETER, device_commands.DangerAltSelect, 284, 0.14, {0.0, 0.98}, nil, false, "Center Lower", "Altitude Warning Alarm Adjust")
definePotentiometer("ALT_PRESS", devices.ALTIMETER, device_commands.AltimeterPressure, 262, {-1, 1}, "Center Middle", "Altimeter Pressure Knob")

--Oxygen System
defineToggleSwitch("HELM_AIR", devices.OXYGENE_SYSTEM, device_commands.HelmetAirCondition, 285, "Left Horizontal", "Helmet Air Conditioning On/Off")
defineToggleSwitch("EMR_O2", devices.OXYGENE_SYSTEM, device_commands.EmergOxygene, 286, "Left Horizontal", "Emergency Oxygen")
defineToggleSwitch("MIX_O2", devices.OXYGENE_SYSTEM, device_commands.MixtureOxygeneSelect, 287, "Left Horizontal", "Mixture/Oxygen")

--Canopy
defineToggleSwitch("CAB_PRES", devices.CANOPY, device_commands.CanopyHermetHandle, 328, "Left Vertical", "Pressurize Canopy")
defineToggleSwitch("CAN_LCK", devices.CANOPY, device_commands.CanopyLockHandle, 329, "Left Vertical", "Lock Canopy")
definePushButton("CAN_OPN", devices.CANOPY, device_commands.CanopyOpen, 375, "Left Vertical", "Open Canopy")
definePushButton("CAN_CLS", devices.CANOPY, device_commands.CanopyClose, 385, "Center Upper", "Close Canopy")
definePushButton("CAN_ANTI_ICE", devices.CANOPY, device_commands.CanopyAntiIce, 239, "Center Upper", "Canopy Anti Ice")
defineToggleSwitch("CAN_EMR_REL", devices.CANOPY, device_commands.CanopyEmergRelease, 224, "Right Vertical", "Canopy Emergency Jettison")
definePotentiometer("CAN_VENT", devices.CANOPY, device_commands.CanopyVentSystem, 649, {0, 1}, "Right Vertical", "Canopy Ventilation")

--ASP Gunsight
defineToggleSwitch("SIGHT_PWR", devices.ASP, device_commands.ASPon, 186, "Right Vertical", "Gunsight On/Off")
defineToggleSwitch("SIGHT_MAN_AUTO", devices.ASP, device_commands.ASPmanAutoSelect, 241, "Gunsight", "Gunsight Auto/Manual")
defineToggleSwitch("SIGHT_SHT_BMB", devices.ASP, device_commands.ASPbombStrelbSelect, 242, "Gunsight", "Gunsight Shoot/Bomb Select")
defineToggleSwitch("SIGHT_MSL_GUN", devices.ASP, device_commands.ASPmissileGunSelect, 243, "Gunsight", "Gunsight gun/missile Select")
defineToggleSwitch("SIGHT_GYRO_MSL", devices.ASP, device_commands.ASPssGiroSelect, 244, "Gunsight", "Gunsight Gyro/Missile Select")
defineToggleSwitch("SIGHT_PPR", devices.ASP, device_commands.ASPpipperOn, 249, "Gunsight", "Gunsight Pipper On/Off")
defineToggleSwitch("SIGHT_FIX_NET", devices.ASP, device_commands.ASPnetOn, 250, "Gunsight", "Gunsight Fixed Net On/Off")
definePotentiometer("TGT_SIZE", devices.ASP, device_commands.ASPtargetSize, 245, {0, 1}, "Gunsight", "Gunsight Target Range")
definePotentiometer("INT_ANGLE", devices.ASP, device_commands.ASPinterceptAngle, 246, {0, 1}, "Gunsight", "Gunsight Intercept Angle")
definePotentiometer("SCL_BRT", devices.ASP, device_commands.ASPscaleLight, 247, {0, 1}, "Gunsight", "Gunsight Scale Brightness")
definePotentiometer("PPR_BRT", devices.ASP, device_commands.ASPpipperLight, 248, {0, 1}, "Gunsight", "Gunsight Pipper Brightness")
definePotentiometer("FIX_NET_BRT", devices.ASP, device_commands.ASPnetLight, 251, {0, 1}, "Gunsight", "Gunsight Fixed Net Brightness")
definePotentiometer("TDC_RGE_SPAN", devices.ASP, device_commands.RUDoblog_axis, 384, {0, 1}, "Left Horizontal", "TDC Range/Pipper Span")

--Weapon Control
defineToggleSwitch("MSL_HEAT", devices.WEAPON_CONTROL, device_commands.Obogrev, 181, "Right Vertical", "Missile/Rocket Heat")
defineToggleSwitch("MSL_LNCH", devices.WEAPON_CONTROL, device_commands.Pusk, 182, "Right Vertical", "Missile/Rocket Launch")
defineToggleSwitch("INB_PYL_PWR", devices.WEAPON_CONTROL, device_commands.Pitanie12, 183, "Right Vertical", "Pylons 1-2 On/Off")
defineToggleSwitch("OBD_PYL_PWR", devices.WEAPON_CONTROL, device_commands.Pitanie34, 184, "Right Vertical", "Pylons 3-4 On/Off")
defineToggleSwitch("GUN_PWR", devices.WEAPON_CONTROL, device_commands.GS23, 185, "Right Vertical", "GS-23 Gun On/Off")
defineToggleSwitch("GUN_CAM", devices.WEAPON_CONTROL, device_commands.FKP, 187, "Right Vertical", "Gun Camera On/Off")
defineToggleSwitch("BMB_FUZ_CVR", devices.WEAPON_CONTROL, device_commands.TaktSbrosSafetyCover, 277, "Center Lower", "Tactical Drop Cover")
defineToggleSwitch("BMB_FUZ", devices.WEAPON_CONTROL, device_commands.TaktSbros, 278, "Center Lower", "Tactical Drop")
defineToggleSwitch("EM_MSL_JET_CVR", devices.WEAPON_CONTROL, device_commands.AvarPuskSafetyCover, 275, "Center Lower", "Emergency Missile/Rocket Launch Cover")
definePushButton("EM_MSL_JET", devices.WEAPON_CONTROL, device_commands.AvarPusk, 276, "Center Lower", "Emergency Missile/Rocket Launch")
defineToggleSwitch("WING_DRP_TKS_CVR", devices.WEAPON_CONTROL, device_commands.SbrosKrilBakovSafetyCover, 256, "Center Middle", "Wing Drop Tank Jettison Cover")
definePushButton("WING_DRP_TKS", devices.WEAPON_CONTROL, device_commands.SbrosKrilBakov, 257, "Center Middle", "Wing Drop Tank Jettison")
definePushButton("CTR_DRP_TK", devices.WEAPON_CONTROL, device_commands.SbrosPodvBakov, 386, "Stick", "Centerline Drop Tank Jettison")
defineToggleSwitch("OBD_PYL_JET_CVR", devices.WEAPON_CONTROL, device_commands.SbrosVnesnSafetyCover, 269, "Center Middle", "Outboard Pylon Jettison Cover")
definePushButton("OBD_PYL_JET", devices.WEAPON_CONTROL, device_commands.SbrosVnesn, 270, "Center Middle", "Outboard Pylon Jettison")
defineToggleSwitch("INB_PYL_JET_CVR", devices.WEAPON_CONTROL, device_commands.SbrosVnutrSafetyCover, 271, "Center Middle", "Inboard Pylon Jettison Cover")
definePushButton("INB_PYL_JET", devices.WEAPON_CONTROL, device_commands.SbrosVnutr, 272, "Center Middle", "Inboard Pylon Jettison")
defineToggleSwitch("MODE_AA_AG", devices.WEAPON_CONTROL, device_commands.ASPvozduhZemlja, 230, "Center Upper", "Weapons AA/AG Mode")
defineTumb("IR_SAR_NEU", devices.WEAPON_CONTROL, device_commands.ASPssNeutrRns, 231, 0.5, {0, 1}, nil, false, "Center Upper", "IR/Neutral/SAR Missile Mode")
definePushButton("GUN_PYRO_1", devices.WEAPON_CONTROL, device_commands.ASPgunReload1, 232, "Center Upper", "Gun Pyro Charge 1")
definePushButton("GUN_PYRO_2", devices.WEAPON_CONTROL, device_commands.ASPgunReload2, 233, "Center Upper", "Gun Pyro Charge 2")
definePushButton("GUN_PYRO_3", devices.WEAPON_CONTROL, device_commands.ASPgunReload3, 234, "Center Upper", "Gun Pyro Charge 3")
defineTumb("WPN_SEL", devices.WEAPON_CONTROL, device_commands.ASPlauncherSelect, 235, .1, {0, 1}, nil, true, "Center Upper", "Weapon Selector")
definePotentiometer("MSL_VOL", devices.WEAPON_CONTROL, device_commands.MissileSound, 297, {0, 1}, "Left Vertical", "IR Missile Seeker Volume")
definePushButton("GUN", devices.WEAPON_CONTROL, device_commands.GunFireBtn, 381, "Stick", "Gun Trigger")
definePushButton("WPN_REL", devices.WEAPON_CONTROL, device_commands.PuskBtn, 382, "Stick", "Weapons Release")
defineToggleSwitch("WPN_REL_CVR", devices.WEAPON_CONTROL, device_commands.PuskBtnSafetyCover, 383, "Stick", "Weapons Release Cover")

--Helmet Visor
defineToggleSwitch("HELM_HEAT_MODE", devices.HELMET_VISOR, device_commands.HelmetHeatManAut, 306, "Left Vertical", "Helmet Heat Auto/Manual")
definePushButton("HELM_QUICK_HEAT", devices.HELMET_VISOR, device_commands.HelmetQuickHeat, 310, "Left Vertical", "Helmet Quick Heat")
defineToggleSwitch("HELM_VSR", devices.HELMET_VISOR, device_commands.HelmetVisor, 369, "Left Vertical", "Helmet Visor On/Off")

--Air Conditioning
defineTumb("CPT_AIR_CND", devices.AIR_CONDITIONING, device_commands.AirConditioningSelect, 292, 0.33, {0, 0.99}, nil, true, "Left Vertical", "Air Conditioning Select")

devices = nil
device_commands = nil

BIOS.protocol.endModule()
end
