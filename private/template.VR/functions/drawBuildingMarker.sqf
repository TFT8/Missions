params ["_object"];
private _pos = getPosATL _object;
private _bound = boundingBoxReal _object;
private _dir = getDir _object;

_bmin = _bound select 0;
//_min = _object modelToWorld _bmin;

_bmax = _bound select 1;
//_max = _object modelToWorld _bmax;

//base corners
//_b1 = _object modelToWorld _bmin;
//_b2 = _object modelToWorld [_bmax select 0, _bmin select 1, _bmin select 2];
//_b3 = _object modelToWorld [_bmax select 0, _bmax select 1, _bmin select 2];
//_b4 = _object modelToWorld [_bmin select 0, _bmax select 1, _bmin select 2];

private _markerName = "marker_" + str (_pos select 0) + "_" + str (_pos select 1);

//player sideChat format["creating marker %1",_randomName];
_marker = createMarker [_markerName, _pos];
_marker setMarkerShape "RECTANGLE";
_marker setMarkerSize [_bmax select 0, _bmax select 1];
_markername setMarkerBrush "SolidFull";
_marker setMarkerColor "ColorGrey";
_marker setMarkerDir _dir;
