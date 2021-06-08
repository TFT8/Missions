/*
 * Author: yourstruly
 * Show how many targets are still up.
 *
 * Arguments:
 * 0: Unique name of the targets group <STRING>
 * 2: Screens for displaying time (must always be 2) <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["targets1", [S1, S2]] call TFT_fnc_countDrivTargets
 */
params ["_targetCodename", "_displays"];

private _targets = [_targetCodename] call TFT_fnc_targetsUp;

(_displays select 0) setObjectTextureGlobal [0, format['images\numbers\%1.paa', _targets % 10]];
(_displays select 1) setObjectTextureGlobal [0, format['images\numbers\%1.paa', floor (_targets / 10)]];
