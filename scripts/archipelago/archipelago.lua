-- this is an example/ default implementation for AP autotracking
-- it will use the mappings defined in item_mapping.lua and LOCATION_TO_ID_MAP.lua to track items and locations via thier ids
-- it will also load the AP slot data in the global SLOT_DATA, keep track of the current index of on_item messages in CUR_INDEX
-- addition it will keep track of what items are local items and which one are remote using the globals LOCAL_ITEMS and GLOBAL_ITEMS
-- this is useful since remote items will not reset but local items might
ScriptHost:LoadScript("scripts/archipelago/item_mapping.lua")
ScriptHost:LoadScript("scripts/archipelago/location_mapping.lua")

CUR_INDEX = -1
SLOT_DATA = nil
LOCAL_ITEMS = {}
GLOBAL_ITEMS = {}

function dump_table(o, depth)
	if depth == nil then
		depth = 0
	end
	if type(o) == 'table' then
		local tabs = ('\t'):rep(depth)
		local tabs2 = ('\t'):rep(depth + 1)
		local s = '{\n'
		for k, v in pairs(o) do
			if type(k) ~= 'number' then
				k = '"' .. k .. '"'
			end
			s = s .. tabs2 .. '[' .. k .. '] = ' .. dump_table(v, depth + 1) .. ',\n'
		end
		return s .. tabs .. '}'
	else
		return tostring(o)
	end
end

