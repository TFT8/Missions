 //fix Zeus placing aircraft over water

params ["_curator", "_entity"];

if (_entity isKindOf "Air") then {
	private _isWater = surfaceIsWater position _entity;
	if (_isWater) then {
		private _altitude = 50;
		_entity setVehiclePosition [(getPos _entity vectorAdd [0,0,_altitude]), [], 0, "FLY"];
		if (_entity isKindOf "Plane") then {
			_entity setVelocityModelSpace [0, 100, 0];
		};
	};
};