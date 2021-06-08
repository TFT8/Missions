/*
 * Author: yourstruly
 * Add necessary actions and handling for BRM target.
 *
 * Arguments:
 * 0: Target object <OBJECT>
 * 1: Line name <STRING>
 * 2: Row name <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * [target1, "line2", "100m"] call TFT_fnc_initBrmTarget
 */
params ["_target", "_line", "_row"];

[_target, "BRM"] call TFT_fnc_registerTarget;
[_target, _line] call TFT_fnc_registerTarget;
[_target, _row]  call TFT_fnc_registerTarget;
_target setVariable ["TFT_BRM_line", "TFT_BRM_" + _line, true];

_target addEventHandler ["HandleDamage", {0}];
_target addEventHandler ["Hit", {
    params ["_target", "_source", "_damage", "_instigator"];
    if (isPlayer _instigator && {!(_target getVariable ["TFT_BRM_Hit", false])}) then {
        _target setVariable ["TFT_BRM_Hit", true, true];
        _target setDamage 0;
        private _line = _target getVariable ["TFT_BRM_line", ""];
        private _score = missionNamespace getVariable [_line, 0];
        missionNamespace setVariable [_line, _score + 1, true];
    };
}];
