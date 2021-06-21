/*
 * Author: yourstruly
 * Add actions and timer to run a course.
 *
 * Arguments:
 * 0: Unique name of the course <STRING>
 * 1: Object (with a screen) to which action is assigned <OBJECT>
 * 2: Screens for displaying time (must always be 5) <ARRAY>
 * 3: Pre-condition to run before timer <CODE>
 * 4: Condition for timer ending <CODE>
 * 5: Post-condition to run after timer <CODE>
 *
 * Return Value:
 * -
 *
 * Example:
 * ["course1", screen, [s1, s2, s3, s4, s5], {}, {kills == 3}, {}] call TFT_fnc_initCourse
 */
params ["_codename", "_screen", "_timerScreens", "_precondition", "_timerCondition", "_postcondition"];

_screen addAction ["Run course", {
    (_this select 3) params ["_codename", "_screen", "_timerScreens", "_precondition", "_timerCondition", "_postcondition"];
    call _precondition;
    _screen setVariable [_codename, true, true];
    
    [_screen, _timerScreens, _timerCondition] call tft_fnc_startTimer;
    
    _screen setVariable [_codename, false, true];
    call _postcondition;
}, _this, 10, true, true, "", format ["! (_target getVariable ['%1', false])", _codename]];

_screen addAction ["Cancel course", {
    (_this select 3) params ["_codename", "_screen", "_postcondition"];
    _screen setVariable [_codename, false, true];
    call _postcondition;
}, [_codename, _screen, _postcondition], 10, true, true, "", format ["_target getVariable ['%1', false]", _codename]];
