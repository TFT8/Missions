if (hasInterface) then {
	//prevent ACE advanced fatigue force walk
	_handle = [{
		if (ace_advanced_fatigue_anreserve < 100) then { ace_advanced_fatigue_anreserve = 100; };
	}, 1,[]] call CBA_fnc_addPerFrameHandler;
	
	//ares custom curator modules
	["ACEX Headless", "Blacklist Group", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		group _objectUnderCursor setVariable ["acex_headless_blacklist", true, true];
	}] call Ares_fnc_RegisterCustomModule;
	["ACEX Headless", "Unblacklist Group", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		group _objectUnderCursor setVariable ["acex_headless_blacklist", false, true];
	}] call Ares_fnc_RegisterCustomModule;
};