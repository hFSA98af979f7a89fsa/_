game.ReplicatedStorage.tp.OnServerEvent:Connect(function(plr)
	local s = game:GetService("TeleportService")
	local id = 650705980
	s:Teleport(plr, id)
end)
