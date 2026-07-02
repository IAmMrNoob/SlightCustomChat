local fps = {
    raw = "https://raw.githubusercontent.com/IAmMrNoob/SlightCustomChat/refs/heads/main/",
    check = "https://github.com/IAmMrNoob/SlightCustomChat/latest-commit/main/"
}--- fille path shit from github to my thing
local json = {
    decode = function(x:"json string")
        return game:GetService("HttpService"):JSONDecode(x)
    end,
    encode = function(x:"table")
        return game:GetService("HttpService"):JSONEncode(x)
    end
}
local req = {
    Get = function(url,head,cookie)
        return request({
            Url = url,
            Method = "GET",
            Headers = head or {},
            --Cookies = cookie or {}
        })
    end
}
local lA = {
    ui = "", src = ""
}
if not isfolder("SlightCustomChat") then
	makefolder("SlightCustomChat")
end
if not isfile("SlightCustomChat/vC") then
	writefile("SlightCustomChat/vC",json.encode(lA))
else
    lA = json.decode(readfile("SlightCustomChat/vC"))
end
local function shittyLoad(urlpath,name)
    local re = req.Get(fps.check..urlpath,{["Accept"]= "application/json"})
    local thingdate = json.decode(re.Body).date
    if not isfile("SlightCustomChat/"..name) or lA[name] ~= thingdate then
        lA[name] = thingdate
        warn("found new script changes")
	    writefile("SlightCustomChat/vC",json.encode(lA))
        writefile("SlightCustomChat/"..name,game:HttpGet(fps.raw..urlpath, true))
    end
    return loadstring(readfile("SlightCustomChat/"..name))()
end
local bigSidebar,UIButtons,setTheme,AddMessage,uiSettings = shittyLoad("UI.lua","ui")
local SettingsButton,ThemesButton,UsersButton,SendButton,TextBox = unpack(UIButtons)
local SendRecieveChannels,mod = shittyLoad("srcModified.lua","src")
UsersButton.Visible = false

--bigSidebar,{SettingsButton,ThemesButton,UsersButton,SendButton,TextBox},setTheme,AddMessage,settings

do--- ui theme
    local themeSettingsPage = bigSidebar.page("Theming")
    themeSettingsPage.textbox("Set BG color",{"R","G","B"},uiSettings.Theming.Main,function(r,g,b)
        r = tonumber(r) or 0
        g = tonumber(g) or 0
        b = tonumber(b) or 0
        uiSettings.Theming.Main = {r,g,b}
        setTheme()
    end)
    themeSettingsPage.textbox("Set text color",{"R","G","B"},uiSettings.Theming.Text,function(r,g,b)
        r = tonumber(r) or 0
        g = tonumber(g) or 0
        b = tonumber(b) or 0
        uiSettings.Theming.Text = {r,g,b}
        setTheme()
    end)
    themeSettingsPage.textbox("Set placeholder text color",{"R","G","B"},uiSettings.Theming.PlaceHolder,function(r,g,b)
        r = tonumber(r) or 0
        g = tonumber(g) or 0
        b = tonumber(b) or 0
        uiSettings.Theming.PlaceHolder = {r,g,b}
        setTheme()
    end)
    ThemesButton.MouseButton1Click:Connect(themeSettingsPage.open)
end
do-- ui setttings
    local scriptSettingsPage = bigSidebar.page("Settins")
    scriptSettingsPage.textbox("Send rate (faster does not mean equal better)","s",SendRecieveChannels.cRate,function(x)
        SendRecieveChannels.cRate = tonumber(x)
    end)
    SettingsButton.MouseButton1Click:Connect(scriptSettingsPage.open)
end
for i = 1, 2, 1 do
    SendRecieveChannels.Create(i)
end
SendRecieveChannels.Callback = function(plr,str)
    --prin(plr,str)
    if str == "" then
        warn("something went wrong when",plr,"was trying to send something please notify them just incase (either high speed or lag can cause this but it could be just my shitty script too)")
    end
    --print(plr,str)
    AddMessage(plr.DisplayName ..": ".. str)
end
SendButton.MouseButton1Click:Connect(function()
    local msg = TextBox.Text
    local thing = AddMessage(msg)
    local plrName = game.Players.LocalPlayer.DisplayName
    SendRecieveChannels.send(msg,function(current,max)
        if current == max then
            thing:FindFirstChildOfClass("TextLabel").Text = "[sent] "..plrName..": "..msg
        else
            thing:FindFirstChildOfClass("TextLabel").Text = "["..tostring(math.round(current/max*100)).."%] "..plrName..": "..msg
        end
    end)
    TextBox.Text = ""
end)
