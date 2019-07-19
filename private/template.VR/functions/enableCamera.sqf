hint "Camera access enabled.";

/*
private _statement = {
	params ["_target", "_player", "_params"];
	["Exit"] call BIS_fnc_camera;
};
private _action = ["Camera","Camera","",_statement,{true}] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject
*/

player addAction ["Camera", {
	["Exit"] call BIS_fnc_camera;
}, nil, 0, false, false, "", "_target == _this", -1, true]