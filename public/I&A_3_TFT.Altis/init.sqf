/*
Author:

	BACONMOP

Description:

	Things that may run on both server and client.
	Deprecated initialization file, still using until the below is correctly partitioned between server and client.
______________________________________________________*/
missionActive = true;
enableSaving false;
artySorcher allowDamage False;
artyMLRS allowDamage False;

//---------------------------------- Mission vars (for all clients)
derp_PARAM_AOSize = "AOSize" call BIS_fnc_getParamValue;
derp_PARAM_AntiAirAmount = "AntiAirAmount" call BIS_fnc_getParamValue;
derp_PARAM_MRAPAmount = "MRAPAmount" call BIS_fnc_getParamValue;
derp_PARAM_InfantryGroupsAmount = "InfantryGroupsAmount" call BIS_fnc_getParamValue;
derp_PARAM_AAGroupsAmount = "AAGroupsAmount" call BIS_fnc_getParamValue;
derp_PARAM_ATGroupsAmount = "ATGroupsAmount" call BIS_fnc_getParamValue;
derp_PARAM_RandomVehcsAmount = "RandomVehcsAmount" call BIS_fnc_getParamValue;

derp_PARAM_AIAimingAccuracy = "AIAimingAccuracy" call BIS_fnc_getParamValue;
derp_PARAM_AIAimingShake = "AIAimingShake" call BIS_fnc_getParamValue;
derp_PARAM_AIAimingSpeed = "AIAimingSpeed" call BIS_fnc_getParamValue;
derp_PARAM_AISpotingDistance = "AISpotingDistance" call BIS_fnc_getParamValue;
derp_PARAM_AISpottingSpeed = "AISpottingSpeed" call BIS_fnc_getParamValue;
derp_PARAM_AICourage = "AICourage" call BIS_fnc_getParamValue;
derp_PARAM_AIReloadSpeed = "AIReloadSpeed" call BIS_fnc_getParamValue;
derp_PARAM_AICommandingSkill = "AICommandingSkill" call BIS_fnc_getParamValue;
derp_PARAM_AIGeneralSkill = "AIGeneralSkill" call BIS_fnc_getParamValue;


["Initialize"] call BIS_fnc_dynamicGroups;
for [ {_i = 0}, {_i < count(paramsArray)}, {_i = _i + 1} ] do {
	call compile format
	[
		"PARAMS_%1 = %2",
		(configName ((missionConfigFile >> "Params") select _i)),
		(paramsArray select _i)
	];
};
