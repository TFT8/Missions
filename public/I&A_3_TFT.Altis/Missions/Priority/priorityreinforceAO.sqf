/*
Author:

	Lost Bullet

Last modified: none

modified:

Description:

	Every X seconds that the "Factory" is not destroyed, current AO is reinforced with enemies

_________________________________________________________________ */

private ["_basepos","_loopVar","_dir","_PTdir","_pos","_barrier","_unitsArray","_flatPos","_accepted","_position","_enemiesArray","_targetList","_fuzzyPos","_x","_briefing","_enemiesArray","_unitsArray","_groupsArray","_flatPos1","_flatPos2","_flatPos3","_doTargets","_targetSelect","_targetListEnemy","_hangar","_randomDir","_objectiveUnit"];
private _spawnedUnits = [];
private _AISkillUnitsArray = [];
factoryDisabled = false;

/* --- 1. FIND POSITION FOR OBJECTIVE --- */

        _basepos = getMarkerPos "respawn_west";
        _flatPos = [0,0,0];
        _accepted = false;
		_posAO = getMarkerPos currentAO;
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
						hint "found position"; sleep 3;
                };
        };

/* --- 2. SPAWN OBJECTIVE --- */

        house = "Land_i_Shed_Ind_F" createVehicle _flatPos;
        waitUntil {!isNull house};

	// sink building: z - 1
        house setPos [(getPos house select 0), (getPos house select 1), ((getPos house select 2) - 1)];
	house setDir random 360;
	house allowDamage false; //no CAS bombing it until the Engineer inside is killed.

	//Place engineers team/objectives inside house
	_unitsArray = [objNull];             
        _groupsArray= [objNull];
	_priorityGroup = createGroup east;
		_objectiveUnit = "O_G_Soldier_unarmed_F" createUnit [_flatPos, _priorityGroup];
		_objectiveUnit disableAI "MOVE";
		private _HEpriority = _objectiveUnit addEventHandler ["killed",{
			hint "Factory disabled! Destroy the factory so it cannot be re-activated. Enable the explosives or call in CAS support";
			factoryDisabled = true;
			house allowDamage true;
			house addAction ["Set Explosives",
				/* set explosives to blow up house */
			""		
			];
		}];
	_groupsArray = _groupsArray + [_priorityGroup];

        {
                _spawnedUnits pushBack _x;
        } foreach (units _priorityGroup);

	//spawn protection group for the unarmed engineers

	_priorityGroup2 = createGroup east;

		"O_officer_F" createUnit [_flatpos, _priorityGroup2];
		"O_Soldier_AR_F" createUnit [_flatpos, _priorityGroup2];
	        "O_Soldier_AR_F" createUnit [_flatpos, _priorityGroup2];
        	"O_Soldier_F" createUnit [_flatpos, _priorityGroup2];
        	"O_Soldier_F" createUnit [_flatpos, _priorityGroup2];

	_unitsArray = _unitsArray + [_priorityGroup2];
	_priorityGroup2 setBehaviour "SAFE";
	_priorityGroup2 setCombatMode "GREEN";
	_priorityGroup2 allowFleeing 0;

	{
		_spawnedUnits pushBack _x;
	} foreach (units _priorityGroup2);

/* --- 3. SPAWN PATROLS --- */

//_infPos = getPos _flatPos;
for "_x" from 1 to 5 do {
    private _randomPos = [[[_flatPos, 300 * 1.2], []], ["water", "out"]] call BIS_fnc_randomPos;
    private _infantryGroup = createGroup EAST;
    for "_x" from 1 to 8 do {
                private _squadPos = [[[_randomPos, 10], []], ["water", "out"]] call BIS_fnc_randomPos;
        _unitArray = (missionconfigfile >> "unitList" >> MainFaction >> "units") call BIS_fnc_getCfgData;
        _unit = _unitArray call BIS_fnc_selectRandom;
        _grpMember = _infantryGroup createUnit [_unit, _squadPos, [], 0, "FORM"];
        sleep 1;
    };

    [_infantryGroup, _flatPos, 300 / 1.6] call AW_FNC_taskPatrol;

    {
        _spawnedUnits pushBack _x;
        _AISkillUnitsArray pushBack _x;
    } foreach (units _infantryGroup);
};
sleep 1;

