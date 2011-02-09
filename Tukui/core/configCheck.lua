------------------------------------------------------------------------
-- auto-overwrite script config is X mod is found
------------------------------------------------------------------------

-- because users are too lazy to disable feature in config file
-- adding an auto disable if some mods are loaded
local T, C, L = unpack(select(2, ...)) -- Import: T - functions, constants, variables; C - config; L - locales

if (C.actionbar.sidebarWidth > 6) or (C.actionbar.sidebarWidth < 0) then C.actionbar.sidebarWidth = 6 end