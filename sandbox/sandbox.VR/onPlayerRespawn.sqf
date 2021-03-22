player setPos (box getPos [random 20, random 360]);
player setDir (player getDir box);

[player] call ace_weaponselect_fnc_putWeaponAway;
[player, currentWeapon player, currentMuzzle player] call ace_safemode_fnc_lockSafety;
