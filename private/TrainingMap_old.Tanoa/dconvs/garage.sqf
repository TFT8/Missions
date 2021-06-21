if !(isNull(uiNamespace getVariable [ "DCON_Garage_Display", objNull ])) exitwith {};

if(isNil "DCON_Garage_SpawnType") then {
	DCON_Garage_SpawnType = 0;
};

params ["_gl"];
(_gl nearObjects ["AllVehicles", 10]) apply {deleteVehicle _x};
_pos = getPos _gl;
_dir = getDir _gl;
_spawns = [];

_helipad = "Land_HelipadEmpty_F" createVehicleLocal _pos;

waitUntil{!isNull _helipad};

_helipad setPos _pos;
_helipad setDir _dir;

BIS_fnc_arsenal_fullGarage = true;
BIS_fnc_garage_center = _helipad;
DCON_Garage_CanSpawn = 0;
DCON_Garage_Vehicle = objNull;
DCON_Garage_Loadout_Controls = [];
DCON_Garage_Color = [0,0,0,1];

// "no idea what this does but it works";
disableSerialization;

_display = findDisplay 46 createDisplay "RscDisplayGarage";
uiNamespace setVariable ["DCON_Garage_Display", _display];

_xPos = safezoneX + safezoneW;
_yPos = safezoneY + safezoneH;

_yPos = _yPos - 0.11;

