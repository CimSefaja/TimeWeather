--      ____    ____    ____    ______   _____  ______     
--     /\  _`\ /\  _`\ /\  _`\ /\  _  \ /\___ \/\  _  \    
--     \ \,\L\_\ \ \L\_\ \ \L\_\ \ \L\ \\/__/\ \ \ \L\ \   
--      \/_\__ \\ \  _\L\ \  _\/\ \  __ \  _\ \ \ \  __ \  
--        /\ \L\ \ \ \L\ \ \ \/  \ \ \/\ \/\ \_\ \ \ \/\ \ 
--        \ `\____\ \____/\ \_\   \ \_\ \_\ \____/\ \_\ \_\
--         \/_____/\/___/  \/_/    \/_/\/_/\/___/  \/_/\/_/
--                   https://discord.gg/H7DUpKpDvw  


local personalTimeEnabled = false
local personalHour = 12
local uiOpen = false

local function SetPersonalTime(hour)
    personalHour = hour
    personalTimeEnabled = true

    SetResourceKvpInt("personal_time", hour)
end

local function SetPersonalWeather(weatherType)
    SetWeatherTypeNowPersist(weatherType)

    SetResourceKvp("personal_weather", weatherType)
end


CreateThread(function()
    Wait(500)

    local savedTime = GetResourceKvpInt("personal_time")
    local savedWeather = GetResourceKvpString("personal_weather")

    if savedTime and savedTime > 0 then
        SetPersonalTime(savedTime)
    end

    if savedWeather then
        SetPersonalWeather(savedWeather)
    end
end)


RegisterCommand(Config.Day, function()
    SetPersonalTime(Config.DayTime)
end)

RegisterCommand(Config.Night, function()
    SetPersonalTime(Config.NightTime)
end)

RegisterCommand(Config.Morning, function()
    SetPersonalTime(Config.MorningTime)
end)

RegisterCommand(Config.Evening, function()
    SetPersonalTime(Config.EveningTime)
end)

RegisterCommand(Config.Sunny, function()
    SetPersonalWeather("clear")
end)

RegisterCommand(Config.ExtraSunny, function()
    SetPersonalWeather("extrasunny")
end)

RegisterCommand(Config.Rainy, function()
    SetPersonalWeather("thunder")
end)

RegisterCommand(Config.Xmas, function()
    SetPersonalWeather("xmas")
end)


RegisterCommand("weatherui", function()
    uiOpen = not uiOpen
    SetNuiFocus(uiOpen, uiOpen)

    SendNUIMessage({
        action = "toggle",
        state = uiOpen
    })
end)


RegisterNUICallback("setTime", function(data, cb)
    SetPersonalTime(data.hour)
    cb("ok")
end)

RegisterNUICallback("setWeather", function(data, cb)
    SetPersonalWeather(data.weather)
    cb("ok")
end)

RegisterNUICallback("close", function(_, cb)
    uiOpen = false
    SetNuiFocus(false, false)

    SendNUIMessage({
        action = "toggle",
        state = false
    })

    cb("ok")
end)

CreateThread(function()
    while true do
        Wait(1000)
        if personalTimeEnabled then
            NetworkOverrideClockTime(personalHour, 0, 0)
        end
    end
end)

