call TFT_fnc_prepPhaseInit;

_mrkr = getMarkerPos "respawn_west";
"respawn_west" setMarkerPosLocal [_mrkr select 0, _mrkr select 1, 89];

if isServer then {
	//_curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"]; 
	//_curator setVariable ["Addons", 3, true];
	tft_zeus addCuratorEditableObjects [allUnits + vehicles, true];
	if (!hasInterface) then {
		tft_zeus setVariable ["Owner", "#adminLogged", true];
		execVM "tft_init.sqf";
	} else {
		//Editor play in Multiplayer
		player assignCurator tft_zeus;
	};
};

// fix for units losing their loadout when switching to Headless Client
["CAManBase", "Local", {
    params ["_entity", "_isLocal"];

    if (_isLocal) then {
		{
			if ((uniform _x) isEqualTo "") then {
				_x setUnitLoadout (typeOf _x);
			};
		} forEach units group _entity;
    };
}] call CBA_fnc_addClassEventHandler;