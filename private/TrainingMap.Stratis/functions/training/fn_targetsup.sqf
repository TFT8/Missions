/*
 * Author: yourstruly
 * Check how many targets are up.
 *
 * Arguments:
 * 0: Group name <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["group1"] call TFT_fnc_targetsUp
 */
params ["_groupName"];

private _group = missionNamespace getVariable [format["TFT_targets_%1", _groupName], []];

count (_group select { (_x animationPhase "terc") == 0 })
