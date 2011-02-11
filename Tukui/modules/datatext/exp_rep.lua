local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales
--------------------------------------------------------------------
-- FPS
--------------------------------------------------------------------

if C["datatext"].exp_rep and C["datatext"].exp_rep > 0 then
	local Stat = CreateFrame("Frame")
	Stat:EnableMouse(true)
	Stat:SetFrameStrata("BACKGROUND")
	Stat:SetFrameLevel(3)

	local Text  = TukuiInfoLeft:CreateFontString(nil, "OVERLAY")
	Text:SetFont(C.media.uffont, C.media.uffontsize, C.media.uffontflags)
	T.PP(C["datatext"].exp_rep, Text)
	
	local reaction = {
		[1] = {{ 170/255, 70/255,  70/255 }, "Hated", "FFaa4646"},
		[2] = {{ 170/255, 70/255,  70/255 }, "Hostile", "FFaa4646"},
		[3] = {{ 170/255, 70/255,  70/255 }, "Unfriendly", "FFaa4646"},
		[4] = {{ 200/255, 180/255, 100/255 }, "Neutral", "FFc8b464"},
		[5] = {{ 75/255,  175/255, 75/255 }, "Friendly", "FF4baf4b"},
		[6] = {{ 75/255,  175/255, 75/255 }, "Honored", "FF4baf4b"},
		[7] = {{ 75/255,  175/255, 75/255 }, "Revered", "FF4baf4b"},
		[8] = {{ 155/255,  255/255, 155/255 }, "Exalted","FF9bff9b"},
	}
	
	local function OnEvent(self)
		if UnitLevel("player") ~= MAX_PLAYER_LEVEL then
			local XP, maxXP = UnitXP("player"), UnitXPMax("player")
			local restXP = GetXPExhaustion()
			Text:SetTextColor(1,1,1)
			if restXP then
				Text:SetText("|cffb18ce3"..T.ShortValue(XP).."/"..T.ShortValue(maxXP).."|cff7fcaff+"..T.ShortValue(restXP).."|r")
			else
				Text:SetText(T.ShortValue(XP).."/"..T.ShortValue(maxXP))
			end
		elseif GetWatchedFactionInfo() then
			local name, rank, minRep, maxRep, value = GetWatchedFactionInfo()
			Text:SetText(value-minRep.."/"..maxRep-minRep)
			Text:SetTextColor(unpack(reaction[rank][1]))
		else
			Text:SetText("-")
			Text:SetTextColor(1,1,1)
		end
		self:SetAllPoints(Text)
	end
	
	--Event handling
	Stat:RegisterEvent("PLAYER_LEVEL_UP")
	Stat:RegisterEvent("PLAYER_XP_UPDATE")
	Stat:RegisterEvent("UPDATE_EXHAUSTION")
	Stat:RegisterEvent("CHAT_MSG_COMBAT_FACTION_CHANGE")
	Stat:RegisterEvent("UPDATE_FACTION")
	Stat:RegisterEvent("PLAYER_ENTERING_WORLD")
	Stat:SetScript("OnEvent", OnEvent) 
	Stat:SetScript("OnEnter", function(self)
		local anchor, panel, xoff, yoff = T.DataTextTooltipAnchor(Text)
		GameTooltip:SetOwner(panel, anchor, xoff, yoff)
		GameTooltip:ClearLines()
		if UnitLevel("player") ~= MAX_PLAYER_LEVEL then
			local XP, maxXP = UnitXP("player"), UnitXPMax("player")
			local restXP = GetXPExhaustion()
			GameTooltip:AddLine("Experience:")
			GameTooltip:AddLine("XP: "..T.CommaValue(XP).."/"..T.CommaValue(maxXP).."("..floor(XP/maxXP*100).."%)")
			GameTooltip:AddLine("Remaining: -"..T.CommaValue(maxXP-XP))
			if restXP then
				GameTooltip:AddLine("|cffb18ce3Rested: "..T.CommaValue(restXP).."("..floor(restXP/maxXP*100).."%)|r")
			end
		end
		if GetWatchedFactionInfo() then
			local name, rank, min, max, value = GetWatchedFactionInfo()
			if UnitLevel("player") ~= MAX_PLAYER_LEVEL then GameTooltip:AddLine(" ") end
			GameTooltip:AddLine("Reputation: "..name)
			GameTooltip:AddLine("Standing: |c"..reaction[rank][3]..reaction[rank][2].."|r")
			GameTooltip:AddLine("Rep: "..T.CommaValue(value-min).."/"..T.CommaValue(max-min).."("..floor((value-min)/(max-min)*100).."%)")
			GameTooltip:AddLine("Remaining: -"..T.CommaValue(max-value))
		end
		GameTooltip:Show()
	end)
	Stat:SetScript("OnLeave", function() GameTooltip:Hide() end)
end