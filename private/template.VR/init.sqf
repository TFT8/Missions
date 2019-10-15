call TFT_fnc_prepPhaseInit;


// add line of sight ACE Actions
_statement = {
	[] call tft_fnc_toggleDoor
};
_action = ["ToggleDoor","Toggle Door","",_statement,{true}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;

_statement = {
	[] call tft_fnc_toggleLight
};
_action = ["ToggleLight","Toggle Light","",_statement,{true}] call ace_interact_menu_fnc_createAction;
[["ACE_ZeusActions"], _action] call ace_interact_menu_fnc_addActionToZeus;
if isServer then {
	//_curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"]; 
	//_curator setVariable ["Addons", 3, true];
	tft_zeus addCuratorEditableObjects [allUnits + vehicles, true];
	if (!hasInterface) then {
		tft_zeus setVariable ["Owner", "#adminLogged", true];
		call compile preprocessFileLineNumbers "tft_init.sqf";
	} else {
		//Editor play in Multiplayer
		player assignCurator tft_zeus;
	};
	[tft_zeus, ["CuratorObjectPlaced", {_this call tft_fnc_zeusSpawnAir}]] remoteExec ["addEventHandler", 0, true];
		
	//player log
	if isDedicated then {
		tft_op_id = format ["%1%2", briefingName, "real_date" callExtension "GMT+"];
		tft_ops_log = profileNamespace getVariable ["tft_ops_log", []];
		tft_ops_log_index = tft_ops_log pushBack [tft_op_id, []];
		
		tft_op_player_list = [];
		addMissionEventHandler ["PlayerConnected",{
			params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
			tft_op_player_list pushBackUnique _name;
			tft_ops_log set [tft_ops_log_index, [tft_op_id, tft_op_player_list]];
			profileNamespace setVariable ["tft_ops_log", tft_ops_log];
			saveProfileNamespace
		}];
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