call TFT_fnc_prepPhaseInit;

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

{
    if (side _x == civilian) then {
        0 = _x addEventHandler ["FiredNear", {
            params ["_civ"];
            
            if (stance _civ == "PRONE") then {
                _civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";
            } else {
                _civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";
            };
            //set sprint
            _civ setSpeedMode "FULL";
            //list nearest houses
            _nH = nearestObjects [_civ, ["House"], 100]; 
            //filter houses with garrison positions
            _nHwP = _nH select { not ((_x buildingPos 0) isEqualTo [0,0,0])}; 
            
            _H = selectRandom _nH; 
            //list house positions
            _HP = _H buildingPos -1; 

            _HP = selectRandom _HP; 

            _civ doMove _HP; 
            
            _civ removeAllEventHandlers "FiredNear"; 
        }];
    };
    //non-playable civilians
} count (allUnits - switchableUnits - playableUnits);

if (hasInterface) then {
    player addEventHandler ["Take", {
        params ["_unit", "_container", "_item"];
        if (_item in [
            "MobilePhone",
            "SmartPhone",
            "FlashDisk",
            "Laptop_Closed",
            "Wallet_ID",
            "UMI_Land_Camcorder_F",
            "UMI_Land_Camera_F",
            "UMI_Land_Tablet_F"
        ]) then {
            private _itemName = getText (configFile >> "CfgMagazines" >> _item >> "displayName");
            if (_itemName == "") then {
                _itemName = getText (configFile >> "CfgWeapons" >> _item >> "displayName");
            };
            private _description = format ["%1 collected by %2 in %3", _itemName, name _unit, mapGridPosition _container];
            [
                true, // owner
                [netId _container, "task_intel"], // [taskID, parent taskID]
                [_description, _itemName, ""], // Task description in the format ["description", "title", "marker"] 
                getPos _container, // destination
                "SUCCEEDED", // state
                -1, // priority
                false, // showNotification
                "", // type
                false // visibleIn3D
            ] call BIS_fnc_taskCreate;
        };
    }];
};




