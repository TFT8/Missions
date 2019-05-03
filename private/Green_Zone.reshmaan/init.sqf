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
	
if isServer then {
	_curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"]; 
	_curator setVariable ["Addons", 3, true];
	_curator addCuratorEditableObjects [allUnits + vehicles, true];
	if (!hasInterface) then {
		_curator setVariable ["Owner", "#adminLogged", true];
	} else {
		//Editor play in Multiplayer
		player assignCurator _curator;
	};
};

// fix for units losing their loadout when switching to Headless Client
["CAManBase", "Local", {
    params ["_entity", "_isLocal"];

    if (_isLocal) then {
		{
			if ((uniform _x) isEqualTo "") then {
				_x setUnitLoadout (getUnitLoadout (typeOf _x));
			};
		} forEach units group _entity;
    };
}] call CBA_fnc_addClassEventHandler;

// civilian fleeing
["Civilian", "FiredNear", {
    params ["_civ"];
	if (behaviour _civ == "COMBAT") exitWith {};
	
	_civ setBehaviour "AWARE";
	//set sprint
	group _civ setSpeedMode "FULL";
	//list nearest houses
	_nH = nearestObjects [_civ, ["House", "Building"], 200]; 
	if (_nH isEqualTo []) then {
		_civ setUnitPos "DOWN";
	} else {
		//filter houses with garrison positions
		_nHwP = _nH select { not ((_x buildingPos 0) isEqualTo [0,0,0])}; 
		
		_H = _nH # 0; 
		//list house positions
		_HP = _H buildingPos -1;
		_HP = selectRandom _HP;
		if ((_civ distance _HP) > 1) then
		{
			_civ doMove _HP;
			//private _wp = group _civ addWaypoint [_HP, 0, 1];
			//_wp setWaypointStatements ["behaviour this != 'COMBAT'", ""];
		} else {
			_civ setUnitPos "DOWN";
		};
	};
	switch (stance _civ) do {
		case "STAND":{_civ switchMove "ApanPercMstpSnonWnonDnon_G01";};
		case "CROUCH":{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
		case "PRONE":{_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";};
		default{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
	};
}] call CBA_fnc_addClassEventHandler;

["Civilian", "AnimDone", {
    params ["_civ"];
	if (behaviour _civ != "COMBAT" && {animationState _civ select [0,5] == "apanp"}) then {
		_civ switchMove "";
		_civ setUnitPos "AUTO";
		_civ setSpeedMode "LIMITED";
	};
}] call CBA_fnc_addClassEventHandler;