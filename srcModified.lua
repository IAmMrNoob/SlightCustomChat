--[[

credit to jdue
source/(forked?) : https://github.com/jj123llol/CloudEditCameraCoordinateFrame
i basicly skinned his code alive while giving him feedback or whatever

]]
--- adding billions of comments for forgetfull me icl
type Callback = () -> ()
type sethiddenproperty = (Instance, string, any) -> ()
type setscriptable = (Instance, string, boolean) -> ()
type gethiddenproperty  = (Instance, string) -> (any)
type Listener = (Player, number, number) -> ()

--[[ so my ide doesnt show everywhere a missing var or whatver
local sethiddenproperty = sethiddenproperty
local setscriptable = setscriptable
local gethiddenproperty  = gethiddenproperty
local getgenv = getgenv
--]]

local mod
if not getgenv().lilcloudmod then
    getgenv().lilcloudmod = {}
    local info = Instance.new("Part")
    mod = getgenv().lilcloudmod
    mod.Runtime = {
        Active = true,
        db = false, --- so it doesnt disturb you during something but it does mean that other stuff on runtime will stop
        Delay = 1,-- cannot be less then 0.15
        Callbacks = {}
    }
    mod.restCF = CFrame.new()
    mod.Listeners = {}
    mod.Users = {} -- users like using mine or exact same but modified ig -- unsure if it would work
    mod.infoWr = {
        toCF = function(X,Y,Z,rX,rY,rZ)
            info.Position = Vector3.new(X,Y,Z)
            info.Rotation = Vector3.new(rX,rY,rZ)
            return info.CFrame
        end,
        toInfo = function(cf)
            info.CFrame = cf
            local pos = info.Position
            local rot = info.Rotation
            return pos.X,pos.Y,pos.Z,rot.X,rot.Y,rot.Z
        end
    }
else
    mod = getgenv().lilcloudmod
end

local method = 2 
local plrs = game:GetService("Players")
local lp = plrs.LocalPlayer

local json = {
    decode = function(x:"json string")
        return game:GetService("HttpService"):JSONDecode(x)
    end,
    encode = function(x:"table")
        return game:GetService("HttpService"):JSONEncode(x)
    end
}
local stage = 0
pcall(function()
	setscriptable(lp, "CloudEditCameraCoordinateFrame", true)
	lp.CloudEditCameraCoordinateFrame = CFrame.new(0, 999, 999) -- if this works try method 1 next
    if lp.CloudEditCameraCoordinateFrame == CFrame.new(0, 999, 999) then
        stage = 1
    end
	sethiddenproperty(lp, "CloudEditCameraCoordinateFrame", CFrame.new(0, 99999, 99999)) -- iff this fails use method 2
    if gethiddenproperty(lp, "CloudEditCameraCoordinateFrame") == CFrame.new(0, 99999, 99999) then
        stage = 2 -- stage 2 means use method 1
    end
end)

if stage == 0 then
    error("Executor not supported")
    return "Executor doesn't support (set/get)hiddenproperty or setscriptable"
elseif stage == 2 then--- this check is probably useless cause theres no way a executor would implement gethidden and not put sethidden
    method = 1
else--default just incase ig
    method = 2
end

-- doing tings main

local cloudCF = {}
function cloudCF.set(cf : CFrame) -- sets our cloud cframe
    local plr = game.Players.LocalPlayer
	if method == 1 then
		sethiddenproperty(plr, "CloudEditCameraCoordinateFrame", cf)
    else
		plr.CloudEditCameraCoordinateFrame = cf
	end
end
function cloudCF.get(plr : Player)-- gets ours if no players is set
    if plr == nil then
        plr = game.Players.LocalPlayer
    end
    if method == 1 then
		return gethiddenproperty(plr, "CloudEditCameraCoordinateFrame")
	end
	return plr.CloudEditCameraCoordinateFrame
end

-- module functions

function mod.RestChannel(channel : number, optional1: number, optional2: number) -- allows you to change the rest from 0 ot to something else idk
    optional1, optional2 = optional1 or 0, optional2 or 0
    mod.restCF = CFrame.new(channel, optional1, optional2)
    cloudCF.set(mod.restCF)
end
function mod.GetRestChannel(plr: Player) --- get current channel 
    return cloudCF.get(plr).X -- if they send a message into a channel right at the same time this will break..