/* --- 4. ADD UNITS TO ZEUS --- */

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

/* --- 5. GET RANDOM TYPE OF FACTORY MISSION --- */

private _typeFactory = ["inf", "veh", "paradrop", "heli","jetaa","helicas","jetcas"] call BIS_fnc_selectRandom;

/* --- 6. BRIEF --- */

_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{ _x setMarkerPos _fuzzyPos; } forEach ["priorityMarker", "priorityCircle"];
priorityTargetText = "Support Factory";
"priorityMarker" setMarkerText "Priority Target: Factory";

/* --------------------- BOTH FOLLOWING LINES NEED WORK ----------------------- */
private _typeFactoryText = "description of what time of enemies are spawned and frequency";
[west,["priorArtyTask"],[_typeFactory,"Priority Target: Artillery","priorityCircle"],(getMarkerPos "priorityCircle"),0,0,true,"NewPriorityTarget",true] call BIS_fnc_taskCreate;

/* --- 7. MISSION TRIGGERS --- */

priorityTrigger1 = createTrigger ["EmptyDetector", _flatPos];
priorityTrigger1 setTriggerArea [20,20,0,false];
priorityTrigger1 setTriggerStatements ["
	if({alive _x}

/* --- 8. FACTORY IS WORKING!! --- */

private _firstloop = 1;
private _radiusCheck = 800;
private ["_numPlayersinAO","_randomPlayer", "_totalspawnUnits","_addspawnUnits"];

while {factoryDisabled == false} do{
	// ---- if its the first run or current AO doesn't have friendly's, don't spawn anything ----
	_numPlayersinAO = 0;
	_playerClose = [];
	{	if ((_x distance _posAO) < 800) then {
			_numPlayersinAO = _numPlayersinAO + 1;
			_playerClose pushBack _x;
		};
	}foreach allPlayers;
	sleep 10;
	if ((_firstloop == 1) || (_numPlayersinAO < 1)) then{
		_firstloop = 0;
		//hint "don't spawn yet"; //just for test
		sleep 10;
	}
	else{
		_randomPlayer = _playerClose call BIS_fnc_selectRandom;
		//select position near random player in AO
		_typefactory = "inf"; //testing
		_private _reinforceGroup = createGroup EAST;
		_addspawnUnits = [];
		switch (_typefactory) do {
			case "inf": {
				hint "let's spawn some ground troops";
				_randomspawnPosition = [[[(position _randomPlayer), 200 * 1.2], []], ["water", "out"]] call BIS_fnc_randomPos;
				//ground troop multiplier --> account for number of players on AO
				if (_numPlayersinAO > 20) then{
					_totalspawnUnits = 20;
				}else{_totalspawnUnits = 5 + floor (_numPlayersinAO * 0.3)};
				for "_x" from 1 to _totalspawnUnits do {
					private _squadPos = [[[_randomspawnPosition, 10], []], ["water", "out"]] call BIS_fnc_randomPos;
					_unitArray = (missionconfigfile >> "unitList" >> MainFaction >> "units") call BIS_fnc_getCfgData;
					_unit = _unitArray call BIS_fnc_selectRandom;
					_grpMember = _reinforceGroup createUnit [_unit, _squadPos, [], 0, "FORM"];
					sleep 1;
    				};
				_reinforceGroup addWaypoint [(position _randomPlayer), 10];
				// real value: sleep 120;
				sleep 10; //test
			};
			case "veh": {
				sleep 240;
			};
			case "paradrop": {
				sleep 120;
			};
			case "heli": {
				sleep 400;
			};
			case "jetaa": {
				sleep 400;
			};
			case "helicas": {
				sleep 600;
			};
			case "jetcas": {
				sleep 600;
			};
		};
                {
                	_addspawnUnits pushBack _x;
                } foreach (units _reinforceGroup);
		if (isServer) then {
			{
			_x addCuratorEditableObjects [_addspawnUnits, true];
			} foreach allCurators;
		} else {
			[_addspawnUnits, true] remoteExec ["derp_fnc_remoteAddCuratorEditableObjects", 2];
			addspawnUnits = _addspawnUnits;
			publicVariableServer "addspawnUnits";
			addspawnUnits = nil;
		};
	};
};
