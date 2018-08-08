/*
Author:

	BACONMOP

Description:

	Things that may run on both server.
	Deprecated initialization file.
______________________________________________________*/

enableSaving false;
artySorcher allowDamage False;
artyMLRS allowDamage False;

//------------------- client executions

_null = [] execvm "scripts\vehicle\crew\crew.sqf"; 								// vehicle HUD
_null = [] execVM "scripts\misc\QS_icons.sqf";									// Icons
_null = [] execVM "scripts\misc\diary.sqf";									// Icons
_null = [] execVM "scripts\pilotCheck.sqf"; 									// pilots only
_null = [] execVM "scripts\misc\earplugs.sqf";									//Earplugs from the start

//------------------- Restrictions and arsenal

#include "defines\arsenalDefines.hpp"
if ("ArsenalFilter" call BIS_fnc_getParamValue == 1) then {
        player addEventHandler ["Take", {
            params ["_unit", "_container", "_item"];

            [_unit, 1, _item, _container] call derp_fnc_gearLimitations;
        }];

        player addEventHandler ["InventoryClosed", {
            params ["_unit"];

            [_unit, 0] call derp_fnc_gearLimitations;
        }];
    };
[{[_this select 0, ("ArsenalFilter" call BIS_fnc_getParamValue)] call derp_fnc_VA_filter}, [ArsenalBoxes], 3] call derp_fnc_waitAndExecute; // Init arsenal boxes.
    {
    _x addAction [
        "<t color='#006bb3'>Save gear</t>",
        {
            player setVariable ["derp_savedGear", (getUnitLoadout player)];
            systemChat "gear saved";
        }
    ];
    } foreach ArsenalBoxes;
//------------------- Disable Arty Computer for all but FSG
enableEngineArtillery false;
if (player isKindOf "B_support_Mort_f") then {
	enableEngineArtillery true;
};

//------------------ Player SafeZone

player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "respawn_west") < 300) then {
		deleteVehicle _projectile;
		hintC "Don't goof at base. Hold your horses soldier, don't throw, fire or place anything inside the base.";
	}}];
player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "FOB_Martian") < 300) then {
		deleteVehicle _projectile;
		hintC "Don't goof at base. Hold your horses soldier, don't throw, fire or place anything inside the base.";
	}}];
player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "FOB_Marathon") < 300) then {
		deleteVehicle _projectile;
		hintC "Don't goof at base. Hold your horses soldier, don't throw, fire or place anything inside the base.";
	}}];
player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "FOB_Last_Stand") < 300) then {
		deleteVehicle _projectile;
		hintC "Don't goof at base. Hold your horses soldier, don't throw, fire or place anything inside the base.";
	}}];
player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "FOB_Guardian") < 300) then {
		deleteVehicle _projectile;
		hintC "Don't goof at base. Hold your horses soldier, don't throw, fire or place anything inside the base.";
	}}];
	player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "USS_Freedom") < 500) then {
		deleteVehicle _projectile;
		hintC "Don't goof at base. Hold your horses soldier, don't throw, fire or place anything inside the base.";
	}}];
/*player addEventHandler ["Fired", {
	params ["_unit", "_weapon", "", "", "", "", "_projectile"];
	if (_unit distance2D (getMarkerPos "safeZoneHill") < 300) then {
		deleteVehicle _projectile;
		hintC "Don't goof at base. Hold your horses soldier, don't throw, fire or place anything inside the base.";
	}}];*/
	
//------------------ BIS groups
["InitializePlayer", [player]] call BIS_fnc_dynamicGroups;

//------------------ Respawn

// Derp_revive setup
if ("derp_revive" in (getMissionConfigValue "respawnTemplates")) then {
    if (getMissionConfigValue "derp_revive_everyoneCanRevive" == 0) then {
        if (player getUnitTrait "medic") then {
            call derp_revive_fnc_drawDowned;
        };
    } else {
        call derp_revive_fnc_drawDowned;
    };
    call derp_revive_fnc_handleDamage;
    call derp_revive_fnc_diaryEntries;
    if (getMissionConfigValue "respawnOnStart" == -1) then {[player] call derp_revive_fnc_reviveActions};
};

//------------------- PLAYER protection

player addRating 10000000;


//--------------------- Squad Url Hint
_infoArray = squadParams player;
_infoSquad = _infoArray select 0;
_squad = _infoSquad select 1;
_infoName = _infoArray select 1;
_name = _infoName select 1;
_email = _infoSquad select 2;


// replace line below with your Squad xml's email
//if (_email == "staff@ahoyworld.net") then {

//_GlobalHint = format["<t align='center' size='2.2' color='#FF0000'>%1<br/></t><t size='1.4' color='#33CCFF'>%2</t><br/>has joined the server, To get involved in the Ahoy World community, register an account at www.AhoyWorld.net and get stuck in!</t><br/>",_squad,_name];

//[_GlobalHint] remoteExec ["AW_fnc_globalHint",0,false];
//} else {};
