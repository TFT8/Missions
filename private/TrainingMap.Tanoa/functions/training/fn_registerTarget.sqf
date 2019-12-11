/*
 * Author: yourstruly
 * Store target object in named group for future use.
 *
 * Arguments:
 * 0: Target to store <OBJECT>
 * 1: Group name <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * [target1, "group1"] call TFT_fnc_registerTarget
 */
params ["_target", "_groupName"];

_group = missionNamespace getVariable [format["TFT_targets_%1", _groupName], []];
_group pushBackUnique _target;
_target addEventHandler ["HandleDamage", {0}];

missionNamespace setVariable [format["TFT_targets_%1", _groupName], _group];
