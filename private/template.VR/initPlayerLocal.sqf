if (hasInterface) then {
	//prevent ACE advanced fatigue force walk
	_handle = [{
		if (ace_advanced_fatigue_anreserve < 100) then { ace_advanced_fatigue_anreserve = 100; };
	}, 1,[]] call CBA_fnc_addPerFrameHandler;
	
	//ares custom curator modules
	["ACEX Headless", "Blacklist Group", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		group _objectUnderCursor setVariable ["acex_headless_blacklist", true, true];
		["Group Blacklisted: %1", group _objectUnderCursor] call Achilles_fnc_ShowZeusErrorMessage;
	}] call Ares_fnc_RegisterCustomModule;
	["ACEX Headless", "Unblacklist Group", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		group _objectUnderCursor setVariable ["acex_headless_blacklist", false, true];
		["Group Unblacklisted: %1", group _objectUnderCursor] call Achilles_fnc_ShowZeusErrorMessage;
	}] call Ares_fnc_RegisterCustomModule;
	["VcomAI", "Disable Vcom for Group", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		group _objectUnderCursor setVariable ["Vcm_Disable", true, true];
		["Group Vcom Disabled: %1", group _objectUnderCursor] call Achilles_fnc_ShowZeusErrorMessage;
	}] call Ares_fnc_RegisterCustomModule;
	["VcomAI", "Enable Vcom for Group", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		group _objectUnderCursor setVariable ["Vcm_Disable", false, true];
		["Group Vcom Enabled: %1", group _objectUnderCursor] call Achilles_fnc_ShowZeusErrorMessage;
	}] call Ares_fnc_RegisterCustomModule;
};