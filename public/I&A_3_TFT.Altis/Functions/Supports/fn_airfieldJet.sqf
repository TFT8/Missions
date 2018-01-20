/*
  Author: BACONMOP
  Spawns CSAT JET to CAS strike
 	O_Plane_CAS_02_F
  LaserTargetE
 
  _laser = "LaserTargetE" createVehicle (getPos player);
  _laser attachTo [player,[0,0,0]];
 
 plane doTarget Player;
 
 Last modified:
	18/05/2017 by stanhope, AW-members
	
 Modified:
 Made it pick a random jet from the jetlist array.
 Added the jet to zeus after it spawning. 
 */
jetCounter = jetCounter + 1;
_accepted = false;
_casType = ["airfieldSpawn","gunStrike"];
_casCase = _casType call BIS_fnc_selectRandom;
_jetlist = ["O_Plane_CAS_02_F","O_Plane_CAS_02_F","O_Plane_Fighter_02_F","O_Plane_Fighter_02_Stealth_F","I_Plane_Fighter_04_F","I_Plane_Fighter_04_F"];
_jettype = _jetlist call BIS_fnc_selectRandom;

switch (_casCase) do {

	case "airfieldSpawn":{
		private ["_jet"];
		_airField = [
			"AAC_CAS_Spawn",
			"Airbase_CAS_Spawn",
			"SaltLake_CAS_Spawn",
			"Molos_CAS_Spawn"
		];
		if ("AAC_Airfield" in controlledZones) then {
			_airField = _airField - ["AAC_CAS_Spawn"];
		};
		if ("Central_Airfield" in controlledZones) then {
			_airField = _airField - ["Airbase_CAS_Spawn"];
		};
		if ("Almyra_Saltflats" in controlledZones) then {
			_airField = _airField - ["SaltLake_CAS_Spawn"];
		};
		if ("Molos_Airfield" in controlledZones) then {
			_airField = _airField - ["Molos_CAS_Spawn"];
		};
		_jetGrp = createGroup east;
		if ((count _airField) > 0) then {
			_jetSpawn = _airField call BIS_fnc_selectRandom;
			_jet = _jettype createVehicle (getMarkerPos _jetSpawn);
			_jet setDir markerDir _jetSpawn;
			_jet flyInHeight 1000;
			_jet lock 2;
			[_jet,_jetGrp] call BIS_fnc_spawnCrew;
			{_x addCuratorEditableObjects [[_jet], false];} foreach adminCurators;
		};
		if ((count _airField) <= 0) then {
			_spawnPos = [(random 30000),(random 30000),3000];
			_jet = _jettype createVehicle (getMarkerPos _spawnPos);
			waitUntil {!isNull _jet};
			[_jet,_jetGrp] call BIS_fnc_spawnCrew;
			_jet engineOn TRUE;
			_jet allowCrewInImmobile TRUE;
			_jet flyInHeight 1000;
			_jet lock 2;
			{_x addCuratorEditableObjects [[_jet], false];} foreach adminCurators;
		};
		_jetWp = _jetGrp addWaypoint [getMArkerPos currentAO,0];
		_jetWp setWaypointType "LOITER";
		_jetWp setWaypointLoiterRadius 2000;
		_jetWp setWaypointCompletionRadius 50;
		_accepted = false;
		while {!_accepted} do {
			_target = objNull;
			_targetPos = [0,0,0];
			_playerCount = count playableUnits;
			if (_playerCount > 0) then {
				if (isMultiplayer) then {
					_target = playableUnits select (floor (random (count playableUnits)));
				} else {
					_target = switchableUnits select (floor (random (count switchableUnits)));
			};
			};
			
			if ((!isNull _target) && (_target distance (getMarkerPos currentAO)) < 1500 && (_target isKindOf "Man")) then {
				_laser = "LaserTargetE" createVehicle (getPos _target);
				_laser attachTo [_target,[0,0,0]];
				_accepted = true;
			};
			sleep 3;
			if ((_playerCount == 0) || !alive _jet) then {
				_accepted = true;
			};
		};
		hint str _jet;
		waitUntil {sleep 5; !alive _jet};
	};

	case "gunStrike":{
		_accepted = false;
		while {!_accepted} do {
			_target = objNull;
			_targetPos = [0,0,0];
			_playerCount = count playableUnits;
			if (_playerCount > 0) then {
				if (isMultiplayer) then {
					_target = playableUnits select (floor (random (count playableUnits)));
				};
			};
			
			if ((!isNull _target)) then {
				if ((_target distance (getMarkerPos currentAO)) < 1500) then {
					if (_target isKindOf "Man") then {
						_targetPos = getPos _target;
						_dir = random 360;
						_strikeType = [0,1,2];
						_run = _strikeType call BIS_fnc_selectRandom;
						_randomPos = [[[_targetPos, 10],[]],[]] call BIS_fnc_randomPos;
						_redSmoke = "SmokeShellRed" createVehicle _randomPos;
						[_targetPos,_dir,_jettype,_run] call AW_fnc_createCas;
						_accepted = true;
					};
					sleep 3;
				};
			};
		};
	};
};
jetCounter = jetCounter - 1;