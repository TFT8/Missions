if(tft_ch_timer <= 0) exitWith { hint "You have to start the challenge first."; };

[(_this select 0), (_this select 2)] remoteExec ["removeAction", 0, true];
remoteExec ["tft_challenge_fnc_score", 2];
