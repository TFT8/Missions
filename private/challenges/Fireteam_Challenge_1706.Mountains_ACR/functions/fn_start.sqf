[(_this select 0), (_this select 2)] remoteExec ["removeAction", 0, true];

{
    [_x, 1] remoteExec ["lock", 0, true];
} forEach vics;

tft_ch_timer = serverTime;
publicVariableServer "tft_ch_timer";
