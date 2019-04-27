call TFT_fnc_prepPhaseInit;
call TFT_fnc_defaultLoadouts;


// fix Zeus placing aircraft over water
["ModuleCurator_F", "init", {
	params ["_curator"];
	_curator addEventHandler ["CuratorObjectPlaced", {
		params ["_curator", "_entity"];

		if (_entity isKindOf "Air") then {
			private _isWater = surfaceIsWater position _entity;
			if (_isWater) then {
				private _altitude = 50;
				_entity setVehiclePosition [(getPos _entity vectorAdd [0,0,_altitude]), [], 0, "FLY"];
				if (_entity isKindOf "Plane") then {
					_entity setVelocityModelSpace [0, 100, 0];
				};
			};
		};
	}];
}] call CBA_fnc_addClassEventHandler;
	
if (isServer && !hasInterface) then {
	_curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"]; 
	_curator setVariable ["Addons", 3, true]; 
	_curator setVariable ["Owner", "#adminLogged", true];

	{ 
	  _x addCuratorEditableObjects [allUnits + vehicles, true]; 
	} forEach allCurators; 
	
	//all players
	private _allHCs = entities "HeadlessClient_F";
	private _allHPs = allPlayers - _allHCs;

	TFT_players = [];
	{
		TFT_players pushBackUnique (name _x);
	} forEach _allHPs;

	0 = [] execVM "log.sqf";
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