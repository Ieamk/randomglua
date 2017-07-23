hook.Add("OnPlayerChat","showURLmaks",function(ply, text) -- Open in steam overlay
	if string.Replace(string.lower(text), " ", "") == "!maks" then -- Modify !maks by any chat command
		if ply == LocalPlayer() then
			gui.OpenURL("http://steamcommunity.com/profiles/76561198197775845/") -- Modify link by any url
		end
	end
end)