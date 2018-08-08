//-------------------- Wait for player to action

[[player,"AinvPknlMstpSlayWrflDnon_medic"],"QS_fnc_switchMoveMP",nil,false] spawn BIS_fnc_MP;

sleep 1;



//-------------------- Send hint to player that he's planted the bomb

hint "The pilot is healed, good job.  He'll find his own way home";

sleep 1;

[] remoteExec ["Aw_fnc_smSucSwitch",2];