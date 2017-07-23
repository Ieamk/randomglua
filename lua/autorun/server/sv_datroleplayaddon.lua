math.randomseed(os.time()) -- Generate random seed
hook.Add("PlayerSay","RollDatRPDice",function(ply, text)
	if string.Explode(" ",text,false)[1] == "!dice" then
		local tabText = string.Explode(" ",text,false)
		if !isnumber(tabText[2]) or !isnumber(tabText[4]) then return end
		local random = math.random(0,tonumber(tabText[2])+tonumber(tabText[4]) )
		if random <= tonumber(tabText[2]) then
			for _,v in pairs(player.GetAll()) do
				v:SendLua("chat.AddText(Color(200,200,200),\"["..ply:Nick().."] fait une \",Color(0,255,0),\"REUSSITE CRITIQUE!\",Color(200,200,200),\"("..random..")\")")
			end
		elseif random >= tonumber(tabText[4]) then
			for _,v in pairs(player.GetAll()) do
				v:SendLua("chat.AddText(Color(200,200,200),\"["..ply:Nick().."] fait un \",Color(255,0,0),\"ECHEC CRITIQUE!\",Color(200,200,200),\"("..random..")\")")
			end
		elseif random > tabText[3] then
			for _,v in pairs(player.GetAll()) do
				v:SendLua("chat.AddText(Color(200,200,200),\"["..ply:Nick().."] fait un \",Color(255,0,0),\"ECHEC!\",Color(200,200,200),\"("..random..")\")")
			end
		else
			for _,v in pairs(player.GetAll()) do
				v:SendLua("chat.AddText(Color(200,200,200),\"["..ply:Nick().."] fait une \",Color(0,255,0),\"REUSSITE!\",Color(200,200,200),\"("..random..")\")")
			end
		end
		return ""
	end
end)