Filger_Settings = {
	configmode = false,
}

--[[ CD-Example
		{
			Name = "COOLDOWN",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { "CENTER", UIParent, "CENTER", 0, -100 },

			-- Wild Growth/Wildwuchs
			{ spellID = 48438, size = smallBuffs, filter = "CD" },
		},
]]

local T, C, L = unpack(Tukui) -- Import: T - functions, constants, variables; C - config; L - locales

local smallBuffs = C.unitframes.sizes.player.height
local medBuffs = 47
local largeBuffs = 72

local P_BUFF_ICON = { "TOPRIGHT", UIParent, "TOPLEFT", -160,  74 } --Player's buffs (off the screen)
local T_BUFF_ICON =	{ "TOPLEFT" , UIParent, "TOPRIGHT",  160,  74 } --Target's buffs (off the screen)

local P_PROC_ICON =	{ "BOTTOMRIGHT", TukuiPlayer, "TOPLEFT", -5, 3 } --Player's class procs
local T_DEBUFF_ICON = { "BOTTOMLEFT" , TukuiTarget, "TOPRIGHT",  5, 3 } --Target's debuffs

local PVE_PVP_P_DEBUFF_ICON = { "TOPLEFT",  TukuiPlayer, "BOTTOMLEFT", 0, -25 } --PvE/PvP player's debuffs
local PVP_T_BUFF_ICON = { "TOPRIGHT", TukuiTarget, "BOTTOMRIGHT", 0, -25 } -- PvP target's buffs

local F_DEBUFF_BAR = { "BOTTOMLEFT" , TukuiTarget, "TOPRIGHT",  5, 10 + medBuffs } --Focus bars

local SPECIAL_P_BUFF_ICON = { "RIGHT",  TukuiPlayer, "LEFT", -5, 0 } --Special procs (trinkets, eng, etc.)



