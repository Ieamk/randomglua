hook.Add("OnPlayerChat","justapicbro",function(ply, text) 
	if string.Replace(text," ","") == "!img" then -- replace !img by a chat command
		if ply == LocalPlayer() then
			local url = "http://www.thenug.com/sites/default/pub/110816/thenug-to3pFZ324V.jpg" -- replace url by your url
			local modifier = 1.5 -- Increase => smaller img
			local Window = vgui.Create("DFrame")
			Window:SetSize(ScrW()/modifier,ScrH()/modifier)
			Window:SetTitle("")
			Window:SetVisible(true)
			Window:SetDraggable(false)
			Window:ShowCloseButton(false)
			Window:SetVerticalScrollbarEnabled(false)
			function Window:Paint(w,h)	end
			local html = vgui.Create("DHTML", Window)
			html:Dock(FILL)
			html:SetHTML([[<div align="center"><img src="]]..url..[[" height="95%" width="auto"></div>]]) -- If scrollbars tweak the height
			html:SetAllowLua(false)
			Window:Center()
			Window:MakePopup()
			local quitButton = vgui.Create("DButton",Window)
			function quitButton:Paint(w,h)	end
			quitButton:SetText("x")
			quitButton:SetFont("Trebuchet24")
			quitButton:SizeToContentsX(10)
			quitButton:AlignTop(0)
			quitButton:AlignRight(100)
			quitButton:SetColor(Color(255,0,0))
			quitButton.DoClick = function()
				Window:Close()
			end
			html:SetScrollbars(false)
		end
	end
end)