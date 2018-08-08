// run in init.sqf
// null = [] execVM "civsFlee.sqf";

{
	0 = _x addEventHandler ["FiredNear", {
		_civ = (_this select 0);
		
		switch (selectRandom [0,0,1,1,2]) do {
			case 0:{_civ switchMove "ApanPercMstpSnonWnonDnon_G01";};
			case 1:{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
			case 2:{_civ playMoveNow "ApanPpneMstpSnonWnonDnon_G01";};
			default{_civ playMoveNow "ApanPknlMstpSnonWnonDnon_G01";};
		};
		_civ setSpeedMode "FULL";
		
		_nH = nearestObjects [_civ, ["House"], 100];
		
		_nHwP = _nH select { not ((_x buildingPos 0) isEqualTo [0,0,0])};
		
		//_H = selectRandom _nH;
		_H = _nH select 0;
		
		_HP = _H buildingPos -1;

		_HP = selectRandom _HP;

		_civ doMove _HP;
		
		_civ removeEventHandler ["FiredNear", _thisEventHandler]; 
	}];

} count (
	(allUnits - switchableUnits - playableUnits) select {side _x == civilian}
);
