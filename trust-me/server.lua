-- server.lua
local function SendDiscordLog(name, message)
    local discordInfo = {
        ["color"] = 11750815, -- Lila Farbe
        ["type"] = "rich",
        ["title"] = "TrustMe Systems: /me Command Log",
        ["description"] = "Inhalt: " .. message,
        ["footer"] = {
            ["text"] ="TrustMeLogs:  Spieler: " .. name .. " hat den /me Befehl benutzt."
        }
    }

    PerformHttpRequest(Config.DiscordWebhook, function(err, text, headers) end, 'POST', json.encode({username = 'Chat Log', embeds = {discordInfo}}), { ['Content-Type'] = 'application/json' })
end

RegisterCommand('me', function(source, args, user)
    local text = table.concat(args, " ")
    local name = GetPlayerName(source)
    SendDiscordLog(name, text) -- Die Reihenfolge ist wichtig. Diese Funktion muss nach der Definition stehen.
end, false)

RegisterServerEvent('me:logToDiscord')
AddEventHandler('me:logToDiscord', function(text)
    local _source = source
    local name = GetPlayerName(_source)
    SendDiscordLog(name, text)
end)
