-- 
-- Run Baby Run Script for FS17
-- by Blacky_BPG
-- 
-- Version: 1.9.0.1      | 17.11.2019 - initial FS19 release
-- Version: 1.4.4.0      | 12.05.2017 - initial FS17 release
-- 
BPG_RunBabyRun = {}
function BPG_RunBabyRun.prerequisitesPresent(specializations)
    return SpecializationUtil.hasSpecialization(Motorized, specializations)
end

function BPG_RunBabyRun.registerEventListeners(vehicleType)
	local specFunctions = {"onUpdateTick"}
	
	for _, specFunction in ipairs(specFunctions) do
		SpecializationUtil.registerEventListener(vehicleType, specFunction, BPG_RunBabyRun)
	end
end

function BPG_RunBabyRun:onUpdateTick(dt, isActiveForInput, isActiveForInputIgnoreSelection, isSelected)
	local spec = self.spec_BPG_RunBabyRun
	if spec.stopDuration == nil then
		spec.stopDuration = g_gameSettings:getValue("motorStopTimerDuration")
	end
	if self.isServer and self:getIsMotorStarted() then
		if self.spec_motorized.motorStopTimer < spec.stopDuration then
			self.spec_motorized.motorStopTimer = spec.stopDuration * 2
		end
	end
end
