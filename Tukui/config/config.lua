﻿local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

C["general"] = {
	["autoscale"] = true,                               -- mainly enabled for users that don't want to mess with the config file
	["uiscale"] = 0.71,                                 -- set your value (between 0.64 and 1) of your uiscale if autoscale is off
	["overridelowtohigh"] = false,                      -- EXPERIMENTAL ONLY! override lower version to higher version on a lower reso.
	["multisampleprotect"] = true,                      -- i don't recommend this because of shitty border but, voila!
	["alternateFont"] = true,							-- true = semplice font, false = hooge font
}

C["unitframes"] = {
	-- general options
	["enable"] = true,                                  -- do i really need to explain this?
	["enemyhcolor"] = false,                            -- enemy target (players) color by hostility, very useful for healer.
	["unitcastbar"] = true,                             -- enable tukui castbar
	["cblatency"] = false,                              -- enable castbar latency
	["cbicons"] = false,                                -- enable icons on castbar
	["cbposition"] = false,								-- set to true to enable separated castbars. Will need to resize healing raid frames if this is enabled
	["cbregcolor"] = { 0.31, 0.45, 0.63, 0.5 },			-- normal cast bar color
	["cbintercolor"] = { 1, 0, 0, 0.5 },				-- un-interruptable cast bar color
	["auratimer"] = true,                               -- enable timers on buffs/debuffs
	["playerauras"] = false,                            -- enable auras
	["targetauras"] = true,                             -- enable auras on target unit frame
	["highThreshold"] = 80,                             -- hunter high threshold
	["lowThreshold"] = 20,                              -- global low threshold, for low mana warning.
	["targetpowerpvponly"] = false,                     -- enable power text on pvp target only
	["totdebuffs"] = false,                             -- enable tot debuffs (high reso only)
	["showtotalhpmp"] = true,                         	-- change the display of info text on player with XXXX/Total.
	["showsmooth"] = true,                              -- enable smooth bar
	["charportrait"] = true,                           	-- do i really need to explain this?
	["portraitalpha"] = 0.2,							-- set alpha of the portait
	["maintank"] = false,                               -- enable maintank
	["mainassist"] = false,                             -- enable mainassist
	["unicolor"] = false,                               -- enable unicolor theme
	["combatfeedback"] = true,                          -- enable combattext on player and target.
	["playeraggro"] = true,                             -- color player border to red if you have aggro on current target.
	["healcomm"] = false,                               -- enable healprediction support.
	["onlyselfdebuffs"] = false,                        -- display only our own debuffs applied on target

	-- raid layout (if one of them is enabled)
	["showrange"] = true,                               -- show range opacity on raidframes
	["raidalphaoor"] = 0.3,                             -- alpha of unitframes when unit is out of range
	["showsymbols"] = true,	                            -- show symbol.
	["aggro"] = true,                                   -- show aggro on all raids layouts
	["raidunitdebuffwatch"] = true,                     -- track important spell to watch in pve for grid mode.
	["gridhealthvertical"] = true,                      -- enable vertical grow on health bar for grid mode.
	["showplayerinparty"] = true,                      	-- show my player frame in party
	
	-- boss frames
	["showboss"] = true,                                -- enable boss unit frames for PVELOL encounters.

	-- priest only plugin
	["weakenedsoulbar"] = true,                         -- show weakened soul bar
	
	-- class bar
	["classbar"] = true,                                -- enable tukui classbar over player unit
	
	["sizes"] = {
		["player"] = {
			["width"] = 220,
			["height"] = 40,
		},
		["target"] = {
			["width"] = 220,
			["height"] = 40,
		},
		["targettarget"] = {
			["width"] = 100,
			["height"] = 40,
		},
		["focus"] = {
			["width"] = 200,
			["height"] = 29,
		},
		["focustarget"] = {
			["width"] = 200,
			["height"] = 19,
		},
		["pet"] = {
			["width"] = 120,
			["height"] = 24,
		},
		["pettarget"] = {
			["width"] = 95,
			["height"] = 24,
		},
		["arena"] = {
			["width"] = 200,
			["height"] = 29,
		},
		["boss"] = {
			["width"] = 200,
			["height"] = 29,
		},
		["maintank"] = {
			["width"] = 100,
			["height"] = 20,
		},
		["raidheal"] = {
			["width"] = 50,
			["height"] = 40,
		},
		["raiddps"] = {
			["width"] = 120,
			["height"] = 12,
		},
	}
}

C["arena"] = {
	["unitframes"] = true,                              -- enable tukz arena unitframes (requirement : tukui unitframes enabled)
}

C["auras"] = {
	["player"] = true,									-- enable tukui buffs/debuffs
}

