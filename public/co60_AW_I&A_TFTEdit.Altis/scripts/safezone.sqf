/*
GrenadeStop v0.8

AUTHOR:
    Bake
    Modified by FitzGerald [TFT8], YoursTruly [TFT8]

DESCRIPTION:
    Stops players from throwing grenades and firing weapons in safety zones.

CONFIGURATION:
    Edit the #defines below.
_______________________________________________________________________*/

#define SAFETY_ZONES    [["respawn_west", 150], ["respawn_pilot", 150]] // Syntax: [["marker1", radius1], ["marker2", radius2], ...]
#define MESSAGE "Weapon use in BluFor controlled areas is prohibited & can get you banned."

waitUntil {!isNull player};

player addEventHandler ["FiredMan", {
    if ({(_this select 0) distance getMarkerPos (_x select 0) < _x select 1} count SAFETY_ZONES > 0) then {
        deleteVehicle (_this select 6);
        "Go give it to the enemy!" hintC MESSAGE;
    };
}];
