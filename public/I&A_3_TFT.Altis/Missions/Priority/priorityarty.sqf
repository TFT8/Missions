/*
Author:

	Quiksilver
	Rarek [AW]

Last modified:

	24/04/2014

Description:

	Not done with this, want to get the Commanders gun firing, and some other stuff.

__________________________________________________________________________*/

private ["_flatPos","_accepted","_position","_flatPos1","_flatPos2","_flatPos3","_PTdir","_unitsArray","_priorityGroup","_distance","_dir","_c","_pos","_barrier","_enemiesArray","_radius","_unit","_targetPos","_firingMessages","_fuzzyPos","_briefing","_completeText","_priorityMan1","_priorityMan2"];
private _spawnedUnits = [];
private _AISkillUnitsArray = [];
//-------------------- 1. FIND POSITION

	_flatPos = [0,0,0];
	_accepted = false;
	while {!_accepted} do {
		_position = [[[getMarkerPos currentAO,2500]],["water","out"]] call BIS_fnc_randomPos;
		_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];

		while {(count _flatPos) < 2} do {
			_position = [[[getMarkerPos currentAO,2500]],["water","out"]] call BIS_fnc_randomPos;
			_flatPos = _position isFlatEmpty [5, 0, 0.2, 5, 0, false];
		};

		if ((_flatPos distance (getMarkerPos "respawn_west")) > 2000 && (_flatPos distance (getMarkerPos currentAO)) > 800) then
		{
			_accepted = true;
		};
	};

	_flatPos1 = [(_flatPos select 0) - 2, (_flatPos select 1) - 2, (_flatPos select 2)];
	_flatPos2 = [(_flatPos select 0) + 2, (_flatPos select 1) + 2, (_flatPos select 2)];
	_flatPos3 = [(_flatPos select 0) + 20, (_flatPos select 1) + random 20, (_flatPos select 2)];

//-------------------- 2. SPAWN OBJECTIVES

	_PTdir = random 360;

	sleep 0.3;

	priorityObj1 = "O_MBT_02_arty_F" createVehicle _flatPos1;
	waitUntil {!isNull priorityObj1};
	priorityObj1 setDir _PTdir;

	sleep 0.3;

	priorityObj2 = "O_MBT_02_arty_F" createVehicle _flatPos2;
	waitUntil {!isNull priorityObj2};
	priorityObj2 setDir _PTdir;

	sleep 0.3;

	//----- SPAWN AMMO TRUCK (for ambiance and plausibiliy of unlimited ammo)

	ammoTruck = "O_Truck_03_ammo_F" createVehicle _flatPos3;
	waitUntil {!isNull ammoTruck};
	ammoTruck setDir random 360;

	{_x lock 3;_x allowCrewInImmobile true; } forEach [priorityObj1,priorityObj2,ammoTruck];

//-------------------- 3. SPAWN CREW - Same method as in priorityaa

	sleep 1;

        _unitsArray = [objNull];                        // for crew and h-barriers
        _groupsArray= [objNull];

        _priorityGroup = createGroup east;

                "O_officer_F" createUnit [_flatPos, _priorityGroup];
                "O_officer_F" createUnit [_flatPos, _priorityGroup];
                "O_engineer_F" createUnit [_flatPos, _priorityGroup];
                "O_engineer_F" createUnit [_flatPos, _priorityGroup];

                ((units _priorityGroup) select 0) assignAsCommander priorityObj1;
                ((units _priorityGroup) select 0) moveInCommander priorityObj1;
                ((units _priorityGroup) select 1) assignAsCommander priorityObj2;
                ((units _priorityGroup) select 1) moveInCommander priorityObj2;
                ((units _priorityGroup) select 2) assignAsGunner priorityObj1;
                ((units _priorityGroup) select 2) moveInGunner priorityObj1;
                ((units _priorityGroup) select 3) assignAsGunner priorityObj2;
                ((units _priorityGroup) select 3) moveInGunner priorityObj2;

        _groupsArray = _groupsArray + [_priorityGroup];

	[(units _priorityGroup)] call AW_fnc_setSkill4;
	_priorityGroup setBehaviour "COMBAT";
	_priorityGroup setCombatMode "RED";
	_priorityGroup allowFleeing 0;


//-------------------- 4. SPAWN H-BARRIER RING

	sleep 1;

	_distance = 16;
	_dir = 0;
	for "_c" from 0 to 7 do {
		_pos = [_flatPos, _distance, _dir] call BIS_fnc_relPos;
		_barrier = "Land_HBarrierBig_F" createVehicle _pos;
		waitUntil {alive _barrier};
		_barrier setDir _dir;
		_dir = _dir + 45;
		_barrier allowDamage false;
		_barrier enableSimulation false;

		_unitsArray = _unitsArray + [_barrier];
	};

//-------------------- 5. SPAWN FORCE PROTECTION

