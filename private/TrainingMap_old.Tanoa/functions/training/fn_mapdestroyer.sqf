/*
 * Author: Frankie
 * Hides map objects around a marker within the radius defined
 *
 * Arguments:
 * 0: Marker Name <STRING>
 * 1: Radius <INT>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["marker1",150] call TFT_fnc_mapDestroyer
 */

params ["_marker","_radius"];


_location = markerPos _marker;

if (isServer) then {
	_terrainobjects = nearestTerrainObjects [_location,[],_radius];
	{_x hideObjectGlobal true} foreach _terrainobjects;
};
