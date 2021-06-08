/*
 * Author: Ampersand
 * Give player pilot training actions.
 * 
 * Arguments:
 * 0: player <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [] call TFT_fnc_addSOACActions
 */


/* ace_interact_menu_fnc_createAction
 * Argument:
 * 0: Action name <STRING>
 * 1: Name of the action shown in the menu <STRING>
 * 2: Icon <STRING>
 * 3: Statement <CODE>
 * 4: Condition <CODE>
 * 5: Insert children code <CODE> (Optional)
 * 6: Action parameters <ANY> (Optional)
 * 7: Position (Position array, Position code or Selection Name) <ARRAY>, <CODE> or <STRING> (Optional)
 * 8: Distance <NUMBER> (Optional)
 * 9: Other parameters [showDisabled,enableInside,canCollapse,runOnHover,doNotCheckLOS] <ARRAY> (Optional)
 * 10: Modifier function <CODE> (Optional)
 */

hint "SOAC Training ACE Self Actions enabled when in a helicopter!";

_condition = {
    (vehicle _player isKindOf "Helicopter")
};
_statement = {
	params ["_target", "_player", "_params"];
};
_insertChildren = {
    params ["_target", "_player", "_params"];
    //diag_log format ["_insertChildren [%1, %2, %3]", _target, _player, _params];

    // Add children to this action
    private _actions = [];
    private _childStatement = {
		[_this select 2, {_this setHitPointDamage ["HitHRotor", 1];}] remoteExec ["spawn", vehicle _player];
	};
    private _action = ["Autorotation", "Autorotation", "", _childStatement, {true}, {}, vehicle _player] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _player]; // New action, it's children, and the action's target
    
    _childStatement = {
		[_this select 2, {sleep random 30; _this setHitPointDamage ["HitHRotor", 1];}] remoteExec ["spawn", vehicle _player];
	};
    _action = ["AutorotationDelay", "Autorotation (Delay)", "", _childStatement, {true}, {}, vehicle _player] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _player]; // New action, it's children, and the action's target

    _childStatement = {
		[_this select 2, {_this setHitPointDamage ["HitVRotor", 1];}] remoteExec ["spawn", vehicle _player];
	};
    _action = ["TailRotorLoss", "Tail Rotor Loss", "", _childStatement, {true}, {}, vehicle _player] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _player]; // New action, it's children, and the action's target
    
    _childStatement = {
		[_this select 2, {sleep random 30; _this setHitPointDamage ["HitVRotor", 1];}] remoteExec ["spawn", vehicle _player];
	};
    _action = ["TailRotorLossDelay", "Tail Rotor Loss (Delay)", "", _childStatement, {true}, {}, vehicle _player] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _player]; // New action, it's children, and the action's target

    _childStatement = {
		[_this select 2, {_this setDamage 0; _this setFuel 1; _this setVehicleAmmo 1;}] remoteExec ["spawn", vehicle _player];
	};
    _action = ["Restore", "Restore", "", _childStatement, {true}, {}, vehicle _player] call ace_interact_menu_fnc_createAction;
    _actions pushBack [_action, [], _player]; // New action, it's children, and the action's target
    
    _actions
};

_action = ["SOACTraining","SOAC","",_statement,_condition,_insertChildren] call ace_interact_menu_fnc_createAction;
[player, 1, ["ACE_SelfActions"], _action] call ace_interact_menu_fnc_addActionToObject;


