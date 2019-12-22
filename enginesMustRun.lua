-- 
-- Engines must run Script for FS17
-- by Blacky_BPG
-- 
-- Version: 1.9.0.1      | 17.11.2019 - initial FS19 release
-- Version: 1.4.4.0      | 12.05.2017 - initial FS17 release
-- 

enginesMustRun = {}
enginesMustRun.userDir = getUserProfileAppPath()
enginesMustRun.version = "1.9.0.1  -  17.11.2019"

if g_specializationManager:getSpecializationByName("BPG_RunBabyRun") == nil then
	g_specializationManager:addSpecialization("BPG_RunBabyRun", "BPG_RunBabyRun", Utils.getFilename("BPG_RunBabyRun.lua",  g_currentModDirectory),true , nil)

	local numVehT = 0
	for typeName, typeEntry in pairs(g_vehicleTypeManager:getVehicleTypes()) do
		if SpecializationUtil.hasSpecialization(Motorized, typeEntry.specializations) then
			g_vehicleTypeManager:addSpecialization(typeName, "BPG_RunBabyRun")
			numVehT = numVehT + 1
		end
	end
	print(" ++ loading EnginesMustRun V "..tostring(enginesMustRun.version).." for "..tostring(numVehT).." motorized Vehicles")
end
