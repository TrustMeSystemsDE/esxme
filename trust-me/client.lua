local cooldown = false
local display = false
local textToShow = ""
local endTime

RegisterCommand('me', function()
    if cooldown then
        TriggerEvent('chatMessage', "Du musst warten, bevor du dies wieder verwenden kannst.")
        return
    end

    DisplayOnscreenKeyboard(1, "FMMC_MPM_NA", "", "Was möchtest du tun? (Missbrauch wird geahndet)", "", "", "", 128)
    while (UpdateOnscreenKeyboard() == 0) do
        DisableAllControlActions(0)
        Wait(0)
    end
    if (GetOnscreenKeyboardResult()) then
        textToShow = GetOnscreenKeyboardResult()
        display = true
        endTime = GetGameTimer() + Config.DisplayTime
        cooldown = true
        TriggerEvent('me:triggered', textToShow) -- Event um die Nachricht an den Server zu senden
        Citizen.SetTimeout(Config.Cooldown, function()
            cooldown = false
        end)
    end
end, false)

-- Event-Listener für das Client-seitige Trigger-Event
RegisterNetEvent('me:triggered')
AddEventHandler('me:triggered', function(text)
    TriggerServerEvent('me:logToDiscord', text)
end)

-- Thread für das Zeichnen des Textes
Citizen.CreateThread(function()
    while true do
        Wait(0)
        if display and GetGameTimer() < endTime then
            local playerPed = PlayerPedId()
            local playerCoords = GetEntityCoords(playerPed)
            local offset = vector3(0.0, 0.0, 1.0)
            DrawText3D(playerCoords + offset, textToShow)
        else
            display = false
        end
    end
end)

-- Funktion für das Zeichnen des 3D Textes
function DrawText3D(coords, text)
    local onScreen, _x, _y = World3dToScreen2d(coords.x, coords.y, coords.z)
    if onScreen then
        SetTextScale(0.35, 0.35)
        SetTextFont(4)
        SetTextProportional(1)
        SetTextColour(Config.TextColor.r, Config.TextColor.g, Config.TextColor.b, Config.TextColor.a)
        SetTextEntry("STRING")
        SetTextCentre(1)
        AddTextComponentString(text)
        DrawText(_x, _y)
    end
end
