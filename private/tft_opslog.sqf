//player log
if isDedicated then {
    // log time, map, mission
    tft_op_id = format ["%1_%2_%3", "real_date" callExtension "GMT+", worldName, briefingName];
    tft_ops_log = profileNamespace getVariable ["tft_ops_log", []];
    tft_ops_log_index = tft_ops_log pushBack [tft_op_id, []];
    
    // log players
    tft_op_player_list = [];
    addMissionEventHandler ["PlayerConnected",{
        params ["_id", "_uid", "_name", "_jip", "_owner", "_idstr"];
        tft_op_player_list pushBackUnique _name;
        tft_ops_log set [tft_ops_log_index, [tft_op_id, tft_op_player_list - ["__SERVER__","hc_2","hc_1","hc_3"]]];
        profileNamespace setVariable ["tft_ops_log", tft_ops_log];
        saveProfileNamespace
    }];
    
    addMissionEventHandler ["Ended", {
        params ["_endType"];
        tft_ops_log set [tft_ops_log_index, [format ["%1_%2", tft_op_id, time], tft_op_player_list - ["__SERVER__","hc_1","hc_2","hc_3"]]];
    }];
};