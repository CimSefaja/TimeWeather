local personalTimeEnabled = false
local personalHour = 12

local function SetPersonalTime(hour)
    personalHour = hour
    personalTimeEnabled = true
end

local function SetPersonalWeather(weatherType)
    SetWeatherTypeNowPersist(weatherType)
end

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

CreateThread(function()
    while true do
        Citizen.Wait(1000)
        if personalTimeEnabled then
            NetworkOverrideClockTime(personalHour, 0, 0)
        end
    end
end)
