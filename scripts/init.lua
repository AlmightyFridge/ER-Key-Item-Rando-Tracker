Tracker:AddItems("items/items.json")
Tracker:AddItems("items/events.json")
Tracker:AddItems("items/options.json")

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/item_data.lua")
ScriptHost:LoadScript("scripts/util.lua")
ScriptHost:LoadScript("scripts/custom_util.lua")

Tracker:AddLayouts("layouts/options_layout.json")
Tracker:AddLayouts("layouts/input_layout.json")
Tracker:AddLayouts("layouts/map_layouts.json")
Tracker:AddLayouts("layouts/main.json")

Tracker:AddLocations("locations/victory.json")
Tracker:AddLocations("locations/key_items.json")
Tracker:AddLocations("locations/sacred_tears.json")
Tracker:AddLocations("locations/golden_seeds.json")
Tracker:AddLocations("locations/shops.json")
Tracker:AddLocations("locations/major_bosses.json")
Tracker:AddLocations("locations/locations.json")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