Filger_Spells = {
	["DRUID"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Opacity = 1,
			Mode = "ICON",
			setPoint = { unpack(P_BUFF_ICON) },

			-- Lifebloom/Blühendes Leben
			{ spellID = 33763, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rejuvenation/Verjüngung
			{ spellID = 774, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Regrowth/Nachwachsen
			{ spellID = 8936, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Wild Growth/Wildwuchs
			{ spellID = 48438, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_BUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Opacity = 1,
			Mode = "ICON",
			setPoint = { unpack(T_BUFF_ICON) },

			-- Lifebloom/Blühendes Leben
			{ spellID = 33763, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Rejuvenation/Verjüngung
			{ spellID = 774, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Regrowth/Nachwachsen
			{ spellID = 8936, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Wild Growth/Wildwuchs
			{ spellID = 48438, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Eclipse (Lunar)/Mondfinsternis
			{ spellID = 48518, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Eclipse (Solar)/Sonnenfinsternis
			{ spellID = 48517, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shooting Stars/Sternschnuppen
			{ spellID = 93400, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Savage Roar/Wildes Brüllen
			{ spellID = 52610, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Survival Instincts/Überlebensinstinkte
			{ spellID = 61336, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tree of Life/Baum des Lebens
			{ spellID = 33891, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting/Freizaubern
			{ spellID = 16870, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate/Anregen
			{ spellID = 29166, size = medBuffs, unitId = "player", caster = "all", filter = "BUFF" },
			-- Barkskin/Baumrinde
			{ spellID = 22812, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Hibernate/Winterschlaf
			{ spellID = 2637, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots/Wucherwurzeln
			{ spellID = 339, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Cyclone/Wirbelsturm
			{ spellID = 33786, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Moonfire/Mondfeuer
			{ spellID = 8921, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunfire/Sonnenfeuer
			{ spellID = 93402, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Insect Swarm/Insektenschwarm
			{ spellID = 5570, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rake/Krallenhieb
			{ spellID = 1822, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Rip/Zerfetzen
			{ spellID = 1079, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Lacerate/Aufschlitzen
			{ spellID = 33745, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Pounce Bleed/Anspringblutung
			{ spellID = 9007, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mangle/Zerfleischen
			{ spellID = 33876, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth and Moon/Erde und Mond
			{ spellID = 48506, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Faerie Fire/Feenfeuer
			{ spellID = 770, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },

			-- Hibernate/Winterschlaf
			{ spellID = 2637, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots/Wucherwurzeln
			{ spellID = 339, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Cyclone/Wirbelsturm
			{ spellID = 33786, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["HUNTER"] = {
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Lock and Load
			{ spellID = 56342, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fury of the Five Flights
			{ spellID = 60314, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Quick Shots
			--{ spellID = 6150, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Master Tactician
			{ spellID = 34837, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Steady Shot/Verbesserter zuverlässiger Schuss
			{ spellID = 53224, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Expose Weakness
			--{ spellID = 34503, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rapid Fire
			{ spellID = 3045, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Call of the Wild
			{ spellID = 53434, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Mend Pet/Tier heilen
			{ spellID = 136, size = smallBuffs, unitId = "pet", caster = "player", filter = "BUFF" },
			-- Feed Pet/Tier füttern
			{ spellID = 6991, size = smallBuffs, unitId = "pet", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Wyvern Sting
			{ spellID = 19386, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Serpent Sting
			{ spellID = 1978, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Scorpid Sting
			--{ spellID = 3043, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Black Arrow
			{ spellID = 3674, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Explosive Shot
			{ spellID = 53301, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Hunter's Mark
			{ spellID = 1130, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },

		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },

			-- Wyvern Sting
			{ spellID = 19386, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["MAGE"] = {
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Frostbite
			--{ spellID = 11071, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Winter's Chill
			{ spellID = 28593, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Fingers of Frost
			{ spellID = 44544, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fireball!
			{ spellID = 57761, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hot Streak
			{ spellID = 44445, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Missile Barrage
			{ spellID = 54486, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 12536, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Impact
			{ spellID = 12358, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Polymorph
			{ spellID = 118, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Arcane Blast
			{ spellID = 36032, size = medBuffs, unitId = "player", caster = "player", filter = "DEBUFF" },
			-- Improved Scorch
			{ spellID = 11367, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Scorch
			{ spellID = 2948, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Slow
			{ spellID = 31589, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Ignite
			{ spellID = 11119, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Living Bomb
			{ spellID = 44457, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Pyroblast!
			{ spellID = 92315, size = medBuffs, unitId = "player", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },

			-- Polymorph
			{ spellID = 118, size = smallBuffs, barWidth = 191, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["WARRIOR"] = {
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Sudden Death
			{ spellID = 52437, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slam!
			{ spellID = 46916, size = medBuffs, unitId = "player", caster = "all", filter = "BUFF" },
			-- Sword and Board
			{ spellID = 50227, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Blood Reserve
			{ spellID = 64568, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Last Stand
			{ spellID = 12975, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shield Wall
			{ spellID = 871, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Hamstring
			{ spellID = 1715, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rend
			{ spellID = 94009, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Sunder Armor
			{ spellID = 7386, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Expose Armor
			--{ spellID = 48669, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Thunder Clap
			{ spellID = 6343, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Infected Wounds
			{ spellID = 48484, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Frost Fever
			{ spellID = 55095, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Demoralizing Shout
			{ spellID = 1160, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demoralizing Roar
			{ spellID = 99, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Weakness
			{ spellID = 702, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
		},
	},
	["SHAMAN"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_BUFF_ICON) },

			-- Earth Shield/Erdschild
			{ spellID = 974, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Riptide/Springflut
			{ spellID = 61295, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Lightning Shield/Blitzschlagschild
			{ spellID = 324, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Water Shield/Wasserschild
			{ spellID = 52127, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_BUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_BUFF_ICON) },

			-- Earth Shield/Erdschild
			{ spellID = 974, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Riptide/Springflut
			{ spellID = 61295, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Maelstorm Weapon
			{ spellID = 53817, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shamanistic Rage
			{ spellID = 30823, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Clearcasting
			{ spellID = 16246, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tidal Waves
			{ spellID = 51562, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Ancestral Fortitude
			{ spellID = 16236, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unleash Life
			{ spellID = 73685, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Hex
			{ spellID = 51514, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Storm Strike
			{ spellID = 17364, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Earth Shock
			{ spellID = 8042, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Shock
			{ spellID = 8056, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Flame Shock
			{ spellID = 8050, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },
			
			-- Earth Shield/Erdschild
			{ spellID = 974, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "player", filter = "BUFF" },
			-- Hex
			{ spellID = 51514, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Bind Elemental
			{ spellID = 76780, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["PALADIN"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Opacity = 1,
			Mode = "ICON",
			setPoint = { unpack(P_BUFF_ICON) },

			-- Beacon of Light/Flamme des Glaubens
			{ spellID = 53563, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_BUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Opacity = 1,
			Mode = "ICON",
			setPoint = { unpack(T_BUFF_ICON) },

			-- Beacon of Light/Flamme des Glaubens
			{ spellID = 53563, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Judgements of the Pure
			{ spellID = 53671, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Holy Shield
			{ spellID = 20925, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Infusion of Light
			{ spellID = 54149, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Plea
			{ spellID = 54428, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Essence of Life
			{ spellID = 60062, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Illumination
			{ spellID = 31842, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Hammer of Justice/Hammer der Gerechtigkeit
			{ spellID = 853, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Judgement of Light
			{ spellID = 20271, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Judgement of Justice
			--{ spellID = 53407, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Judgement of Wisdom
			--{ spellID = 20186, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Heart of the Crusader
			--{ spellID = 54499, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Blood Corruption
			--{ spellID = 53742, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },

			-- Hammer of Justice/Hammer der Gerechtigkeit
			{ spellID = 853, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["PRIEST"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_BUFF_ICON) },

			-- Prayer of Mending/Gebet der Besserung
			{ spellID = 41637, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Guardian Spirit/Schutzgeist
			{ spellID = 47788, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Pain Suppression/Schmerzunterdrückung
			{ spellID = 33206, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power Word: Shield/Machtwort: Schild
			{ spellID = 17, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Renew/Erneuerung
			{ spellID = 139, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fade/Verblassen
			{ spellID = 586, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Fear Ward/Furchtzauberschutz
			{ spellID = 6346, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Divine Aegis
			{ spellID = 47753, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_BUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_BUFF_ICON) },

			-- Prayer of Mending/Gebet der Besserung
			{ spellID = 41637, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Guardian Spirit/Schutzgeist
			{ spellID = 47788, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Pain Suppression/Schmerzunterdrückung
			{ spellID = 33206, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Power Word: Shield/Machtwort: Schild
			{ spellID = 17, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Renew/Erneuerung
			{ spellID = 139, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Fear Ward/Furchtzauberschutz
			{ spellID = 6346, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Divine Aegis
			{ spellID = 47753, size = smallBuffs, unitId = "target", caster = "player", filter = "BUFF" },
		},
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Surge of Light
			{ spellID = 33151, size = medBuffs, unitId = "player", caster = "all", filter = "BUFF" },
			-- Serendipity
			{ spellID = 63730, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shadow Weaving
			--{ spellID = 15258, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Spirit Tap
			-- { spellID = 59000, size = 37, unitId = "player", caster = "all", filter = "BUFF" },
			-- Shadow Orb
			{ spellID = 77487, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Archangel
			{ spellID = 81700, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evangelism
			{ spellID = 81661, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dispersion
			{ spellID = 47585, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Shackle undead
			{ spellID = 9484, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Word: Pain
			{ spellID = 589, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Devouring Plague
			{ spellID = 2944, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Vampiric Touch
			{ spellID = 34914, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },

			-- Shackle undead
			{ spellID = 9484, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["WARLOCK"] = {
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			--Devious Minds/Teuflische Absichten
			{ spellID = 70840, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Improved Soul Fire
			{ spellID = 85114, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Molten Core
			{ spellID = 47383, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Decimation
			{ spellID = 63158, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backdraft
			{ spellID = 54277, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Backlash
			{ spellID = 34939, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nether Protection
			{ spellID = 30301, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Nightfall
			{ spellID = 18095, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Burning Soul
			{ spellID = 74434, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Fear
			{ spellID = 5782, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of the Elements
			{ spellID = 1490, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Tongues
			{ spellID = 1714, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Curse of Weakness
			{ spellID = 702, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Shadow Embrace
			{ spellID = 32385, size = medBuffs, unitId = "target", caster = "player", filter = "BUFF" },
			-- Corruption
			{ spellID = 172, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Immolate
			{ spellID = 348, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Curse of Agony
			{ spellID = 980, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Bane of Doom
			{ spellID = 603, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unstable Affliction
			{ spellID = 30108, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Haunt
			{ spellID = 48181, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Seed of Corruption
			{ spellID = 27243, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Enslave Demon
			{ spellID = 1098, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Demon Charge
			{ spellID = 54785, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "RIGHT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },

			-- Fear
			{ spellID = 5782, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Banish
			{ spellID = 710, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["ROGUE"] = {
		{
			Name = "P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Sprint
			{ spellID = 2983, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Adrenaline Rush
			{ spellID = 13750, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Evasion
			{ spellID = 5277, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Envenom
			{ spellID = 32645, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Overkill
			{ spellID = 58426, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Slice and Dice
			{ spellID = 5171, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tricks of the Trade
			{ spellID = 57934, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Turn the Tables
			{ spellID = 51627, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Cheap shot
			{ spellID = 1833, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Kidney shot
			{ spellID = 408, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = medBuffs, unitId = "target", caster = "all", filter = "DEBUFF" },
			-- Rupture
			{ spellID = 1943, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Garrote
			{ spellID = 703, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Expose Armor
			{ spellID = 8647, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Dismantle
			{ spellID = 51722, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Deadly Poison
			{ spellID = 2818, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Mind-numbing Poison
			{ spellID = 5760, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Crippling Poison
			{ spellID = 3409, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Wound Poison
			{ spellID = 13218, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
		{
			Name = "F/DEBUFF_BAR",
			Direction = "UP",
			IconSide = "LEFT",
			Interval = 4,
			Mode = "BAR",
			setPoint = { unpack(F_DEBUFF_BAR) },

			-- Blind
			{ spellID = 2094, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = smallBuffs, barWidth = 200, unitId = "focus", caster = "all", filter = "DEBUFF" },
		},
	},
	["DEATHKNIGHT"] = {
		{
			Name = "P_PROC_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(P_PROC_ICON) },

			-- Unholy Force/Unheilige Kraft
			{ spellID = 67383, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Desolation/Verwüstung
			--{ spellID = 66817, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unholy Strength/Unheilige Stärke
			{ spellID = 53365, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Unholy Might/Unheilige Macht
			{ spellID = 67117, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Dancing Rune Weapon/Tanzende Runenwaffe
			{ spellID = 49028, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Killing machine
			{ spellID = 51124, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Freezing fog
			{ spellID = 59052, size = medBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "T_DEBUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(T_DEBUFF_ICON) },

			-- Blood Plague/Blutseuche
			{ spellID = 59879, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Frost Fever/Frostfieber
			{ spellID = 59921, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Unholy Blight/Unheilige Verseuchung
			{ spellID = 49194, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
			-- Summon Gargoyle/Gargoyle beschwören
			{ spellID = 49206, size = medBuffs, unitId = "target", caster = "player", filter = "DEBUFF" },
		},
	},
	["ALL"] = {
		{
			Name = "SPECIAL_P_BUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(SPECIAL_P_BUFF_ICON) },

			-- Eyes of Twilight/Augen des Zwielichts
			{ spellID = 75495, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Piercing Twilight/Durchbohrendes Zwielicht
			{ spellID = 75456, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Twilight Flames/Zwielichtflammen
			{ spellID = 75473, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Scaly Nimbleness/Schuppige Gewandtheit
			{ spellID = 75480, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Surge of Power/Kraftsog
			{ spellID = 71644, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Thick Skin/Dicke Haut
			{ spellID = 71639, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Siphoned Power/Entzogene Kraft
			{ spellID = 71636, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Aegis of Dalaran/Aegis von Dalaran
			{ spellID = 71638, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Speed of the Vrykul/Geschwindigkeit der Vrykul
			{ spellID = 71560, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Power of the Taunka/Macht der Taunka
			{ spellID = 71558, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Agility of the Vrykul/Beweglichkeit der Vrykul
			{ spellID = 71556, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Mote of Anger/Partikel des Zorns
			{ spellID = 71432, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Icy Rage/Eisige Wut
			{ spellID = 71541, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Cultivated Power/Kultivierte Macht
			{ spellID = 71572, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Invigorated/Gestärkt
			{ spellID = 71577, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Revitalized/Revitalisiert
			{ spellID = 71584, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Rage of the Fallen/Zorn der Gefallenen
			{ spellID = 71396, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Hardened Skin/Gehärtete Haut
			{ spellID = 71586, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Elusive Power/Flüchtige Macht
			{ spellID = 71579, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Shard of Flame/Flammensplitter
			{ spellID = 67759, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },

			-- Frostforged Champion/Frostgeschmiedeter Champion
			{ spellID = 72412, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Chilling Knowledge/Kühlendes Wissen
			{ spellID = 72418, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Frostforged Sage/Frostgeschmiedeter Weiser
			{ spellID = 72416, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Frostforged Defender/Frostgeschmiedeter Verteidiger
			{ spellID = 72414, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },

			-- Hyperspeed Accelerators/Hypergeschwindigkeitsbeschleuniger
			{ spellID = 54999, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Synapse Springs
			{ spellID = 82174, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },

			-- Speed/Geschwindigkeit
			{ spellID = 53908, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Wild Magic/Wilde Magie
			{ spellID = 53909, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },

			--Tricks of the Trade/Schurkenhandel
			{ spellID = 57934, size = smallBuffs, unitId = "player", caster = "all", filter = "BUFF" },
			--Power Infusion/Seele der Macht
			{ spellID = 10060, size = smallBuffs, unitId = "player", caster = "all", filter = "BUFF" },
			-- Bloodlust/Kampfrausch
			{ spellID = 2825, size = smallBuffs, unitId = "player", caster = "all", filter = "BUFF" },
			-- Heroism/Heldentum
			{ spellID = 32182, size = smallBuffs, unitId = "player", caster = "all", filter = "BUFF" },
			
			-- Berserking
			{ spellID = 26297, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Black Magic
			{ spellID = 59626, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Heartsong
			{ spellID = 74224, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			
			-- Blood of Isiset
			{ spellID = 91149, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Tear of Blood
			{ spellID = 91138, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			
			
			
			-- Elemental Mastery
			{ spellID = 64701, size = smallBuffs, unitId = "player", caster = "player", filter = "BUFF" },
		},
		{
			Name = "PVE/PVP_P_DEBUFF_ICON",
			Direction = "LEFT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(PVE_PVP_P_DEBUFF_ICON) },

			-- Death Knight
			-- Gnaw (Ghoul)
			{ spellID = 47481, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Strangulate
			{ spellID = 47476, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chains of Ice
			{ spellID = 45524, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Desecration (no duration, lasts as long as you stand in it)
			{ spellID = 55741, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Heart Strike
			{ spellID = 58617, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Icy Clutch (Chilblains)
			--{ spellID = 50436, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hungering Cold
			{ spellID = 51209, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Druid
			-- Cyclone
			{ spellID = 33786, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hibernate
			{ spellID = 2637, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Bash
			{ spellID = 5211, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Maim
			{ spellID = 22570, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Pounce
			{ spellID = 9005, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Entangling Roots
			{ spellID = 339, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Feral Charge Effect
			{ spellID = 45334, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Infected Wounds
			{ spellID = 58179, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Hunter
			-- Freezing Trap Effect
			{ spellID = 3355, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Freezing Arrow Effect
			--{ spellID = 60210, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Scare Beast
			{ spellID = 1513, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Scatter Shot
			{ spellID = 19503, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chimera Shot - Scorpid
			--{ spellID = 53359, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Snatch (Bird of Prey)
			{ spellID = 50541, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silencing Shot
			{ spellID = 34490, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Intimidation
			{ spellID = 24394, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sonic Blast (Bat)
			{ spellID = 50519, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ravage (Ravager)
			{ spellID = 50518, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Concussive Barrage
			{ spellID = 35101, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Concussive Shot
			{ spellID = 5116, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Trap Aura
			{ spellID = 13810, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Freezing Trap
			{ spellID = 61394, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Wing Clip
			{ spellID = 2974, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Counterattack
			{ spellID = 19306, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Entrapment
			{ spellID = 19185, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Pin (Crab)
			{ spellID = 50245, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Venom Web Spray (Silithid)
			{ spellID = 54706, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Web (Spider)
			{ spellID = 4167, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Froststorm Breath (Chimera)
			{ spellID = 51209, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Tendon Rip (Hyena)
			{ spellID = 51209, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Mage
			-- Dragon's Breath
			{ spellID = 31661, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Polymorph
			{ spellID = 118, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced - Improved Counterspell
			{ spellID = 18469, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Deep Freeze
			{ spellID = 44572, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Freeze (Water Elemental)
			{ spellID = 33395, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Nova
			{ spellID = 122, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shattered Barrier
			{ spellID = 55080, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Chilled
			{ spellID = 6136, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cone of Cold
			{ spellID = 120, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Slow
			{ spellID = 31589, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Paladin
			-- Repentance
			{ spellID = 20066, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Turn Evil
			{ spellID = 10326, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shield of the Templar
			{ spellID = 63529, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hammer of Justice
			{ spellID = 853, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Holy Wrath
			{ spellID = 2812, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Stun (Seal of Justice proc)
			{ spellID = 20170, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Avenger's Shield
			{ spellID = 31935, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Priest
			-- Psychic Horror
			{ spellID = 64058, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mind Control
			{ spellID = 605, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Psychic Horror
			{ spellID = 64044, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Psychic Scream
			{ spellID = 8122, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silence
			{ spellID = 15487, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mind Flay
			{ spellID = 15407, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Rogue
			-- Dismantle
			{ spellID = 51722, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blind
			{ spellID = 2094, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gouge
			{ spellID = 1776, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Sap
			{ spellID = 6770, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Garrote - Silence
			{ spellID = 1330, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced - Improved Kick
			{ spellID = 18425, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Cheap Shot
			{ spellID = 1833, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Kidney Shot
			{ spellID = 408, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Blade Twisting
			{ spellID = 31125, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Crippling Poison
			{ spellID = 3409, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Deadly Throw
			{ spellID = 26679, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Shaman
			-- Hex
			{ spellID = 51514, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Earthgrab
			{ spellID = 64695, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Freeze
			{ spellID = 63685, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Stoneclaw Stun
			{ spellID = 39796, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Earthbind
			{ spellID = 3600, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Shock
			{ spellID = 8056, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Warlock
			-- Banish
			{ spellID = 710, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Death Coil
			{ spellID = 6789, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Fear
			{ spellID = 5782, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Howl of Terror
			{ spellID = 5484, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Seduction (Succubus)
			{ spellID = 6358, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Spell Lock (Felhunter)
			{ spellID = 24259, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shadowfury
			{ spellID = 30283, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Intercept (Felguard)
			{ spellID = 30153, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Aftermath
			{ spellID = 18118, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Curse of Exhaustion
			{ spellID = 18223, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Warrior
			-- Intimidating Shout
			{ spellID = 20511, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Disarm
			{ spellID = 676, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Silenced (Gag Order)
			{ spellID = 18498, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Charge Stun
			{ spellID = 7922, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Concussion Blow
			{ spellID = 12809, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Intercept
			{ spellID = 20253, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Revenge Stun
			--{ spellID = 12798, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Shockwave
			{ spellID = 46968, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Glyph of Hamstring
			{ spellID = 58373, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Improved Hamstring
			{ spellID = 23694, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Hamstring
			{ spellID = 1715, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Piercing Howl
			{ spellID = 12323, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- Racials
			-- War Stomp
			{ spellID = 20549, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },

			-- ICC
			-- Mark of the Fallen Champion/Mal des gefallenen Champions (Deathbringer Saurfang)
			{ spellID = 72293, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Inoculated/Geimpft (Festergut)
			{ spellID = 72103, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mutated Infection/Mutierte Infektion (Rotface)
			{ spellID = 71224, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Unbound Plague/Entfesselte Seuche (Professor Putricide)
			{ spellID = 72856, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Plague Sickness/Seuchenkrankheit (Professor Putricide)
			{ spellID = 73117, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Gas Variable/Gasvariable (Professor Putricide)
			{ spellID = 70353, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Ooze Variable/Schlammvariable (Professor Putricide)
			{ spellID = 70352, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Pact of the Darkfallen/Pakt der Sinistren (Bloodqueen Lana'thel)
			{ spellID = 71340, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Swarming Shadows/Schwärmende Schatten (Bloodqueen Lana'thel)
			{ spellID = 71861, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Essence of the Blood Queen/Essenz der Blutkönigin (Bloodqueen Lana'thel)
			{ spellID = 71473, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Frost Bomb/Frostbombe (Sindragosa)
			{ spellID = 71053, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Instability/Instabilität (Sindragosa)
			{ spellID = 69766, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Unchained Magic/Entfesselte Magie (Sindragosa)
			{ spellID = 69762, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Mystic Buffet/Mystischer Puffer (Sindragosa)
			{ spellID = 70128, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			-- Necrotic Plague/Nekrotische Seuche (Arthas - The Lich King)
			{ spellID = 73912, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Fiery Combustion/Feurige Einäscherung (Halion)
			{ spellID = 74562, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			--Soul Consumption/Seelenverzehrung (Halion)
			{ spellID = 74792, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
			
			-- Cave In
			{ spellID = 74987, size = largeBuffs, unitId = "player", caster = "all", filter = "DEBUFF" },
		},
		{
			Name = "PVP_T_BUFF_ICON",
			Direction = "RIGHT",
			Interval = 4,
			Mode = "ICON",
			setPoint = { unpack(PVP_T_BUFF_ICON) },

			-- Aspect of the Pack
			{ spellID = 13159, size = largeBuffs, unitId = "player", caster = "player", filter = "BUFF" },
			-- Innervate
			{ spellID = 29166, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF"},
			-- Spell Reflection
			{ spellID = 23920, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Aura Mastery
			{ spellID = 31821, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Ice Block
			{ spellID = 45438, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Cloak of Shadows
			{ spellID = 31224, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Divine Shield
			{ spellID = 642, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Deterrence
			{ spellID = 19263, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Anti-Magic Shell
			{ spellID = 48707, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Lichborne
			{ spellID = 49039, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Freedom
			{ spellID = 1044, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Sacrifice
			{ spellID = 6940, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Grounding Totem Effect
			{ spellID = 8178, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Hand of Protection
			{ spellID = 1022, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Avenging Wrath
			{ spellID = 31884, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
			-- Thorns
			{ spellID = 467, size = largeBuffs, unitId = "target", caster = "all", filter = "BUFF" },
		},
	},
}