end
function mod.Listen(channel : number)
    if channel == mod.restCF.X then
        return "Channel cannot be the same as resting Channel" and warn("Channel cannot be the same as resting Channel")
    end
    if not mod.Listeners[channel] then -- if the channel doesnt exist add it
        mod.Listeners[channel] = {}
    end
    local listenmod = {}
    function listenmod.Stop()
        listenmod.Runtime(true)
        table.remove(mod.Listeners,channel)
    end

    function listenmod.addListener(f : Listener)
        if typeof(f) ~="function" then
            return "type needs to be a function" and warn("tried to set "+typeof(f)+"as a listener function")
        end
        table.insert(mod.Listeners[channel],f)
        local rV = {}
        function rV.remove()
            table.remove(mod.Listeners,table.find(mod.Listeners,f))
        end
        return rV
    end

    function listenmod.Runtime(fun)
        if typeof(fun) ~= "function" and typeof(fun) ~= "boolean" then
            return "Should be a function for runtime loop or bool to remove runtime loop(must be true)" and warn("Should be a function for runtime loop or bool to remove runtime loop(must be true)")
        elseif typeof(fun) == "boolean" then
            mod.Runtime.Callbacks[channel] = nil
            return true --- always return true incase they want feedback for this action
        end
		if mod.Runtime.Callbacks[channel] ~= nil then
            return "You can only use 1 function as a runtime Loop per channel" and warn("You can only use 1 function as a runtime Loop per channel")
        end
        mod.Runtime.Callbacks[channel] = fun
    end

    function listenmod.Put(num1 : number, num2 : number)
		if num1 == nil or num2 == nil then
            return "num 1 or 2 is nil" and warn("num 1 or 2 is nil")
        end
        cloudCF.set(CFrame.new(channel, num1, num2))
    end

    function listenmod.Putraw(cf : CFrame)
		if typeof(cf) == "CFrame" then
            return "value is not a CFrame" and warn("value is not a CFrame")
        end
        cloudCF.set(cf)
    end

    return listenmod
end

--- runtime

task.spawn(function()--- this is just background functions that ill rarely use that runs in a loop and fire the loop for a channel or whatever
    while mod.Runtime.Active do
        if not mod.Runtime.db then -- ik it ruins the point of runtime but its needed so it doesnt disturb other stuff thats being done
            --- i dont think i need to add a check for when the table is empty 
            for _, Callback in pairs(mod.Runtime.Callbacks) do
                Callback()
            end
        end
        task.wait(mod.Runtime.Delay)--- loops 0.5 seconds by defualt 
    end
end)

local fml = {}
fml.CHARS = {-- we dont use 0 - 99 cause we want consistent length as 36 characters in one slot cause we wanna maximize data sent yk
    --lowercase
    [100] = "a", [101] = "b", [102] = "c", [103] = "d", [104] = "e", [105] = "f",
    [106] = "g", [107] = "h", [108] = "i", [109] = "j", [110] = "k", [111] = "l",
    [112] = "m", [113] = "n", [114] = "o", [115] = "p", [116] = "q", [117] = "r",
    [118] = "s", [119] = "t", [120] = "u", [121] = "v", [122] = "w", [123] = "x",
    [124] = "y", [125] = "z",
    --uppercase
    [126] = "A", [127] = "B", [128] = "C", [129] = "D", [130] = "E", [131] = "F",
    [132] = "G", [133] = "H", [134] = "I", [135] = "J", [136] = "K", [137] = "L",
    [138] = "M", [139] = "N", [140] = "O", [141] = "P", [142] = "Q", [143] = "R",
    [144] = "S", [145] = "T", [146] = "U", [147] = "V", [148] = "W", [149] = "X",
    [150] = "Y", [151] = "Z",
    --symbols
    [152] = ",", [153] = ".", [154] = "<", [155] = ">", [156] = "/", [157] = "?",
    [158] = ";", [159] = ":", [160] = "\'", [161] = "\"", [162] = "\\", [163] = "|",
    [164] = "[", [165] = "]", [166] = "{", [167] = "}", [168] = "=", [169] = "-",-- was thining of removing 169 cause 789 glup but lowkenuinly dont wanna be like that yk
    [170] = "+", [171] = "_", [172] = "(", [173] = ")", [174] = "*", [175] = "&",
    [176] = "^", [177] = "%",[178] = "^", [179] = "$",[180] = "#", [181] = "@",
    [182] = "!", [183] = "¡", [184] = "`",[185] = "~",[186] = "\n",[187] = "\t",
    --numbers
    [188] = "0", [189] = "1", [190] = "2", [191] = "3", [192] = "4", [193] = "5",
    [194] = "6", [195] = "7", [196] = "8", [197] = "9", [198] = " ",-- iforgot about spaces existing breh
    --- numbers this late in cause i forgot but i js remembred now ab it tho lmao
    -- would put some latin like later but i dont use them so like maybe other time
}

