/*
 * Author: yourstruly
 * Prepare everything for counting time and displaying it on proper screens.
 *
 * Arguments:
 * 0: Object to which action is assigned <OBJECT>
 * 1: Screens for displaying time (must always be 5) <ARRAY>
 * 2: Condition for timer ending <CODE>
 *
 * Return Value:
 * -
 *
 * Example:
 * [screen, [s1, s2, s3, s4, s5], { count _targets == 0}] call TFT_fnc_startTimer
 */
params ["_screen", "_timeDisplays", "_condition"];

sleep 1;
_screen setObjectTextureGlobal [0, 'images\status\inProgress.paa'];

private _time = 0;
while {! call _condition} do {
    _time = _time + 1;
    private _sec = _time % 60;
    private _min = floor (_time / 60);
    (_timeDisplays select 0) setObjectTextureGlobal [0, format['images\numbers\%1.paa', _sec % 10]];
    (_timeDisplays select 1) setObjectTextureGlobal [0, format['images\numbers\%1.paa', floor (_sec / 10)]];
    (_timeDisplays select 2) setObjectTextureGlobal [0, 'images\numbers\colon.paa'];
    (_timeDisplays select 3) setObjectTextureGlobal [0, format['images\numbers\%1.paa', _min % 10]];
    (_timeDisplays select 4) setObjectTextureGlobal [0, format['images\numbers\%1.paa', floor (_min / 10)]];
    sleep 1;
};

_screen setObjectTextureGlobal [0, 'images\status\complete.paa'];
sleep 3;
