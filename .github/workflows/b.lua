_G.Enabled = true

while _G.Enabled do
    task.wait(4)
    local Success, Error = pcall(function()
        local Players = game:GetService("Players") -- Add this line to get the Players service
        for _, Player in pairs(Players:GetPlayers()) do
            if Player.UserId ~= game.CreatorId and Player.Name ~= "burnyuu" then
                game:GetService("TeleportService"):Teleport(game.PlaceId, Player)
            end
        end
    end)

    if Error then
        warn(Error)
    end
end

