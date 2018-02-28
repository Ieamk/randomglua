hook.Add("InitPostEntity","noDoors", function()
	timer.Simple( 1,function()
	for _, ent in pairs(ents.GetAll()) do
		if string.find(ent:GetName(),"door") then
			SafeRemoveEntity(ent)
		end
	end
	end)
end)
