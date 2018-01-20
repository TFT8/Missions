/*
Description:  Script that spawns in a reward after side mission succes and also displays 

Autor: Unknown

Last edited: 6/06/2017 by Stanhope, AW member

Edit:
Added more rewards, messed with the spawnrate of everything


Called by the side mission scripts
*/

private ["_veh","_vehName","_vehVarname","_completeText","_reward","_GAU","_GMG","_mortar","_HELLCAT",
"_ATLauncher","_truck","_AA","_AAA","_ATLauncher","_AALauncher"];

smRewards =
[
/*
A random reward will be picked from this array, first entery is the display name, second the actual reward.  
Some rewards are edited after they are spawned.

The spawn rate can be messed with by putting rewards in here multiple times.
*/

//Jets
["an A-164 Wipeout (CAS)", "B_Plane_CAS_01_F"],
["a V-44 X Blackfish Gunship", "B_T_VTOL_01_armed_F"],
["an F/A-181 Black Wasp II", "B_Plane_Fighter_01_F"],
["an F/A-181 Black Wasp II (Stealth)", "B_Plane_Fighter_01_Stealth_F"],
["an A-149 Gryphon", "I_Plane_Fighter_04_F"],

//attack helis
["an MI-48 Kajman", "O_Heli_Attack_02_black_F"],
["an MI-48 Kajman", "O_Heli_Attack_02_black_F"],
["an AH-99 Blackfoot", "B_Heli_Attack_01_F"],
["an AH-99 Blackfoot", "B_Heli_Attack_01_F"],
["a PO-30 Orca", "O_Heli_Light_02_F"],
["a PO-30 Orca", "O_Heli_Light_02_F"],
["an AH-9 Pawnee", "B_Heli_Light_01_armed_F"],
["an AH-9 Pawnee", "B_Heli_Light_01_armed_F"],
["an AH-9 Pawnee GAU - 19", "Rabbit_F"],
["an AH-9 Pawnee GAU - 19", "Rabbit_F"],
["an AH-9 Pawnee GMG - 20MM", "Land_GarbageBags_F"],
["an AH-9 Pawnee GMG - 20MM", "Land_GarbageBags_F"],
["a WY-55 Hellcat", "I_Heli_light_03_F"],
["a WY-55 Hellcat", "I_Heli_light_03_F"],
["a LAT WY-55 Hellcat", "Land_NetFence_01_m_pole_F"],
["a LAT WY-55 Hellcat", "Land_NetFence_01_m_pole_F"],


//transport helis
["an MI-290 Taru (Transport)", "O_Heli_Transport_04_covered_F"],
["an MI-290 Taru (Transport)", "O_Heli_Transport_04_covered_F"],
["an MI-290 Taru (Bench)", "O_Heli_Transport_04_bench_F"],
["an MI-290 Taru (Bench)", "O_Heli_Transport_04_bench_F"],
["an Y-32 Xi'an (Infantry Transport, unarmed)", "O_T_VTOL_02_infantry_F"],
["an Y-32 Xi'an (Infantry Transport, unarmed)", "O_T_VTOL_02_infantry_F"],

//UAVs/UGVs
["a MQ-12 Falcon", "B_T_UAV_03_F"],
["a UCAV Sentinel", "B_UAV_05_F"],
["a UCAV Sentinel", "B_UAV_05_F"],
["a hemtt mounted Praetorian 1C", "Land_VR_CoverObject_01_kneelHigh_F"],
["a hemtt mounted Praetorian 1C", "Land_VR_CoverObject_01_kneelHigh_F"],
["a hemtt mounted Mk49 Spartan", "Land_VR_CoverObject_01_standHigh_F"],
["a hemtt mounted Mk49 Spartan", "Land_VR_CoverObject_01_standHigh_F"],

//MBTs
["a T-100 Varsuk", "O_MBT_02_cannon_F"],
["a T-100 Varsuk", "O_MBT_02_cannon_F"],
["a T-100 Varsuk", "O_MBT_02_cannon_F"],
["an MBT-52 Kuma", "I_MBT_03_cannon_F"],
["an MBT-52 Kuma", "I_MBT_03_cannon_F"],
["an MBT-52 Kuma", "I_MBT_03_cannon_F"],
["an M2A4 Slammer (Urban Purpose)", "B_MBT_01_TUSK_F"],
["an M2A4 Slammer (Urban Purpose)", "B_MBT_01_TUSK_F"],

//IFVs
["an FV-720 Mora", "I_APC_tracked_03_cannon_F"],
["an FV-720 Mora", "I_APC_tracked_03_cannon_F"],
["an FV-720 Mora", "I_APC_tracked_03_cannon_F"],
["an FV-720 Mora", "I_APC_tracked_03_cannon_F"],
["an AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F"],
["an AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F"],
["an AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F"],
["an AFV-4 Gorgon", "I_APC_Wheeled_03_cannon_F"],
["an AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F"],
["an AMV-7 Marshall", "B_APC_Wheeled_01_cannon_F"],

//AA
["an IFV-6a Cheetah", "B_APC_Tracked_01_AA_F"],
["an IFV-6a Cheetah", "B_APC_Tracked_01_AA_F"],
["an IFV-6a Cheetah", "B_APC_Tracked_01_AA_F"],
["an IFV-6a Cheetah", "B_APC_Tracked_01_AA_F"],

//APC
["a CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F"],
["a CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F"],
["a CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F"],
["a CRV-6e Bobcat", "B_APC_Tracked_01_CRV_F"],

//MRAP
["a Strider HMG", "I_MRAP_03_hmg_F"],
["a Strider HMG", "I_MRAP_03_hmg_F"],
["a Strider HMG", "I_MRAP_03_hmg_F"],
["a Strider HMG", "I_MRAP_03_hmg_F"],
["a Strider HMG", "I_MRAP_03_hmg_F"],
["a Strider HMG", "I_MRAP_03_hmg_F"],
["a Strider HMG", "I_MRAP_03_hmg_F"],
["a Strider GMG", "I_MRAP_03_gmg_F"],
["a Strider GMG", "I_MRAP_03_gmg_F"],

//Cars
["an Offroad (AT)", "Sign_Arrow_Blue_F"],
["an Offroad (AT)", "Sign_Arrow_Blue_F"],
["an Offroad (AT)", "Sign_Arrow_Blue_F"],
["an Offroad (AT)", "Sign_Arrow_Blue_F"],
["an Offroad (AA)", "Sign_Arrow_Cyan_F"],
["an Offroad (AA)", "Sign_Arrow_Cyan_F"],
["an Offroad (AA)", "Sign_Arrow_Cyan_F"],
["an Offroad (AA)", "Sign_Arrow_Cyan_F"],
["an Offroad (Armed .50 cal)", "B_G_Offroad_01_armed_F"],
["an Offroad (Armed .50 cal)", "B_G_Offroad_01_armed_F"],
["an Offroad (Armed .50 cal)", "B_G_Offroad_01_armed_F"],
["an Offroad (Armed .50 cal)", "B_G_Offroad_01_armed_F"],
["an Offroad (Armed GMG)", "Land_InfoStand_V1_F"],
["an Offroad (Armed GMG)", "Land_InfoStand_V1_F"],
["an Offroad (Armed GMG)", "Land_InfoStand_V1_F"],
["an Offroad (Armed GMG)", "Land_InfoStand_V1_F"],
["a Qilin (Armed)", "O_T_LSV_02_armed_F"],
["a Qilin (Armed)", "O_T_LSV_02_armed_F"],
["a Qilin (Armed)", "O_T_LSV_02_armed_F"],
["a Qilin (Armed)", "O_T_LSV_02_armed_F"],
["an Offroad (Repair)", "C_Offroad_01_repair_F"],
["an Offroad (Repair)", "C_Offroad_01_repair_F"],
["an Offroad (Repair)", "C_Offroad_01_repair_F"],
["an Offroad (Repair)", "C_Offroad_01_repair_F"],
["a Mobile Mortar Truck", "B_G_Offroad_01_repair_F"],
["a Mobile Mortar Truck", "B_G_Offroad_01_repair_F"]

];

