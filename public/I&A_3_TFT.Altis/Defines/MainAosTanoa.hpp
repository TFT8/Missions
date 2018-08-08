/*
Author: BACONMOP
Description: Defines MAin Ao's n shiz
Contributors: Zissou & Pero
*/

class AOs{

	class Imuri_Island {
		name =  "Imuri Island";
		nearlocations[]={
			"Lailai",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Blerick"
		};
		type = "Outpost";
		vehicles[] = {};
	};
    class Blerick {
		name =  "Blerick";
		nearlocations[]={
			"Moddergat",
			"Lijnhaven",
			"Rereki",
			"Griz_Pass"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Lailai {
		name =  "Lailai";
		nearlocations[]={
			"Imuri_Island",
			"Bacons_Mound",
			"Moddergat",
			"KatKoula"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class base {
		name =  "Base";
		nearlocations[]={
			"Imuri_Island",
			"Bacons_Mound",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Rautake"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Bacons_Mound {
		name =  "Bacons Mound";
		nearlocations[]={
			"KatKoula",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Blerick",
			"Namuvaka"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class KatKoula {
		name =  "KatKoula";
		nearlocations[]={
			"Moddergat",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Rautake",
			"Balavu"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Namuvaka {
		name =  "Namuvaka";
		nearlocations[]={
			"Lailai",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Blerick",
			"Rautake",
			"Tavu"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Dr_Steve_Zissou_Center_For_Aquatic_Excellence {
		name =  "Dr Steve Zissou Center For Aquatic Excellence";
		nearlocations[]={
			"Namuvaka",
			"Balavu",
			"Tavu",
			"Railway_Depot"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Tavu {
		name =  "Tavu";
		nearlocations[]={
			"Namuvaka",
			"Balavu",
			"Railway_Depot",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Sosovu",
			"Rautake"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Balavu {
		name =  "Balavu";
		nearlocations[]={
			"Namuvaka",
			"Tavu",
			"Railway_Depot",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Sosovu",
			"Rautake"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Rautake {
		name =  "Rautake";
		nearlocations[]={
			"Namuvaka",
			"Tavu",
			"Railway_Depot",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Sosovu",
			"KatKoula",
			"Int_Airport"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Sosovu {
		name =  "Sosovu";
		nearlocations[]={
			"Railway_Depot",
			"Belfort",
			"Dr_Steve_Zissou_Center_For_Aquatic_Excellence",
			"Tuvanaka",
			"Tuvanaka_Airbase",
			"Vehicle_Range",
			"Georgetown"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Belfort {
		name =  "Belfort";
		nearlocations[]={
			"Tuvanaka",
			"Tuvanaka_Airbase",
			"Vehicle_Range",
			"Georgetown",
			"Sosovu",
			"Saint_Julian"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Tuvanaka {
		name =  "Tuvanaka";
		nearlocations[]={
			"Tuvanaka_Airbase",
			"Vehicle_Range",
			"Georgetown",
			"Sosovu",
			"Saint_Julian",
			"Belford"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Tuvanaka_Airbase {
		name =  "Tuvanaka Airbase";
		nearlocations[]={
			"Tuvanaka",
			"Vehicle_Range",
			"Georgetown",
			"Sosovu",
			"Saint_Julian",
			"Belford"
		};
		type = "Base";
		respawnPos = "tuv_air_pl_res";
		visMrkr = "FOB_Eagle";
		vehicles[] = {
			{"I_Plane_Fighter_03_CAS_F", "tuv_air_jet",3600},
			{"O_Heli_Light_02_unarmed_F", "tuv_air_heli1",1200},
			{"O_T_VTOL_02_vehicle_F", "tuv_air_heli2",2700},
			{"B_T_Truck_01_fuel_F", "tuv_air_veh1",300},
			{"B_T_Truck_01_Repair_F", "tuv_air_veh2",300},
			{"B_T_Truck_01_ammo_F", "tuv_air_veh3",300},
			{"B_T_APC_Wheeled_01_cannon_F", "tuv_air_veh4",900},
			{"B_T_APC_Wheeled_01_cannon_F", "tuv_air_veh5",900},
			{"B_T_APC_Tracked_01_AA_F", "tuv_air_veh6",1200}
		};
	};
	class Vehicle_Range {
		name =  "Vehicle Range";
		nearlocations[]={
			"Tuvanaka",
			"Georgetown",
			"Sosovu",
			"Saint_Julian",
			"Belford",
			"Railway_Depot",
			"Tuvanaka_Airbase"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Arch_Of_The_Spartans {
		name =  "Arch Of The Spartans";
		nearlocations[]={
			"Ipota",
			"Vehicle_Range",
			"La_Rochelle",
			"Penelo",
			"La_Rochelle_Aerodome"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Ipota {
		name =  "Ipota";
		nearlocations[]={
			"Vehicle_Range",
			"La_Rochelle",
			"Penelo",
			"La_Rochelle_Aerodome",
			"Blue_Pearl_industrial_Port"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Rereki {
		name =  "Rereki";
		nearlocations[]={
			"Lijnhaven",
			"Belrick",
			"Girz_Pass",
			"Moddergat",
			"Doodstil",
			"Harcourt",
			"Marsh_Of_The_Muck_Duck",
			"KatKoula"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Lijnhaven {
		name =  "Lijnhaven";
		nearlocations[]={
			"Belrick",
			"Girz_Pass",
			"Moddergat",
			"Doodstil",
			"Harcourt",
			"Marsh_Of_The_Muck_Duck",
			"KatKoula",
			"Rereki"
		};
		type = "Base";
		respawnPos = "lijn_pl_res";
		visMrkr = "FOB_Fin";
		vehicles[] = {
			{"B_T_Boat_Armed_01_minigun_F", "lijn_boat1",300},
			{"B_T_Boat_Transport_01_F", "ljin_boat2",300},
			{"B_T_Boat_Transport_01_F", "ljin_boat3",300},
			{"B_T_Boat_Armed_01_minigun_F", "ljin_boat4",300},
			{"B_SDV_01_F", "ljin_sub1",300},
			{"B_SDV_01_F", "ljin_sub2",300},
			{"B_Heli_Transport_03_unarmed_F", "ljin_air1",300}
		};
	};
	class Belrick {
		name =  "Belrick";
		nearlocations[]={
			"Lijnhaven",
			"Girz_Pass",
			"Moddergat",
			"Doodstil",
			"Harcourt",
			"Marsh_Of_The_Muck_Duck",
			"KatKoula",
			"Rereki"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Moddergat {
		name =  "Moddergat";
		nearlocations[]={
			"Lijnhaven",
			"Girz_Pass",
			"Doodstil",
			"Harcourt",
			"Marsh_Of_The_Muck_Duck",
			"KatKoula",
			"Belrick",
			"Rereki",
			"Oumere"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Harcourt {
		name =  "Harcourt";
		nearlocations[]={
			"Lijnhaven",
			"Girz_Pass",
			"Doodstil",
			"Marsh_Of_The_Muck_Duck",
			"KatKoula",
			"Belrick",
			"Rereki",
			"Oumere",
			"Moddergat"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Doodstil {
		name =  "Doodstil";
		nearlocations[]={
			"Lijnhaven",
			"Girz_Pass",
			"Doodstil",
			"Marsh_Of_The_Muck_Duck",
			"KatKoula",
			"Belrick",
			"Rereki",
			"Oumere",
			"Moddergat",
			"Harcourt"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Girz_Pass {
		name =  "Girz Pass";
		nearlocations[]={
			"Lijnhaven",
			"Doodstil",
			"Marsh_Of_The_Muck_Duck",
			"KatKoula",
			"Belrick",
			"Rereki",
			"Oumere",
			"Moddergat",
			"Harcourt",
			"Doodstil"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Marsh_Of_The_Muck_Duck {
		name =  "Marsh Of The Muck Duck";
		nearlocations[]={
			"Harcourt",
			"Oumere",
			"Temple_of_the_Dingo",
			"Moddergat",
			"KatKoula"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Temple_of_the_Dingo {
		name =  "Temple of the Dingo";
		nearlocations[]={
			"Marsh_Of_The_Muck_Duck",
			"Pero_del_Pero",
			"Tuvanaka",
			"Vagalala",
			"Oumere"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Oumere {
		name =  "Oumere";
		nearlocations[]={
			"Marsh_Of_The_Muck_Duck",
			"Temple_of_the_Dingo",
			"Pero_del_Pero",
			"Vagalala",
			"Tanouka"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Pero_del_Pero {
		name =  "Pero del Pero";
		nearlocations[]={
			"Blue_Pearl_industrial_Port",
			"Oumere",
			"Temple_of_the_Dingo",
			"Red_Spring",
			"Abandoned_Mine"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Vagalala {
		name =  "Vagalala";
		nearlocations[]={
			"Red_Spring",
			"Pero_del_Pero",
			"Temple_of_the_Dingo",
			"Tanouka",
            "Tanouka_Sugar_Company",
			"Abandoned_Mine"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Red_Spring {
		name =  "Red Spring";
		nearlocations[]={
			"Tiger_Jungle",
			"Blue_Pearl_industrial_Port",
			"Abandoned_Mine",
			"Nasau",
			"Mount_Tanoa",
            "Dr_Venkman_Observatory"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Tanouka {
		name =  "Tanouka";
		nearlocations[]={
			"Tanouka_Sugar_Company",
			"Sheeps_Hump",
			"Temple_of_the_Dingo",
			"Galili",
			"Georgetown"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Tanouka_Sugar_Company {
		name =  "Tanouka Sugar Company";
		nearlocations[]={
			"Sheeps_Hump",
			"Galili",
			"Georgetown",
			"Tanouka",
			"Railway_Depot"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Tiger_Jungle {
		name =  "Tiger Jungle";
		nearlocations[]={
			"Blue_Pearl_industrial_Port",
			"Ipota",
			"La_Rochelle_Aerodome",
			"Nasau",
			"Abandoned_Mine"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Georgetown {
		name =  "Georgetown";
		nearlocations[]={
			"Saint_Julian",
			"Railway_Depot",
			"Sosovu",
			"Sheeps_Hump",
			"Belfort"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Saint_Julian {
		name =  "Saint Julian";
		nearlocations[]={
			"Galili",
			"Georgetown",
			"Vehicle_Range",
			"Belfort",
			"Sosovu"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Sheeps_Hump {
		name =  "Sheeps_Hump";
		nearlocations[]={
			"Tanouka",
			"Tanouka_Sugar_Company",
			"Georgetown",
			"Saint_Julian",
			"Railway_Depot",
			"Sosovu",
			"Int_Airport"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Galili {
		name =  "Galili";
		nearlocations[]={
			"Georgetown",
			"Saint_Julian",
			"Railway_Depot",
			"Sosovu",
			"Dr_Venkman_Observatory",
			"Mount_Tanoa"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Railway_Depot {
		name =  "Railway Depot";
		nearlocations[]={
			"Balavu",
			"Sosovu",
			"Georgetown",
			"Belfort",
			"Sheeps_Hump",
			"Int_Airport"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Abandoned_Mine {
		name =  "Abandoned Mine";
		nearlocations[]={
			"Tiger_Jungle",
			"Nasau",
			"Blue_Pearl_industrial_Port",
			"Red_Spring",
			"Penelo"
		};
		type = "Base";
		respawnPos = "mine_pl_res";
		visMrkr = "FOB_Comms_Bravo";
		vehicles[] = {
			{"B_T_LSV_01_armed_F", "mine_veh1",300},
			{"B_T_LSV_01_armed_F", "mine_veh2",300},
			{"B_T_APC_Wheeled_01_cannon_F", "mine_veh3",900},
			{"B_T_LSV_01_unarmed_F", "mine_veh4",300},
			{"B_T_LSV_01_unarmed_F", "mine_veh5",300},
			{"B_T_Truck_01_transport_F", "mine_veh6",300}
		};
	};
	class Dr_Venkman_Observatory {
		name =  "Dr Venkman Observatory";
		nearlocations[]={
			"Mount_Tanoa",
			"Galili",
			"Abandoned_Mine",
			"La_Rochelle_Aerodome",
			"La_Rochelle",
			"Penelo"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Mount_Tanoa {
		name =  "Mount Tanoa";
		nearlocations[]={
			"Dr_Venkman_Observatory",
			"Abandoned_Mine",
			"Galili",
			"La_Rochelle_Aerodome",
			"La_Rochelle",
			"Penelo"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Penelo {
		name =  "Penelo";
		nearlocations[]={
			"Nasau",
			"La_Rochelle_Aerodome",
			"La_Rochelle",
			"Ipota",
			"Arch_Of_The_Spartans"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class La_Rochelle {
		name =  "La Rochelle";
		nearlocations[]={
			"Arch_Of_The_Spartans",
			"Ipota",
			"Galili",
			"Penelo",
			"La_Rochelle_Aerodome"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class La_Rochelle_Aerodome {
		name =  "La Rochelle Aerodome";
		nearlocations[]={
			"Arch_Of_The_Spartans",
			"Ipota",
			"Galili",
			"Penelo",
			"La_Rochelle",
			"Blue_Pearl_industrial_Port"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Nasau {
		name =  "Nasau";
		nearlocations[]={
			"Tiger_Jungle",
			"Abandoned_Mine",
			"Dr_Venkman_Observatory",
			"Penelo",
			"Mount_Tanoa"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Blue_Pearl_industrial_Port {
		name =  "Blue Pearl industrial Port";
		nearlocations[]={
			"Pero_del_Pero",
			"Red_Spring",
			"Tiger_Jungle",
			"Nasau",
			"La_Rochelle_Aerodome",
			"La_Rochelle",
			"Penelo"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Int_Airport {
		name = "International Airpot of Tanoa";
		nearlocations[]={
			"Railway_Depot",
			"Rautake",
			"Sheeps_Hump"
		};
		type = "Base";
		respawnPos = "Int_Air_pl_res";
		visMrkr = "FOB_International_Airport";
		vehicles[] = {
			{"B_Plane_CAS_01_F", "int_air_jet",5400},
			{"B_Heli_Light_01_F", "int_air_heli1",900},
			{"B_T_VTOL_01_vehicle_F", "int_air_heli2",600},
			{"B_Truck_01_fuel_F", "int_air_veh1",300},
			{"B_Truck_01_ammo_F", "int_air_veh2",300},
			{"B_Truck_01_Repair_F", "int_air_veh5",300},
			{"B_T_APC_Wheeled_01_cannon_F", "int_air_veh3",900},
			{"B_T_APC_Tracked_01_rcws_F", "int_air_veh4",900},
			{"B_T_MBT_01_TUSK_F", "int_air_veh6",1200}
		};
	};
};
