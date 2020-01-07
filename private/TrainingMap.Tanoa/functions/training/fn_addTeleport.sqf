/*
 * Author: yourstruly
 * Add teleport option to the object.
 *
 * Arguments:
 * 0: Object to teleport from <OBJECT>
 * 1: Display name of the teleport position <STRING>
 *
 * Return Value:
 * -
 *
 * Example:
 * [flag, "Base"] call TFT_fnc_addTeleport
 */
params ["_object", "_name"];

if(isNil "TFT_teleportPoints") then { TFT_teleportPoints = []; };

_found = false;
{
    _x params ["_xName", "_xObject"];
    if(_name == _xName) exitWith { _found = true; };
} forEach TFT_teleportPoints;

if(!_found) then {
    _mark = createMarkerLocal [format["markTpPoint%1", count TFT_teleportPoints], getPos _object];
    _mark setMarkerShapeLocal "ICON";
    _mark setMarkerTypeLocal "hd_flag";
    _mark setMarkerSizeLocal [0.6, 0.6];
    _mark setMarkerColorLocal "ColorOrange";

    {
        _x params ["_xName", "_xObject"];
        _object addAction [format["<t color='#ffccaa'>Teleport to %1</t>", _xName], format["[_this select 1, %1, %2] spawn TFT_fnc_teleport", getPos _xObject, getDir _xObject]];
        _xObject addAction [format["<t color='#ffccaa'>Teleport to %1</t>", _name], format["[_this select 1, %1, %2] spawn TFT_fnc_teleport", getPos _object, getDir _object]];
    } forEach TFT_teleportPoints;

    TFT_teleportPoints pushBack [_name, _object];
};
