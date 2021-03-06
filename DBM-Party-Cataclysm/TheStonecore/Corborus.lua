local mod	= DBM:NewMod("Corborus", "DBM-Party-Cataclysm", 7)
local L		= mod:GetLocalizedStrings()

mod:SetRevision(("$Revision: 5173 $"):sub(12, -3))
mod:SetCreatureID(43438)
mod:SetZone()

mod:RegisterCombat("combat")

mod:RegisterEvents(
	"SPELL_AURA_APPLIED",
	"SPELL_CAST_SUCCESS"
)

local warnCrystalBarrage	= mod:NewSpellAnnounce(81634, 2)
local warnDampening			= mod:NewSpellAnnounce(82415, 2)
local warnSubmerge			= mod:NewAnnounce("WarnSubmerge", 2)
local warnEmerge			= mod:NewAnnounce("WarnEmerge", 2)

local specWarnCrystalBarrage		= mod:NewSpecialWarningYou(81634)
local specWarnCrystalBarrageClose	= mod:NewSpecialWarningClose(81634)

local timerDampening	= mod:NewCDTimer(10, 82415)
local timerSubmerge		= mod:NewTimer(90, "TimerSubmerge")
local timerEmerge		= mod:NewTimer(30, "TimerEmerge")

mod:AddBoolOption("CrystalArrow")
mod:AddBoolOption("RangeFrame")

function mod:OnCombatStart(delay)
	timerSubmerge:Start(30-delay)
	self:ScheduleMethod(30, "Submerge")
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(5)
	end
end

function mod:OnCombatEnd()
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:Submerge()
	warnSubmerge:Show()
	timerEmerge:Show()
	timerDampening:Cancel()
	self:ScheduleMethod(30, "Emerge")
	if self.Options.RangeFrame then
		DBM.RangeCheck:Hide()
	end
end

function mod:Emerge()
	warnEmerge:Show()
	timerEmerge:Show()
	self:ScheduleMethod(90, "Submerge")
	if self.Options.RangeFrame then
		DBM.RangeCheck:Show(5)
	end
end

function mod:SPELL_AURA_APPLIED(args)
	if args:IsSpellID(86881, 92648) then--Need to relog this again maybe use UNIT_AURA cause my old logs just didn't have SPELL_AURA_APPLIED
		warnCrystalBarrage:Show(args.destName)--Might need a table if 2 melee happen to be standing together during cast?
		if args:IsPlayer() then
			specWarnCrystalBarrage:Show()
		end
		local uId = DBM:GetRaidUnitId(args.destName)--Should work?
		if uId then--May also not work right if same spellid is applied to people near the target, then will need more work.
			local inRange = CheckInteractDistance(uId, 2)
			local x, y = GetPlayerMapPosition(uId)
			if x == 0 and y == 0 then
				SetMapToCurrentZone()
				x, y = GetPlayerMapPosition(uId)
			end
			if inRange then
				specWarnCrystalBarrageClose:Show()
				if self.Options.CrystalArrow then
					DBM.Arrow:ShowRunAway(x, y, 8, 5)
				end
			end
		end
	end
end

function mod:SPELL_CAST_SUCCESS(args)
	if args:IsSpellID(82415) then
		warnDampening:Show()
		timerDampening:Start()
	end
end