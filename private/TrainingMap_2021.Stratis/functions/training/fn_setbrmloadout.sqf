/*
 * Author: yourstruly
 * Replace unit's loadout with the one required for BRM.
 *
 * Arguments:
 * 0: Unit to replace loadout for <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [player] call TFT_fnc_setBrmLoadount
 */
params ["_unit"];

removeAllWeapons _unit;

private _magazine = "rhs_mag_30Rnd_556x45_M855_PMAG";
_unit addMagazine [_magazine, 20];
_unit addMagazine [_magazine, 10];
_unit addMagazine [_magazine, 10];
_unit addWeapon "rhs_weap_m4a1_carryhandle";
{
	_unit addPrimaryWeaponItem _x;
} forEach ["rhsusf_acc_SF3P556","SMA_ANPEQ15_BLK","rhsusf_acc_compm4","rhsusf_acc_grip1"];