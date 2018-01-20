/*
Author:

	Quiksilver

Last modified:

	1/05/2014

Description:

	Mission control

To do:

	Rescue/capture/HVT missions
______________________________________________*/

private ["_mission","_missionList","_currentMission","_nextMission","_delay","_loopTimeout"];

_delay = 300 + (random 600);
_loopTimeout = 10 + (random 10);

_missionList = [
	"HQcoast",
	"HQresearch",
	"policeProtection",
    "prototypeTank",
	"secureChopper",
	"secureIntelUnit",
	"secureIntelVehicle",
	"secureRadar",
	/*"underWater",*/
	"PilotRescue"
];

SM_SWITCH = true; publicVariable "SM_SWITCH";

//enable pushing a manual type of sidemission to queue
if (isNil "manualSide") then {
    manualSide = "";
    publicVariable manualSide;
};
while {missionActive} do {

	if (SM_SWITCH) then {

		hqSideChat = "Side objective assigned, stand-by for orders.";
		[hqSideChat] remoteExec ["AW_fnc_globalSideChat",0,false];


		sleep 3;

		_mission = _missionList call BIS_fnc_selectRandom;
		//check if there's a manualSide in queue and assign that if valid
		if (manualSide!="") then {
		    _findManual = _missionList find manualSide;
		    if (_findManual > -1) then {
		        _mission = manualSide;
		    };
		};
		_currentMission = execVM format ["missions\side\%1.sqf", _mission];
        //reset manualSide
        manualSide = "";
		waitUntil {
			sleep 3;
			scriptDone _currentMission
		};

		sleep _delay;

		SM_SWITCH = true; publicVariable "SM_SWITCH";
	};
	sleep _loopTimeout;
};
