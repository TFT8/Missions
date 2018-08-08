/*
 * Author: Ampers
 * Adds to vehicle(s) cargo a standard load of infantry munitions and supplies.
 *
 * Arguments:
 * 0: Objects to add supplies to
 *
 * Return Value:
 * -
 *
 * Example:
 * [_veh1, _veh2] call TFT_fnc_vehEquipment;
 */
private _itemsBox = [["ACE_EarPlugs",10], ["TFAR_anprc152_2",1], ["CUP_launch_M72A6",2], ["CUP_MAAWS_HEAT_M",2], ["CUP_MAAWS_HEDP_M",2],
                     ["ACE_M26_Clacker",1], ["HandGrenade",10], ["SmokeShell",15], ["SmokeShellGreen",10], ["DemoCharge_Remote_Mag",6],
                     ["ACE_HandFlare_Green",6], ["Chemlight_green",10], ["ACE_EntrenchingTool",2],["1Rnd_HE_Grenade_shell",20], 
                     ["30Rnd_556x45_Stanag",40], ["200Rnd_556x45_Box_Tracer_Red_F",10]];

private _backpacksBox = [["B_AssaultPack_rgr", 2], ["tf_rt1523g_ocp_big", 1], ["B_UAV_01_backpack_F", 1]];

private _itemsKitbagMedical = [["ACE_packingBandage",20], ["ACE_elasticBandage",20], ["ACE_quikclot",20], ["ACE_morphine",10], ["ACE_epinephrine",10],
                               ["ACE_salineIV_500",10], ["ACE_tourniquet",5], ["ACE_surgicalKit",5], ["ACE_EarPlugs",4], ["ACE_CableTie",5]];

private _itemsMedicPack = [["ACE_packingBandage",20], ["ACE_fieldDressing",15], ["ACE_elasticBandage",15], ["ACE_quikclot",15], ["ACE_epinephrine",5],
                           ["ACE_morphine",5], ["ACE_tourniquet",5], ["ACE_surgicalKit",3], ["ACE_salineIV_500",4], ["ACE_EarPlugs",2]];


{
    private _vic = _x;

    clearWeaponCargoGlobal _vic;
    clearmagazineCargoGlobal _vic;
    clearitemCargoGlobal _vic;
    clearBackpackCargoGlobal _vic;

    // Add medical backpacks
    _vic addBackpackCargoGlobal ["B_Kitbag_rgr", 1];
    _vic addBackpackCargoGlobal ["CUP_B_MedicPack_ACU", 1];

    // Fill up medical backpacks
    {
        if (typeof _x isEqualTo "B_Kitbag_rgr") then {
            private _backpack = _x;
            {
                _backpack addItemCargoGlobal _x;
            } forEach _itemsKitbagMedical;
        };
        if (typeof _x isEqualTo "CUP_B_MedicPack_ACU") then {
            private _backpack = _x;
            {
                _backpack addItemCargoGlobal _x;
            } forEach _itemsMedicPack;
        };
    } forEach (everyBackpack _vic);

    // Add rest of the backpacks
    {
        _vic addBackpackCargoGlobal _x;
    } forEach _backpacksBox;

    // Add items to the box
    {
        _vic addItemCargoGlobal _x;
    } forEach _itemsBox;
} forEach _this;