_infPos = getPos priorityObj1;
for "_x" from 1 to 5 do {
    private _randomPos = [[[_infPos, 300 * 1.2], []], ["water", "out"]] call BIS_fnc_randomPos;
    private _infantryGroup = createGroup EAST;
    for "_x" from 1 to 8 do {
		private _squadPos = [[[_randomPos, 10], []], ["water", "out"]] call BIS_fnc_randomPos;
        _unitArray = (missionconfigfile >> "unitList" >> MainFaction >> "units") call BIS_fnc_getCfgData;
        _unit = _unitArray call BIS_fnc_selectRandom;
        _grpMember = _infantryGroup createUnit [_unit, _squadPos, [], 0, "FORM"];
        sleep 1;
    };

    [_infantryGroup, _infPos, 300 / 1.6] call AW_FNC_taskPatrol;

    {
        _spawnedUnits pushBack _x;
		_AISkillUnitsArray pushBack _x;
    } foreach (units _infantryGroup);
};

	sleep 1;

//--------------------- Add units to zues
[_AISkillUnitsArray] call derp_fnc_AISkill;
if (isServer) then {
	{
	_x addCuratorEditableObjects [_spawnedUnits, true];
	} foreach allCurators;
} else {
	[_spawnedUnits, true] remoteExec ["derp_fnc_remoteAddCuratorEditableObjects", 2];
	spawnedUnits = _spawnedUnits;
	publicVariableServer "spawnedUnits";
	spawnedUnits = nil;
};


//-------------------- 7. BRIEF

_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{ _x setMarkerPos _fuzzyPos; } forEach ["priorityMarker", "priorityCircle"];

priorityTargetText = "Artillery";
"priorityMarker" setMarkerText "Priority Target: Artillery";

[west,["priorArtyTask"],["OPFOR forces are setting up an artillery battery to hit you guys damned hard! We've picked up their positions with thermal imaging scans and have marked it on your map. This is a priority target, boys! They're just setting up now; they'll be firing in about five minutes!","Priority Target: Artillery","priorityCircle"],(getMarkerPos "priorityCircle"),0,0,true,"NewPriorityTarget",true] call BIS_fnc_taskCreate;




//-------------------- FIRING SEQUENCE LOOP

_radius = 80;

while { canMove priorityObj1 || canMove priorityObj2 } do {

		_accepted = false;
		_unit = objNull;
		_targetPos = [0,0,0];

		while {!_accepted} do {
			if (isMultiplayer) then {
				_playerCount = count playableUnits;
			} else {
				_playerCount = count switchableUnits;
			};
		
			_playerCount = count playableUnits;
			if (_playerCount >= 1) then {
		
				if (isMultiplayer) then {
					_unit = playableUnits select (floor (random (count playableUnits)));
				} else {
					_unit = switchableUnits select (floor (random (count switchableUnits)));
				};

				if (!isNull _unit) then {
					_targetPos = getPos _unit;
					if ((_targetPos distance (getMarkerPos "respawn_west")) > 1000) then {
						if ((_targetPos distance (getMarkerPos "FOB_Martian")) > 1000) then {
							if ((_targetPos distance (getMarkerPos "FOB_Marathon")) > 1000) then {
								if ((_targetPos distance (getMarkerPos "FOB_Guardian")) > 1000) then {
									if ((_targetPos distance (getMarkerPos "Dirt_Track")) > 1000) then {
										if ((_targetPos distance (getMarkerPos "Dirt_Last_Stand")) > 1000) then {
											if ((_targetPos distance (getMarkerPos "USS_Freedom")) > 1000) then {
												if (vehicle _unit == _unit) then { 
													if (side _unit == WEST) then { 
														_accepted = true; 
													} else {
													sleep 7;																// default 10
													};
												};
											};
										sleep 3;
										};
									};
								};
							};
						};
					};
				};
			} else {
				_accepted = true;
			};
		};
		_dir = [_flatPos, _targetPos] call BIS_fnc_dirTo;
		{ _x setDir _dir; } forEach [priorityObj1, priorityObj2];

		sleep 5;																		// default 5

		{
			if (alive _x) then {
				[_x,_targetPos] call AW_fnc_artyStrike;
			};
		} forEach [priorityObj1,priorityObj2];

		if (_radius > 10) then { _radius = _radius - 10; };

		if (PARAMS_ArtilleryTargetTickTimeMax <= PARAMS_ArtilleryTargetTickTimeMin) then {
			sleep PARAMS_ArtilleryTargetTickTimeMin;
		} else {
			sleep (PARAMS_ArtilleryTargetTickTimeMin + (random (PARAMS_ArtilleryTargetTickTimeMax - PARAMS_ArtilleryTargetTickTimeMin)));
		};
};

//-------------------- DE-BRIEF

["priorArtyTask", "Succeeded",true] call BIS_fnc_taskSetState;
sleep 5;
["priorArtyTask",west] call bis_fnc_deleteTask;
{ _x setMarkerPos [-10000,-10000,-10000] } forEach ["priorityMarker","priorityCircle"];

//-------------------- DELETE

sleep 6;
{ deleteVehicle _x } forEach _unitsArray;
{ deleteVehicle _x } forEach [priorityObj1,priorityObj2,ammoTruck];
{ deleteVehicle _x } foreach _spawnedUnits;
