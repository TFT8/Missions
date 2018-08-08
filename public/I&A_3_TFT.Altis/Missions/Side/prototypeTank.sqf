/*
Author: BACONMOP
Destroy a prototype Tank
*/

// Get Location for Sidemission -----------------
_flatPos = [0,0,0];
_accepted = false;
while {!_accepted} do {
    _position = [] call BIS_fnc_randomPos;
    _flatPos = _position isFlatEmpty [10,1,0.2,sizeOf "Land_Dome_Small_F",0,false];

    while {(count _flatPos) < 3} do {
        _position = [] call BIS_fnc_randomPos;
        _flatPos = _position isFlatEmpty [10,1,0.2,sizeOf "Land_Dome_Small_F",0,false];
    };

    if ((_flatPos distance (getMarkerPos "respawn_west")) > 3000 && (_flatPos distance (getMarkerPos currentAO)) > 3000) then {
        _accepted = true;
    };
};

// Create Objective Tank ------------------------
_objPos = _flatPos;
_grp1 = createGroup east;
_protoTank = createVehicle ["O_MBT_02_cannon_F", _objPos,[],0,"NONE"];
[_protoTank,_grp1] call BIS_fnc_spawnCrew;
_protoTank removeWeapon ("cannon_125mm");
_protoTank removeWeapon ("LMG_coax");
_protoTank removeMagazine "24Rnd_125mm_APFSDS_T_Green";
_protoTank removeMagazine "12Rnd_125mm_HE_T_Green";
_protoTank removeMagazine "12Rnd_125mm_HEAT_T_Green";
_protoTank addWeapon ("rockets_230mm_GAT");
_protoTank addMagazine "12Rnd_230mm_rockets";
_protoTank addMagazine "12Rnd_230mm_rockets";
_protoTank addMagazine "12Rnd_230mm_rockets";
_protoTank addWeapon ("Gatling_30mm_Plane_CAS_01_F");
_protoTank addMagazine "1000Rnd_Gatling_30mm_Plane_CAS_01_F";
_protoTank addMagazine "1000Rnd_Gatling_30mm_Plane_CAS_01_F";
_protoTank addWeapon ("Missile_AGM_02_Plane_CAS_01_F");
_protoTank addMagazine "6Rnd_Missile_AGM_02_F";
_protoTank addWeapon ("Rocket_04_HE_Plane_CAS_01_F");
_protoTank addMagazine "7Rnd_Rocket_04_HE_F";
_protoTank addMagazine "7Rnd_Rocket_04_HE_F";
_protoTank addMagazine "7Rnd_Rocket_04_HE_F";
{_x lock 3;_x allowCrewInImmobile true;} forEach [_protoTank];
_protoTank setVariable ["selections", []];
_protoTank setVariable ["gethit", []];
_protoTank addEventHandler
	[
		"HandleDamage",
		{
			_unit = _this select 0;
			_selections = _unit getVariable ["selections", []];
			_gethit = _unit getVariable ["gethit", []];
			_selection = _this select 1;
			if !(_selection in _selections) then
			{
				_selections set [count _selections, _selection];
				_gethit set [count _gethit, 0];
			};
			_i = _selections find _selection;
			_olddamage = _gethit select _i;
			_damage = _olddamage + ((_this select 2) - _olddamage) * 0.25;
			_gethit set [_i, _damage];
			_damage;
		}
	];
[_grp1, _objPos, 200] call bis_fnc_taskPatrol;
// Spawn SM Forces --------------------------------
_smUnits = [_objPos,300,2,3,2,4,2,2] call AW_fnc_sideMissionEnemy;

// Breifing and Markers ---------------------------
_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{ _x setMarkerPos _fuzzyPos; } forEach ["sideMarker", "sideCircle"];
sideMarkerText = "Prototype Tank";
"sideMarker" setMarkerText "Side Mission: Prototype Tank";
[west,["tankTask"],["We have gotten reports that OpFor have sent a prototype tank to their allies for a field test. Get over there and destroy that thing. Be careful, our operatives have said that has much more armor than standard and carries a wide array of powerful weapons.","Side Mission: Prototype Tank","sideCircle"],(getMarkerPos "sideCircle"),0,0,true,"protoTank",true] call BIS_fnc_taskCreate;
sideMarkerText = "Prototype Tank";

// WaitUntil Tank is dead -------------------------

waitUntil {sleep 5; !alive _protoTank;};

// Debrief ----------------------------------------
[] call AW_fnc_SMhintSUCCESS;
{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];
["tankTask", "SUCCEEDED",true] call BIS_fnc_taskSetState;
sleep 5;
["tankTask",west] call bis_fnc_deleteTask;
sleep 180;
{
	if (!(isNull _x) && {alive _x}) then {
	deleteVehicle _x;
	};
} foreach units _grp1;
{
    if (!(isNull _x) && {alive _x}) then {
        deleteVehicle _x;
    };
} foreach _smUnits;
