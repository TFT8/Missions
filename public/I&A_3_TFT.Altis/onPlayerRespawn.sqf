/*
@filename: onPlayerRespawn.sqf
Author:

	BACONMOP

Last modified:

    Stanhope, AW community member
    
modified:

    added an addaction to clear vehicle inventory

Description:

	Client scripts that should execute after respawn.
______________________________________________________*/

private ["_iampilot"];

player disableConversation true;
[player ,"NoVoice"] remoteExec ["setSpeaker",0,true];

//=========================== Fatigue setting

if (PARAMS_Fatigue == 1) then {player enableFatigue FALSE;};

//=========================== Respawn Gear


if !(player getVariable ["derp_revive_downed", false]) then {
    if (!isNil {player getVariable "derp_savedGear"}) then {
        player setUnitLoadout [(player getVariable "derp_savedGear"), true];
    } else {
        if (!isNil {player getVariable "derp_revive_loadout"}) then {
            player setUnitLoadout [(player getVariable "derp_revive_loadout"), true];
        };
    };
};

//=========================== PILOTS ONLY

_pilots = ["B_pilot_F","B_helipilot_F"];
_iampilot = ({typeOf player == _x} count _pilots) > 0;
if (_iampilot) then {
	//===== UH-80 TURRETS
	if (PARAMS_UH80TurretControl != 0) then {
		inturretloop = false;
		UH80TurretAction = player addAction ["Turret Control",AW_fnc_uh80TurretControl,[],-95,false,false,'','[] call AW_fnc_conditionUH80TurretControl'];
	};
};

//======================Refueling with Repair spec and Engineer

FUELFUNC = {

ADDFUEL = player addAction ["<t color='#99ffc6'>Refuel Aircraft</t>",{
RF_BIRD = cursorTarget; publicVariable "RF_BIRD";
Current_fuel = fuel RF_BIRD; if (Current_fuel <= 0.1) then { Fuel_to_ADD = Current_fuel + 0.2; publicVariable "Fuel_to_ADD";
Send_Com = {RF_BIRD setFuel Fuel_to_ADD}; publicVariable "Send_Com";
remoteExecCall ["Send_Com",2]; cutText['Aircraft refuelled', 'PLAIN']; } else { cutText['Fuel not required', 'PLAIN'];  };

  },[],1,false,true,""," ((vehicle player) == player) && (CursorTarget isKindOf ""Air"" ) && ((player distance cursorTarget) < 10) "];
};

if (player isKindOf "B_soldier_repair_F") then {player call FUELFUNC;  } else {};
if (player isKindOf "B_engineer_F") then {player call FUELFUNC; } else {};



//======================= Add players to Zeus

{_x addCuratorEditableObjects [[player],FALSE];} count allCurators;


//======================clear vehicle inventory

player addAction ["<t color='#99ffc6'>Clear vehicle inventory</t>",{[] call AW_fnc_clearVehicleInventory},
[],1,false,true,"","(player == driver vehicle player) && !((vehicle player) == player)"];

//======================= Assign zeus

player setVariable ["isZeus", false, true];
[] spawn {
    sleep 9;
    [player] remoteExecCall ["initiateZeusByUID", 2];
	sleep 5;
	execVM "scripts\pilotcheck.sqf";
};


