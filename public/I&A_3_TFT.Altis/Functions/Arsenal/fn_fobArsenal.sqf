params ["_box", "_filter"];
switch (_filter) do {
    case 0: {
          [_box, [true], false] call BIS_fnc_removeVirtualItemCargo;
          [_box, [true], false] call BIS_fnc_removeVirtualWeaponCargo;
    };

    case 1: {
        if (isServer) then {
            ["AmmoboxInit", [_box, true]] call BIS_fnc_arsenal;
        };

        [_box, [true], false] call BIS_fnc_removeVirtualItemCargo;
        [_box, [true], false] call BIS_fnc_removeVirtualWeaponCargo;
        [_box [true], false] call BIS_fnc_removeVirtualBackpackCargo;

        if (isServer && isDedicated) exitWith {};

        private _availableItems = [] call derp_fnc_findItemList;

        _availableItems = (((((((_availableItems - ArsenalWeaponBlacklist)  - ArsenalBlacklistedItems) - ArsenalBlacklistedUniforms) - ArsenalBlacklistedHelmets) - ArsenalBlacklistedGlasses) - ArsenalBlacklistedBackpacks) - ArsenalBlacklistedVests);

        private _restrictedItems = [];
        _restrictedItems pushBack GearLimitationMarksman;
        _restrictedItems pushBack GearLimitationAT;
        _restrictedItems pushBack GearLimitationSniper;
        _restrictedItems pushBack GearLimitationMMG;
        _restrictedItems pushBack GearLimitationUAVOperator;
        _restrictedItems pushBack GearLimitationGrenadier;
        _restrictedItems pushBack GearLimitationGhillie;

        {
            _x params ["_classCode", "_testedArray"];
            private _unit = player;
            if !(call _classCode) then {
                _availableItems = _availableItems - _testedArray;
            };
        } foreach _restrictedItems;

        [_box, _availableItems, false] call BIS_fnc_addVirtualItemCargo;
        [_box, _availableItems, false] call BIS_fnc_addVirtualWeaponCargo;
        [_box, _availableItems, false] call BIS_fnc_addVirtualBackpackCargo;

        {
            _box removeAction (_box getVariable "bis_fnc_arsenal_action");
            _action = _box addaction [
                localize "STR_A3_Arsenal",
                {
                    params ["_box", "_unit"];
                    ["Open", [nil, _box, _unit]] call bis_fnc_arsenal;

                    [_unit] spawn {
                        params ["_unit"];

                        uiSleep 2;
                        (uinamespace getvariable "bis_fnc_arsenal_display") displayAddEventHandler ["Unload", {
                            [player, 0] call derp_fnc_gearLimitations;
                        }];
                    };
                },
                [],
                6,
                true,
                false,
                "",
                "
                    _cargo = _target getvariable ['bis_addVirtualWeaponCargo_cargo',[[],[],[],[]]];
                    if ({count _x > 0} count _cargo == 0) then {
                        _target removeaction (_target getvariable ['bis_fnc_arsenal_action',-1]);
                        _target setvariable ['bis_fnc_arsenal_action',nil];
                    };
                    _condition = _target getvariable ['bis_fnc_arsenal_condition',{true}];
                    alive _target && {_target distance _this < 5} && {call _condition}
                "
            ];
        _box setvariable ["bis_fnc_arsenal_action", _action];
    };

    case 2: {
        if (isServer) then {
            ["AmmoboxInit", [_box, true]] call BIS_fnc_arsenal;
        };
    };
};