function SetSettings()
    Tracker:FindObjectForCode("goal").CurrentStage = SLOT_DATA.goal

	Tracker:FindObjectForCode("Seedsanity").Active = (SLOT_DATA.Seedsanity == 1)
	Tracker:FindObjectForCode("Tearsanity").Active = (SLOT_DATA.Tearsanity == 1)
    Tracker:FindObjectForCode("Shopsanity").Active = (SLOT_DATA.Shopsanity == 1)
	Tracker:FindObjectForCode("Dragonsanity").Active = (SLOT_DATA.Dragonsanity == 1)
	Tracker:FindObjectForCode("Paintingsanity").Active = (SLOT_DATA.Paintingsanity == 1)
	Tracker:FindObjectForCode("Risesanity").Active = (SLOT_DATA.Risesanity == 1)

	Tracker:FindObjectForCode("Volcano_Manor_Abduction_Skip").Active = (SLOT_DATA.Volcano_Manor_Abduction_Skip)
    Tracker:FindObjectForCode("Early_Academy_Key").Active = (SLOT_DATA.Early_Academy_Key == 1)
    Tracker:FindObjectForCode("Vanilla_Great_Runes").Active = (SLOT_DATA.Vanilla_Great_Runes == 1)
    
    Tracker:FindObjectForCode("Great_Runes_Elden_Beast").AcquiredCount = SLOT_DATA.Great_Runes_Elden_Beast
	Tracker:FindObjectForCode("Great_Runes_Rold").AcquiredCount = SLOT_DATA.Great_Runes_Rold
	Tracker:FindObjectForCode("Great_Runes_Capital").AcquiredCount = SLOT_DATA.Great_Runes_Capital
	Tracker:FindObjectForCode("Region_Locking_Base").CurrentStage = SLOT_DATA.Region_Locking_Base
    Tracker:FindObjectForCode("Rold_Medallion_Setting").CurrentStage = SLOT_DATA.Rold_Medallion_Setting

    if SLOT_DATA.goal == 3 then
        Tracker:FindObjectForCode("Great_Rune_Hunt_Count").AcquiredCount = SLOT_DATA.Great_Rune_Hunt_Victory_Count
    end

    Tracker:FindObjectForCode("whetblades_setting").Active = (SLOT_DATA.Add_Whetblades == 1)
    Tracker:FindObjectForCode("talisman_pouches_setting").Active = (SLOT_DATA.Add_Talisman_Pouches == 1)
    Tracker:FindObjectForCode("flask_restrictions_setting").Active = (SLOT_DATA.Add_Flask_Restrictions == 1)

    Tracker:FindObjectForCode("DLC").CurrentStage = SLOT_DATA.DLC
    
	Tracker:FindObjectForCode("Region_Locking_DLC").CurrentStage = SLOT_DATA.Region_Locking_DLC

	Tracker:FindObjectForCode("Scadusanity").Active = (SLOT_DATA.Scadusanity == 1)
	Tracker:FindObjectForCode("Ashsanity").Active = (SLOT_DATA.Ashsanity == 1)

    Tracker:FindObjectForCode("Messmers_Kindling_Setting").CurrentStage = SLOT_DATA.Messmers_Kindling_Setting
	Tracker:FindObjectForCode("Messmers_Kindling_Shards_Total").AcquiredCount = SLOT_DATA.Messmers_Kindling_Shards_Total
	Tracker:FindObjectForCode("Messmers_Kindling_Shards_Needed").AcquiredCount = SLOT_DATA.Messmers_Kindling_Shards_Needed

    if SLOT_DATA.minor_bosses_setting == 0 then
        Tracker:FindObjectForCode("minor_bosses").CurrentStage = 0
    else
        Tracker:FindObjectForCode("minor_bosses").CurrentStage = 1
    end

    Tracker:FindObjectForCode("night_bosses").Active = (SLOT_DATA.Minor_Bosses_Nightsanity == 1)
    Tracker:FindObjectForCode("catacombs").Active = (SLOT_DATA.Minor_Bosses_Catacombsanity == 1)
    Tracker:FindObjectForCode("caves").Active = (SLOT_DATA.Minor_Bosses_Cavesanity == 1)
    Tracker:FindObjectForCode("dlc-catacombs").Active = (SLOT_DATA.Minor_Bosses_DLC_Catacombsanity == 1)
    Tracker:FindObjectForCode("dlc-caves").Active = (SLOT_DATA.Minor_Bosses_DLC_Cavesanity == 1)
    Tracker:FindObjectForCode("dlc-historical").Active = (SLOT_DATA.Minor_Bosses_DLC_Ruinsanity == 1)
    Tracker:FindObjectForCode("dlc-roamers").Active = (SLOT_DATA.Minor_Bosses_DLC_Fieldsanity == 1)
    Tracker:FindObjectForCode("evergaols").Active = (SLOT_DATA.Minor_Bosses_Evergaolsanity == 1)
    Tracker:FindObjectForCode("gaols").Active = (SLOT_DATA.Minor_Bosses_Gaolsanity == 1)
    Tracker:FindObjectForCode("golems").Active = (SLOT_DATA.Minor_Bosses_Golemsanity == 1)
    Tracker:FindObjectForCode("heros_graves").Active = (SLOT_DATA.Minor_Bosses_Heros_Gravesanity == 1)
    Tracker:FindObjectForCode("historical").Active = (SLOT_DATA.Minor_Bosses_Ruinsanity == 1)
    Tracker:FindObjectForCode("hunters").Active = (SLOT_DATA.Minor_Bosses_Huntersanity == 1)
    Tracker:FindObjectForCode("mausoleums").Active = (SLOT_DATA.Minor_Bosses_Mausoleumsanity == 1)
    Tracker:FindObjectForCode("roamers").Active = (SLOT_DATA.Minor_Bosses_Fieldsanity == 1)
    Tracker:FindObjectForCode("trees").Active = (SLOT_DATA.Minor_Bosses_Treesanity == 1)
    Tracker:FindObjectForCode("tunnels").Active = (SLOT_DATA.Minor_Bosses_Tunnelsanity == 1)

    Tracker:FindObjectForCode("fortissax").Active = (SLOT_DATA.Include_Fortissax == 1)
    Tracker:FindObjectForCode("critical_path").Active = (SLOT_DATA.Include_Critical_Path_Bosses == 1)

end

function onClear(slot_data)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onClear, slot_data:\n%s", dump_table(slot_data)))
    end
    SLOT_DATA = slot_data
    CUR_INDEX = -1

    -- reset locations
    for _, v in pairs(ID_TO_LOCATION_MAP) do
        if v[1] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing location %s", v[1]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[1]:sub(1, 1) == "@" then
                    obj.AvailableChestCount = obj.ChestCount
                else
                obj.Active = false
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    -- reset items
    for _, v in pairs(ITEM_MAPPING) do
        if v[1] and v[2] then
            if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: clearing item %s of type %s", v[1], v[2]))
            end
            local obj = Tracker:FindObjectForCode(v[1])
            if obj then
                if v[2] == "toggle" then
                    obj.Active = false
                elseif v[2] == "progressive" then
                    obj.CurrentStage = 0
                    obj.Active = false
                elseif v[2] == "consumable" then
                    obj.AcquiredCount = 0
                elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                    print(string.format("onClear: unknown item type %s for code %s", v[2], v[1]))
                end
            elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
                print(string.format("onClear: could not find object for code %s", v[1]))
            end
        end
    end
    LOCAL_ITEMS = {}
    GLOBAL_ITEMS = {}

    SetSettings()
    -- manually run snes interface functions after onClear in case we are already ingame
    if PopVersion < "0.20.1" or AutoTracker:GetConnectionState("SNES") == 3 then
        -- add snes interface functions here
    end
