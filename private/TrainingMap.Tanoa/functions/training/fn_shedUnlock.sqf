/*
 * Author: Frankie
 * Unlock doors on a building if caller belongs to cadre.
 *
 * Arguments:
 * 0: Building to unlock <OBJECT>
 * 1: Person trying to unlock it <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [shed1, player] spawn TFT_fnc_shedUnlock;
 */
params ["_building", "_caller"];

if(_caller in [sds, ds, ds_1, ds_2, ds_3, ds_4]) then {
    _building setVariable ['bis_disabled_Door_1', 0, false];
    hint "Shed Unlocked";
} else {
    hint "Only cadre has permission to enter";
};
