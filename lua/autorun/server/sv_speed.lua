hook.Add("PlayerSpawn", "setSpeed", function(ply)
	ply:SetWalkSpeed(200) -- Walking speed, default 200
	ply:SetRunSpeed(500) -- Running speed, default 500
end)

local function getAffectedPly(name, playerInServer)
	local player = {}
	for k, ply in pairs( playerInServer ) do
		if string.find( string.lower(ply:Nick()), name, 1, true) then
			table.insert(player, ply) 
		end
	end
	return player
end

hook.Add("PlayerSay","setSpeedCommand",function(ply, text)
	if string.sub( string.lower( text ), 1, 10 ) == "!walkspeed" then -- commande : !walkspeed <nom> <vitesse> ( marche )
		if string.Explode(" ",text,false)[2] ) == nil then
			ply:ChatPrint("Player's name?")
		elseif string.Explode(" ",text,false)[3] ) then
			ply:ChatPrint("Player's speed?")
		end
		local affectedPly = getAffectedPly( string.lower( string.Explode(" ",text,false)[2] ), player.GetAll() )
		for _, v in pairs(affectedPly) do
			v:SetWalkSpeed( string.Explode(" ",text,false)[3] )
		end
	elseif string.sub( string.lower( text ), 1, 9 ) == "!runspeed" then -- commande : !runspeed <nom> <vitesse> ( sprint )
		if string.Explode(" ",text,false)[2] == nil then
			ply:ChatPrint("Player's name?")
		elseif string.Explode(" ",text,false)[3] == nil then
			ply:ChatPrint("Player's speed?")
		end
		local affectedPly = getAffectedPly( string.lower( string.Explode(" ",text,false)[2] ), player.GetAll() )
		for _, v in pairs(affectedPly) do
			v:SetRunSpeed( string.Explode(" ",text,false)[3] )
		end
	end
end)