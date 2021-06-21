/*
 * Author: Frankie
 * Resets the bounding course with new triggers and lowers all targets.
 *
 * Arguments:
 * -
 *
 * Return Value:
 * -
 *
 * Example:
 * [] call TFT_fnc_resetBounding;
 */

// Make all targets go down
["BOUND", 1] call TFT_fnc_toggleTargets;

sleep 2;

// Create triggers to raise targets once shooter enters area
_boundTrg1 = createTrigger ["EmptyDetector",[2583.72,11483,-0.105]];
_boundTrg1 setTriggerArea [4,31,232,true];
_boundTrg1 setTriggerActivation["WEST","PRESENT",false];
_boundTrg1 setTriggerStatements ["this","['bSec1', 0] call TFT_fnc_toggleTargets",""];

_boundTrg2 = createTrigger ["EmptyDetector",[2593.21,11466.3,0.0299997]];
_boundTrg2 setTriggerArea [4,31,232,true];
_boundTrg2 setTriggerActivation["WEST","PRESENT",false];
_boundTrg2 setTriggerStatements ["this","['bSec2', 0] call TFT_fnc_toggleTargets",""];

_boundTrg3 = createTrigger ["EmptyDetector",[2601.27,11455.2,0]];
_boundTrg3 setTriggerArea [4,31,232,true];
_boundTrg3 setTriggerActivation["WEST","PRESENT",false];
_boundTrg3 setTriggerStatements ["this","['bSec3', 0] call TFT_fnc_toggleTargets",""];

_boundTrg4 = createTrigger ["EmptyDetector",[2608.4,11445.1,0]];
_boundTrg4 setTriggerArea [4,31,232,true];
_boundTrg4 setTriggerActivation["WEST","PRESENT",false];
_boundTrg4 setTriggerStatements ["this","['bSec4', 0] call TFT_fnc_toggleTargets",""];

hint "Bounding course reset";
