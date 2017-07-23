hook.Add("PlayerSetModel","pimpmybot",function(ply)
	if ply:SteamID() == "BOT" then
		ply:SetModel("models/AntLion.mdl") -- modify models/AntLion.mdl by any model
	end
end)