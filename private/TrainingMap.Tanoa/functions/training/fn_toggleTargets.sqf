/*
 * Author: yourstruly
 * Raise or lower all targets from given group.
 *
 * Arguments:
 * 0: Group name <STRING>
 * 1: Mode (0 - raise, 1 - lower) <NUMBER>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["group1", 1] call TFT_fnc_toggleTargets
 */
params ["_groupName", "_mode"];

private _group = missionNamespace getVariable [format["TFT_targets_%1", _groupName], []];

{
	_x animate["terc", _mode];
	_x allowDamage ([true, false] select _mode);
} forEach _group;
