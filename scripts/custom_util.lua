-- Implement custom logic functions here

-- Custom logic: OptionCount
function OptionCount(param1, param2)
	return Tracker:ProviderCountForCode(param1) >= Tracker:ProviderCountForCode(param2)
end

function check_max_level(param)
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= tonumber(param))
end

function check_boss_lock_option(param)
	return (Tracker:FindObjectForCode("Region_Locking_Base").CurrentStage == tonumber(param))
end

function check_boss_lock_option_DLC(param)
	return (Tracker:FindObjectForCode("Region_Locking_DLC").CurrentStage == tonumber(param))
end

function check_goal(param)
	return (Tracker:FindObjectForCode("goal").CurrentStage == tonumber(param))
end

function has_abduction_skip()
	if Tracker:FindObjectForCode("Volcano_Manor_Abduction_Skip").Active then
		return true
	else
		return false
	end
end

function check_minor_bosses()
	if Tracker:FindObjectForCode("minor_bosses").CurrentStage == 1 then
		return true
	elseif Tracker:FindObjectForCode("minor_bosses").CurrentStage == 0 then
		return false
	end
end

function has_rold_access()
	if Tracker:FindObjectForCode("Rold_Medallion_Setting").CurrentStage > 0 and Tracker:FindObjectForCode("rold_medallion").Active then
		return true
	elseif (Tracker:FindObjectForCode("Rold_Medallion_Setting").CurrentStage == 0 and Tracker:ProviderCountForCode("great_rune") >= Tracker:ProviderCountForCode("Great_Runes_Rold")) then
		Tracker:FindObjectForCode("Rold_Medallion").Active = true
		return true
	else
		return false
	end
end

function can_burn_sealing_tree()
	print(string.format("in can_burn_sealing_tree"))
	if Tracker:FindObjectForCode("messmers_kindling_setting").CurrentStage > 0 and Tracker:FindObjectForCode("messmers_kindling").Active then
		print(string.format("messmers_kindling_setting > 0 and messmers_kindling is active"))
		return true
	elseif (Tracker:FindObjectForCode("messmers_kindling_setting").CurrentStage == 0 and Tracker:ProviderCountForCode("messmers_kindling_shard_item") >= Tracker:ProviderCountForCode("messmers_kindling_shards_needed")) then
		print(string.format("messmers_kindling_setting == 0 and messmers_kindling_shard_item has more than messmers_kindling_shards_needed"))
		return true
	else
		print(string.format("neither options are true"))
		return false
	end
end


-- boss requirement checks

function margit_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 1 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 1)
end

function makar_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 2 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 1)
end

function capital_entry_boss_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 5 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 6)
end

function commander_niall_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 7 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 8)
end

function morgott_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 6 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 6)
end

function red_wolf_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 3 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 2)
end

function starscourge_radahn_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 4 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 4)
end

function royal_knight_loretta_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 2 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 1)
end

function valiant_gargoyles_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 4 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 6)
end

function fire_giant_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 7 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 8)
end

function astel_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 5 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 6)
end

function astel_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 5 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 6)
end

function mohg_killable()
	return (Tracker:FindObjectForCode("max_rune_level_+10").CurrentStage >= 8 and Tracker:ProviderCountForCode("max_stone_level_+1") >= 8)
end

function ADM_killable()
	return (Tracker:ProviderCountForCode("max_scadu") >= 1 and Tracker:ProviderCountForCode("max_ash") >= 1)
end

function romina_killable()
	return (Tracker:ProviderCountForCode("max_scadu") >= 4 and Tracker:ProviderCountForCode("max_ash") >= 4)
end


function display_minor_boss(index)
	if Archipelago.PlayerNumber == -1 then
		return true
	else
		minor_boss_data = convert_hex_to_binary(SLOT_DATA.Minor_Boss_Data)
		index = index - 219
		--print(string.format(minor_boss_data))
		if string.sub(minor_boss_data, index, index) == "1" then
			return true
		else
			--print(string.format("it returned false"))
			return false
		end
	end
end

function convert_hex_to_binary(hex_str)
    local hex_to_bin = {
        ['0'] = '0000', ['1'] = '0001', ['2'] = '0010', ['3'] = '0011',
        ['4'] = '0100', ['5'] = '0101', ['6'] = '0110', ['7'] = '0111',
        ['8'] = '1000', ['9'] = '1001', ['A'] = '1010', ['B'] = '1011',
        ['C'] = '1100', ['D'] = '1101', ['E'] = '1110', ['F'] = '1111'
    }

    hex_str = string.gsub(hex_str, "0x", "", 1)

    return ((hex_str:upper():gsub(".", hex_to_bin)):sub(1))
end