function fml.tnum(str)
    local returnValue = {}
    local isJson,cantparsetsbro = pcall(json.decode,str)
    if isJson then -- repeat re-encode just to remove and space in between kommas and whatever
        str = json.encode(cantparsetsbro)
    end
    local maxCHARACTERS = 2 --- i lied everythime i said about being able to do 12 characters now im gonna try 8 to see if 24 numbers is possible instead
    -- i lied again bro like lowkey the limit in cframes b4 it starts rounding or messing up or whatever is at 999999000 i assume its the same as like negatibe numbers also
    -- 2*3 = 6 so i wont pass it but i cant use more in a cframe without removing letters or symboles from the char table
    -- so ill keep it like this for now and in the future ill see how to overcome or something

    local tLength = math.ceil(string.len(str)/maxCHARACTERS)--- since were gonna do 12 characters in 1 num we gottta know how many times we gonna send or something ig because 36/3 = 12 yk
    local ourRef = str
    for i = 1, tLength, 1 do
        local currentSet = string.sub(ourRef,1,maxCHARACTERS)
        local finishedSet = ""
        for char = 1, string.len(currentSet),1 do
            char = string.sub(currentSet,char,char)
            finishedSet = finishedSet .. tostring(table.find(fml.CHARS,char,100))-- start from 100 cause if it start at a nil position it js gives up and i lowkey didnt know that
        end
        table.insert(returnValue,tonumber(finishedSet))
        ourRef = string.sub(ourRef,string.len(currentSet)+1)
    end
    return returnValue
end

function fml.tstr(tn)
    if typeof(tn) =="number" then
        tn = {tn}
    end
    if typeof(tn) ~= "table" then
        return "needs to be a table of numbers" and warn("needs to be a table of numbers")
    end
    local returnValue = ""

    for _, data in pairs(tn) do
        data = tostring(data)
        for i = 1, string.len(data)/3,1 do
            local current = string.sub(data,1,3)
            pcall(function()
                returnValue = returnValue .. fml.CHARS[tonumber(current)]
            end)
            data = string.sub(data,4)
        end
    end

    return returnValue
end

local function catch(plr,cf)
    local X,Y,Z,rX,rY,rZ = mod.infoWr.toInfo(cf) --- so you dont get confused and know what info is what 100%
    if rX == 0 and rY == 0 and rZ == 0 then --- make sure you recieve nill instead of 0 since this is js some experimental thing im doing
        rX,rY,rZ = nil,nil,nil
    end
    if rX ~= nil then -- basicly since i set them nil ik when or when not to switch yk
        local channel = mod.Listeners[rZ] -- rotation on the Zaxis being the channel rotations only can go from -360 to 360
        --- maybe later on ill make rY to add so you can basicly get 360 + 360 = 720 but you cant combine it with negative and positibe for obvious reasons
        --- but for now im gonna let rY be the order of my data when i get to using it
        --- or maybe ill make it like rX for js extra data
        --- rX is js another slot as for data that i do since my data only goes between 100 to 200
        if mod.Listeners[rZ] ~= nil then---- check if it exist
            --mod.Listeners[rZ](plr,X,Y,Z,rX,rY) -- for when i change it in the future and commit to this maybe
            for i, Callbacks in pairs(channel) do
                Callbacks(plr,X,Y,Z,rX,rY)
            end
        end
    else
        local channel = mod.Listeners[X] -- in this case X = channel because yeah thats how jude wanted it so i gotta keep familiarity
        --- in the channel theres probably a bunch of functions for something or maybe js one since thats all im gonna do
        --- maybe latter on ill make it so the channel is js a function instead of a table
        if mod.Listeners[X] ~= nil then
            for i, Callbacks in pairs(channel) do
                Callbacks(plr,Y,Z) -- we input the player for identity to know who wrote this set and Y & Z being the data
            end
        end
    end
end

