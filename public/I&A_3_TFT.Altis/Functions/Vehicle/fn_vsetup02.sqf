/*
@filename: fn_vSetup02.sqf
Author:

	???
	
Last modified:

	18/05/2017 by stanhope
	
modified:
	
	added the new UAV to it's array
	
Description:

	Apply code to vehicle
	vSetup02 deals with code that is already applied where it should be.
_______________________________________________*/

//============================================= CONFIG

private ["_u","_t"];

_u = _this select 0;
_t = typeOf _u;

if (isNull _u) exitWith {};

//============================================= ARRAYS

_ghosthawk = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"]; 			// ghosthawk
_strider = ["I_MRAP_03_F","I_MRAP_03_hmg_F","I_MRAP_03_gmg_F"];					// strider
_blackVehicles = [];															// black skin
_wasp = ["B_Heli_Light_01_F","B_Heli_Light_01_armed_F"];						// MH-9
_orca = ["O_Heli_Light_02_unarmed_F"];											// Orca
_mobileArmory = ["B_Truck_01_ammo_F"];											// Mobile Armory
_noAmmoCargo = ["B_APC_Tracked_01_CRV_F","B_Truck_01_ammo_F"];					// Bobcat CRV
_slingHeli = ["I_Heli_Transport_02_F","B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"];											// sling capable
_slingable = ["B_Heli_Light_01_F"];												// slingable
_notSlingable = ["B_Heli_Light_01_armed_F", "B_Heli_Attack_01_F"];				// not slingable
_dropHeli = ["B_Heli_Transport_01_camo_F","B_Heli_Transport_01_F"]; 			// drop capable
_uav = ["B_UAV_02_CAS_F","B_UAV_02_F","B_UGV_01_F","B_UGV_01_rcws_F","B_UAV_05_F"];			// UAVs
_allHelis = ["B_Heli_Light_01_armed_F","B_Heli_Attack_01_F","B_Heli_Transport_03_F","B_Heli_Transport_03_unarmed_F","B_Heli_Light_01_F","B_Heli_Transport_01_F","B_Heli_Transport_01_camo_F","B_CTRG_Heli_Transport_01_sand_F","B_CTRG_Heli_Transport_01_tropic_F","O_Heli_Transport_04_F","O_Heli_Transport_04_ammo_F","O_Heli_Transport_04_bench_F","O_Heli_Transport_04_box_F","O_Heli_Transport_04_fuel_F","O_Heli_Transport_04_medevac_F","O_Heli_Transport_04_repair_F","O_Heli_Transport_04_covered_F","O_Heli_Attack_02_F","O_Heli_Attack_02_black_F","O_Heli_Light_02_F","O_Heli_Light_02_v2_F","O_Heli_Light_02_unarmed_F","I_Heli_Transport_02_F","I_Heli_light_03_F","I_Heli_light_03_unarmed_F","I_C_Heli_Light_01_civil_F"];
_hunterHMG = ["B_MRAP_01_hmg_F"];												// Armed Vehicles added to safezone


//============================================= SORT

//===== Turret Lock

if (_t in _ghosthawk) then {
	_u setVariable ["turretL_locked",FALSE,TRUE];
	_u setVariable ["turretR_locked",FALSE,TRUE];
};


//===== black camo

if (_t in _blackVehicles) then {
	for "_i" from 0 to 9 do {_u setObjectTextureGlobal [_i,"#(argb,8,8,3)color(0,0,0,0.6)"];};
};

//===== Heli KillMessage

if (_t in _allHelis) then {
	_u addEventHandler ["killed",{[] spawn {sleep 3;_artyMessageArray = ['mp_groundsupport_65_chopperdown_BHQ_0','mp_groundsupport_65_chopperdown_BHQ_1','mp_groundsupport_65_chopperdown_BHQ_2'];_artyMessage = selectRandom _artyMessageArray;[[west, 'Base'],_artyMessage] remoteExec ['sideRadio',0,false];};}];
};

//===== strider nato skin

if (_t in _strider) then {
	_u setObjectTextureGlobal [0,'\A3\soft_f_beta\mrap_03\data\mrap_03_ext_co.paa'];
	_u setObjectTextureGlobal [1,'\A3\data_f\vehicles\turret_co.paa']; 
};

//===== aaf skin

if(_t in _wasp) then {
	_u setObjectTextureGlobal [0,'A3\Air_F\Heli_Light_01\Data\skins\heli_light_01_ext_digital_co.paa'];
};

//===== aaf skin

if(_t in _orca) then {
	_u setObjectTextureGlobal [0,'A3\Air_F\Heli_Light_02\Data\heli_light_02_ext_indp_co.paa'];
};

//==== UAVs

if(_t in _uav) then {
	{deleteVehicle _x;} count (crew _u);
	[_u] spawn {
		_u = _this select 0;
		sleep 2;
		createVehicleCrew _u;
	};
};

//=== Zues
{_x addCuratorEditableObjects [[_u],FALSE];} count allCurators;

//===== ArmedVeh EH adder

if (_t in  _hunterHMG) then {
 _u addEventHandler ["Fired", {
    params ["_unit", "_weapon", "", "", "", "", "_projectile"];
    if (player distance (getMarkerPos "respawn_west") < 300)then {
         deleteVehicle _projectile;
    }}];
};