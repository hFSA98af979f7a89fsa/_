local TeleportService = game:GetService("TeleportService")
local Players = game:GetService("Players")

local placeId = game.PlaceId

-- Teleport each player individually
for _, player in pairs(Players:GetPlayers()) do
    TeleportService:Teleport(placeId, player)
end
