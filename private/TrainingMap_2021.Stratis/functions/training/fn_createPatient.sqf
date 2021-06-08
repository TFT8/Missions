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
params [["_center",getMarkerPos "patientSpawn"],["_radius",0]];

private _group = createGroup [west, true];
private _unit = _group createUnit ["b_survivor_F", _center, [], 0, "NONE"];
[_unit, true, 60] call ace_medical_fnc_setUnconscious;
_unit setVariable ["acex_headless_blacklist", true, true];
_unit disableAI "PATH";
_unit setUnitLoadout [[],[],[],["U_B_CombatUniform_mcam_worn",[]],[],[],"","",[],["","","","","",""]];

private _count = floor random 5;
for [{private _i = 0},{_i<=_count},{_i=_i+1}] do {
  ["ace_medical_woundReceived", [
      _unit,
      selectRandom ["Body", "Head", "LeftArm", "RightArm", "LeftLeg", "RightLeg"],
      0.4 + random 0.55,
      _unit, "bullet", [1,1]], _unit
  ] call CBA_fnc_targetEvent;
};
