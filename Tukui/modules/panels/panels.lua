local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

local sbWidth = C.actionbar.sidebarWidth
local mbWidth = C.actionbar.mainbarWidth

local TukuiBar1 = CreateFrame("Frame", "TukuiBar1", UIParent, "SecureHandlerStateTemplate")
TukuiBar1:CreatePanel("Invisible", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 14)
TukuiBar1:SetWidth((T.buttonsize * mbWidth) + (T.buttonspacing * (mbWidth-1)))
TukuiBar1:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar1:SetFrameStrata("BACKGROUND")
TukuiBar1:SetFrameLevel(1)

local TukuiBar2 = CreateFrame("Frame", "TukuiBar2", UIParent)
TukuiBar2:CreatePanel("Invisible", 1, 1, "BOTTOMRIGHT", TukuiBar1, "BOTTOMLEFT", -6, 0)
TukuiBar2:SetWidth((T.buttonsize * sbWidth) + (T.buttonspacing * (sbWidth-1)))
TukuiBar2:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar2:SetFrameStrata("BACKGROUND")
TukuiBar2:SetFrameLevel(2)

local TukuiBar3 = CreateFrame("Frame", "TukuiBar3", UIParent)
TukuiBar3:CreatePanel("Invisible", 1, 1, "BOTTOMLEFT", TukuiBar1, "BOTTOMRIGHT", 6, 0)
TukuiBar3:SetWidth((T.buttonsize * sbWidth) + (T.buttonspacing * (sbWidth-1)))
TukuiBar3:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar3:SetFrameStrata("BACKGROUND")
TukuiBar3:SetFrameLevel(2)

local TukuiBar4 = CreateFrame("Frame", "TukuiBar4", UIParent)
TukuiBar4:CreatePanel("Invisible", 1, 1, "BOTTOM", UIParent, "BOTTOM", 0, 14)
TukuiBar4:SetWidth((T.buttonsize * mbWidth) + (T.buttonspacing * (mbWidth-1)))
TukuiBar4:SetHeight((T.buttonsize * 2) + (T.buttonspacing))
TukuiBar4:SetFrameStrata("BACKGROUND")
TukuiBar4:SetFrameLevel(2)

local TukuiBar5 = CreateFrame("Frame", "TukuiBar5", UIParent)
TukuiBar5:CreatePanel("Invisible", 1, (T.buttonsize * 12) + (T.buttonspacing * 11), "RIGHT", UIParent, "RIGHT", -24, -14)
TukuiBar5:SetWidth(T.buttonsize)
TukuiBar5:SetFrameStrata("BACKGROUND")
TukuiBar5:SetFrameLevel(2)

local TukuiBar6 = CreateFrame("Frame", "TukuiBar6", UIParent)
TukuiBar6:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar6:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 11))
TukuiBar6:SetPoint("LEFT", TukuiBar5, "LEFT", 0, 0)
TukuiBar6:SetFrameStrata("BACKGROUND")
TukuiBar6:SetFrameLevel(2)

local TukuiBar7 = CreateFrame("Frame", "TukuiBar7", UIParent)
TukuiBar7:SetWidth((T.buttonsize * 1) + (T.buttonspacing * 2))
TukuiBar7:SetHeight((T.buttonsize * 12) + (T.buttonspacing * 11))
TukuiBar7:SetPoint("TOP", TukuiBar5, "TOP", 0 , 0)
TukuiBar7:SetFrameStrata("BACKGROUND")
TukuiBar7:SetFrameLevel(2)

local petbg = CreateFrame("Frame", "TukuiPetBar", UIParent, "SecureHandlerStateTemplate")
petbg:CreatePanel("Invisible", T.petbuttonsize + (T.petbuttonspacing * 2), (T.petbuttonsize * 10) + (T.petbuttonspacing * 11), "RIGHT", TukuiBar5, "LEFT", -6, 0)

local ltpetbg1 = CreateFrame("Frame", "TukuiLineToPetActionBarBackground", petbg)
ltpetbg1:CreatePanel("Invisible", 24, 265, "LEFT", petbg, "RIGHT", 0, 0)
ltpetbg1:SetParent(petbg)
ltpetbg1:SetFrameStrata("BACKGROUND")
ltpetbg1:SetFrameLevel(0)
ltpetbg1:SetAlpha(.8)

