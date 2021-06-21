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

if(_caller in [sds, ds, ds_1, ds_2, ds_3, ds_4, pl, ps, sl1, sl2, tl1, tl2, tl3, tl4, tl5, tl6, cc, apl_1, apl_2, asl_1, asl_2, asl_3, asl_4, asl_5, asl_6, asl_7, asl_8]) then {
    _building setVariable ['bis_disabled_Door_1', 0, false];
    hint "Shed Unlocked";
	} else {
		hint "Authorized Personnel Only";
};