/*
Author: 

	stanhope, AW-community members
	bassed off of existing AW created side missions

Last modified:

	22/03/2017
	
Modified:
	
	

Description:

	Mission in which players have to find and heal a crashed helipilot before he dies. Bleedouttimer starts running when player get's within 3.5km of the obj.

*/

private ["_flatPos","_playerClose","_numPlayersnear","_accepted","_position","_objPos","_randomDir","_fuzzyPos","_i","_enemiesArray",
"_randomPos","_bleedouttimer","_x","_triggerrange"];

_bleedouttimer = 900; //time before the pilot dies
_triggerrange = 3500; //if players get within this radius the bleedouttimer starts running


//-------------------- FIND SAFE POSITION FOR heliwreck

	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5,0,0.2,sizeOf "Land_Wreck_Heli_Attack_01_F",0,false];

		while {(count _flatPos) < 2} do {
			_position = [] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [5,0,0.2,sizeOf "Land_Wreck_Heli_Attack_01_F",0,false];
		};

		if ((_flatPos distance (getMarkerPos "respawn_west")) > 1000 && (_flatPos distance (getMarkerPos currentAO)) > 500) then
		{
			_accepted = true;
		};
	};

	_objPos = [_flatPos, 25, 35, 10, 0, 0.5, 0] call BIS_fnc_findSafePos;


// Heli-wreck Creation -----------------------


	sideObj = "Land_Wreck_Heli_Attack_01_F" createVehicle _flatPos;
	waitUntil {alive sideObj};
	sideObj setDir 88.370;
	sideObj setPos [(getPos sideObj select 0), (getPos sideObj select 1), ((getPos sideObj select 2))];
	sideObj setVectorUp surfaceNormal position sideObj;
	
	
//Pilot Creation -----------------------


RescueMe setPos [(getPos sideObj select 0)+4, (getPos sideObj select 1)-4, ((getPos sideObj select 2))];
RescueMe setVectorUp surfaceNormal position RescueMe;

RescueMe setDir 88.370;
RescueMe setUnitPos "down";


// Spawn enemy forces--------------------------------------
	
	_enemiesArray = [sideObj] call AW_fnc_SMenemyEASTrescuepilot;
	
// Briefing ------------------------------------------------

_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{ _x setMarkerPos _fuzzyPos; } forEach ["sideMarker", "sideCircle"];
sideMarkerText = "search and rescue";
"sideMarker" setMarkerText "Side Mission: search and rescue";
[west,["rescueTask"],/*briefing needs rewriting*/
["We received a distress call from a friendly heli. We believe the enemy has shot it down, your job is to find and rescue the pilot who is believe to have survived the crash. Be careful when approaching the searcharea we expect heavy AA."
,"Side Mission: search and rescues","sideCircle"],
(getMarkerPos "sideCircle"),0,0,true,"heal",true] call BIS_fnc_taskCreate;

//mission core

sideMissionUp = true;
SM_SUCCESS = false;

_numPlayersnear = 0;
while { sideMissionUp } do {

	while 
	{
		_numPlayersnear < 1
	}do
	{	_playerClose = [];
		{	if ((_x distance _flatPos) < 3500) then {
				_playerClose pushBack _x;
			};
		} foreach allPlayers;
	
		_numPlayersnear = count _playerClose;
		sleep 5;
		if (!alive RescueMe) exitWith{};
	};
	
	if ((_bleedouttimer == 0)||(!alive RescueMe)) exitWith {

		//-------------------- DE-BRIEFING

        ["rescueTask", "Failed",true] call BIS_fnc_taskSetState;
		RescueMe setPos [21035.54,7448.917,0.144];
        sleep 5;
        ["rescueTask",west] call bis_fnc_deleteTask;
		{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];
		sideMissionUp = false;

		//-------------------- DELETE

		
		sleep 120;
		deleteVehicle nearestObject [getPos sideObj,"Land_Wreck_Heli_Attack_01_F"];
		{ [_x] spawn AW_fnc_SMdelete } forEach [_enemiesArray];
	};

	if (SM_SUCCESS) exitWith {
		
		RescueMe setPos [21035.54,7448.917,0.144];
		sleep 3;
		//-------------------- DE-BRIEFING

		[] call AW_fnc_SMhintSUCCESS;
        ["rescueTask", "SUCCEEDED",true] call BIS_fnc_taskSetState;
        sleep 5;
        ["rescueTask",west] call bis_fnc_deleteTask;
		{_x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];
		sideMissionUp = false;

		//--------------------- DELETE
		sleep 120;
		deleteVehicle nearestObject [getPos sideObj,"Land_Wreck_Heli_Attack_01_F"];
		{ [_x] spawn AW_fnc_SMdelete } forEach [_enemiesArray];
	};
	
	_bleedouttimer = _bleedouttimer -1;
	sleep 1;
};