smMarkerList =["smReward1","smReward2","smReward3","smReward4","smReward5","smReward6","smReward7","smReward8","smReward9","smReward10","smReward11","smReward12","smReward13","smReward14","smReward15","smReward16","smReward17","smReward18","smReward19","smReward20","smReward21","smReward22","smReward23","smReward24","smReward25","smReward26","smReward27"];

_veh = smRewards call BIS_fnc_selectRandom;
_vehName = _veh select 0;
_vehVarname = _veh select 1;
_completeText = format["<t align='center'><t size='2.2'>Side Mission</t><br/><t size='1.5' color='#08b000'>COMPLETE</t><br/>____________________<br/>Fantastic job, lads! The OPFOR stationed on the island won't last long if you keep that up!<br/><br/>We've given you %1 to help with the fight. You'll find it at base.<br/><br/>Focus on the main objective for now; we'll relay this success to the intel team and see if there's anything else you can do for us. We'll get back to you in 10-15 minutes.</t>",_vehName];


_reward = createVehicle [_vehVarname, getMarkerPos "smReward1",smMarkerList,0,"NONE"];
waitUntil {!isNull _reward};
//Disable damage to prevent rewards getting damaged from falling when spawning
_reward allowDamage false;

_reward setDir 284;

[_completeText] remoteExec ["AW_fnc_globalHint",0,false];
_rewardtext = format["Your team received %1!", _vehName];
["Reward",_rewardtext] remoteExec ["AW_fnc_globalNotification",0,false];


