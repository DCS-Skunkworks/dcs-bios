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

devices = nil
device_commands = nil

BIOS.protocol.endModule()
end
