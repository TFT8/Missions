call TFT_fnc_prepPhaseInit;

if(isServer) then {
    _curator = (createGroup sideLogic) createUnit ["ModuleCurator_F", [0,0,0], [], 0, "NONE"]; 
    _curator setVariable ["Addons", 3, true]; 
    _curator setVariable ["Owner", "#adminLogged", true];
};