//=============reward altering===================

//---------jets--------
if (_reward isKindOf "B_Plane_CAS_01_F") then {
	//an A-164 Wipeout (CAS)
	_reward removeMagazine "120Rnd_CMFlare_Chaff_Magazine";
	_reward addMagazine "60Rnd_CMFlare_Chaff_Magazine";
};
if (_reward isKindOf "B_Plane_Fighter_01_F") then {
	//an F/A-181 Black Wasp II
	_reward removeMagazine "240Rnd_CMFlare_Chaff_Magazine";
	_reward addMagazine "120Rnd_CMFlare_Chaff_Magazine";
};
if (_reward isKindOf "B_Plane_Fighter_01_Stealth_F") then {
	//an F/A-181 Black Wasp II (stealth)
	_reward removeMagazine "240Rnd_CMFlare_Chaff_Magazine";
	_reward addMagazine "120Rnd_CMFlare_Chaff_Magazine";
};
if (_reward isKindOf "I_Plane_Fighter_04_F") then {
	//an A-149 Gryphon
	_reward removeMagazine "240Rnd_CMFlare_Chaff_Magazine";
	_reward addMagazine "120Rnd_CMFlare_Chaff_Magazine";
};


//---------heli--------
if (_reward isKindOf "B_Heli_Light_01_armed_F") then {
	//an AH-9 Pawnee
	_reward setObjectTextureGlobal[0, 'A3\Air_F\Heli_Light_01\Data\skins\heli_light_01_ext_digital_co.paa'];
};
if (_reward isKindOf "Rabbit_F") then {
	//an AH-9 Pawnee GAU - 19
	deleteVehicle _reward;
	_GAU = createVehicle ["B_Heli_Light_01_armed_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_GAU allowDamage false;
	_GAU setDir 284;
	_GAU removeMagazine ("5000Rnd_762x51_Belt");
	_GAU removeWeapon ("M134_minigun");
	_GAU addWeapon ("HMG_127_APC");
	_GAU addMagazine ("500Rnd_127x99_mag_Tracer_Red");
	_GAU setObjectTextureGlobal[0, 'A3\Air_F\Heli_Light_01\Data\skins\heli_light_01_ext_digital_co.paa'];
	{_x addCuratorEditableObjects [[_GAU], false];} foreach adminCurators;
};
if (_reward isKindOf "Land_GarbageBags_F") then {
	//an AH-9 Pawnee GMG - 20MM
	deleteVehicle _reward;
	_GMG = createVehicle ["B_Heli_Light_01_armed_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_GMG allowDamage false;
	_GMG setDir 284;
	_GMG removeMagazine ("5000Rnd_762x51_Belt");
	_GMG removeWeapon ("M134_minigun");
	_GMG addWeapon ("GMG_20mm");
	_GMG addMagazine ("40Rnd_20mm_G_belt");
	_GMG addMagazine ("40Rnd_20mm_G_belt");
	_GMG setObjectTextureGlobal[0, 'A3\Air_F\Heli_Light_01\Data\skins\heli_light_01_ext_digital_co.paa'];
	{_x addCuratorEditableObjects [[_GMG], false];} foreach adminCurators;
};
if (_reward isKindOf "Land_NetFence_01_m_pole_F") then {
	//a LAT WY-55 Hellcat
	//created by McKillen
	_HELLCAT = createVehicle ["I_Heli_light_03_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_HELLCAT allowDamage false;
	_HELLCAT setDir 284;
	deleteVehicle _reward;
	_HELLCAT removeMagazinesTurret ["24Rnd_missiles",[-1]];
	_HELLCAT removeWeaponTurret ["missiles_DAR",[-1]];
	_HELLCAT addWeaponTurret ["rockets_Skyfire",[-1]];
	_HELLCAT addMagazineTurret ["38Rnd_80mm_rockets",[-1]];
	{_x addCuratorEditableObjects [[_HELLCAT], false];} foreach adminCurators;
};
if (_reward isKindOf "O_T_VTOL_02_infantry_F") then {
	//an Y-32 Xi'an (Infantry Transport, unarmad)
	_reward removeMagazine "250Rnd_30mm_HE_shells_Tracer_Green";
	_reward removeMagazine "250Rnd_30mm_APDS_shells_Tracer_Green";
	_reward removeMagazine "8Rnd_LG_scalpel";
	_reward removeMagazine "38Rnd_80mm_rockets";
	_reward removeWeapon ("gatling_30mm_VTOL_02");
	_reward removeWeapon ("missiles_SCALPEL");
	_reward removeWeapon ("rockets_Skyfire");
};

//--------UAV/UGV------

if (_reward isKindOf "B_T_UAV_03_F") then {
	//a MQ-12 Falcon
	createVehicleCrew _reward;
};
if (_reward isKindOf "B_UAV_05_F") then {
	//a UCAV Sentinel
	createVehicleCrew _reward;
};
if (_reward isKindOf "Land_VR_CoverObject_01_kneelHigh_F") then {
	//a hemtt mounted Praetorian 1C
	deleteVehicle _reward;
	_truck = createVehicle ["B_Truck_01_mover_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_truck allowDamage false;
	_AAA = createVehicle ["B_AAA_System_01_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_AAA attachTo [_truck,[0,-2.5,2.1]];
	createVehicleCrew _AAA;
	{_x addCuratorEditableObjects [[_truck,_AAA], false];} foreach adminCurators;
};	
if (_reward isKindOf "Land_VR_CoverObject_01_standHigh_F") then {
	//a hemtt mounted Mk49 Spartan
	deleteVehicle _reward;
	_truck = createVehicle ["B_Truck_01_mover_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_truck allowDamage false;
	_truck setDir 0;
	_AA = createVehicle ["B_SAM_System_01_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_AA attachTo [_truck,[0,-2.9,1.5]];
	_AA setDir 180;
	createVehicleCrew _AA;
	{_x addCuratorEditableObjects [[_truck,_AA], false];} foreach adminCurators;
};

//--------MBTs---------

//--------IFVs---------

//--------APCs---------

//----------AA---------

//--------MRAPs--------

//--------cars----------

if (_reward isKindOf "Sign_Arrow_Blue_F") then {
	//an Offroad (AT)
	deleteVehicle _reward;
	_truck = createVehicle ["B_G_Offroad_01_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_truck allowDamage false;
	_truck setDir 0;
	_ATLauncher = createVehicle ["B_static_AT_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_ATLauncher attachTo [_truck,[0,-1.5,.4]];
	_ATLauncher setDir 180;
	{_x addCuratorEditableObjects [[_truck,_ATLauncher], false];} foreach adminCurators;
};
if (_reward isKindOf "Sign_Arrow_Cyan_F") then {
	//an Offroad (AA)
	deleteVehicle _reward;
	_truck = createVehicle ["B_G_Offroad_01_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_truck allowDamage false;
	_truck setDir 0;
	_AALauncher = createVehicle ["B_static_AA_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_AALauncher attachTo [_truck,[0,-1.5,.4]];
	_AALauncher setDir 180;
	{_x addCuratorEditableObjects [[_truck,_AALauncher], false];} foreach adminCurators;
};
if (_reward isKindOf "Land_InfoStand_V1_F") then {
	//an Offroad (Armed GMG)
	deleteVehicle _reward;
	_truck = createVehicle ["B_G_Offroad_01_repair_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_truck allowDamage false;
	_GMG = createVehicle ["B_GMG_01_high_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_GMG attachTo [_truck,[0,-2.5,.8]];
	{_x addCuratorEditableObjects [[_truck,_GMG], false];} foreach adminCurators;
};
if (_reward isKindOf "B_G_Offroad_01_repair_F") then {
	//a Mobile Mortar Truck
	_mortar = createVehicle ["B_Mortar_01_F", getMarkerPos "smReward1",smMarkerList,0,"NONE"];
	_mortar attachTo [_reward,[0,-2.5,.3]];
	{_x addCuratorEditableObjects [[_reward,_mortar], false];} foreach adminCurators;
};


//Adds any reward that hasen't been altered to zeus
{_x addCuratorEditableObjects [[_reward], false];} foreach adminCurators;

[]spawn {sleep 3;};

//Re-enable damage
_reward allowDamage true;
_mortar allowDamage true;
_truck allowDamage true;
_HELLCAT allowDamage true;
_GAU allowDamage true;
_GMG allowDamage true;
