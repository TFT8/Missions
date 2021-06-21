/*
 * Author: yourstruly
 * Repair, rearm and refuel vehicle.
 *
 * Arguments:
 * 0: Vehicle to rearm <OBJECT>
 *
 * Return Value:
 * -
 *
 * Example:
 * [vehicle player] call TFT_fnc_serviceVehicle
 */

params ["_vehicle", ["_time_factor", 0.5, [0]]];
private ["_type", "_fuel", "_magazines", "_count", "_config", "_config2", "_count2"];

_type = typeOf _vehicle;

_fuel = fuel _vehicle;
[_vehicle, 0] remoteExec ["setFuel"];
_vehicle vehicleChat format ["Servicing %1... Please stand by...", getText(configFile >> "CfgVehicles" >> _type >> "displayName")];

_vehicle vehicleChat "Reloading...";
_magazines = count getArray(configFile >> "CfgVehicles" >> _type >> "magazines");

_count = count (configFile >> "CfgVehicles" >> _type >> "Turrets");
for "_i" from 0 to (_count - 1) do {
	_config = (configFile >> "CfgVehicles" >> _type >> "Turrets") select _i;
	_magazines = _magazines + count getArray(_config >> "magazines");

	_count2 = count (_config >> "Turrets");
	for "_i" from 0 to (_count2 - 1) do {
		_config2 = (_config >> "Turrets") select _i;
		_magazines = _magazines + count getArray(_config2 >> "magazines");
	};
};
sleep _time_factor * _magazines;
_vehicle setVehicleAmmo 1;

_vehicle vehicleChat "Repairing...";
sleep _time_factor + (damage _vehicle)*10;
_vehicle setDamage 0;

_vehicle vehicleChat "Refueling...";
sleep _time_factor + (1 - _fuel)*10;
[_vehicle, 1] remoteExec ["setFuel"];

_vehicle vehicleChat format ["%1 is ready...", getText(configFile >> "CfgVehicles" >> _type >> "displayName")];
