private _points = 0;
private _msg = "";

_msg = _msg + format ["SCORE\nTime penalty: -%1\n", round (serverTime - tft_ch_timer)];
_points = _points - (round (serverTime - tft_ch_timer));

if (vip_1 inArea "marker_safe") then {
	_msg = _msg + "VIP secured: +1000\n";
	_points = _points + 1000;
};

if (vip_2 inArea "marker_safe") then {
	_msg = _msg + "Bodyguard secured: +500\n";
	_points = _points + 500;
};

if (vip_3 inArea "marker_safe") then {
	_msg = _msg + "Bodyguard secured: +500\n";
	_points = _points + 500;
};

private _deadCivCount = count (allDead select {side group _x == civilian});
if (_deadCivCount > 0) then {
	_msg = _msg + format["%1 civilians killed: -%2\n", _deadCivCount, _deadCivCount * 200];
	_points = _points - _deadCivCount * 200;
};

private _enemyCount = count (allUnits select {side _x == east});
if (_enemyCount > 0) then {
	_msg = _msg + format["%1 enemies remaining: -%2\n", _enemyCount, _enemyCount * 50];
	_points = _points - _enemyCount * 50;
};

private _vicsLeft = count (vics select {(getMarkerPos "marker_safe") distance2D _x > 30});
if (_vicsLeft > 0) then {
	_msg = _msg + format["Wasted equipement: -%1\n", _vicsLeft * 100];
	_points = _points - _vicsLeft * 100;
};

_msg = _msg + format ["\nFinal Score: %1", _points];
_msg remoteExec ["hint"];