-- INVISIBLE FRAME COVERING BOTTOM ACTIONBARS JUST TO PARENT UF CORRECTLY
local invbarbg = CreateFrame("Frame", "InvTukuiActionBarBackground", UIParent)
if T.lowversion then
	invbarbg:SetPoint("TOPLEFT", TukuiBar1)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar1)
	TukuiBar2:Hide()
	TukuiBar3:Hide()
else
	invbarbg:SetPoint("TOPLEFT", TukuiBar2)
	invbarbg:SetPoint("BOTTOMRIGHT", TukuiBar3)
end

-- LEFT VERTICAL LINE
local ileftlv = CreateFrame("Frame", "TukuiInfoLeftLineVertical", TukuiBar1)
ileftlv:CreatePanel("Default", 2, 130, "BOTTOMLEFT", UIParent, "BOTTOMLEFT", 22, 30)

-- RIGHT VERTICAL LINE
local irightlv = CreateFrame("Frame", "TukuiInfoRightLineVertical", TukuiBar1)
irightlv:CreatePanel("Default", 2, 130, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", -22, 30)

if not C.chat.background then
	-- CUBE AT LEFT, ACT AS A BUTTON (CHAT MENU)
	local cubeleft = CreateFrame("Frame", "TukuiCubeLeft", TukuiBar1)
	cubeleft:CreatePanel("Default", 10, 10, "BOTTOM", ileftlv, "TOP", 0, 0)
	cubeleft:EnableMouse(true)
	cubeleft:SetScript("OnMouseDown", function(self, btn)
		if TukuiInfoLeftBattleGround and UnitInBattleground("player") then
			if btn == "RightButton" then
				if TukuiInfoLeftBattleGround:IsShown() then
					TukuiInfoLeftBattleGround:Hide()
				else
					TukuiInfoLeftBattleGround:Show()
				end
			end
		end
		
		if btn == "LeftButton" then	
			ToggleFrame(ChatMenu)
		end
	end)

	-- CUBE AT RIGHT, ACT AS A BUTTON (CONFIGUI or BG'S)
	local cuberight = CreateFrame("Frame", "TukuiCubeRight", TukuiBar1)
	cuberight:CreatePanel("Default", 10, 10, "BOTTOM", irightlv, "TOP", 0, 0)
	if C["bags"].enable then
		cuberight:EnableMouse(true)
		cuberight:SetScript("OnMouseDown", function(self)
			ToggleKeyRing()
		end)
	end
end

-- HORIZONTAL LINE LEFT
local ltoabl = CreateFrame("Frame", "TukuiLineToABLeft", TukuiBar1)
ltoabl:CreatePanel("Default", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabl:ClearAllPoints()
ltoabl:Point("BOTTOMLEFT", ileftlv, "BOTTOMLEFT", 0, 0)
ltoabl:Point("RIGHT", TukuiBar1, "BOTTOMLEFT", -1, 17)
ltoabl:SetFrameStrata("BACKGROUND")
ltoabl:SetFrameLevel(1)

-- HORIZONTAL LINE RIGHT
local ltoabr = CreateFrame("Frame", "TukuiLineToABRight", TukuiBar1)
ltoabr:CreatePanel("Default", 5, 2, "BOTTOMRIGHT", UIParent, "BOTTOMRIGHT", 0, 0)
ltoabr:ClearAllPoints()
ltoabr:Point("LEFT", TukuiBar1, "BOTTOMRIGHT", 1, 17)
ltoabr:Point("BOTTOMRIGHT", irightlv, "BOTTOMRIGHT", 0, 0)
ltoabr:SetFrameStrata("BACKGROUND")
ltoabr:SetFrameLevel(1)

-- MOVE/HIDE SOME ELEMENTS IF CHAT BACKGROUND IS ENABLED
local movechat = 0
if C.chat.background then movechat = 10 ileftlv:SetAlpha(0) irightlv:SetAlpha(0) end

-- INFO LEFT (FOR STATS)
local ileft = CreateFrame("Frame", "TukuiInfoLeft", TukuiBar1)
ileft:CreatePanel("ThickBorder", T.InfoLeftRightWidth, 23, "LEFT", ltoabl, "LEFT", 14 - movechat, 0)
ileft:SetFrameLevel(2)
ileft:SetFrameStrata("BACKGROUND")
ileft:Hide()

-- INFO RIGHT (FOR STATS)
local iright = CreateFrame("Frame", "TukuiInfoRight", TukuiBar1)
iright:CreatePanel("ThickBorder", T.InfoLeftRightWidth, 23, "RIGHT", ltoabr, "RIGHT", -14 + movechat, 0)
iright:SetFrameLevel(2)
iright:SetFrameStrata("BACKGROUND")
iright:Hide()

if C.chat.background then
	-- Alpha horizontal lines because all panels is dependent on this frame.
	ltoabl:SetAlpha(0)
	ltoabr:SetAlpha(0)
	
	-- CHAT BG LEFT
	local chatleftbg = CreateFrame("Frame", "TukuiChatBackgroundLeft", TukuiInfoLeft)
	chatleftbg:CreatePanel("Transparent", T.InfoLeftRightWidth + 12, 177, "BOTTOM", TukuiInfoLeft, "BOTTOM", 0, -6)
	chatleftbg:SetFrameStrata("BACKGROUND")

	-- CHAT BG RIGHT
	local chatrightbg = CreateFrame("Frame", "TukuiChatBackgroundRight", TukuiInfoRight)
	chatrightbg:CreatePanel("Transparent", T.InfoLeftRightWidth + 12, 177, "BOTTOM", TukuiInfoRight, "BOTTOM", 0, -6)
	chatrightbg:Hide() --This will get shown if a chat exists in the bottomright corner
	chatrightbg:SetFrameStrata("BACKGROUND")
	
	-- LEFT TAB PANEL
	local tabsbgleft = CreateFrame("Frame", "TukuiTabsLeftBackground", TukuiBar1)
	tabsbgleft:CreatePanel("ThickBorder", T.InfoLeftRightWidth, 23, "TOP", chatleftbg, "TOP", 0, -6)
	tabsbgleft:SetFrameLevel(2)
	tabsbgleft:SetFrameStrata("BACKGROUND")
		
	-- RIGHT TAB PANEL
	local tabsbgright = CreateFrame("Frame", "TukuiTabsRightBackground", TukuiBar1)
	tabsbgright:CreatePanel("ThickBorder", T.InfoLeftRightWidth, 23, "TOP", chatrightbg, "TOP", 0, -5)
	tabsbgright:SetFrameLevel(2)
	tabsbgright:SetFrameStrata("BACKGROUND")
	tabsbgright:Hide() --This will get shown if a chat exists in the bottomright corner
end

if TukuiMinimap then
	local minimapstatsleft = CreateFrame("Frame", "TukuiMinimapStatsLeft", TukuiMinimap)
	minimapstatsleft:CreatePanel("ThickBorder", ((TukuiMinimap:GetWidth() + 4) / 2) -3, 19, "TOPLEFT", TukuiMinimap, "BOTTOMLEFT", 0, -1)
	minimapstatsleft:Hide()

	local minimapstatsright = CreateFrame("Frame", "TukuiMinimapStatsRight", TukuiMinimap)
	minimapstatsright:CreatePanel("ThickBorder", ((TukuiMinimap:GetWidth() + 4) / 2) -2, 19, "TOPRIGHT", TukuiMinimap, "BOTTOMRIGHT", 0, -1)
	minimapstatsright:Hide()
end

--BATTLEGROUND STATS FRAME
if C["datatext"].battleground == true then
	local bgframe = CreateFrame("Frame", "TukuiInfoLeftBattleGround", UIParent)
	bgframe:CreatePanel("ThickBorder", 1, 1, "TOPLEFT", UIParent, "BOTTOMLEFT", 0, 0)
	bgframe:SetAllPoints(ileft)
	bgframe:SetFrameStrata("LOW")
	bgframe:SetFrameLevel(0)
	bgframe:EnableMouse(true)
end
