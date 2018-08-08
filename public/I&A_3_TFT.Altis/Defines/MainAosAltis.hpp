/*
Author: BACONMOP
Description: Defines MAin Ao's n shiz
Contributors: Zissou & Pero
*/

class AOs{
	class AAC_Airfield {
		name =  "AAC Airfield";
		nearlocations[]={
			"Melanera_Bay",
			"Therisa",
			"Katalaki",
			"Katalaki_Penninsula",
			"Faronaki"
		};
		type = "Base";
		respawnPos = "aac_pl_res";
		visMrkr = "FOB_Martian";
		vehicles[] =
		{
			{"I_Plane_Fighter_03_AA_F", "aac_jet_spawn",1800},
			{"I_Heli_light_03_unarmed_F", "aac_heli1",450},
			{"I_Heli_light_03_unarmed_F", "aac_heli2",450},
			{"I_Heli_Transport_02_F", "aac_heli3",300},
			{"B_MRAP_01_hmg_F", "aac_veh1",300},
			{"B_MRAP_01_gmg_F", "aac_veh2",300},
			{"B_Truck_01_ammo_F", "aac_veh3",700},
			{"B_APC_Wheeled_01_cannon_F", "aac_veh4",1200},
			{"B_APC_Wheeled_01_cannon_F", "aac_veh5",1200},
			{"B_APC_Tracked_01_AA_F", "aac_veh6",1200}
		};
	};
	class Base {
		name =  "Camp Landfell";
		nearlocations[]={
			"Skopos",
			"Cap_Makrinos",
		};
		type = "MainBase";
		vehicles[] = {};
	};
	class Skopos {
		name =  "Skopos";
		nearlocations[]={
			"Cap_Makrinos",
			"Castle_Ruins",
			"Vikos_Outpost",
			"Melanera_Bay"
		};
		type = "Hill";
		vehicles[] = {};
	};
	class Cap_Makrinos {
		name =  "Cap Makrinos";
		nearlocations[]={
			"Skopos",
			"Castle_Ruins",
			"Vikos_Outpost",
			"Faronaki"
		};
		type = "Coastline";
		vehicles[] = {};
	};
	class Castle_Ruins {
		name =  "Castle Ruins";
		nearlocations[]={
			"Skopos",
			"Cap_Makrinos",
			"Vikos_Outpost",
			"Melanera_Bay",
			"Zaros_PowerPlant"
		};
		type = "Hill";
		vehicles[] = {};
	};
	class Vikos_Outpost {
		name =  "Vikos Outpost";
		nearlocations[]={
			"Skopos",
			"Castle_Ruins",
			"Cap_Makrinos",
			"Faronaki"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Melanera_Bay {
		name =  "Melanera Bay";
		nearlocations[]={
			"Castle_Ruins",
			"Vikos_Outpost",
			"Therisa",
			"Zaros",
			"Therisa",
			"Zaros_PowerPlant",
			"AAC_Airfield"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Therisa {
		name =  "Therisa";
		nearlocations[]={
			"Melanera_Bay",
			"AAC_Airfield",
			"Zaros",
			"Katalaki",
			"Katalaki_Penninsula"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Zaros {
		name =  "Zaros";
		nearlocations[]={
			"Melanera_Bay",
			"Therisa",
			"Zaros_PowerPlant",
			"Edessa",
			"Xirolimni_Dam"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Zaros_PowerPlant {
		name =  "Zaros Power Plant";
		nearlocations[]={
			"Xirolimni_Dam",
			"Edessa",
			"Castle_Ruins",
			"A_Dump",
			"Zaros"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Edessa {
		name =  "Edessa";
		nearlocations[]={
			"Zaros",
			"Zaros_PowerPlant",
			"Panochori",
			"Panochori_Bay",
			"A_Dump"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Panochori {
		name =  "Panochori";
		nearlocations[]={
			"A_Dump",
			"Panochori_Bay",
			"Athanos",
			"Neri",
			"Neri_Bay",
			"Edessa"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Panochori_Bay {
		name =  "Panochori Bay";
		nearlocations[]={
			"Panochori",
			"Athanos",
			"Neri",
			"Neri_Bay"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Athanos {
		name =  "Athanos";
		nearlocations[]={
			"Panochori",
			"Panochori_Bay",
			"Athanos",
			"Neri",
			"Neri_Bay"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Neri_Bay {
		name =  "Neri_Bay";
		nearlocations[]={
			"Panochori",
			"Panochori_Bay",
			"Athanos",
			"Neri",
			"Quarry"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Neri {
		name =  "Neri";
		nearlocations[]={
			"Panochori",
			"Panochori_Bay",
			"Athanos",
			"Neri_Bay",
			"Quarry",
			"A_Dump"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Quarry {
		name =  "Quarry";
		nearlocations[]={
			"Panochori",
			"Neri_Bay",
			"A_Dump",
			"Aggelochori_Outskirts"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class A_Dump {
		name =  "A Dump";
		nearlocations[]={
			"Zaros",
			"Zaros_PowerPlant",
			"Edessa",
			"Aggelochori_Outskirts",
			"Panochori"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Aggelochori_Outskirts {
		name =  "Aggelochori Outskirts";
		nearlocations[]={
			//"Aggelochori_Factory",
			"A_Dump",
			"Quarry",
			"Stadium",
			"Power_Plant"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Aggelorchori_Factory {
		name =  "Aggelorchori Factory";
		nearlocations[]={
			"Stadium",
			"Power_Plant",
			"Negadas",
			"Aggelochori_Outskirts"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Stadium {
		name =  "Stadium";
		nearlocations[]={
			"Stadium",
			"Power_Plant",
			"Negadas",
			//"Aggelochori_Factory",
			"Topolia",
			"Agia_Stemma"
		};
		type = "Base";
		respawnPos = "sdm_pl_res";
		visMrkr = "FOB_Marathon";
		vehicles[] =
		{
			{"B_Heli_Light_01_armed_F", "sdm_heli1",1200},
			{"B_Heli_Light_01_F", "sdm_heli2",1200},
			{"B_MRAP_01_hmg_F", "sdm_veh1",300},
			{"B_MRAP_01_gmg_F", "sdm_veh2",300},
			{"B_Truck_01_fuel_F", "sdm_veh3",450},
			{"B_MRAP_01_hmg_F", "sdm_veh4",300},
			{"B_MRAP_01_gmg_F", "sdm_veh5",300},
			{"O_APC_Tracked_02_cannon_F", "sdm_veh6",600}
		};
	};
	class Power_Plant {
		name =  "Power Plant";
		nearlocations[]={
			"Stadium",
			"Negadas",
			//"Aggelochori_Factory",
			"Agios_Konstantinos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Negadas {
		name =  "Negadas";
		nearlocations[]={
			"Power_Plant",
			"Stadium",
			"Topolia",
			"Kore",
			"Kira"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Kira {
		name =  "Kira";
		nearlocations[]={
			"Agios_Konstantinos",
			"Agios_Konstantinos_Turbines",
			"Gori_Woods",
			"Kore"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agios_Konstantinos {
		name =  "Agios_Konstantinos";
		nearlocations[]={
			"Agios_Konstantinos_Turbines",
			"Gori_Woods",
			"Kore",
			"Kira",
			"Negadas"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agios_Konstantinos_Turbines {
		name =  "Agios Konstantinos Turbines";
		nearlocations[]={
			"Agios_Konstantinos",
			"Gori_Woods",
			"Kira",
			"Dump_Station",
			"Oreokastro"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Oreokastro {
		name =  "Oreokastro";
		nearlocations[]={
			"Synneforos",
			"Gori_Woods",
			"Dump_Station",
			"Faros",
			"Agios_Konstantinos_Turbines"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Synneforos {
		name =  "Synneforos";
		nearlocations[]={
			"Oreokastro",
			"Faros",
			"Adbera_Turbines",
			"Abdera_Airstrip",
			"Dump_Station"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Faros {
		name =  "Faros";
		nearlocations[]={
			"Oreokastro",
			"Synneforos",
			"Adbera_Turbines",
			"Abdera_Airstrip",
			"Ammolofi_Bay",
			"Krya_Nera"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Abdera_Airstrip {
		name =  "Abdera Airstrip";
		nearlocations[]={"Synneforos",
			"Adbera_Turbines",
			"Abdera_Airstrip",
			"Ammolofi_Bay",
			"Krya_Nera",
			"Adbera"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Adbera_Turbines {
		name =  "Adbera Turbines";
		nearlocations[]={
			"Faros",
			"Synneforos",
			"Abdera_Airstrip",
			"Ammolofi_Bay",
			"Krya_Nera",
			"Adbera"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	/*class Feres_Town {
		name =  "Feres Town";
		nearlocations[]={
			"Selakano_Town",
			"Selakano_Windmills",
			"Panagia_Town",
			"Livadi_Bay"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Selakano_Town {
		name =  "Selakano Town";
		nearlocations[]={
			"Feres_Town",
			"Selakano_Windmills",
			"Panagia_Town",
			"Livadi_Bay"
		};
		type = "Base";
		respawnPos = "Sel_pl_res";
		visMrkr = "FOB_Dirt_Track";
		vehicles[] =
		{
			{"O_Heli_Attack_02_black_F", "sel_heli1",5400},
			{"B_Heli_Transport_03_F", "sel_heli2",300},
			{"B_MRAP_01_hmg_F", "sel_veh1",300},
			{"B_MRAP_01_gmg_F", "sel_veh2",300},
			{"B_Truck_01_transport_F", "sel_veh3",300},
			{"B_APC_Wheeled_01_cannon_F", "sel_veh4",600},
			{"B_APC_Wheeled_01_cannon_F", "sel_veh5",600},
			{"B_MBT_01_cannon_F", "sel_veh6",1200}
		};
	};
	*/
	class Selakano_Windmills {
		name =  "Selakano Windmills";
		nearlocations[]={
			//"Feres_Town",
			//"Selakano_Town",
			//"Panagia_Town",
			"Livadi_Bay"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	
	/*class Panagia_Town {
		name =  "Panagia Town";
		nearlocations[]={
			//"Feres_Town",
			//"Selakano_Town",
			"Livadi_Bay",
			"Aktinarki",
			"Didymos_Valley",
			"Faronaki_Col"

		};
		type = "Outpost";
		vehicles[] = {};
	};*/
	class Livadi_Bay {
		name =  "Livadi Bay";
		nearlocations[]={
			//"Feres_Town",
			//"Selakano_Town",
			"Aktinarki",
			//"Didymos_Valley",
			"Faronaki_Col",
			"Selakano_Windmills",
			"Didymos_Plain"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	/*class Didymos_Valley {
		name =  "Didymos Valley";
		nearlocations[]={
			"Selakano_Windmills",
			"Didymos_Plain",
			"Faronaki_Col",
			"Livadi_Bay",
			//"Panagia_Town",
			"Faronaki_Quarry"
		};
		type = "Outpost";
		vehicles[] = {};
	};*/
	class Didymos_Plain {
		name =  "Didymos Plain";
		nearlocations[]={
			//"Didymos_Valley",
			"Faronaki_Col",
			"Livadi_Bay",
			//"Panagia_Town",
			"Faronaki_Quarry",
			"Faronaki"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Faronaki {
		name =  "Faronaki";
		nearlocations[]={
			"Katalaki_Penninsula",
			//"Didymos_Valley",
			"Faronaki_Quarry",
			"Didymos_Plain",
			"Vikos_Outpost",
			"Pyrgos_Town",
			"AAC_Airfield"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Faronaki_Quarry {
		name =  "Faronaki Quarry";
		nearlocations[]={
			//"Didymos_Valley",
			"Didymos_Plain",
			"Pyrgos_Town",
			"Faronaki_Col",
			"Chalkeia"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Faronaki_Col {
		name =  "Faronaki Col";
		nearlocations[]={
			"Faronaki_Quarry",
			//"Didymos_Valley",
			"Didymos_Plain",
			"Aktinarki",
			"Chalkeia"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Aktinarki {
		name =  "Aktinarki";
		nearlocations[]={
			//"Panagia_Town",
			"Chalkeia",
			"Cap_Kategidis",
			//"Feres_Town",
			"Faronaki_Col"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Chalkeia {
		name =  "Chalkeia";
		nearlocations[]={
			"Aktinarki",
			"Cap_Kategidis",
			"Faronaki_Col",
			"Dorida"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Pyrgos_Town {
		name =  "Pyrgos";
		nearlocations[]={
			"Dorida",
			"Charkia_Mine",
			"Chelonisi",
			"Faronaki_Quarry",
			"Faronaki",
			"Katalaki_Penninsula",
			"Lakka",
			"Terminal"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Chelonisi {
		name =  "Chelonisi";
		nearlocations[]={
			"Dorida",
			"Charkia_Mine",
			"Faronaki_Quarry",
			"Faronaki",
			"Katalaki_Penninsula",
			"Charkia",
			"Anthrakia"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Dorida {
		name =  "Dorida";
		nearlocations[]={
			"Cap_Kategidis",
			"Limni",
			"Charkia_Mine",
			"Charkia",
			"Chelonisi",
			"Chalkeia",
			"Pyrgos_Town",

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Cap_Kategidis {
		name =  "Cap Kategidis";
		nearlocations[]={
			"Pyrgos_Town",
			"Cap_Thelos",
			"Ochrolimni",
			"Kalochori_Town",
			"Dorida",
			"Limni",
			"Chalkeia",
			"Aktinarki"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Limni {
		name =  "Limni";
		nearlocations[]={
			"Cap_Kategidis",
			"Kalochori_Town",
			"Cap_Thelos",
			"Charkia",
			"Charkia_Mine",
			"Dorida"

		};
		type = "Outpost";
		vehicles[] = {};

	};class Cap_Thelos {
		name =  "Cap Thelos";
		nearlocations[]={
			"Cap_Kategidis",
			"Kalochori_Town",
			"Ochrolimni",
			"Salt_Flats_North",
			"Salt_Flats_South"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Salt_Flats_South {
		name =  "Salt Flats South";
		nearlocations[]={
			"Ochrolimni",
			"Salt_Flats_North",
			"Cap_Thelos",
			"Kalochori_Town"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Charkia {
		name =  "Charkia";
		nearlocations[]={
			"Anthrakia",
			"Rodopoli",
			"Charkia_Mine",
			"Limni"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Charkia_Mine {
		name =  "Charkia Mine";
		nearlocations[]={
			"Charkia",
			"Limni",
			"Dorida",
			"Chelonisi"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Ochrolimni{
		name =  "Ochrolimni";
		nearlocations[]={
			"Salt_Flats_North",
			"Salt_Flats_South",
			"Cap_Thelos",
			"Kalochori_Town",
			"Limni"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Kalochori_Town{
		name =  "Kalochori Town";
		nearlocations[]={
			"Paros_Town",
			"Limni",
			"Salt_Flats_North",
			"Salt_Flats_South",
			"Cap_Thelos"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Paros_Town {
		name =  "Paros Town";
		nearlocations[]={
			"Agios_Georgios",
			"Agios_Petros",
			"Rodopoli",
			"Kalochori_Town"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Rodopoli {
		name =  "Rodopoli";
		nearlocations[]={
			"Kalochori_Town",
			"Agios_Petros",
			"Kalithea",
			"Anthrakia"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agios_Petros {
		name =  "Agios Petros";
		nearlocations[]={
			"Kalithea",
			"Cap_Zeryris",
			"Rodopoli",
			"Agios_Georgios"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agios_Georgios {
		name =  "Agios Georgios";
		nearlocations[]={
			"Hotel",
			"Salt_Flats_South",
			"Agios_Petros",
			"Paros_Town",
			"Cap_Zeryris"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Salt_Flats_North {
		name =  "Salt Flats North";
		nearlocations[]={
			"Salt_Flats_South",
			"Ioannina",
			"Delfinaki",
			"Sofia_Town"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Sofia_Town {
		name =  "Sofia Town";
		nearlocations[]={
			"Gatolia_Hill",
			"Molos_Hill",
			"Nidasos_Hill",
			"Limnichori",
			"Nidasos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Gatolia_Hill {
		name =  "Gatolia Hill";
		nearlocations[]={
			"Sofia_Town",
			"Molos_Airfield",
			"Molos_Bay_South",
			"Molos_Hill",
			"Limnichori"
		};
		type = "Outpost";
		vehicles[] = {};
		};
	class Nidasos {
		name =  "Nidasos";
		nearlocations[]={
			"Nidasos_Hill",
			"Hotel",
			"Sofia_Town",
			"Agios_Andreas"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Molos_Town {
		name =  "Molos Town";
		nearlocations[]={
			"Molos_Hill",
			"Molos_Airfield",
			"Molos_Bay_South",
			"Cap_Strigla"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Cap_Strigla {
		name =  "Cap Strigla";
		nearlocations[]={
			"Molos_Hill",
			"Molos_Airfield",
			"Molos_Bay_South",
			"Molos_Town"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Molos_Airfield {
		name =  "Molos Airfield";
		nearlocations[]={
			"Molos_Hill",
			"Molos_Bay_South",
			"Molos_Town",
			"Cap_Strigla"
		};
		type = "Base";
		respawnPos = "mol_pl_res";
		visMrkr = "FOB_Last_Stand";
		vehicles[] =
		{
			{"B_Plane_CAS_01_F", "mol_jet_spawn",5400},
			{"B_Heli_Light_01_F", "mol_heli1",600},
			{"I_Heli_light_03_F", "mol_heli2",300},
			{"B_MRAP_01_hmg_F", "mol_veh1",300},
			{"B_MRAP_01_gmg_F", "mol_veh2",300},
			{"B_Truck_01_medical_F", "mol_veh3",300},
			{"B_APC_Wheeled_01_cannon_F", "mol_veh4",600},
			{"B_APC_Wheeled_01_cannon_F", "mol_veh5",600},
			{"B_MBT_01_cannon_F", "mol_veh6",1200}
		};
	};
	class Molos_Bay_South {
		name =  "Molos Bay South";
		nearlocations[]={
			"Molos_Hill",
			"Molos_Airfield",
			"Molos_Town",
			"Cap_Strigla"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Molos_Hill {
		name =  "Molos Hill";
		nearlocations[]={
			"Molos_Airfield",
			"Molos_Bay_South",
			"Molos_Town",
			"Cap_Strigla",
			"Limnichori"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Limnichori {
		name =  "Limnichori";
		nearlocations[]={
			"Molos_Airfield",
			"Molos_Bay_South",
			"Molos_Town",
			"Cap_Strigla"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agios_Andreas {
		name =  "Agios Andreas";
		nearlocations[]={
			"Limnichori",
			"Nidasos",
			"Nidasos_Hill",
			"Sofia_Town"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Nidasos_Hill {
		name =  "Nidasos Hill";
		nearlocations[]={
			"Limnichori",
			"Nidasos",
			"Sofia_Town",
			"Hotel"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Hotel {
		name =  "Hotel";
		nearlocations[]={
			"Agios_Georgios",
			"Ioannina",
			"Nidasos",
			"Nidasos_Hill",
			"Delfinaki"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Ioannina {
		name =  "Ioannina";
		nearlocations[]={
			"Agios_Georgios",
			"Hotel",
			"Nidasos",
			"Nidasos_Hill",
			"Delfinaki"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Delfinaki {
		name =  "Delfinaki";
		nearlocations[]={
			"Salt_Flats_North",
			"Ioannina",
			"Sofia_Town",
			"Hotel"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Kalithea {
		name =  "Kalithea";
		nearlocations[]={
			"Cap_Zeryris",
			"Zeloran",
			"Agios_Georgios",
			"Agios_Petros",
			"Anthrakia",
			"Telos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Cap_Zeryris {
		name =  "Cap Zeryris";
		nearlocations[]={
			"Zeloran",
			"Kalithea",
			"Agia_Trida",
			"Athira_Factory",
			"Telos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Anthrakia {
		name =  "Anthrakia";
		nearlocations[]={
			"Neochori",
			"Chelonisi",
			"Kalithea",
			"Athira_Town",
			"Katalaki_Penninsula",
			"Terminal",
			"Telos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Zeloran {
		name =  "Zeloran";
		nearlocations[]={
			"Agia_Trida",
			"Cap_Zeryris",
			"Nychi",
			"Kalithea",
			"Frini",
			"Terminal",
			"Telos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agia_Trida {
		name =  "Agia Trida";
		nearlocations[]={
			"Nychi",
			"Frini",
			"Zeloran",
			"Athira_Factory"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Nychi {
		name =  "Nychi";
		nearlocations[]={
			"Cap_Agrios",
			"Frini_Woods",
			"Frini",
			"Agia_Trida",
			"Zeloran"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Cap_Agrios {
		name =  "Cap Agrios";
		nearlocations[]={
			"Tonos_Bay",
			"Frini_Woods",
			"Nychi",
			"Hill_140",
			"Frini"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Frini {
		name =  "Frini";
		nearlocations[]={
			"Frini_Woods",
			"Agia_Trida",
			"Ifestiona",
			"Athira_Factory"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Frini_Woods {
		name =  "Frini Woods";
		nearlocations[]={
			"Frini",
			"Nychi",
			"Agia_Trida",
			"Hill_140"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Tonos_Bay {
		name =  "Tonos Bay";
		nearlocations[]={
			"Cap_Agrios",
			"Frini_Woods",
			"Hill_140",
			"Krya_Nera"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Hill_140 {
		name =  "Hill 140";
		nearlocations[]={
			"Abdera",
			"Ifestiona",
			"Tonos_Bay",
			"Frini_Woods"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Ammolofi_Bay {
		name =  "Ammolofi Bay";
		nearlocations[]={
			"Krya_Nera",
			"Adbera_Turbines",
			"Abdera_Airstrip",
			"Tonos_Bay"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Krya_Nera {
		name =  "Krya Nera";
		nearlocations[]={
			"Abdera",
			"Ammolofi_Bay",
			"Adbera_Turbines",
			"Galati"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Ifestiona {
		name =  "Ifestiona";
		nearlocations[]={
			"Koroni",
			"Athira_Town",
			"Frini",
			"Hill_140"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Katalaki_Penninsula {
		name =  "Katalaki Penninsula";
		nearlocations[]={
			"Chelonisi",
			"Pyrgos_Town",
			"Faronaki",
			"Neochori",
			"AAC_Airfield"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Katalaki {
		name =  "Katalaki";
		nearlocations[]={
			"Neochori",
			"Katalaki_Penninsula",
			"Therisa",
			"Xirolimni_Dam",
			"Alikampos",
			"AAC_Airfield"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Neochori {
		name =  "Neochori";
		nearlocations[]={
			"Katalaki_Penninsula",
			"Katalaki",
			"Xirolimni_Dam",
			"Koroni",
			"Alikampos",
			"Lakka",
			"Terminal"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Abdera {
		name =  "Abdera";
		nearlocations[]={
			"Abdera_Airstrip",
			"Krya_Nera",
			"Galati",
			"Hill_140"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Dump_Station {
		name =  "Dump Station";
		nearlocations[]={
			"Oreokastro",
			"Synneforos",
			"Agios_Konstantinos_Turbines",
			"Abdera"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Kore {
		name =  "Kore";
		nearlocations[]={
			"Gori_Woods",
			"Negadas",
			"Topolia",
			"Stadium"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Xirolimni_Dam {
		name =  "Xirolimni Dam";
		nearlocations[]={
			"Zaros",
			"Agia_Stemma",
			"Katalaki_Penninsula",
			"Therisa",
			"Alikampos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agios_Dionysios {
		name =  "Agios Dionysios";
		nearlocations[]={
			"Orino",
			"Xirolimni_Dam",
			"Agia_Stemma",
			"Neochori",
			"Alikampos",
			"Lakka"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Syrta {
		name =  "Syrta";
		nearlocations[]={
			"Gori_Woods",
			"Kore",
			"Abdera",
			"Orino"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Koroni {
		name =  "Koroni";
		nearlocations[]={
			"Galati",
			"Ifestiona",
			"Athira_Town",
			"Neochori",
			"Lakka",
			"Terminal"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Orino {
		name =  "Orino";
		nearlocations[]={
			"Agios_Dionysios",
			"Syrta",
			"Galati",
			"Koroni",
			"Lakka"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Galati {
		name =  "Galati";
		nearlocations[]={
			"Abdera",
			"Syrta",
			"Koroni",
			"Ifestiona",
			"Orino"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Athira_Factory {
		name =  "Athira Factory";
		nearlocations[]={
			"Ifestiona",
			"Koroni",
			"Athira_Town",
			"Zeloran",
			"Agia_Trida"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Athira_Town {
		name =  "Athira Town";
		nearlocations[]={
			"Ifestiona",
			"Koroni",
			"Athira_Factory",
			"Zeloran",
			"Terminal",
			"Telos"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Gori_Woods {
		name =  "Gori Woods";
		nearlocations[]={
			"Dump_Station",
			"Abdera",
			"Syrta",
			"Kira"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Agia_Stemma {
		name =  "Agia Stemma";
		nearlocations[]={
			"Topolia",
			"Agios_Dionysios",
			"Xirolimni_Dam",
			"Stadium",
			"Zaros"

		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Topolia {
		name =  "Topolia";
		nearlocations[]={
			"Kore",
			"Agios_Dionysios",
			"Agia_Stemma",
			"Xirolimni_Dam",
			"Stadium"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Alikampos {
		name =  "Alikampos";
		nearlocations[]={
			"Katalaki",
			"Neochori",
			"Agios_Dionysios",
			"Xirolimni_Dam",
			"Lakka"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Lakka {
		name =  "Lakka";
		nearlocations[]={
			"Alikampos",
			"Neochori",
			"Terminal",
			"Orino",
			"Agios_Dionysios"
		};
		type = "Outpost";
		vehicles[] = {};
	};
	class Terminal {
		name =  "Terminal";
		nearlocations[]={
			"Lakka",
			"Neochori",
			"Telos",
			"Athira",
			"Anthrakia"
		};
		type = "Base";
		respawnPos = "term_pl_res";
		visMrkr = "FOB_Guardian";
		vehicles[] =
		{
			{"B_Heli_Light_01_F", "term_heli1",1200},
			{"B_Heli_Attack_01_F", "term_heli2",5400},
			{"O_Heli_Light_02_F", "term_heli3",1200},
			{"O_Heli_Transport_04_covered_F", "term_heli4",600},
			{"B_MRAP_01_hmg_F", "term_veh1",300},
			{"B_MRAP_01_gmg_F", "term_veh2",300},
			{"B_Truck_01_fuel_F", "term_veh3",600},
			{"B_Truck_01_transport_F", "term_veh4",300},
			{"B_Truck_01_transport_F", "term_veh5",300},
			{"B_Truck_01_transport_F", "term_veh6",300},
			{"B_MBT_01_cannon_F", "term_veh7",1200},
			{"I_APC_Wheeled_03_cannon_F", "term_veh8",900}
		};
	};
	class Telos {
		name =  "Telos";
		nearlocations[]={
			"Terminal",
			"Anthrakia",
			"Zeloran",
			"Athira"
		};
		type = "Outpost";
		vehicles[] = {};
	};
};
