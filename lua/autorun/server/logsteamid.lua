hook.Add("PlayerInitialSpawn","SteamIDlogMaks", function( ply )
	if !file.Exists( "steamidlog.txt", "DATA") then
		file.Write( "steamidlog.txt", "")
	end
	local fileID = file.Open( "steamidlog.txt","r", "DATA")
	local lastPos = fileID:Tell()+58
	local playerStr = ply:Nick().." || "..ply:SteamID().."\n"
	while fileID:Tell() != lastPos do -- research if player is in file
		lastPos = fileID:Tell()
		if fileID:ReadLine() == playerStr then
			return -- quit if player is in file
		end
	end
	file.Append("steamidlog.txt", playerStr)
	fileID:Close()
end)