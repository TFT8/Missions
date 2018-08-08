/*
 * Author: BACONMOP
 * Creates and handles Sub Objectives
 *
 *
 */
reinforcementsSpawned = 0;
subObjComplete = 0;
_subObjMission = [
	"AmmoCache",
	"RadioTower"
	//"Reinforcements"
];
_subObj = _subObjMission call BIS_fnc_selectRandom;

switch(_subObj) do{

	case "AmmoCache":{
		_aoLoaction = getMarkerPos currentAO;
		_cacheBuildingArray1 = nearestObjects [_aoLoaction, ["house"], 750];
		_cacheBuildingArray2 = nearestObjects [_aoLoaction, ["building"], 750];
		_cacheBuildingArray = _cacheBuildingArray1 + _cacheBuildingArray2;
		_cacheBuildingArrayAmount = count _cacheBuildingArray;
		if (_cacheBuildingArrayAmount > 0) then {
			_cacheBuilding = _cacheBuildingArray call BIS_fnc_selectRandom;
			_cacheBuildingLocationFinal = _cacheBuilding buildingPos (1 + (random 4));
			if !(_cacheBuildingLocationFinal isEqualTo [0,0,0]) then {
				ammoCrate = "O_supplyCrate_F" createVehicle _aoLoaction;
				ammoCrate allowdamage false;
				ammoCrate setPos _cacheBuildingLocationFinal;
				ammoCrate allowdamage true;
			} else {
				_accepted = false;
				while {!_accepted} do {
					_cacheBuilding = _cacheBuildingArray call BIS_fnc_selectRandom;
					_cacheBuildingLocationFinal = _cacheBuilding buildingPos (1 + (random 4));
					if !(_cacheBuildingLocationFinal isEqualTo [0,0,0]) then {
						ammoCrate = "O_supplyCrate_F" createVehicle _aoLoaction;
						ammoCrate allowdamage false;
						ammoCrate setPos _cacheBuildingLocationFinal;
						ammoCrate allowdamage true;
						_accepted = true;
					};
				};
			};
			sleep 1;
			_dt = createTrigger ["EmptyDetector", _cacheBuildingLocationFinal];
			_dt setTriggerArea [225, 225, 0, false];
			_fuzzyMarkerPos = [[[_dt, 225],[]],[]] call BIS_fnc_randomPos;
			deleteVehicle _dt;
			{ _x setMarkerPos _fuzzyMarkerPos; } forEach ["radioMarker","radioCircle"];
			{_x setMarkerText "Sub-Objective: Cache"} forEach ["radioMarker"];
			if ((getMarkerPos "radioMarker") isEqualTo [0,0,0]) exitWith {execVM "Missions\Main\SubObj.sqf";};
			_defenders = [_cacheBuilding] call AW_fnc_buildingDefenders;
			_targetStartText = format
			[
				"<t align='center' size='2.2'>Sub-Objective</t><br/><t size='1.5' align='center' color='#FFCF11'>Supply Cache</t><br/>____________________<br/>We have received intel from local resistance fighters that OPFOR have hidden a weapons cache in the area. Take it out and expect it to be guarded.<br/><br/>"
			];
			[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];
            [west,["SubAoTask"],["We have received intel from local resistance fighters that OPFOR have hidden a weapons cache in the area. Take it out and expect it to be guarded.","Ammo Cache","radioCircle"],(getMarkerPos "radioCircle"),0,0,true,"destroy",true] call BIS_fnc_taskCreate;
			waitUntil {sleep 5;!alive ammoCrate || !missionActive;};
			sleep 10;
			_targetStartText = format
			[
				"<t align='center' size='2.2'>Sub-Objective</t><br/><t size='1.5' align='center' color='#FFCF11'>Cache Destroyed</t><br/>____________________<br/>Good job. The cache has been destroyed.",
				currentAO
			];
			[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];
			["CompletedSub", "AmmoCache"] remoteExec ["AW_fnc_globalNotification",0,false];
            ["SubAoTask", "Succeeded",true] call BIS_fnc_taskSetState;
            sleep 5;
            ["SubAoTask",west] call bis_fnc_deleteTask;
			{ [_x] spawn AW_fnc_SMdelete } forEach [_defenders];
			deleteVehicle ammoCrate;
		};
	};

	case "RadioTower":{
		_dt = createTrigger ["EmptyDetector", getMarkerPos currentAO];
		_dt setTriggerArea [800, 800, 0, false];
		_dt setTriggerActivation ["EAST", "PRESENT", false];
		_dt setTriggerStatements ["this","",""];
		_position = [[[getMarkerPos currentAO, PARAMS_AOSize],_dt],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty[3, 1, 0.3, 30, 0, false];

		while {(count _flatPos) < 1} do {
			_position = [[[getMarkerPos currentAO, PARAMS_AOSize],_dt],["water","out"]] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty[3, 1, 0.3, 30, 0, false];
		};

		_roughPos =
		[
			((_flatPos select 0) - 200) + (random 400),
			((_flatPos select 1) - 200) + (random 400),
			0
		];

		radioTower = "Land_TTowerBig_2_F" createVehicle _flatPos;
		waitUntil { sleep 0.5; alive radioTower || !missionActive;};
		radioTower setVectorUp [0,0,1];
		radioTowerAlive = true;
		deleteVehicle _dt;
		{ _x setMarkerPos _position; } forEach ["radioMarker","radioCircle"];
		{_x setMarkerText "Sub-Objective: Radio Tower"} forEach ["radioMarker"];
		_targetStartText = format
			[
				"<t align='center' size='2.2'>Sub-Objective</t><br/><t size='1.5' align='center' color='#FFCF11'>Radio Tower</t><br/>____________________<br/>OPFOR have setup a radio communications tower in the AO. Take it out quickly or else they will use it to call in air strikes.<br/><br/>"
			];
		[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];
        [west,["SubAoTask"],["OPFOR have setup a radio communications tower in the AO. Take it out quickly or else they will use it to call in air strikes.","Radio Tower","radioCircle"],(getMarkerPos "radioCircle"),0,0,true,"destroy",true] call BIS_fnc_taskCreate;
		[] spawn {
			sleep (30 + (random 180));
			if (alive radioTower) then {
				while {(alive radioTower)} do {
					if (jetCounter < 3) then {
					[] call AW_fnc_airfieldJet;
					sleep (720 + (random 480));
					};
				};
			};
		};
		waitUntil {sleep 3; !alive radioTower};
		_targetStartText = format
			[
				"<t align='center' size='2.2'>Sub-Objective</t><br/><t size='1.5' align='center' color='#FFCF11'>Complete</t><br/>____________________<br/>Good job with that radio tower. OPFOR should have a tougher time organizing their air efforts."
			];
		[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];
		["CompletedSub", "Radio Tower"] remoteExec ["AW_fnc_globalNotification",0,false];
        ["SubAoTask", "Succeeded",true] call BIS_fnc_taskSetState;
        sleep 5;
        ["SubAoTask",west] call bis_fnc_deleteTask;
		deleteVehicle radioTower;
	};


	case "Reinforcements":{
		reinfAO = [currentAO] call AW_fnc_getAo;
		_controlled = true;
		if (reinfAO in controlledZones) then {
			while {_controlled} do{
				reinfAO = [currentAO] call AW_fnc_getAo;
				if !(reinfAO in controlledZones) then {
					_controlled = false;
				};
			};
		};
		_mkrPos = getMarkerPos reinfAO;
		{_x setMarkerPos _mkrPos; } forEach ["radioMarker","radioCircle"];
		{_x setMarkerText "Sub-Objective: Enemy Reinforcements"} forEach ["radioMarker"];
		_targetStartText = format
		[
			"<t align='center' size='2.2'>Sub-Objective</t><br/><t size='1.5' align='center' color='#FFCF11'>Enemy Reinforcements</t><br/>____________________<br/>Heads up. We have just received intel that OPFOR are amassing to reinforce the current objective. We estimate that you have about 5 minutes before they begin to move.<br/><br/>"
		];
		[_targetStartText] remoteExec ["AW_fnc_globalHint",0,false];
		["NewSub", "Reinforcements"] remoteExec ["AW_fnc_globalNotification",0,false];
		_delay = 120 + random 300;
		sleep _delay;
		reinforcementsSpawned = 1;
	};
};
{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["radioMarker","radioCircle"];
subObjComplete = 1;