end

-- called when an item gets collected
function onItem(index, item_id, item_name, player_number)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onItem: %s, %s, %s, %s, %s", index, item_id, item_name, player_number, CUR_INDEX))
    end
    if index <= CUR_INDEX then
        return
    end
    local is_local = player_number == Archipelago.PlayerNumber
    CUR_INDEX = index;
    local v = ITEM_MAPPING[item_id]
    if not v then
        if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: could not find item mapping for id %s", item_id))
        end
        return
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: code: %s, type %s", v[1], v[2]))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[2] == "toggle" then
            obj.Active = true
        elseif v[2] == "progressive" then
            if obj.Active then
                obj.CurrentStage = obj.CurrentStage + 1
            else
                obj.Active = true
            end
        elseif v[2] == "consumable" then
            obj.AcquiredCount = obj.AcquiredCount + obj.Increment
        elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
            print(string.format("onItem: unknown item type %s for code %s", v[2], v[1]))
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onItem: could not find object for code %s", v[1]))
    end
    -- track local items via snes interface
    if is_local then
        if LOCAL_ITEMS[v[1]] then
            LOCAL_ITEMS[v[1]] = LOCAL_ITEMS[v[1]] + 1
        else
            LOCAL_ITEMS[v[1]] = 1
        end
    else
        if GLOBAL_ITEMS[v[1]] then
            GLOBAL_ITEMS[v[1]] = GLOBAL_ITEMS[v[1]] + 1
        else
            GLOBAL_ITEMS[v[1]] = 1
        end
    end
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("local items: %s", dump_table(LOCAL_ITEMS)))
        print(string.format("global items: %s", dump_table(GLOBAL_ITEMS)))
    end
    if PopVersion < "0.20.1" or AutoTracker:GetConnectionState("SNES") == 3 then
        -- add snes interface functions here for local item tracking
    end
end

--called when a location gets cleared
function onLocation(location_id, location_name)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocation: %s, %s", location_id, location_name))
    end
    local v = ID_TO_LOCATION_MAP[location_id]
    if not v and AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find location mapping for id %s", location_id))
    end
    if not v[1] then
        return
    end
    local obj = Tracker:FindObjectForCode(v[1])
    if obj then
        if v[1]:sub(1, 1) == "@" then
            obj.AvailableChestCount = obj.AvailableChestCount - 1
        else
        obj.Active = true
        end
    elseif AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("onLocation: could not find object for code %s", v[1]))
    end
end

