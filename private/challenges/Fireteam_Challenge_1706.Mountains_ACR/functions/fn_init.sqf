if(isServer) then {
	//set all civilians to flee on hearing gunfire
	_nil = [] execVM "civsFlee.sqf";
	{
		_x addCuratorEditableObjects [allUnits + vehicles, true];
	} forEach allCurators;
	{
		_x lock true;
	} forEach vics;
	tft_ch_timer = 0;
};
