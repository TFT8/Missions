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
_boundTrg1 = createTrigger ["EmptyDetector",[6393.1,5368.587,0]];
_boundTrg1 setTriggerArea [30,4,30,true,311];
_boundTrg1 setTriggerActivation["WEST","PRESENT",false];
_boundTrg1 setTriggerStatements ["this","['bSec1', 0] call TFT_fnc_toggleTargets",""];

_boundTrg2 = createTrigger ["EmptyDetector",[6387.316,5362.375,0]];
_boundTrg2 setTriggerArea [30,4,30,true,311];
_boundTrg2 setTriggerActivation["WEST","PRESENT",false];
_boundTrg2 setTriggerStatements ["this","['bSec2', 0] call TFT_fnc_toggleTargets",""];

_boundTrg3 = createTrigger ["EmptyDetector",[6379.056,5352.767,0]];
_boundTrg3 setTriggerArea [30,4,30,true,311];
_boundTrg3 setTriggerActivation["WEST","PRESENT",false];
_boundTrg3 setTriggerStatements ["this","['bSec3', 0] call TFT_fnc_toggleTargets",""];

_boundTrg4 = createTrigger ["EmptyDetector",[6370.688,5342.83,0]];
_boundTrg4 setTriggerArea [30,4,30,true,311];
_boundTrg4 setTriggerActivation["WEST","PRESENT",false];
_boundTrg4 setTriggerStatements ["this","['bSec4', 0] call TFT_fnc_toggleTargets",""];

_boundTrg5 = createTrigger ["EmptyDetector",[6359.068,5331.506,0]];
_boundTrg5 setTriggerArea [30,4,30,true,311];
_boundTrg5 setTriggerActivation["WEST","PRESENT",false];
_boundTrg5 setTriggerStatements ["this","['bSec5', 0] call TFT_fnc_toggleTargets",""];

hint "Bounding course reset";