-- called when a locations is scouted
function onScout(location_id, location_name, item_id, item_name, item_player)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onScout: %s, %s, %s, %s, %s", location_id, location_name, item_id, item_name,
            item_player))
    end
    -- not implemented yet :(
end

-- called when a bounce message is received 
function onBounce(json)
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onBounce: %s", dump_table(json)))
    end
    -- your code goes here
end

function onLocationSectionChanged(LocationSection)
    local loc_id = (LocationSection.FullID)
    local v = LOCATION_TO_ID_MAP[loc_id]
    if AUTOTRACKER_ENABLE_DEBUG_LOGGING_AP then
        print(string.format("called onLocationSectionChanged. Location section is: %s", LocationSection))
        print(string.format("called onLocationSectionChanged. Location name is: %s , location id is: %s", loc_id, v))
    end

    local goal = 0

    if SLOT_DATA ~= nil then
        if SLOT_DATA.goal == 0 then
            goal = 1
        elseif SLOT_DATA.goal == 1 then
            goal = 192
        elseif SLOT_DATA.goal == 2 then
            goal = 211
        elseif SLOT_DATA.goal == 3 then
            goal = 377
        elseif SLOT_DATA.goal == 4 then
            goal = 378
        end
    end

    if LocationSection.AccessibilityLevel == 7 then
        local check_goal = loc_id
        print(string.format("location name to check for goal: %s", check_goal))
        print(string.format("location id to check for goal: %s",LOCATION_TO_ID_MAP[check_goal]))
        if LOCATION_TO_ID_MAP[check_goal] == goal then
            Archipelago:StatusUpdate(30)
        end
        
        new_loc_check = {}
        table.insert(new_loc_check, v)
        Archipelago:LocationChecks(new_loc_check) --send manual check
        
    end
end

function itemLayoutChange(code)
    print(string.format("entered item layout change function"))
    Tracker:AddLayouts("layouts/new_input_void.json")

    --used in all layouts
    Tracker:AddLayouts("layouts/new_input_max_level.json")
    Tracker:AddLayouts("layouts/new_input_keys_medallions.json")
    Tracker:AddLayouts("layouts/new_input_free_items.json")

    --fortissax
    if Tracker:FindObjectForCode("fortissax").Active then
        Tracker:AddLayouts("layouts/new_input_cursemark.json")
    end

    --whetblades
    if Tracker:FindObjectForCode("whetblades_setting").Active then
        Tracker:AddLayouts("layouts/new_input_whetblades.json")
    end

    --victory token
    if Tracker:FindObjectForCode("goal").CurrentStage == 4 then
        Tracker:AddLayouts("layouts/new_input_victory_token.json")
    end


    --dlc
    if code == "DLC" then
        if Tracker:FindObjectForCode("DLC").CurrentStage == 1 then
            Tracker:AddLayouts("layouts/map_layouts_dlc.json")
        else
            Tracker:AddLayouts("layouts/map_layouts_base.json")
        end 
    end

    if Tracker:FindObjectForCode("DLC").CurrentStage == 1 then
        print(string.format("entered item layout change function - dlc active check"))
        
        
        Tracker:AddLayouts("layouts/new_input_dlc_keys.json")
        Tracker:AddLayouts("layouts/new_input_upgrades_dlc.json")


        --messmers kindling
        if Tracker:FindObjectForCode("messmers_kindling_setting").CurrentStage == 0 then
            print(string.format("entered item layout change function - messmers kindling setting check"))
            
            Tracker:AddLayouts("layouts/new_input_messmer_shards.json")

        else
            Tracker:AddLayouts("layouts/new_input_messmer_kindling.json")
        end
        
         --minor bosses
        if Tracker:FindObjectForCode("minor_bosses").CurrentStage == 1 then
            Tracker:AddLayouts("layouts/new_input_mb_dlc.json")
        end

        --flask restrictions and talisman pouches
        if Tracker:FindObjectForCode("flask_restrictions_setting").Active then
            if Tracker:FindObjectForCode("talisman_pouches_setting").Active then
                Tracker:AddLayouts("layouts/new_input_upgrades_dlc_fl_tp.json")
            else
                Tracker:AddLayouts("layouts/new_input_upgrades_dlc_fl.json")
            end
        else
            if Tracker:FindObjectForCode("talisman_pouches_setting").Active then
                Tracker:AddLayouts("layouts/new_input_upgrades_dlc_tp.json")
            else
                Tracker:AddLayouts("layouts/new_input_upgrades_dlc.json")
            end
        end
    
    else
        --base
        
        --flask restrictions and talisman pouches
        if Tracker:FindObjectForCode("flask_restrictions_setting").Active then
            if Tracker:FindObjectForCode("talisman_pouches_setting").Active then
                Tracker:AddLayouts("layouts/new_input_upgrades_base_fl_tp.json")
            else
                Tracker:AddLayouts("layouts/new_input_upgrades_base_fl.json")
            end
        else
            if Tracker:FindObjectForCode("talisman_pouches_setting").Active then
                Tracker:AddLayouts("layouts/new_input_upgrades_base_tp.json")
            else
                Tracker:AddLayouts("layouts/new_input_upgrades_base.json")
            end
        end

        --minor bosses
        if Tracker:FindObjectForCode("minor_bosses").CurrentStage == 1 then
            Tracker:AddLayouts("layouts/new_input_mb.json")
        end

	end
end

-- add AP callbacks
-- un-/comment as needed
ScriptHost:AddOnLocationSectionChangedHandler("Manual Location Handler", onLocationSectionChanged)
Archipelago:AddClearHandler("clear handler", onClear)
Archipelago:AddItemHandler("item handler", onItem)
Archipelago:AddLocationHandler("location handler", onLocation)
-- Archipelago:AddScoutHandler("scout handler", onScout)
-- Archipelago:AddBouncedHandler("bounce handler", onBounce)
