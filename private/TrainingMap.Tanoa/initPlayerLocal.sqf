if hasInterface then {
	//prevent ACE advanced fatigue force walk
	_handle = [{
		if (ace_advanced_fatigue_anreserve < 100) then { ace_advanced_fatigue_anreserve = 100; };
	}, 1,[]] call CBA_fnc_addPerFrameHandler;
	
	private _customZeusModules = [
		["Respawn", "Change Respawn Position", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			"respawn_west" setMarkerPos _position;
			[objNull, format ["Marker respawn_west moved to: %1", _position]] call bis_fnc_showCuratorFeedbackMessage;
		}],
		["AI Systems", "ACEX HC Blacklist Group", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			group _objectUnderCursor setVariable ["acex_headless_blacklist", true, true];
			[objNull, format ["Group Blacklisted: %1", group _objectUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
		}],
		["AI Systems", "ACEX HC Unblacklist Group", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			group _objectUnderCursor setVariable ["acex_headless_blacklist", false, true];
			[objNull, format ["Group Unblacklisted: %1", group _objectUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
		}],
		["AI Systems", "Vcom Disable for Group", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			group _objectUnderCursor setVariable ["Vcm_Disable", true, true];
			[objNull, format ["Group Vcom Disabled: %1", group _objectUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
		}],
		["AI Systems", "Vcom Enable for Group", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			group _objectUnderCursor setVariable ["Vcm_Disable", false, true];
			[objNull, format ["Group Vcom Enabled: %1", group _objectUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
		}],
		["AI Behaviour", "Look Here", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			[_objectUnderCursor, {
				params ["_successful", "_unit", "_mousePosASL"];
				[_unit, _mousePosASL] remoteExec ["doWatch", owner _unit]
			}] call ace_zeus_fnc_getModuleDestination;
		}],
		["AI Behaviour", "Disable AI: Path", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			[_objectUnderCursor, "Path"] remoteExec ["DisableAI", owner _objectUnderCursor];
			[objNull, format ["Path AI Disabled: %1", _objectUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
		}],
		["AI Behaviour", "Enable AI: Path", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			[_objectUnderCursor, "Path"] remoteExec ["EnableAI", owner _objectUnderCursor];
			[objNull, format ["Path AI Enabled: %1", _objectUnderCursor]] call bis_fnc_showCuratorFeedbackMessage;
		}],
		["AI Behaviour", "Unpack Static Weapon", {
			params [["_position", [0,0,0], [[]], 3], ["_objectUnderCursor", objNull, [objNull]]];
			private _g = group _objectUnderCursor;
			_g allowFleeing 0;
			[_g, getPos _objectUnderCursor, _objectUnderCursor getPos [500, getDir _objectUnderCursor]] call BIS_fnc_unpackStaticWeapon;
			private _xs = [];
			[objNull, format ["Unpacking Static: %1", _g]] call bis_fnc_showCuratorFeedbackMessage;
			
			[_g] spawn {
				params ["_g"];
				private _time = diag_tickTime;
				private _xs = units _g select {assignedVehicleRole _x isEqualTo ["Turret", [0]]} apply {vehicle _x};
				private _newTurrets = [];
				waitUntil {
					sleep 0.1;
					((diag_tickTime - _time) > 10) ||
					{
						_newTurrets = units _g select {assignedVehicleRole _x isEqualTo ["Turret", [0]]} apply {vehicle _x};
						!(_xs isEqualTo _newTurrets)
					}
					
				};
				_newTurrets = _newTurrets - _xs;
				_newTurrets apply {
					//systemChat format ["Righting Turret %1", _x setVectorUp surfaceNormal getPos _x];
					getPos _x params ["_posX", "_posY", "_posZ"];
					_x setPos [_posX, _posY, 0.05];
					_x setVectorUp surfaceNormal getPos _x;
				};
			};
		}]
	];
	
	//Achilles
	if isClass (configfile >> "CfgPatches" >> "achilles_ui_f") then {
		_customZeusModules apply {_x call Ares_fnc_RegisterCustomModule};
	};
	
	//Zeus Enhanced
	if isClass (configfile >> "CfgPatches" >> "zen_main") then {
		_customZeusModules apply {_x call zen_custom_modules_fnc_register};
	};
};