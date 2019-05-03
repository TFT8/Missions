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
	["AI Behaviour", "Dash to Waypoint", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		private _g = group _objectUnderCursor;
		[[], [_g]] call Achilles_fnc_transferOwnership;
		waitUntil {local _g};
		_g setVariable ["Vcm_Disable", true, true];
		_g setVariable ["acex_headless_blacklist", true, true];
		_g allowFleeing 0;
		_g setCombatMode "BLUE";
		{
			_x disableAI "TARGET";
			_x disableAI "AUTOTARGET";
			_x disableAI "FSM";
			_x disableAI "WEAPONAIM";
			_x disableAI "SUPPRESSION";
			_x disableAI "COVER";
			_x disableAI "AUTOCOMBAT";
			_x setSpeedMode "FULL";
			_x setSkill ["courage", 1];
		} forEach units _g;
		
		private _cwp = waypoints _g select (currentWaypoint _g);
		_cwp setWaypointStatements ["true", "private _g = group this; _g setCombatMode 'YELLOW'; { _x enableAI 'TARGET'; _x enableAI 'AUTOTARGET'; _x enableAI 'FSM'; _x enableAI 'WEAPONAIM'; _x enableAI 'SUPPRESSION'; _x enableAI 'COVER'; _x enableAI 'AUTOCOMBAT'; _x setSpeedMode 'AUTO';} forEach units _g;"];

		["Group Dashing: %1", _g] call Achilles_fnc_ShowZeusErrorMessage;
	}] call Ares_fnc_RegisterCustomModule;
	["AI Behaviour", "Unpack Static Weapon", {
		params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
		private _g = group _objectUnderCursor;
		_g allowFleeing 0;
		[_g, getPos _objectUnderCursor, _objectUnderCursor getPos [500, getDir _objectUnderCursor]] call BIS_fnc_unpackStaticWeapon;
		private _turrets = [];
		["Unpacking Static: %1", _g] call Achilles_fnc_ShowZeusErrorMessage;
		
		waitUntil {
			!(units _g select {_x != vehicle _x} isEqualTo [])
		};
		private _turret = vehicle ((units _g select {_x != vehicle _x}) select 0);
		if (vectorUp _turret vectorDotProduct surfaceNormal getPos _turret < 0.99) then {
			//hintSilent "Righting Turret";
			_turret setPosASL ((getPosASL _turret) vectorAdd [0,0,0.1]);
			_turret setVectorUp surfaceNormal getPos _turret;
		};
	}] call Ares_fnc_RegisterCustomModule;
};