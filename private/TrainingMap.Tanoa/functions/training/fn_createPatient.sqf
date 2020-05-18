/* 
 * Description:
 * Creates AI with damage for medical training.
 *
 * Parameters:
 * 0 - Center point which they will spawn <STRING>
 * 1 - Radius around center point which they will spawn <INT>
 *
 * Example: [3, getMarkerPos "patientSpawn", 5]] call tft_fnc_createPatient;
 */
params ["_center","_radius"];

private _group = createGroup west;
private _unit = _group createUnit ["b_survivor_F", _center, [], 0, "NONE"];
_unit setVariable ["acex_headless_blacklist", true];
_unit setVariable ["Vcm_Disable", true];
_unit disableAI "PATH";
_unit disableAI "AUTOTARGET";
_unit disableAI "AUTOCOMBAT";
_unit disableAI "MOVE";
_unit disableAI "FSM";
_unit disableAI "ANIM";
removeAllWeapons _unit;
removeVest _unit;
removeBackpack _unit;
removeHeadgear _unit;
{_x addCuratorEditableObjects [[_unit],false]} foreach allCurators;

[
    _unit,
    0.4,
    selectRandom ["head", "body", "hand_r", "hand_l", "leg_l", "leg_r"],
    selectRandom ((configfile >> "ACE_Medical_Advanced" >> "Injuries" >> "damageTypes") call BIS_fnc_getCfgSubClasses)
] call ace_medical_fnc_addDamageToUnit;