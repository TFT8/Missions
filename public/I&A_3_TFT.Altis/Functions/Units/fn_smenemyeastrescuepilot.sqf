/*
Author: 

	Quiksilver, modified by stanhope
	
Last modified:

	22/03/2017
	
Modified:
	
	modified to fit the rescue pilot side mission.

Description:

	Spawn OPFOR enemy around side objectives.
	
___________________________________________*/

//---------- CONFIG

#define INF_TEAMS "OIA_InfTeam_AA","OIA_InfSquad","OI_reconPatrol","OI_reconTeam","OI_ViperTeam"
#define VEH_TYPES "O_APC_Tracked_02_cannon_F","O_APC_Wheeled_02_rcws_F","O_MRAP_02_hmg_F","O_MRAP_02_gmg_F"
#define AA_TYPES "O_APC_Tracked_02_AA_F"
private ["_x","_pos","_flatPos","_randomPos","_enemiesArray","_infteamPatrol","_SMvehPatrol","_SMveh","_SMaaPatrol","_SMaa","_smSniperTeam"];
_enemiesArray = [grpNull];
_x = 0;

//---------- GROUPS
	
_infteamPatrol = createGroup east;
_smSniperTeam = createGroup east;
_SMvehPatrol = createGroup east;
_SMaaPatrol = createGroup east;

//---------- INFANTRY RANDOM
	
for "_x" from 0 to (3 + (random 2)) do {
	_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
	_infteamPatrol = [_randomPos, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> [INF_TEAMS] call BIS_fnc_selectRandom)] call BIS_fnc_spawnGroup;
	[_infteamPatrol, getPos sideObj, 100] call BIS_fnc_taskPatrol;
				
	_enemiesArray = _enemiesArray + [_infteamPatrol];

	{
		_x addCuratorEditableObjects [units _infteamPatrol, false];
	} foreach adminCurators;

};

//---------- SNIPER

for "_x" from 0 to 1 do {
	_randomPos = [getPos sideObj, 500, 100, 20] call BIS_fnc_findOverwatch;
	_smSniperTeam = [_randomPos, EAST, (configfile >> "CfgGroups" >> "East" >> "OPF_F" >> "Infantry" >> "OI_SniperTeam")] call BIS_fnc_spawnGroup;
	_smSniperTeam setBehaviour "COMBAT";
	_smSniperTeam setCombatMode "RED";
		
	_enemiesArray = _enemiesArray + [_smSniperTeam];

	{
		_x addCuratorEditableObjects [units _smSniperTeam, false];
	} foreach adminCurators;

};
	
//---------- VEHICLE RANDOM
	
_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh1 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh1};
[_SMveh1, _SMvehPatrol] call BIS_fnc_spawnCrew;
[_SMvehPatrol, getPos sideObj, 75] call BIS_fnc_taskPatrol;
_SMveh1 lock 3;
if (random 1 >= 0.5) then {
	_SMveh1 allowCrewInImmobile true;
};
sleep 0.1;
{
	_x addCuratorEditableObjects [[_SMveh1], false];
} foreach adminCurators;
	
_enemiesArray = _enemiesArray + [_SMveh1];




//---------- VEHICLE RANDOM	
	
_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMveh2 = [VEH_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMveh2};
[_SMveh2, _SMvehPatrol] call BIS_fnc_spawnCrew;
[_SMvehPatrol, getPos sideObj, 150] call BIS_fnc_taskPatrol;
_SMveh2 lock 3;
if (random 1 >= 0.5) then {
	_SMveh2 allowCrewInImmobile true;
};
sleep 0.1;
{
	_x addCuratorEditableObjects [[_SMveh2], false];
	_x addCuratorEditableObjects [units _SMvehPatrol, false];
} foreach adminCurators;
	
_enemiesArray = _enemiesArray + [_SMveh2];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMvehPatrol];



//---------- VEHICLE AA

for "_x" from 0 to (1 + (random 2)) do {
_randomPos = [[[getPos sideObj, 300],[]],["water","out"]] call BIS_fnc_randomPos;
_SMaa = [AA_TYPES] call BIS_fnc_selectRandom createVehicle _randomPos;
waitUntil {sleep 0.5; !isNull _SMaa};
[_SMaa, _SMaaPatrol] call BIS_fnc_spawnCrew;
_SMaa lock 3;
if (random 1 >= 0.5) then {
	_SMaa allowCrewInImmobile true;
};
[_SMaaPatrol, getPos sideObj, 150] call BIS_fnc_taskPatrol;
	
_enemiesArray = _enemiesArray + [_SMaaPatrol];
sleep 0.1;
_enemiesArray = _enemiesArray + [_SMaa];

{
	_x addCuratorEditableObjects [[_SMaa], false];
	_x addCuratorEditableObjects [units _SMaaPatrol, false];
} foreach adminCurators;
};

//---------- COMMON

[(units _infteamPatrol)] call AW_fnc_setSkill2;
[(units _smSniperTeam)] call AW_fnc_setSkill3;
[(units _SMaaPatrol)] call AW_fnc_setSkill4;
[(units _SMvehPatrol)] call AW_fnc_setSkill2;
	
_enemiesArray