// Original pilotcheck by Kamaradski [AW]. 
// Since then been tweaked by many hands!
// Notable contributors: chucky [allFPS], Quiksilver, Rewritten to be eventHandler by BACONMOP



if ( player getVariable "isZeus" ) exitWith {};

player addEventHandler ["getInMan",{
	_veh = _this select 2;
	_iampilot = typeOf player;
	_aircraft_nocopilot = [
	"B_Heli_Transport_03_unarmed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Light_01_armed_F",
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Transport_01_F",
	"B_Heli_Transport_01_camo_F",
	"I_Heli_Transport_02_F",
	"I_Heli_light_03_unarmed_F",
	"I_Heli_light_03_F",
	"B_Heli_Transport_03_F",
	"B_Heli_Transport_03_unarmed_F",
	"B_Heli_Transport_03_black_F",
	"B_Heli_Transport_03_unarmed_green_F",
	"B_T_VTOL_01_infantry_F",
	"B_T_VTOL_01_vehicle_F",
	"B_T_VTOL_01_armed_F",
	"B_CTRG_Heli_Transport_01_sand_F",
	"B_CTRG_Heli_Transport_01_tropic_F",
	"B_T_VTOL_01_infantry_blue_F",
	"B_T_VTOL_01_infantry_olive_F",
	"B_T_VTOL_01_vehicle_blue_F",
	"B_T_VTOL_01_vehicle_olive_F"
	];

	if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
		if(({typeOf _veh == _x} count _aircraft_nocopilot) > 0) then {
			_forbidden = [_veh turretUnit [0]];
			if(player in _forbidden) then {
				if !(player isKindOf "B_Helipilot_F") then {
					systemChat "Co-pilot is disabled on this vehicle";
					player action ["getOut",_veh];
				};
			};
		};
		if !(player isKindOf "B_Helipilot_F") then {
			_forbidden = [driver _veh];
			if (player in _forbidden) then {
				systemChat "You must be a pilot to fly this aircraft";
				player action ["getOut", _veh];
			};
		};
	};
}];	
player addEventHandler ["SeatSwitchedMan",{
	_veh = _this select 2;
	_iampilot = typeOf player;
	_aircraft_nocopilot = [
	"B_Heli_Transport_03_unarmed_F",
	"B_Heli_Light_01_F",
	"B_Heli_Light_01_armed_F",
	"O_Heli_Light_02_F",
	"O_Heli_Light_02_unarmed_F",
	"B_Heli_Transport_01_F",
	"B_Heli_Transport_01_camo_F",
	"I_Heli_Transport_02_F",
	"I_Heli_light_03_unarmed_F",
	"I_Heli_light_03_F",
	"B_Heli_Transport_03_F",
	"B_Heli_Transport_03_unarmed_F",
	"B_Heli_Transport_03_black_F",
	"B_Heli_Transport_03_unarmed_green_F",
	"B_T_VTOL_01_infantry_F",
	"B_T_VTOL_01_vehicle_F",
	"B_T_VTOL_01_armed_F",
	"B_CTRG_Heli_Transport_01_sand_F",
	"B_CTRG_Heli_Transport_01_tropic_F",
	"B_T_VTOL_01_infantry_blue_F",
	"B_T_VTOL_01_infantry_olive_F",
	"B_T_VTOL_01_vehicle_blue_F",
	"B_T_VTOL_01_vehicle_olive_F"
	];

	if((_veh isKindOf "Helicopter" || _veh isKindOf "Plane") && !(_veh isKindOf "ParachuteBase")) then {
		if(({typeOf _veh == _x} count _aircraft_nocopilot) > 0) then {
			_forbidden = [_veh turretUnit [0]];
			if(player in _forbidden) then {
				if !(player isKindOf "B_Helipilot_F") then {
					systemChat "Co-pilot is disabled on this vehicle";
					player action ["Eject",_veh];
				};
			};
		};		
		if !(player isKindOf "B_Helipilot_F") then {
			_forbidden = [driver _veh];
			if (player in _forbidden) then {
				systemChat "You must be a pilot to fly this aircraft";
				player action ["getOut", _veh];
			};
		};
	};
}];