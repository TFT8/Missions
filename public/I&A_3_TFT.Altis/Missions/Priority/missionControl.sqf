/*
Author: 

	Quiksilver

Last modified: 

	4/02/2016

Description:

	Priority Mission control

To do:

______________________________________________*/

private ["_mission","_missionList","_currentMission","_nextMission","_delay","_loopTimeout"];

_delay = 1500 + (random 600);
_loopTimeout = 10 + (random 10);

_missionList = [
	"Priorityarty",
	"Priorityarty",
	"Priorityarty",
	"priorityAA",
	"Priorityarty"
];

SM_SWITCH = true; publicVariable "SM_SWITCH";
	
while { true } do {

	if (SM_SWITCH) then {
	
		hqSideChat = "Priority mission assigned.";
		[hqSideChat] remoteExec ["AW_fnc_globalSideChat",0,false];
		
	
		sleep 3;
	
		_mission = _missionList call BIS_fnc_selectRandom;
		_currentMission = execVM format ["missions\Priority\%1.sqf", _mission];
	
		waitUntil {
			sleep 3;
			scriptDone _currentMission
		};
	
		sleep _delay;
		
		SM_SWITCH = true; publicVariable "SM_SWITCH";
	};
	sleep _loopTimeout;
};