do -- setup kinda
    function onJoin(plr)
        setscriptable(plr, "CloudEditCameraCoordinateFrame", true) --[[
            we have to set it incase an executor does setscriptable properly and it does care about the object being different

            but also so incase method 2 is being used cause not get/set hidden property
            maybe ill add a check to see if its using method 2
        ]]
        plr.Changed:Connect(function(p)
            if p == "CloudEditCameraCoordinateFrame" then
                catch(plr,cloudCF.get(plr))
            end
        end)
    end 

    for _, plr :Player in pairs(plrs:GetPlayers()) do
        if plr ~= lp then
            onJoin(plr)
        end
    end

    plrs.PlayerAdded:Connect(onJoin)
end

local checkChannel = mod.Listen(731)
checkChannel.Runtime(function()
    checkChannel.Put(789,2556)
end)
checkChannel.addListener(function(plr,Data1,Data2)
    if Data1 == 789 and Data2 == 2556 then
        if table.find(mod.Users,plr) == nil then
            print(plr,"is using script slight plug : https://discord.gg/Wn4YQ7vG4S")
            table.insert(mod.Users,plr) --- adding plrs yk and if they leave they should become just nil
        end
    end
end)

local SendRecieveChannels = {}
SendRecieveChannels.InUse = {}
SendRecieveChannels.srC = {}
function SendRecieveChannels.Create(id) -- id in a way as im gonna be trying to make a channel for sending and recieving info like a queue in a way
    if id < 0 and id > 300 then -- limit to how many there can be but surely you dont need more than 300 like seriously 
        --0 the limit is there to not collide with my previous code that is at 731
        return "id cannot be smaller than 0 or greater than 300"
    end
    local SRchannel = mod.Listen(id + 100)-- my little starting point ig
    SendRecieveChannels.InUse[id] = false
    --- start 558
    --- end 311
    --- info 428
    local start,info,end_ = 558,428,311
    local dataset = {}
    SRchannel.addListener(function(plr,a,b)
        if a == start and b == info then-- we reset and start
            table.clear(dataset)
            --warn("open channel for ".. tostring(id))
        elseif a == info and b == end_ then -- we end and call our main function that wants to use the data
            SendRecieveChannels.Callback(plr,fml.tstr(dataset))
            --warn("closed channel for ".. tostring(id))
        else--- this means we are now gonna start js captureing everything
            dataset[b] = a -- for now im gonna make it so b is the order of it but later on i will be using both as data or more
            --warn("Recieved for ".. tostring(id) .. " " .. tostring(b) .. " data: " .. tostring(a))
        end
        --- added warns and whatever for debug
    end)
    local returnValue = {}
    function returnValue.setStart()
        --warn(start,info)
        SendRecieveChannels.InUse[id] = true
        SRchannel.Put(start,info)
    end
    function returnValue.setEnd()
        --warn(info,end_)
        SendRecieveChannels.InUse[id] = false
        SRchannel.Put(info,end_)
    end
    function returnValue.Put(a,b)
        --warn(a,b)
        SRchannel.Put(a,b)
    end
    SendRecieveChannels.srC[id] = returnValue
end

function SendRecieveChannels.send(str)
    if SendRecieveChannels.Callback == nil then
        return "Needs to have callback function to send or recieve"
    end
    local UsableChannelID
    for ID, v in pairs(SendRecieveChannels.InUse) do
        if v == false then
            UsableChannelID = ID
            break
        end
    end
    if UsableChannelID ~= nil then
        task.spawn(function()
            local dataset = fml.tnum(str)
            --[[
            function roundNumber(num, numDecimalPlaces)
                return tonumber(string.format("%." .. (numDecimalPlaces or 0) .. "f", num))
            end
            local x = game.Players.LocalPlayer:GetNetworkPing()*1.16
            print(roundNumber(x,3))
            ]]
            local wT = 0.15 ----0.04 the least i could get it at b4 it js stops listening or what ever
            mod.Runtime.db = true
            task.wait(wT)
            SendRecieveChannels.srC[UsableChannelID].setStart()
            task.wait(wT)
            for order, data in pairs(dataset) do
                SendRecieveChannels.srC[UsableChannelID].Put(data,order)
                task.wait(wT)
            end
            task.wait(wT)
            SendRecieveChannels.srC[UsableChannelID].setEnd()
            task.wait(wT)
            mod.Runtime.db = false
        end)
    else
        warn("all SendRecieveChannels used")
    end
end

---- main party where when you send the string through this is where its gonna end up and you can choose what to do with it and for me rn im gonna just print it
SendRecieveChannels.Callback = function(plr,str)
    if str == "" then
        warn("something went wrong when",plr,"was trying to send something please notify them just incase")
    end
    print(plr,str)
end

return SendRecieveChannels,mod