/*
@filename: initPlayerLocal.sqf
Author:
    Quiksilver

Last modified:
    2017/01/11

Description:
    Client scripts and event handlers.*/

enableSentences false;

//------------------- client executions
_null = [] execvm "scripts\vehicle\crew\crew.sqf";                                  // vehicle HUD
_null = [] execVM "scripts\restrictions.sqf";                                       // gear restrictions
_null = [] execVM "scripts\pilotCheck.sqf";                                         // pilots only
_null = [] execVM "scripts\jump.sqf";                                               // jump action
_null = [] execVM "scripts\misc\diary.sqf";                                         // diary tabs
_null = [] execVM "scripts\vehicle\fastrope\zlt_fastrope.sqf";                      // heli rope
_null = [] execVM "scripts\playerMarkers.sqf";                                      // blufor map tracker
_null = [] execVM "scripts\safezone.sqf";                                           // SafeZone.

["InitializePlayer", [player, true]] call BIS_fnc_dynamicGroups;                    // Initializes the player/client side Dynamic Groups framework and registers the player group

//-------------------- PVEHs
"showNotification" addPublicVariableEventHandler {
    private ["_type", "_message"];
    _array = _this select 1;
    _type = _array select 0;
    _message = "";
    if (count _array > 1) then { _message = _array select 1; };
    [_type, [_message]] call BIS_fnc_showNotification;
};

"GlobalHint" addPublicVariableEventHandler {
    private ["_GHint"];
    _GHint = _this select 1;
    hint parseText format["%1", _GHint];
};

"hqSideChat" addPublicVariableEventHandler {
    _message = _this select 1;
    [WEST,"HQ"] sideChat _message;
};

"addToScore" addPublicVariableEventHandler {
    ((_this select 1) select 0) addScore ((_this select 1) select 1);
};

"radioTower" addPublicVariableEventHandler {
    "radioMarker" setMarkerPosLocal (markerPos "radioMarker");
    "radioMarker" setMarkerTextLocal (markerText "radioMarker");
    "radioCircle" setMarkerPosLocal (markerPos "radioCircle");
};

"sideMarker" addPublicVariableEventHandler {
    "sideMarker" setMarkerPosLocal (markerPos "sideMarker");
    "sideCircle" setMarkerPosLocal (markerPos "sideCircle");
    "sideMarker" setMarkerTextLocal format["Side Mission: %1",sideMarkerText];
};

"priorityMarker" addPublicVariableEventHandler {
    "priorityMarker" setMarkerPosLocal (markerPos "priorityMarker");
    "priorityCircle" setMarkerPosLocal (markerPos "priorityCircle");
    "priorityMarker" setMarkerTextLocal format["Priority Target: %1",priorityTargetText];
};
