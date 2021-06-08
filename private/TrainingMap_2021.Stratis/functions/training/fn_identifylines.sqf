/*
 * Author: yourstruly
 * Present each BRM line for a few seconds.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * call TFT_fnc_identifyLines
 */

_participants = ((getMarkerPos "brm_participants1") nearEntities ["CAManBase", 25]) +
                ((getMarkerPos "brm_participants2") nearEntities ["CAManBase", 25]);

"Lane identification" remoteExec ["hint", _participants];
["BRM", 1] call TFT_fnc_toggleTargets;
sleep 3;

_down = "BRM";
{
    [_down, 1] call TFT_fnc_toggleTargets;
    _down = _x;
    [_x, 0] call TFT_fnc_toggleTargets;
    format["Lane %1", _forEachIndex+1] remoteExec ["hint", _participants];
    sleep 3;
} forEach ["line1", "line2", "line3", "line4","line5","line6","line7","line8","line9"];

"Lane identification complete" remoteExec ["hint", _participants];
["BRM", 0] call TFT_fnc_toggleTargets;
