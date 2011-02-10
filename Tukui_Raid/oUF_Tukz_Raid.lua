local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales
if not C["unitframes"].enable == true then return end

local font = C["media"].uffont
local fontsize = C["media"].uffontsize
local fontflags = C["media"].uffontflags

local frameWidth = C.unitframes.sizes.raiddps.width-4
local frameHeight = C.unitframes.sizes.raiddps.height-4

local function Shared(self, unit)
	self:SetTemplate("Default")

	self.colors = T.oUF_colors
	self:RegisterForClicks("AnyUp")
	self:SetScript('OnEnter', UnitFrame_OnEnter)
	self:SetScript('OnLeave', UnitFrame_OnLeave)
	
	self.menu = T.SpawnMenu
	
	--self:SetBackdrop({bgFile = C["media"].blank, insets = {top = -T.mult, left = -T.mult, bottom = -T.mult, right = -T.mult}})
	self:SetBackdropColor(0, 0, 0)
	
	local health = CreateFrame('StatusBar', nil, self)
	health:Height(frameHeight)
	health:Width(frameWidth)
	health:SetPoint("TOP", 0, -2)
	health:SetStatusBarTexture(C["media"].normTex)
	self.Health = health

	health.bg = self.Health:CreateTexture(nil, 'BORDER')
	health.bg:SetAllPoints(self.Health)
	health.bg:SetTexture(C["media"].blank)
	health.bg:SetTexture(0.3, 0.3, 0.3)
	health.bg.multiplier = (0.3)
	self.Health.bg = health.bg
	
	health.PostUpdate = T.PostUpdatePetColor
	health.frequentUpdates = true
	
	if C.unitframes.unicolor == true then
		health.colorDisconnected = false
		health.colorClass = false
		health:SetStatusBarColor(.3, .3, .3, 1)
		health.bg:SetVertexColor(.1, .1, .1, 1)		
	else
		health.colorDisconnected = true	
		health.colorClass = true
		health.colorReaction = true			
	end
	
	local name = health:CreateFontString(nil, 'OVERLAY')
	name:SetFont(font, fontsize, fontflags)
	name:Point("LEFT", self, "RIGHT", 5, 0)
	self:Tag(name, '[Tukui:namemedium] [Tukui:dead][Tukui:afk]')
	self.Name = name
	
	if C["unitframes"].showsymbols == true then
		RaidIcon = health:CreateTexture(nil, 'OVERLAY')
		RaidIcon:Height(14)
		RaidIcon:Width(14)
		RaidIcon:SetPoint("CENTER", self, "CENTER")
		RaidIcon:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\raidicons.blp") -- thx hankthetank for texture
		self.RaidIcon = RaidIcon
	end
	
	if C["unitframes"].aggro == true then
		table.insert(self.__elements, T.UpdateThreat)
		self:RegisterEvent('PLAYER_TARGET_CHANGED', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_LIST_UPDATE', T.UpdateThreat)
		self:RegisterEvent('UNIT_THREAT_SITUATION_UPDATE', T.UpdateThreat)
    end
	
	local LFDRole = health:CreateTexture(nil, "OVERLAY")
    LFDRole:Height(6)
    LFDRole:Width(6)
	LFDRole:Point("TOPLEFT", 2, -2)
	LFDRole:SetTexture("Interface\\AddOns\\Tukui\\medias\\textures\\lfdicons.blp")
	self.LFDRole = LFDRole
	
	local ReadyCheck = health:CreateTexture(nil, "OVERLAY")
	ReadyCheck:Height(12)
	ReadyCheck:Width(12)
	ReadyCheck:SetPoint('CENTER')
	self.ReadyCheck = ReadyCheck
	
	--local picon = self.Health:CreateTexture(nil, 'OVERLAY')
	--picon:SetPoint('CENTER', self.Health)
	--picon:SetSize(16, 16)
	--picon:SetTexture[[Interface\AddOns\Tukui\media\textures\picon]]
	--picon.Override = T.Phasing
	--self.PhaseIcon = picon
	
	self.DebuffHighlightAlpha = 1
	self.DebuffHighlightBackdrop = true
	self.DebuffHighlightFilter = true

	if C["unitframes"].showsmooth == true then
		health.Smooth = true
	end
	
	if C["unitframes"].showrange == true then
		local range = {insideAlpha = 1, outsideAlpha = C["unitframes"].raidalphaoor}
		self.Range = range
	end

	return self
end

oUF:RegisterStyle('TukuiDpsRaid', Shared)
oUF:Factory(function(self)
	oUF:SetActiveStyle("TukuiDpsRaid")

	local raid = self:SpawnHeader("TukuiDpsRaid", nil, "raid,party,solo", 
		'oUF-initialConfigFunction', [[
			local header = self:GetParent()
			self:SetWidth(header:GetAttribute('initial-width'))
			self:SetHeight(header:GetAttribute('initial-height'))
		]],
		'initial-width', T.Scale(frameWidth+4),
		'initial-height', T.Scale(frameHeight+4),	
		"showSolo", false,
		"showParty", true,
		"showPlayer", C["unitframes"].showplayerinparty,
		"showRaid", true,
		"groupFilter", "1,2,3,4,5,6,7,8",
		"groupingOrder", "1,2,3,4,5,6,7,8",
		"groupBy", "GROUP",
		"yOffset", T.Scale(-3)
	)
	raid:SetPoint('BOTTOMLEFT', TukuiChatBackgroundLeft, "TOPLEFT", 0, 5)
end)