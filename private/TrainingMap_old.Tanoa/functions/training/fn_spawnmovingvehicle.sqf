/*
 * Author: Ampersand
 * Spawn a vehicle target that moves at a specific speed
 *
 * Arguments:
 * 0: Object to teleport <OBJECT>
 * 1: Teleport destination <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [] call TFT_fnc_spawnMovingVehicle
 */

[] call TFT_fnc_deleteMovingVehicle;

//private _posStart = markerPos "marker_start"; 
private _posStart = [2218.04,10881.5,0];
private _posEnd = markerPos "marker_end"; 

AT_veh = createVehicle ["O_G_Offroad_01_armed_F", [0,0,0], [], 0, "NONE"]; 
AT_veh setDir ([_posStart, _posEnd] call BIS_fnc_dirTo); 
AT_veh setVariable ['ace_cookoff_enable', false, true]; 

AT_grp = createVehicleCrew AT_veh;
AT_grp setVariable ["acex_headless_blacklist", true, true];
AT_grp setVariable ["Vcm_Disable", true, true];
AT_grp setBehaviour "CARELESS"; 
AT_grp setCombatMode "BLUE";
AT_veh setPos _posStart;
if (isNil "AT_spd") then {AT_spd = 50;};
AT_veh limitSpeed AT_spd;
//AT_veh forceSpeed (AT_spd / 3.6);
private _waypoint = AT_grp addWaypoint [_posEnd, 1];
_waypoint setWaypointStatements ["true", "[] call TFT_fnc_deleteMovingVehicle"];
AT_veh setVelocityModelSpace [0,0,1];