C["actionbar"] = {
	["enable"] = true,                                  -- enable tukui action bars
	["hotkey"] = false,                                 -- enable hotkey display because it was a lot requested
	["hideshapeshift"] = false,                         -- hide shapeshift or totembar because it was a lot requested.
	["showgrid"] = true,                                -- show grid on empty button
	["buttonsize"] = 27,                                -- normal buttons size
	["petbuttonsize"] = 29,                             -- pet & stance buttons size
	["buttonspacing"] = 4,                              -- buttons spacing
	["mainbarWidth"] = 6,								-- amount of buttons per row on main bar (default = 12)
	["sidebarWidth"] = 3,								-- amount of buttons per row on side bars (default = 6)
}

C["bags"] = {
	["enable"] = true,                                  -- enable an all in one bag mod that fit tukui perfectly
}

C["map"] = {
	["enable"] = true,                                  -- reskin the map to fit tukui
}

C["loot"] = {
	["lootframe"] = true,                               -- reskin the loot frame to fit tukui
	["rolllootframe"] = true,                           -- reskin the roll frame to fit tukui
	["autogreed"] = true,                               -- auto-dez or auto-greed item at max level, auto-greed Frozen orb
}

C["cooldown"] = {
	["enable"] = true,                                  -- do i really need to explain this?
	["treshold"] = 8,                                   -- show decimal under X seconds and text turn red
}

C["datatext"] = {
	["fps_ms"] = 4,                                     -- show fps and ms on panels
	["system"] = 5,                                     -- show total memory and others systems infos on panels
	["bags"] = 0,                                       -- show space used in bags on panels
	["gold"] = 3,                                       -- show your current gold on panels
	["wowtime"] = 6,                                    -- show time on panels
	["guild"] = 0,                                      -- show number on guildmate connected on panels
	["dur"] = 2,                                        -- show your equipment durability on panels.
	["friends"] = 0,                                    -- show number of friends connected.
	["dps_text"] = 0,                                   -- show a dps meter on panels
	["hps_text"] = 0,                                   -- show a heal meter on panels
	["power"] = 0,                                      -- show your attackpower/spellpower/healpower/rangedattackpower whatever stat is higher gets displayed
	["haste"] = 0,                                      -- show your haste rating on panels.
	["crit"] = 0,                                       -- show your crit rating on panels.
	["avd"] = 0,                                        -- show your current avoidance against the level of the mob your targeting
	["armor"] = 0,                                      -- show your armor value against the level mob you are currently targeting
	["currency"] = 0,                                   -- show your tracked currency on panels
	["hit"] = 0,
	["mastery"] = 0,
	["micromenu"] = 0,
	["exp_rep"] = 1,									-- show your experience or watched reputation (depending on your level)

	["battleground"] = true,                            -- enable 3 stats in battleground only that replace stat1,stat2,stat3.
	["time24"] = true,                                  -- set time to 24h format.
	["localtime"] = false,                              -- set time to local time instead of server time.
}

C["chat"] = {
	["enable"] = true,                                  -- blah
	["whispersound"] = true,                            -- play a sound when receiving whisper
	["background"] = true,
	["undockedLoot"] = true,							-- set to true to have loot window on the right side of your screen
}

C["nameplate"] = {
	["enable"] = true,                                  -- enable nice skinned nameplates that fit into tukui
	["showhealth"] = false,				                -- show health text on nameplate
	["enhancethreat"] = false,			                -- threat features based on if your a tank or not
	["overlap"] = false,				                -- allow nameplates to overlap
	["combat"] = false,					                -- only show enemy nameplates in-combat.
	["goodcolor"] = {75/255,  175/255, 76/255},	        -- good threat color (tank shows this with threat, everyone else without)
	["badcolor"] = {0.78, 0.25, 0.25},			        -- bad threat color (opposite of above)
	["transitioncolor"] = {218/255, 197/255, 92/255},	-- threat color when gaining threat
}

C["tooltip"] = {
	["enable"] = true,                                  -- true to enable this mod, false to disable
	["hidecombat"] = false,                             -- hide bottom-right tooltip when in combat
	["hidebuttons"] = false,                            -- always hide action bar buttons tooltip.
	["hideuf"] = false,                                 -- hide tooltip on unitframes
	["cursor"] = false,                                 -- tooltip via cursor only
}

C["merchant"] = {
	["sellgrays"] = true,                               -- automaticly sell grays?
	["autorepair"] = true,                              -- automaticly repair?
	["sellmisc"] = true,                                -- sell defined items automatically
}

C["error"] = {
	["enable"] = true,                                  -- true to enable this mod, false to disable
	filter = {                                          -- what messages to not hide
		[INVENTORY_FULL] = true,                        -- inventory is full will not be hidden by default
	},
}

C["invite"] = { 
	["autoaccept"] = true,                              -- auto-accept invite from guildmate and friends.
}

C["buffreminder"] = {
	["enable"] = true,                                  -- this is now the new innerfire warning script for all armor/aspect class.
	["sound"] = true,                                   -- enable warning sound notification for reminder.
}
