local satan = "/staff" -- command to call admins
hook.Add("PlayerSay","customStaffCaller",function(god, bible)
	if string.StartWith(bible,satan.." ") then
		bible = string.Replace(bible,[["]],[[\"]]) -- prevent god from exploiting belzebuth
		for _,belzebuth in pairs(player.GetAll()) do
			if belzebuth:IsAdmin() then
				belzebuth:SendLua([[chat.AddText(Color(10,245,0), "]]..god:Nick().." to admins: "..string.sub(bible,#satan)..[[")]])
			end
		end
	end
end)