/*
 * Author: Frankie
 * Runs the rifle range at different speed settings at random for 20 targets.
 * NOTE: This function is not generic and is very connected to current BRM setup on the map!
 *
 * Arguments:
 * 0: Targets up-time coeficient <NUMBER>
 * 
 * Return Value:
 * -
 *
 * Example:
 * [1] call TFT_fnc_rifleTargets
 */
params ["_coef"];

["BRM", 1] call TFT_fnc_toggleTargets;
hint "Setting up random range";
sleep 4;

for "_i" from 1 to 20 do {
    private _distance = selectRandom ["50m","100m","150m","200m","250m","300m","350m","400m"];
    [_distance,0] call TFT_fnc_toggleTargets;
    sleep _coef;
    [_distance,1] call TFT_fnc_toggleTargets;
    sleep 1;
};

hint "Complete";
