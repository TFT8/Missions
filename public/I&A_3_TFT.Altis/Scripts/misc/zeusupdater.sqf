//  ZeusPlayerUpdate Loop     //
//scripts\misc\zeusupdater.sqf//
//      MykeyRM [AW]          //
////////////////////////////////

//zeusupdater.sqf

waitUntil {time > 3};
call {while {true} do {objectsToAdd = (entities "AllVehicles" - entities "Animal" - entities "RoadCone_L_F" - [FreedomRepairs, FreedomFuel,FreedomAmmo,Quartermaster,Quartermaster_1,Quartermaster_2,Quartermaster_3,Quartermaster_4,Quartermaster_5,RescueMe,artyMLRS,artySorcher,Quartermaster_2]); publicVariable "objectsToAdd";{_x addCuratorEditableObjects [(objectsToAdd), true]; } foreach allCurators; sleep 180;};};

//player groupChat "Zeus unit updater running";        //Can have hint that updater is running on startup remove // to activate.
