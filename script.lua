if syn and DrawingImmediate then fileExtension = "txt" end
local fileExLen = #fileExtension + 1


--[[
    Wyvern Init
    Just the basic stuff.
--]]

local wyvern = {}

wyvern.util = {}

wyvern.plugins = {}
wyvern.commands = {}
wyvern.hooks = {}
wyvern.events = {}
wyvern.DefaultFolderPath = "Wyvern-Source/"
wyvern.prefix = "w."
wyvern.logName = "Wyvern-Log"
local fileExtension = "wyrn"




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

--[[
    Wyvern Init end
    Just the basic stuff.
--]]


--[[
    Wyvern Admin file functions

    These functions are used to read and write files to the Wyvern-Source folder.
    This is where all the plugins, hooks, events, commands, configs, and modules are stored.
]]

wyvern.util.Client = function()
    local self = {}

    self.message = ""
    self.result = ""
   
    self.options = {
        ['Bytecode'] = nil,
        ['Advanced'] = nil
    }

   

    self.obfuscate = function(options)
        local string = options['script']
        
        if options['howto'] == 'Bytecode' then
           local firstStep = string:gsub(".", function(incode) return "\\" .. incode:byte () end) or string .."\\\""
            self.result = firstStep
              return self.result
        end

        if options['howto'] == 'Advanced' then
            local a = string
              a="--// Decompiled Code. \n"..a; local function Obfuscate(b)local c="function IllIlllIllIlllIlllIlllIll(IllIlllIllIllIll) if (IllIlllIllIllIll==(((((919 + 636)-636)*3147)/3147)+919)) then return not true end if (IllIlllIllIllIll==(((((968 + 670)-670)*3315)/3315)+968)) then return not false end end; "local d=c;local e=""local f={"IllIllIllIllI","IIlllIIlllIIlllIIlllII","IIllllIIllll"}local g=[[local IlIlIlIlIlIlIlIlII = {]]local h=[[local IllIIllIIllIII = loadstring]]local i=[[local IllIIIllIIIIllI = table.concat]]local j=[[local IIIIIIIIllllllllIIIIIIII = "''"]]local k="local "..f[math.random(1,#f)].." = (7*3-9/9+3*2/0+3*3);"local l="local "..f[math.random(1,#f)].." = (3*4-7/7+6*4/3+9*9);"local m="--// Obfuscated with Wyvern 1.1 \n\n"for n=1,string.len(b)do e=e.."'\\"..string.byte(b,n).."',"end;local o="function IllIIIIllIIIIIl("..f[math.random(1,#f)]..")"local p="function "..f[math.random(1,#f)].."("..f[math.random(1,#f)]..")"local q="local "..f[math.random(1,#f)].." = (5*3-2/8+9*2/9+8*3)"local r="end"local s="IllIIIIllIIIIIl(900283)"local t="function IllIlllIllIlllIlllIlllIllIlllIIIlll("..f[math.random(1,#f)]..")"local q="function "..f[math.random(1,#f)].."("..f[math.random(1,#f)]..")"local u="local "..f[math.random(1,#f)].." = (9*0-7/5+3*1/3+8*2)"local v="end"local w="IllIlllIllIlllIlllIlllIllIlllIIIlll(9083)"local x=m..d..k..l..i..";"..o.." "..p.." "..q.." "..r.." "..r.." "..r..";"..s..";"..t.." "..q.." "..u.." "..v.." "..v..";"..w..";"..h..";"..g..e.."}".."IllIIllIIllIII(IllIIIllIIIIllI(IlIlIlIlIlIlIlIlII,IIIIIIIIllllllllIIIIIIII))()" self.result = x  end;do Obfuscate(a)end
            return self.result
        end


        if options['howto'] == nil then
            return "No Option Selected"
        end

       

    end

  

    return self
end

local Client = wyvern.util.Client()

wyvern.util.randomStringP = function()
	local min, max, final = ("A"):byte(), ("Z"):byte(), "WyvernPluginDownloader-"
	for i = 1, math.random(5, 10) do
		final = final .. string.char(math.random(min, max))
	end
	return final
end

wyvern.util.requestGet = function(url)
  local rhttp = game:GetService('HttpService') 
  local req = syn and syn.request or http and http.request or http_request or fluxus and fluxus.request or getgenv().request or request
if req then
  local response = req({
    Url = url,
    Method = 'GET',
  })
  if not response then 
    wyvern.util.log("Error: Request failed to get " .. url) 
  end
  return response.Body
else
  wyvern.util.makeLog("Exploit does not support request. This plugin will not work.", "HttpService not found")
end

wyvern.util.getFileName(attemptName, RAW)
local fileName
if attemptName then
    if attemptName:sub(-fileExLen) == '.'  then
  fileName = attemptName
else
  fileName = attemptName ..'.' 
    end
    if not isfile(fileName) then
        return fileName
    else
      wyvern.util.makeLog("Provided file name already exists.", "Error")
    end
else
    fileName = loadstring(RAW)().PluginName .. "." 
    if not isfile(fileName) then return fileName end
    repeat fileName = randomStringP() .. "."  until not isfile(fileName)
    return fileName
end
end

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
    local url = "https://raw.githubusercontent.com/Zirmith/Wyvern-Admin/main/Plugins/" .. plugin .. ".wyrn"
    local pluginRaw = wyvern.util.requestGet(url)
    fileName = loadstring(pluginRaw)().PluginName .. ".lua" 

    local ob =  Client.obfuscate({
        ['script'] = pluginRaw ,
        ['howto'] = "Advanced"
    })
    
	writefile('Wyvern-Source/Plugins/'..fileName, ob)
end

wyvern.util.download_hook = function(hook)
    local url = "https://raw.githubusercontent.com/Zirmith/Wyvern-Admin/main/Hooks/" .. hook .. ".wyrn"
    local pluginRaw = wyvern.util.requestGet(url)
    fileName = loadstring(pluginRaw)().HookName ..  ".lua" 
	writefile('Wyvern-Source/Hooks/'..fileName, pluginRaw)
end

wyvern.util.download_event = function(event)
    local url = "https://raw.githubusercontent.com/Zirmith/Wyvern-Admin/main/Events/" .. event .. ".wyrn"
    local pluginRaw = wyvern.util.requestGet(url)
    fileName = loadstring(pluginRaw)().EventName ..  ".lua" 
	writefile('Wyvern-Source/Events/'..fileName, pluginRaw)
end

wyvern.util.download_command = function(command)
    local url = "https://raw.githubusercontent.com/Zirmith/Wyvern-Admin/main/Commands/" .. command .. ".wyrn"
    local pluginRaw = wyvern.util.requestGet(url)
    fileName = loadstring(pluginRaw)().CommandName .. ".lua" 
	writefile('Wyvern-Source/Commands/'..fileName, pluginRaw)
end

wyvern.util.download_config = function(config)
    local url = "https://raw.githubusercontent.com/Zirmith/Wyvern-Admin/main/Config/" .. config .. ".wyrn"
    local pluginRaw = wyvern.util.requestGet(url)
    fileName = loadstring(pluginRaw)().ConfigName .. ".lua"  
	writefile('Wyvern-Source/Configs/'..fileName, pluginRaw)
end

wyvern.util.download_module = function(module)
    local url = "https://raw.githubusercontent.com/Zirmith/Wyvern-Admin/main/Modules/" .. module .. ".wyrn"
    local pluginRaw = wyvern.util.requestGet(url)
    fileName = loadstring(pluginRaw)().ModuleName ..  ".lua"  
	writefile('Wyvern-Source/Modules/'..fileName, pluginRaw)
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

--[[
    Wyvern Admin file functions end

    These functions are used to read and write files to the Wyvern-Source folder.
    This is where all the plugins, hooks, events, commands, configs, and modules are stored.
]]

makefolder(wyvern.DefaultFolderPath)

for i,v in pairs(wyvern.config) do
    makefolder(wyvern.DefaultFolderPath .. v)
end


wyvern.util.download_plugin('example')


--[[
    Wyvern Admin player functions
    These functions are used to get and set player data.

]]


wyvern.util.RemoveSpaces = function(name)
    return name:gsub('%s+', '') or name
end

wyvern.util.finduser = function(name)
    name = wyvern.util.RemoveSpaces(name)
    for i, player in pairs(game:GetService('Players'):GetPlayers()) do
        if player.Name:match('^'.. name) then
            return player
        end
    end
    return nil
end

wyvern.util.getMouse = function()
    return game:GetService('UserInputService'):GetMouseLocation()
end

wyvern.util.getPlayer = function()
    return game.Players.LocalPlayer
end

wyvern.util.getPlayers = function()
    local players = {}
    for i, player in pairs(game:GetService('Players'):GetPlayers()) do
        table.insert(players, player)
    end
    return players
end

wyvern.util.getPlayerHumanoid = function()
    return game.Players.LocalPlayer.Character.Humanoid
end

wyvern.util.getPlayerCharacter = function()
    return game.Players.LocalPlayer.Character
end

wyvern.util.getPlayersHumanoid = function()
    local humanoid = {}
    for i, player in pairs(game:GetService('Players'):GetPlayers()) do
        table.insert(humanoid, player.Character.Humanoid)
    end
    return humanoid
end

--[[
    Wyvern Admin player functions end
    These functions are used to get and set player data.

]]



--[[
    Wyvern Admin game functions
    These functions are used to get and set game data.
]]

wyvern.util.getGame = function()
    return game
end

wyvern.util.getWorkspace = function()
    return game.Workspace
end

wyvern.util.getPlayersService = function()
    return game:GetService('Players')
end

wyvern.util.getLighting = function()
    return game.Lighting
end

wyvern.util.getReplicatedStorage = function()
    return game.ReplicatedStorage
end

wyvern.util.getServerScriptService = function()
    return game.ServerScriptService
end

wyvern.util.getStarterGui = function()
    return game.StarterGui
end

wyvern.util.getCoreGui = function()
    return game.CoreGui
end

wyvern.util.getLightingService = function()
    return game.Lighting
end

wyvern.util.getPlayers = function()
    return game.Players
end

wyvern.util.getPlaceId = function()
    return game.PlaceId
end

wyvern.util.getPlace = function()
    local market = game:GetService('MarketplaceService')
    return market:GetProductInfo(game.PlaceId).Name
end

wyvern.util.getCreator = function()
    local market = game:GetService('MarketplaceService')
    return market:GetProductInfo(game.PlaceId).Creator.Name
end

wyvern.util.getCreatorId = function()
    local market = game:GetService('MarketplaceService')
    return market:GetProductInfo(game.PlaceId).Creator.Id
end

--[[
    Wyvern Admin game functions end
    These functions are used to get and set game data.
]]


--[[
    Wyvern Admin commands
    These functions are used to create and run commands.
]]

wyvern.commands.getplugin = function(plugin)
    local plugin = wyvern.util.get_plugin(plugin)
    if plugin then
        return plugin
    else
        return nil
    end
end

wyvern.commands.gethook = function(hook)
    local hook = wyvern.util.get_hook(hook)
    if hook then
        return hook
    else
        return nil
    end
end

wyvern.commands.getevent = function(event)
    local event = wyvern.util.get_event(event)
    if event then
        return event
    else
        return nil
    end
end

wyvern.commands.getcommand = function(command)
    local command = wyvern.util.get_command(command)
    if command then
        return command
    else
        return nil
    end
end

wyvern.commands.getconfig = function(config)
    local config = wyvern.util.get_config(config)
    if config then
        return config
    else
        return nil
    end
end

wyvern.commands.getmodule = function(module)
    local module = wyvern.util.get_module(module)
    if module then
        return module
    else
        return nil
    end
end

wyvern.commands.download = function(player , args)
   local thingtoget = args[1]
   local thingname = args[2]

   if thingtoget == "plugin" then

    if thingname == nil then
        return warn"Please enter a plugin name"
    end
    wyvern.util.download_plugin(thingname)
   end
   if thingtoget == "command" then

    if thingname == nil then
        return warn"Please enter a command name"
    end
    wyvern.util.download_command(thingname)
   end
   if thingtoget == "event" then

    if thingname == nil then
        return warn"Please enter a event name"
    end
    wyvern.util.download_event(thingname)
   end
   if thingtoget == "hook" then

    if thingname == nil then
        return warn"Please enter a hook name"
    end
    wyvern.util.download_hook(thingname)
   end
   if thingtoget == "module" then

    if thingname == nil then
        return warn"Please enter a module name"
    end
    wyvern.util.download_module(thingname)
   end
    if thingtoget == "config" then
    
     if thingname == nil then
          return warn"Please enter a config name"
     end
     wyvern.util.download_config(thingname)
    end
    -- log downloaded a new thingtoget named thingname
    wyvern.util.log("Downloaded a new "..thingtoget.." named "..thingname, "info")
end

--[[
    Wyvern Admin commands
    These functions are used to create and run commands.
]]


--[[
    Wyvern Admin Start
    This is the main function that is called when the admin is started.
]]

 wyvern.util.getPlayer().Chatted:Connect(function(message)
    message = string.lower(message)

    local splitString = message:split(" ") 
    local slcmd = splitString[1]
    local cmd = slcmd:split(wyvern.prefix[2]) 
    local cmdName = cmd[2]

    if wyvern.commands[cmdName] then
        local args = {}
        for i = 2, #splitString, 1 do
            table.insert(args,splitString[i])
        end
        wyvern.commands[cmdName](wyvern.util.getPlayer() ,args)

    end
end)

--[[
    Wyvern Admin End
    This is the main function that is called when the admin is started.
]]