// "select spawn type";
_combo = _display ctrlCreate ["RscCombo", -1];
_combo ctrlSetPosition [0.3455,_yPos,0.304,0.04];
_combo ctrlSetFont "PuristaMedium";
_combo ctrlSetTooltip "Spawn Type";
_combo ctrlSetEventHandler ["LBSelChanged", 
'
	DCON_Garage_SpawnType = _this select 1;
'];
_combo lbAdd "None";
_combo lbAdd "Getin Driver";
_combo lbAdd "Flying";

_combo lbSetCurSel DCON_Garage_SpawnType;

_combo ctrlCommit 0;

_yPos = _yPos - 0.07;

// "r/woooosh";
_btn = _display ctrlCreate ["RscButton", -1];
_btn ctrlSetPosition [0.3455,_yPos,0.304,0.06];
_btn ctrlSetText "SPAWN";
_btn ctrlSetFont "PuristaMedium";
_btn ctrlSetTooltip "WooOOOOSH!!";
_btn ctrlSetEventHandler ["MouseButtonUp", 
'
	_display = (uiNamespace getVariable "DCON_Garage_Display");
	
	DCON_Garage_CanSpawn = 1;
	
	_display closeDisplay 1;
'];
_btn ctrlCommit 0;

// "part of the function that doesn't work for some reason";
/*
_slider = _display ctrlCreate ["RscXSliderH", -1];
_slider ctrlSetPosition [0,0.5,1,0];
_slider ctrlSetBackgroundColor [0,0,0,0.4];
_slider ctrlSetText "SPAWN";
_slider ctrlSetFont "PuristaMedium";
_slider ctrlSetTooltip "WooOOOOSH!!";
_slider ctrlSetEventHandler ["SliderPosChanged",'
	_value = (_this select 1)  / 10;
	
	DCON_Garage_Color set [0,_value];

	[] call DCON_fnc_Garage_UpdateColor;
'];
_slider ctrlCommit 0;
*/

_controls = allControls _display;

// "I sat here for about an hour manually going through each control trying to find the ones I hated. See my pain";
_spawn = _controls spawn {
	if true exitWith {};
	{
		hint str _x;
		_x ctrlSetBackgroundColor [1, 0, 0, 1];
		sleep 1;
	} forEach _this;
};
_spawns pushBack _spawn;

// "they come back for some reason idk";
_spawn = _display spawn {
	while{true} do {
		(_this displayCtrl 28644) ctrlShow false;
		(_this displayCtrl 25815) ctrlShow false;
		(_this displayCtrl 44347) ctrlEnable false;
		// "(_this displayCtrl 44046) ctrlShow false";
		sleep 0.01;
	};
};
_spawns pushBack _spawn;

// "The intent is to provide players with a sense of pride and accomplishment by pressing the enter key";
_display displayAddEventHandler ["KeyUp",{
	_key = _this select 1;

	if(_key == 28) then {
		_display = (uiNamespace getVariable "DCON_Garage_Display");

		_display closeDisplay 1;

		DCON_Garage_CanSpawn = 1;
		[] call DCON_fnc_Garage_CreateVehicle;
	};
}];

_spawn = [_pos,_dir] spawn {
	_pos = _this select 0;
	_dir = _this select 1;
	_found = false;

	while {true} do {
		_objs = [_pos select 0,_pos select 1] nearEntities [["Air", "Car", "Tank", "Ship", "staticWeapon"], 30];
		reverse _objs;

		_model = uiNamespace getVariable "bis_fnc_garage_centertype";
		_model = _model splitString ":" select 0;
		if(_model find "\a3\" == -1) then {
			_model = "\"+_model;
		};
		if(_model find ".p3d" == -1) then {
			_model = _model+".p3d";
		};

		{
			_found = DCON_Garage_Vehicle getVariable "dcon_garage_veh";
			if(!isNil "_found") exitWith {};

			_id = _x call BIS_fnc_netId;
			_info = (getModelInfo _x) select 1;
			if(_info find "\a3\" == -1) then {
				_info = "\"+_info;
			};
			if(_info find ".p3d" == -1) then {
				_info = _info+".p3d";
			};
			_ignore = _x getVariable "dcon_garage_veh";

			if(_id find "0:" >= 0 && _info == _model && isNil "_ignore") exitWith {
				_veh = _x;

				_veh setVariable ["dcon_garage_veh",true];
				_veh setPlateNumber (groupId (group player));

				DCON_Garage_Vehicle = _veh;

				_display = (uiNamespace getVariable "DCON_Garage_Display");
				_ctrls = [];

				{
					ctrlDelete (_x select 0);
				} forEach DCON_Garage_Loadout_Controls;
				DCON_Garage_Loadout_Controls = [];

				_pylons = (configProperties [configFile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "Pylons"]) apply {configName _x};
				if(count _pylons == 0) exitWith {};

				_last_loadout = (uiNamespace getVariable format ["DCON_Garage_Loadout_%1",typeOf _veh]);

				{
					_ctrl = _display ctrlCreate ["RscCombo", -1];
					//_ctrl setVariable ["test","worked!"];
					_ctrl ctrlSetTooltip "Select Weapon";
					_ctrl ctrlSetBackgroundColor [0,0,0,0.8];
					_ctrl ctrlSetFade 0.2;
					_ctrl ctrlCommit 0;

					_veh animateBay [_forEachIndex, 1];

					if(!isNil "_last_loadout") then {
						_veh setPylonLoadOut [_forEachIndex+1, _last_loadout select _forEachIndex,true];
					};

					_ctrl_index = _forEachIndex;

					_current_wep = (getPylonMagazines (_veh)) select _forEachIndex;

					_selected = -1;

					private _weps = _veh getCompatiblePylonMagazines (_forEachIndex + 1);
					{
						_ctrl lbAdd getText (configFile >> "CfgMagazines" >> _x >> "DisplayName");
						_ctrl lbSetData [_forEachIndex, format["%1^%2",_x,_ctrl_index+1]];

						if(_current_wep == _x) then {
							_selected = _forEachIndex;
						};
					} forEach _weps;

					_ctrl lbSetCurSel _selected;

					_ctrl ctrlAddEventHandler ["LBSelChanged",{
						_veh = DCON_Garage_Vehicle;
						_ctrl = _this select 0;
						_index = _this select 1;
						_str = (_ctrl lbData _index) splitString "^";
						_pylon_index = parseNumber (_str select 1);
						_class = (_str select 0);

						_veh setPylonLoadOut [_pylon_index, _class,true];

						(uiNamespace setVariable [format ["DCON_Garage_Loadout_%1",typeOf _veh],getPylonMagazines _veh]);

						playSound3D ["a3\missions_f_beta\data\sounds\firing_drills\target_pop-down_small.wss",_veh,false,getPos _veh,2];
					}];

					_ctrl ctrlAddEventHandler ["MouseEnter",{
						(_this) ctrlSetFade 0;
						(_this) ctrlCommit 0;
					}];
					_ctrl ctrlAddEventHandler ["MouseExit",{
						(_this) ctrlSetFade 0.5;
						(_this) ctrlCommit 0;
					}];

					_offset = getArray (configfile >> "CfgVehicles" >> typeOf _veh >> "Components" >> "TransportPylonsComponent" >> "pylons" >> _x >> "UIposition");
					_offset_final = +_offset;
					_pos_offset = [-0.33,-0.33,-0.5];
					_multiplyer = [15,15];

					switch (typeOf _veh) do { 
						case 'B_Plane_CAS_01_dynamicLoadout_F': {
							_offset_final = [(_offset select 1),_offset select 0];
							_pos_offset = [-0.26,-0.36,-0.5];
							_multiplyer = [25,15];
						};
						case 'B_Plane_Fighter_01_F': {
							_offset_final = [-(_offset select 0),_offset select 1];
							_pos_offset = [0.33,-0.36,-0.5];
							_multiplyer = [16,15];
						};
						case 'B_UAV_05_F': {
							_offset_final = [-(_offset select 0),_offset select 1];
							_pos_offset = [0.33,-0.36,-0.5];
							_multiplyer = [16,15];
						};
						case 'B_Heli_Light_01_dynamicLoadout_F': {
							_offset_final = [(_offset select 0),(_offset select 1)];
							_pos_offset = [-0.32,-0.5,-0.5];
							_multiplyer = [6,6];
						};
						case 'B_Heli_Attack_01_dynamicLoadout_F': {
							_offset_final = [(_offset select 0),(_offset select 1)];
							_pos_offset = [-0.33,-0.4,-0.5];
							_multiplyer = [6,15];
						}; 
						case 'O_Heli_Attack_02_dynamicLoadout_F': {
							_offset_final = [(_offset select 0),(_offset select 1)];
							_pos_offset = [-0.33,-0.33,-0.5];
							_multiplyer = [13,13];
						};
						case 'B_T_UAV_03_dynamicLoadout_F': {
							_offset_final = [(_offset select 0),-(_offset select 1)];
							_pos_offset = [-0.31,0.33,-0.5];
							_multiplyer = [10,10];
						};
						case 'O_Heli_Light_02_dynamicLoadout_F': {
							_offset_final = [(_offset select 0),(_offset select 1)];
							_pos_offset = [-0.31,-0.8,-1.6];
							_multiplyer = [9,1];
						}; 
						case 'I_Heli_light_03_dynamicLoadout_F': {
							_offset_final = [(_offset select 0),(_offset select 1)];
							_pos_offset = [-0.33,-3,-0.5];
							_multiplyer = [9,1];
						}; 
						case 'I_Plane_Fighter_03_dynamicLoadout_F': {
							_offset_final = [(_offset select 1),(_offset select 0)];
							_pos_offset = [-0.29,-0.33,-0.5];
							_multiplyer = [16,25];
						};
						case 'I_Plane_Fighter_04_F': {
							_offset_final = [-(_offset select 0),_offset select 1];
							_pos_offset = [0.33,-0.30,-0.5];
							_multiplyer = [16,15];
						};
						case 'B_UAV_02_dynamicLoadout_F': {
							_offset_final = [(_offset select 1),(_offset select 0)];
							_pos_offset = [-0.28,-0.22,-0.8];
							_multiplyer = [25,15];
						};
						case 'O_Plane_CAS_02_dynamicLoadout_F': {
							_offset_final = [(_offset select 1),(_offset select 0)];
							_pos_offset = [-0.28,-0.32,-0.8];
							_multiplyer = [24,100];
						};
						case 'O_Plane_Fighter_02_F': {
							_offset_final = [-(_offset select 0),_offset select 1];
							_pos_offset = [0.33,-0.22,-0.5];
							_multiplyer = [24,15];
						};
						case 'O_T_VTOL_02_infantry_dynamicLoadout_F': {
							_offset_final = [(_offset select 1),(_offset select 0)];
							_pos_offset = [-0.28,-0.32,-1.3];
							_multiplyer = [40,20];
						};
						case 'O_T_VTOL_02_vehicle_dynamicLoadout_F': {
							_offset_final = [(_offset select 1),(_offset select 0)];
							_pos_offset = [-0.28,-0.32,-1.3];
							_multiplyer = [40,20];
						};
					};

					_ctrls pushBack [
						_ctrl,
						_offset_final,
						_pos_offset,
						_multiplyer
					];
				} forEach _pylons;

				DCON_Garage_Loadout_Controls = _ctrls;

				["DCON_Garage_FrameEvent", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
				["DCON_Garage_FrameEvent", "onEachFrame", {
					_ctrls = DCON_Garage_Loadout_Controls;
					_veh = DCON_Garage_Vehicle;

					_width = 0.14;
					_height = 0.05;
					_boost = 0;

					_mouse = getMousePosition;

					{
						_ctrl = _x select 0;
						_offset = _x select 1;
						_pos_offset = _x select 2;
						_multiplyer = _x select 3;
						_offset_x = _offset select 0;
						_offset_y = _offset select 1;

						_offset_x = _offset_x + (_pos_offset select 0);
						_offset_y = _offset_y + (_pos_offset select 1);

						_offset_x = _offset_x * -1;
						_offset_y = -_offset_y * 1;

						_offset_x = _offset_x * (_multiplyer select 0);
						_offset_y = _offset_y * (_multiplyer select 1);
						
						_pos = worldToScreen (_veh modelToWorld [_offset_x,_offset_y,(_pos_offset select 2)]);
						_pos_x = (_pos select 0) - _width/2;
						_pos_y = (_pos select 1) - _height/2;

						_dist = 1 - (_mouse distance _pos);

						if(_dist > 0.94) then {
							_boost = 0;
						}
						else
						{
							_boost = 0;
						};

						_ctrl ctrlSetPosition [_pos_x,_pos_y - _boost,_width,_height];
						_ctrl ctrlCommit 0;

					} forEach _ctrls;

				}] call BIS_fnc_addStackedEventHandler;
			};

		} forEach _objs;

		DCON_Garage_Vehicle setPos _pos;
		DCON_Garage_Vehicle setDir _dir;

		sleep 0.1;
	};
};
_spawns pushBack _spawn;

/*
_spawn = [_pos,_dir] spawn {
	_pos = _this select 0;
	_dir = _this select 1;

	while {true} do {
		DCON_Garage_Vehicle setPos _pos;
		DCON_Garage_Vehicle setDir _dir;

		sleep 0.1;
	};
};
_spawns pushBack _spawn;
*/

waitUntil {
	isNull _display;
};

{
	ctrlDelete (_x select 0);
} forEach DCON_Garage_Loadout_Controls;

["DCON_Garage_FrameEvent", "onEachFrame"] call BIS_fnc_removeStackedEventHandler;
//terminate DCON_Garage_Loadout;

deleteVehicle _helipad;

{
	terminate _x;
} forEach _spawns;

_veh = BIS_fnc_garage_center;
{
	deleteVehicle _x;
} forEach crew _veh;

if(DCON_Garage_CanSpawn == 1) then {
	[] call DCON_fnc_Garage_CreateVehicle;
}
else
{
	deleteVehicle _veh;
};
