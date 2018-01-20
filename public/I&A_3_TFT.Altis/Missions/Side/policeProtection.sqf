/*
Author: BACONMOP
side mission defend police
*/

// Find Location --------------------------
_town = call AW_fnc_getTowns;
_townLoc = locationPosition _town;
_accepted = false;
while {!_accepted} do{
	_town = call AW_fnc_getTowns;
	_townLoc = locationPosition _town;
	if ((_townLoc distance (getMarkerPos "respawn_west")) > 3000 && (_townLoc distance (getMarkerPos currentAO)) > 3000) then {
		_accepted = true;
	};
};
_flatPos = [_townLoc, 1, 250, 2, 0, 20, 0] call BIS_fnc_findSafePos;


// Police Creation -----------------------

_squadSize = floor(random 9);
_grp1 = createGroup West;
_GRPDead = createGroup West;
if (_squadSize < 2) then {_squadSize = _squadSize +2;};
for "_i" from 0 to _squadSize do {
	_unitArray = (missionconfigfile >> "unitList" >> "Gendarmerie" >> "units") call BIS_fnc_getCfgData;
	_unit = _unitArray call BIS_fnc_selectRandom;
	_policeUnit = _grp1 createUnit [_unit, _flatPos, [], 0, "FORM"];
	sleep 1;
};
[_grp1, _flatPos, 100] call bis_fnc_taskPatrol;

// Briefing ----------------------------

_fuzzyPos = [((_flatPos select 0) - 300) + (random 600),((_flatPos select 1) - 300) + (random 600),0];
{ _x setMarkerPos _fuzzyPos; } forEach ["sideMarker", "sideCircle"];
sideMarkerText = "Police Protect";
"sideMarker" setMarkerText "Side Mission: Protect U.N. Police Force";
[west,["policeTask"],["Undercover agents have provided Intel that rebel forces are planning to attack a U.N. Police Force. We have the approximate location the the police force. Get over there and protect the police.","Side Mission: Protect U.N. Police Force","sideCircle"],(getMarkerPos "sideCircle"),0,0,true,"defend",true] call BIS_fnc_taskCreate;
sideMarkerText = "Police Protect";

// Give players time to get there -------

sleep 180;

// Enemy Creation -----------------------

_grp2 = createGroup Resistance;
_grp3 = createGroup Resistance;
_grp4 = createGroup Resistance;
opForAttackos = [_flatPos, 750, 1250, 2, 0, 20, 0] call BIS_fnc_findSafePos;
opForGrp2Pos = [opForAttackos, 5, 50, 2, 0, 20, 0] call BIS_fnc_findSafePos;
opForGrp3Pos = [opForAttackos, 5, 50, 2, 0, 20, 0] call BIS_fnc_findSafePos;
opForGrp4Pos = [opForAttackos, 5, 50, 2, 0, 20, 0] call BIS_fnc_findSafePos;
for "_i" from 0 to 7 do {
	_unitArray = (missionconfigfile >> "unitList" >> secondaryMainFaction >> "units") call BIS_fnc_getCfgData;
	_unit = _unitArray call BIS_fnc_selectRandom;
	_opForUnit = _grp2 createUnit [_unit, opForGrp2Pos, [], 0, "FORM"];
	sleep 1;
};
for "_i" from 0 to 7 do {
	_unitArray = (missionconfigfile >> "unitList" >> secondaryMainFaction >> "units") call BIS_fnc_getCfgData;
	_unit = _unitArray call BIS_fnc_selectRandom;
	_opForUnit = _grp3 createUnit [_unit, opForGrp3Pos, [], 0, "FORM"];
	sleep 1;
};
for "_i" from 0 to 7 do {
	_unitArray = (missionconfigfile >> "unitList" >> secondaryMainFaction >> "units") call BIS_fnc_getCfgData;
	_unit = _unitArray call BIS_fnc_selectRandom;
	_opForUnit = _grp4 createUnit [_unit, opForGrp4Pos, [], 0, "FORM"];
	sleep 1;
};
_attackPos = _flatPos;
[_grp2,_attackPos] call BIS_fnc_taskAttack;
[_grp3,_attackPos] call BIS_fnc_taskAttack;
[_grp4,_attackPos] call BIS_fnc_taskAttack;

// Wait for one side to be dead -----------

waitUntil{sleep 5; ((!missionActive) || ({alive _x} count (units _grp1)) < 1 || (({alive _x} count (units _grp2)) < 1 && ({alive _x} count (units _grp3)) < 1 && ({alive _x} count (units _grp4)) < 1 ));};

// Debrief --------------------------------

if (({alive _x} count (units _grp1)) < 1) then {
	hqSideChat = "The police force has been wiped out! Mission FAILED!";
	[hqSideChat] remoteExec ["AW_fnc_globalSideChat",0,false];
	{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];
    ["policeTask", "Failed",true] call BIS_fnc_taskSetState;
    sleep 5;
    ["policeTask",west] call bis_fnc_deleteTask;
};
if (({alive _x} count (units _grp2)) < 1 || !missionActive) then {
	[] call AW_fnc_SMhintSUCCESS;
	{ _x setMarkerPos [-10000,-10000,-10000]; } forEach ["sideMarker", "sideCircle"];
    ["policeTask", "SUCCEEDED",true] call BIS_fnc_taskSetState;
    sleep 5;
    ["policeTask",west] call bis_fnc_deleteTask;
};

// Deletion --------------------------------

sleep 120;
{
	if (!(isNull _x) && {alive _x}) then {
	deleteVehicle _x;
	};
} foreach units _grp1;
{
	if (!(isNull _x) && {alive _x}) then {
	deleteVehicle _x;
	};
} foreach units _grp2;
{
	if (!(isNull _x) && {alive _x}) then {
	deleteVehicle _x;
	};
} foreach units _grp3;
{
	if (!(isNull _x) && {alive _x}) then {
	deleteVehicle _x;
	};
} foreach units _grp4;
