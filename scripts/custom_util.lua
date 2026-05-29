-- Implement custom logic functions here

-- Custom logic: OptionCount
function OptionCount(param1, param2)
	return Tracker:ProviderCountForCode(param1) >= Tracker:ProviderCountForCode(param2)
end

function check_max_level(param)
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= tonumber(param))
end

function check_boss_lock_option(param)
	return (Tracker:FindObjectForCode("Region_Locking").CurrentStage == tonumber(param))
end

function has_abduction_skip()
	if Tracker:FindObjectForCode("Volcano_Manor_Abduction_Skip").Active then
		return true
	else
		return false
	end
end

function has_rold_access()
	if Tracker:FindObjectForCode("Rold_Medallion_Setting").CurrentStage > 0 and Tracker:FindObjectForCode("Rold_Medallion") then
		return true
	elseif (Tracker:FindObjectForCode("Rold_Medallion_Setting").CurrentStage == 0 and Tracker:ProviderCountForCode("great_rune") >= Tracker:ProviderCountForCode("Great_Runes_Rold")) then
		Tracker:FindObjectForCode("Rold_Medallion").Active = true
		return true
	else
		Tracker:FindObjectForCode("Rold_Medallion").Active = false
		return false
	end
end


-- boss requirement checks

function margit_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 1 and Tracker:ProviderCountForCode("progressive_stone_level") >= 1)
end

function makar_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 2 and Tracker:ProviderCountForCode("progressive_stone_level") >= 1)
end

function capital_entry_boss_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 5 and Tracker:ProviderCountForCode("progressive_stone_level") >= 6)
end

function commander_niall_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 7 and Tracker:ProviderCountForCode("progressive_stone_level") >= 8)
end

function morgott_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 6 and Tracker:ProviderCountForCode("progressive_stone_level") >= 6)
end

function red_wolf_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 3 and Tracker:ProviderCountForCode("progressive_stone_level") >= 2)
end

function starscourge_radahn_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 4 and Tracker:ProviderCountForCode("progressive_stone_level") >= 4)
end

function royal_knight_loretta_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 2 and Tracker:ProviderCountForCode("progressive_stone_level") >= 1)
end

function valiant_gargoyles_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 4 and Tracker:ProviderCountForCode("progressive_stone_level") >= 6)
end

function fire_giant_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 7 and Tracker:ProviderCountForCode("progressive_stone_level") >= 8)
end

function astel_killable()
	return (Tracker:FindObjectForCode("progressive_max_level").CurrentStage >= 5 and Tracker:ProviderCountForCode("progressive_stone_level") >= 6)
end