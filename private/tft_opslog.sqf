//player log
if isDedicated then {
    // log time, map, mission
    tft_op_id = format ["%1__%2__%3", "real_date" callExtension "GMT+", worldName, briefingName];
    tft_ops_log = profileNamespace getVariable ["tft_ops_log", []];
    tft_ops_log_index = tft_ops_log pushBack [tft_op_id, []];
    
    // log players
	private NPCs = ["__SERVER__","hc_1","hc_2","hc_3"];
    tft_op_player_list = [];
    addMissionEventHandler ["PlayerConnected",{
        params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
        tft_op_player_list pushBackUnique _name;
        tft_ops_log set [tft_ops_log_index, [tft_op_id, tft_op_player_list - NPCs]];
        profileNamespace setVariable ["tft_ops_log", tft_ops_log];
        saveProfileNamespace
    }];
    
    addMissionEventHandler ["Ended", {
        params ["_endType"];
        tft_ops_log set [tft_ops_log_index, [format ["%1__%2", tft_op_id, time], tft_op_player_list - NPCs]];
    }];
};

/*
GET OPS LOG
(profileNamespace getVariable ["tft_ops_log", []]) joinString (toString [13,10])

CLEAR OPS LOG
profileNamespace setVariable ["tft_ops_log", []]

*/
