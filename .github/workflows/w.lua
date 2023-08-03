game.ReplicatedStorage.tp.OnServerEvent:Connect(function(plr)
	local s = game:GetService("TeleportService")
	local id = 1
	s:Teleport(plr, id)
end)
