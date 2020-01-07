/*
 * Author: yourstruly
 * Run BRM qualification and count hits.
 * NOTE: This function is not generic and is very connected to current BRM setup on the map!
 *
 * Arguments:
 * 0: Number of lines <NUMBER>
 * 1: Time coef for targets <NUMBER>
 *
 * Return Value:
 * -
 *
 * Example:
 * [4, 0.5] call TFT_fnc_beginQualification
 */
params ["_lines", "_coef"];
_totalHits = 40; // Maximum number of hits that unit can have on the course


// --- setup hits counter
for "_i" from 1 to _lines do {
	// reset hits counter
	missionNamespace setVariable [format["TFT_BRM_line%1", _i], 0, true];
	{
        _eh = _x addMPEventHandler ["MPHit", format["missionNamespace setVariable ['TFT_BRM_line%1', (missionNamespace getVariable ['TFT_BRM_line%1', 0])+1, true];", _i]];
        _x setVariable ["TFT_BRM_eh", _eh];
    } forEach (missionNamespace getVariable [format["TFT_targets_line%1", _i], []]);
};

// --- run qualification
hint parseText "<t size='1.1' color='#aaaaaa'>Relay all </t><t size='1.2' color='#ffff88'>yellow messages</t><t size='1.1' color='#aaaaaa'> to qualifiers</t>";
["BRM", 1] call TFT_fnc_toggleTargets;

sleep 6;
hint parseText "<t color='#ffff88'>Switch to PRONE SUPPORTED position</t>";
sleep 8;
hint parseText "<t color='#ffff88'>Get ready</t>";
sleep 2;
["50m", 0] call TFT_fnc_toggleTargets;
sleep (3 * _coef);
["50m", 1] call TFT_fnc_toggleTargets;
["200m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["200m", 1] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
sleep (4 * _coef);
["100m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (5 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["300m", 0] call TFT_fnc_toggleTargets;
sleep (8 * _coef);
["300m", 1] call TFT_fnc_toggleTargets;
["250m", 0] call TFT_fnc_toggleTargets;
sleep (7 * _coef);
["250m", 1] call TFT_fnc_toggleTargets;
["50m", 0] call TFT_fnc_toggleTargets;
sleep (3 * _coef);
["50m", 1] call TFT_fnc_toggleTargets;
["200m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["200m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (5 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["250m", 0] call TFT_fnc_toggleTargets;
sleep (7 * _coef);
["250m", 1] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
["200m", 0] call TFT_fnc_toggleTargets;
sleep (8 * _coef);
["100m", 1] call TFT_fnc_toggleTargets;
["200m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
["300m", 0] call TFT_fnc_toggleTargets;
sleep (10 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["300m", 1] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
["250m", 0] call TFT_fnc_toggleTargets;
sleep (9 * _coef);
["100m", 1] call TFT_fnc_toggleTargets;
["250m", 1] call TFT_fnc_toggleTargets;
["200m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["200m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (5 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["50m", 0] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["50m", 1] call TFT_fnc_toggleTargets;
["100m", 1] call TFT_fnc_toggleTargets;

hint parseText "<t color='#ffff88'>Transition to PRONE UNSUPPORTED</t><br/><t color='#ffff88'>and reload</t>";
sleep 12;
hint parseText "<t color='#ffff88'>Get ready</t>";
sleep 3;
["200m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["200m", 1] call TFT_fnc_toggleTargets;
["250m", 0] call TFT_fnc_toggleTargets;
sleep (8 * _coef);
["250m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["200m", 0] call TFT_fnc_toggleTargets;
["300m", 0] call TFT_fnc_toggleTargets;
sleep (10 * _coef);
["200m", 1] call TFT_fnc_toggleTargets;
["300m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
["200m", 0] call TFT_fnc_toggleTargets;
sleep (9 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["200m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
["250m", 0] call TFT_fnc_toggleTargets;
sleep (9 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["250m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;

hint parseText "<t color='#ffff88'>Transition to KNEELING</t><br/><t color='#ffff88'>and reload</t>";
sleep 12;
hint parseText "<t color='#ffff88'>Get ready</t>";
sleep 2;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (8 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["50m", 0] call TFT_fnc_toggleTargets;
sleep (4 * _coef);
["50m", 1] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
sleep (5 * _coef);
["100m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
sleep (5 * _coef);
["100m", 1] call TFT_fnc_toggleTargets;
["50m", 0] call TFT_fnc_toggleTargets;
sleep (4 * _coef);
["50m", 1] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
sleep (5 * _coef);
["100m", 1] call TFT_fnc_toggleTargets;
["150m", 0] call TFT_fnc_toggleTargets;
sleep (6 * _coef);
["150m", 1] call TFT_fnc_toggleTargets;
["50m", 0] call TFT_fnc_toggleTargets;
sleep (4 * _coef);
["50m", 1] call TFT_fnc_toggleTargets;
["100m", 0] call TFT_fnc_toggleTargets;
sleep (5 * _coef);
["100m", 1] call TFT_fnc_toggleTargets;

hint parseText "<t color='#ffff88'>Qualification complete</t>";
sleep 3;

_final = format ["<t size='1.1' color='#aaaaaa'>Final score (out of %1):</t><br/>", _totalHits];
for "_i" from 1 to _lines do {
    _line  = format ["TFT_BRM_line%1", _i];
    _final = _final + format["Lane %1: <t size='1.1' color='#aaaaff'>%2</t><br/>", _i, missionNamespace getVariable [_line, 0]];
};

TFT_BRM_Final = _final;
publicVariable "TFT_BRM_Final";
[parseText TFT_BRM_Final] remoteExec ["hint", 0];

// --- remove hits counter
for "_i" from 1 to _lines do {
    {
        _x removeMPEventHandler ["MPHit", _x getVariable "TFT_BRM_eh"];
    } forEach (missionNamespace getVariable [format["TFT_targets_line%1", _i], []]);
};
