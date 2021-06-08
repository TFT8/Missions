/*
	File: fn_spawnVehicle.sqf
	Author: Bryan "Tonic" Boardwine

	Description:
	Spawns the selected vehicle, if a vehicle is already on the spawn point
	then it deletes the vehicle from the spawn point.
*/
disableSerialization;
private["_position","_direction","_className","_displayName","_spCheck","_cfgInfo"];
if(lnbCurSelRow 38101 isEqualTo -1) exitWith {hint "You did not select a vehicle to spawn!"};

_className = lnbData[38101,[(lnbCurSelRow 38101),0]];
_displayName = lnbData[38101,[(lnbCurSelRow 38101),1]];
_position = getMarkerPos VVS_SP;
_direction = markerDir VVS_SP;

//Make sure the marker exists in a way.
if(isNil "_position") exitWith {hint "The spawn point marker doesn't exist?";};

//Check to make sure the spawn point doesn't have a vehicle on it, if it does then delete it.
_spCheck = nearestObjects[_position,["landVehicle","Air","Ship","ReammoBox_F"],12] select 0;
if(!isNil "_spCheck") then {deleteVehicle _spCheck;};

_cfgInfo = [_className] call VVS_fnc_cfgInfo;

_vehicle = _className createVehicle _position;
_vehicle allowDamage false;
_vehicle setPos _position; //Make sure it gets set onto the position.
_vehicle setDir _direction; //Set the vehicles direction the same as the marker.

if((_cfgInfo select 4) isEqualTo "Autonomous") then
{
	createVehicleCrew _vehicle;
};

if(VVS_Checkbox) then
{
	clearWeaponCargoGlobal _vehicle;
	clearMagazineCargoGlobal _vehicle;
	clearItemCargoGlobal _vehicle;
};

_vehicle allowDamage true;
[[_vehicle], { { _x addCuratorEditableObjects [_this, false]; } forEach allCurators; }] remoteExec ["bis_fnc_call", 2];

/*if (["medical",_className] call SEN_fnc_findInString) then { // hopefully addon creators name their content appropriately
	_vehicle setvariable ["ace_medicalVehicle", true, true];
	[0,"%1 is set as a ACE3 medical vehicle.",_vehicle] call SEN_fnc_log;
	hint format["You have spawned a %1. Assigning %1 as a medical vehicle.",_displayName];
} else {
	hint format["You have spawned a %1",_displayName];
};*/

hint format["You have spawned a %1",_displayName];
closeDialog 0;