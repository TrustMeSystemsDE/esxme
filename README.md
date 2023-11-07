# ESX /me Command Script

Dieses Script erlaubt es Spielern, den `/me` Befehl im Spiel zu verwenden, um eine Handlung oder Emotion darzustellen. Wenn ein Spieler `/me` verwendet, wird über ihrem Kopf ein Text angezeigt, der ihre Handlung beschreibt. Diese Funktion hat einen Cooldown und der angezeigte Text hat eine einstellbare Dauer und Farbe.

## Features

- `/me` Befehl für RP-Situationen
- Konfigurierbarer Cooldown und Anzeigedauer für Text
- Konfigurierbare Textfarbe
- Text bewegt sich mit dem Spieler
- Discord-Log für jeden Gebrauch des `/me` Befehls

## Installation

1. Kopiere den Ordner `trust-me` in deinen `resources` Ordner auf deinem ESX-Server.
2. Füge `ensure trust-me` in deine `server.cfg` ein.
3. Konfiguriere die `config.lua` nach deinen Wünschen.
4. Starte deinen Server neu.

## Konfiguration

Bearbeite die `config.lua` Datei, um die Einstellungen wie Cooldown-Zeit, Anzeigedauer des Textes, Farbe und Discord-Webhook-Adresse anzupassen.

```lua
Config = {}

Config.Cooldown = 15000 -- Cooldown in Millisekunden
Config.DisplayTime = 10000 -- Anzeigezeit des Textes in Millisekunden
Config.TextColor = { r = 191, g = 162, b = 255, a = 255 } -- Farbe Lila
Config.DiscordWebhook = "DEINE_WEBHOOK_URL_HIER" -- Setze deine Discord Webhook URL hier
