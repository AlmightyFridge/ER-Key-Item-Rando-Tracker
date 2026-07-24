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
	if Tracker:FindObjectForCode("messmers_kindling_setting").CurrentStage > 0 and Tracker:FindObjectForCode("messmers_kindling").Active then
		return true
	elseif (Tracker:FindObjectForCode("messmers_kindling_setting").CurrentStage == 0 and Tracker:ProviderCountForCode("messmers_kindling_shard_item") >= Tracker:ProviderCountForCode("messmers_kindling_shards_needed")) then
		return true
	else
		return false
	end
end

function has_req_flasks(stage)
	if Tracker:FindObjectForCode("flask_restrictions_setting").Active == false then
		return true
	else
		if stage == "1" then
			if Tracker:ProviderCountForCode("flask_level") >= 2 and Tracker:ProviderCountForCode("flask_charge") >= 6 then
				return true
			end
		elseif stage == "2" then
			if Tracker:ProviderCountForCode("flask_level") >= 4 and Tracker:ProviderCountForCode("flask_charge") >= 7 then
				return true
			end
		elseif stage == "3" then
			if Tracker:ProviderCountForCode("flask_level") >= 6 and Tracker:ProviderCountForCode("flask_charge") >= 8 then
				return true
			end
		elseif stage == "4" then
			if Tracker:ProviderCountForCode("flask_level") >= 8 and Tracker:ProviderCountForCode("flask_charge") >= 9 then
				return true
			end
		elseif stage == "5" then
			if Tracker:ProviderCountForCode("flask_level") >= 9 and Tracker:ProviderCountForCode("flask_charge") >= 10 then
				return true
			end
		elseif stage == "6" then
			if Tracker:ProviderCountForCode("flask_level") >= 10 and Tracker:ProviderCountForCode("flask_charge") >= 12 then
				return true
			end
		end
	end
	return false
end

function has_req_tp(stage)
	if Tracker:FindObjectForCode("talisman_pouches_setting").Active == false then
		return true
	else
		if stage == "2" then
			if Tracker:ProviderCountForCode("talisman_pouch") >= 2 then
				return true
			end
		elseif stage == "3" then
			if Tracker:ProviderCountForCode("talisman_pouch") >= 3 then
				return true
			end
		elseif stage == "4" then
			if Tracker:ProviderCountForCode("talisman_pouch") >= 4 then
				return true
			end
		end
	end
	return false
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