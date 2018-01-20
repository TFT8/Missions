/*
 * Author: BACONMOP
 * For new Spawned bases
 *
 * 
 */

_base = _this select 0;


// Respawn Position -------------------------------

_baseRespawnMarker = (missionconfigfile >> "Main_Aos" >> "AOs" >> _base >> "respawnPos") call BIS_fnc_getCfgData;
_respawnMarkerPos = getMarkerPos _baseRespawnMarker;
_respawnMarker = [west, _respawnMarkerPos] call BIS_fnc_addRespawnPosition;
_basevisMarker = (missionconfigfile >> "Main_Aos" >> "AOs" >> _base >> "visMrkr") call BIS_fnc_getCfgData;
{_x setMarkerPos (getMarkerPos _baseRespawnMarker);} forEach [_basevisMarker];
sleep 1;

_arsenal = "B_CargoNet_01_ammo_F" createVehicle (getMarkerPos _baseRespawnMarker);
clearItemCargoGlobal _arsenal;
clearWeaponCargoGlobal _arsenal;
clearBackpackCargoGlobal _arsenal;
_arsenalBox = [];
_arsenalBox pushBack _arsenal;
[_arsenalBox, ("ArsenalFilter" call BIS_fnc_getParamValue)] call derp_fnc_VA_filter;
sleep 1;
[_arsenalBox, ("ArsenalFilter" call BIS_fnc_getParamValue)] remoteExec ["derp_fnc_VA_filter",-2,true];
[_arsenal, ["<t color='#009ACD'>Teleport To Main Base</t>","cutText ['','BLACK OUT'];sleep 2;[player,'BASE'] remoteExec ['AW_fnc_baseTeleport',2];sleep 1; cutText ['','BLACK IN'];","",0,false,true,"","('BASE' in controlledZones)"]] remoteExec ["addAction", -2, true];
[_arsenal, ["<t color='#009ACD'>Teleport To FOB Martian</t>","cutText ['','BLACK OUT'];sleep 2;[player,'AAC_Airfield'] remoteExec ['AW_fnc_baseTeleport',2];sleep 1; cutText ['','BLACK IN'];","",0,false,true,"","('AAC_Airfield' in controlledZones)"]] remoteExec ["addAction", -2, true];
[_arsenal, ["<t color='#009ACD'>Teleport To FOB Marathon</t>","cutText ['','BLACK OUT'];sleep 2;[player,'Stadium'] remoteExec ['AW_fnc_baseTeleport',2];sleep 1; cutText ['','BLACK IN'];","",0,false,true,"","('Stadium' in controlledZones)"]] remoteExec ["addAction", -2, true];
[_arsenal, ["<t color='#009ACD'>Teleport To FOB Dirt Track</t>","cutText ['','BLACK OUT'];sleep 2;[player,'Selakano_Town'] remoteExec ['AW_fnc_baseTeleport',2];sleep 1; cutText ['','BLACK IN'];","",0,false,true,"","('Selakano_Town' in controlledZones)"]] remoteExec ["addAction", -2, true];
[_arsenal, ["<t color='#009ACD'>Teleport To FOB Last Stand</t>","cutText ['','BLACK OUT'];sleep 2;[player,'Molos_Airfield'] remoteExec ['AW_fnc_baseTeleport',2];sleep 1; cutText ['','BLACK IN'];","",0,false,true,"","('Molos_Airfield' in controlledZones)"]] remoteExec ["addAction", -2, true];
[_arsenal, ["<t color='#009ACD'>Teleport To FOB Guardian</t>","cutText ['','BLACK OUT'];sleep 2;[player,'Terminal'] remoteExec ['AW_fnc_baseTeleport',2];sleep 1; cutText ['','BLACK IN'];","",0,false,true,"","('Terminal' in controlledZones)"]] remoteExec ["addAction", -2, true];

// Markers ----------------------------------------

_targetStartText = format
	[
		"<t align='center' size='2.2'>Base Taken</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>Good Job. We have now setup a base at that location.<br/><br/>We have provided you with some vehicles at that the new FOB.", _basevisMarker
	];
[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];


// Vehicles ---------------------------------------

_baseVehicles = (missionconfigfile >> "Main_Aos" >> "AOs" >> _base >> "vehicles") call BIS_fnc_getCfgData;
{
	_veh = _x select 0;
	_mkr = _x select 1;
	_vehicle = _veh createVehicle getMarkerPos _mkr;
	_vehicle setDir (MarkerDir _mkr);
	_timer = _x select 2;
	0 = [_vehicle,_timer,FALSE,AW_fnc_vSetup02,_base] spawn AW_fnc_vBaseMonitor;
}forEach _baseVehicles;


/*
Removed until Defend AOs is finished.
// Base Lost --------------------------------------

waitUntil {sleep 5;!(_base in controlledZones)};

_targetStartText = format
	[
		"<t align='center' size='2.2'>Base Lost</t><br/><t size='1.5' align='center' color='#FFCF11'>%1</t><br/>____________________<br/>The enemy have taken the base.<br/><br/>We cannot use that location anymore until we take it back."
	];
[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];

deleteVehicle _arsenal;
_respawnMarker call BIS_fnc_removeRespawnPosition;
*/