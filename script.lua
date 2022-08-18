local wyvern = {}

wyvern.util = {}

wyvern.plugins = {}
wyvern.commands = {}
wyvern.hooks = {}
wyvern.events = {}
wyvern.DefaultFolderPath = "Wyvern-Source/"
wyvern.prefix = "w."
wyvern.logName = "Wyvern-Log"

 wyvern.config = {
    ['Modules'] = "/Modules",
    ['Plugins'] = "/Plugins",
    ['Commands'] = "/Commands",
    ['Hooks'] = "/Hooks",
    ['Events'] = "/Events",
    ['Config'] = "/Config",
    ['Log'] = "/Logs"
}

wyvern.modules = {
    ["plugins"] = wyvern.plugins,
    ["commands"] = wyvern.commands,
    ["hooks"] = wyvern.hooks,
    ["events"] = wyvern.events
}

 wyvern.categories = {
    ["Player"]  =  "Player",
    ["Render"]  =  "Render",
    ["World"]  =  "World",
    ["Trolling"]  =  "Trolling",
    ["Admin"]  =  "Admin",
    ["Utility"]  =  "Utility",
    ["Other"]  =  "Other"
}


wyvern.util.get_module = function(module)
    return wyvern.modules[module]
end


wyvern.util.get_category = function(category)
    return wyvern.categories[category]
end

wyvern.util.get_plugin = function(plugin)
    return wyvern.plugins[plugin]
end

wyvern.util.download_plugin = function(plugin)
    local url = "https://raw.githubusercontent.com/Wyvern-Admin/Wyvern-Admin/master/Wyvern-Admin/Plugins/" .. plugin .. ".lua"
end

wyvern.util.download_hook = function(hook)
    local url = "https://raw.githubusercontent.com/Wyvern-Admin/Wyvern-Admin/master/Wyvern-Admin/Hooks/" .. hook .. ".lua"
end

wyvern.util.download_event = function(event)
    local url = "https://raw.githubusercontent.com/Wyvern-Admin/Wyvern-Admin/master/Wyvern-Admin/Events/" .. event .. ".lua"
end

wyvern.util.download_command = function(command)
    local url = "https://raw.githubusercontent.com/Wyvern-Admin/Wyvern-Admin/master/Wyvern-Admin/Commands/" .. command .. ".lua"
end

wyvern.util.download_config = function(config)
    local url = "https://raw.githubusercontent.com/Wyvern-Admin/Wyvern-Admin/master/Wyvern-Admin/Config/" .. config .. ".lua"
end

wyvern.util.download_module = function(module)
    local url = "https://raw.githubusercontent.com/Wyvern-Admin/Wyvern-Admin/master/Wyvern-Admin/Modules/" .. module .. ".lua"
end

wyvern.util.checkIfPluginExists = function(plugin)
    local plugin = wyvern.util.get_plugin(plugin)
    if plugin then
        return true
    else
        return false
    end
end

wyvern.util.checkIfHookExists = function(hook)
    local hook = wyvern.util.get_hook(hook)
    if hook then
        return true
    else
        return false
    end
end

wyvern.util.checkIfEventExists = function(event)
    local event = wyvern.util.get_event(event)
    if event then
        return true
    else
        return false
    end
end

wyvern.util.checkIfCommandExists = function(command)
    local command = wyvern.util.get_command(command)
    if command then
        return true
    else
        return false
    end
end

wyvern.util.makeLog = function(message , code)
  local current_time = os.date("%Y-%m-%d %H:%M:%S")
  local fileName = wyvern.logName.. " " .. current_time .. ".txt"
  local json;
  local https = game:GetService'HttpService'
  local data = {
    ["time"] = current_time,
    ['game'] = game:GetService'MarketplaceService':GetProductInfo(game.PlaceId).Name,
    ['creator'] = game:GetService'MarketplaceService':GetProductInfo(game.PlaceId).Creator.Name,
    ['player'] = game.Players.LocalPlayer.Name,
    ['info'] = info,
    ["message"] = message,
    ["code"] = code
  }
  json = https:JSONEncode(data)
  local location = "Wyvern-Source/Logs/" .. fileName
  writefile(location, json, null, 2)
end

makefolder(wyvern.DefaultFolderPath)

for i,v in pairs(wyvern.config) do
    makefolder(wyvern.DefaultFolderPath .. v)
end


-- make log 
wyvern.util.makeLog("Wyvern Admin Started", "info")
