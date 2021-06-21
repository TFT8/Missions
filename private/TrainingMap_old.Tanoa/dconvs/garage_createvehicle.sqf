
_veh  = BIS_fnc_garage_center;

_pos = getPos _veh;
_dir = getDir _veh;
_type = typeOf _veh;
_textures = getObjectTextures _veh;
_animationNames = animationNames _veh;
_animationValues = [];
_current_mags = (getPylonMagazines (_veh));
_special = "CAN_COLLIDE";
_movein = false;

{
	_animationValues pushBack (_veh animationPhase _x);
} forEach _animationNames;

deleteVehicle _veh;
waitUntil {!alive _veh};
sleep 0.1;

switch (DCON_Garage_SpawnType) do {
	case 1 : {
		_movein = true;
	};
	case 2 : {
		_movein = true;
		_special = "FLY";
	};
};

_veh = createvehicle [_type,_pos,[],0,_special];
_veh setVariable ["dcon_garage_veh",true,true];

// "i died about 200 times before implementing this..";
//if!(_veh isKindOf "plane") then {
	_veh setDir _dir;
//};

clearWeaponCargoGlobal _veh;
clearMagazineCargoGlobal _veh;

{
	_veh animate [_x,_animationValues select _forEachIndex,true];
} forEach _animationNames;

{
	_veh setObjectTextureGlobal [_forEachIndex,_x];
} forEach _textures;

{
	_veh setPylonLoadOut [_forEachIndex+1, _x,true];
} forEach _current_mags;

if(_movein) then {
	moveout player;
	waitUntil {vehicle player == player};
	player moveInDriver _veh;
};

_veh setPlateNumber (groupId (group player));
