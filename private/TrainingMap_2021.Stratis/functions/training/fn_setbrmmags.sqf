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

private _weapon = primaryWeapon _unit;
private _magazine = currentMagazine _unit;

{
	_unit removeItem _x;
} count magazines _unit;

_unit addMagazine [_magazine, 20];
_unit addWeapon _weapon;
{
	_unit addPrimaryWeaponItem _x;
} forEach ["rhsusf_acc_compm4"];
_unit addMagazine [_magazine, 10];
_unit addMagazine [_magazine, 10];