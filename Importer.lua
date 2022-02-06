local MODULE_PARENT_URL = "https://raw.githubusercontent.com/RainyBoots0/Modules/main/List"
local function Import(ModuleName)
	return loadstring((game.HttpGet(game, MODULE_PARENT_URL .. ("/" .. (ModuleName .. ".lua")))))().main
end
getgenv().Import = Import
return {
	Import = Import,
}
