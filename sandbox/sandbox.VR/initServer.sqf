private _pos = [[worldSize/2, worldSize/2], 0, -1, 0, 0, 0.1] call BIS_fnc_findSafePos;
"respawn_west" setMarkerPos _pos;
"west_hq" setMarkerPos _pos;
box setPos _pos;
