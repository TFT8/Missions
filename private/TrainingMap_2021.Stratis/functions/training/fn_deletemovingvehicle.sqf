/*
 * Author: Ampersand
 * Delete AT Range vehicle targets
 *
 * Arguments:
 * 0: Object to teleport <OBJECT>
 * 1: Teleport destination <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [] call TFT_fnc_deleteMovingVehicle
 */

if (isNil "AT_veh") then {AT_veh = objNull;};
if (isNil "AT_grp") then {AT_grp = grpNull;};
if !(AT_veh isEqualTo objNull) then {{AT_veh deleteVehicleCrew _x } forEach crew AT_veh; deleteVehicle AT_veh;};
if !(AT_grp isEqualTo grpNull) then {{deleteVehicle _x } forEach units AT_grp;};