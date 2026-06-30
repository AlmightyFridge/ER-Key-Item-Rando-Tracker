Tracker:AddItems("items/items.json")
Tracker:AddItems("items/options.json")

Tracker:AddMaps("maps/maps.json")

ScriptHost:LoadScript("scripts/item_data.lua")
ScriptHost:LoadScript("scripts/util.lua")
ScriptHost:LoadScript("scripts/custom_util.lua")

Tracker:AddLayouts("layouts/options_layout.json")
Tracker:AddLayouts("layouts/input_layout_base.json")
Tracker:AddLayouts("layouts/map_layouts_base.json")
Tracker:AddLayouts("layouts/main.json")
Tracker:AddLayouts("layouts/main_mb.json")

Tracker:AddLocations("locations/victory.json")
Tracker:AddLocations("locations/key_items.json")
Tracker:AddLocations("locations/sacred_tears.json")
Tracker:AddLocations("locations/golden_seeds.json")
Tracker:AddLocations("locations/shops.json")
Tracker:AddLocations("locations/major_bosses.json")
Tracker:AddLocations("locations/dragons.json")
Tracker:AddLocations("locations/rises.json")
Tracker:AddLocations("locations/paintings.json")
Tracker:AddLocations("locations/ashes.json")
Tracker:AddLocations("locations/scadu.json")
Tracker:AddLocations("locations/critical_path.json")
Tracker:AddLocations("locations/locations.json")

Tracker:AddLocations("locations/catacombs.json")
Tracker:AddLocations("locations/caves.json")
Tracker:AddLocations("locations/dlc-catacombs.json")
Tracker:AddLocations("locations/dlc-historical.json")
Tracker:AddLocations("locations/dlc-roamers.json")
Tracker:AddLocations("locations/evergaols.json")
Tracker:AddLocations("locations/gaols.json")
Tracker:AddLocations("locations/golems.json")
Tracker:AddLocations("locations/heros_graves.json")
Tracker:AddLocations("locations/historical.json")
Tracker:AddLocations("locations/hunters.json")
Tracker:AddLocations("locations/mausoleums.json")
Tracker:AddLocations("locations/night_bosses.json")
Tracker:AddLocations("locations/roamers.json")
Tracker:AddLocations("locations/trees.json")
Tracker:AddLocations("locations/tunnels.json")

ScriptHost:LoadScript("scripts/codewatch.lua")

-- AutoTracking for Poptracker
if PopVersion and PopVersion >= "0.18.0" then
    ScriptHost:LoadScript("scripts/autotracking.lua")
end
