/*
    Needed Mods:
    - None

    Optional Mods:
    - None
*/

// Enemy infantry classes
opfor_officer = "tft_ta_officer";                                          // Officer
opfor_squad_leader = "tft_ta_leader";                                  // Squad Leader
opfor_team_leader = "tft_ta_rto";                                   // Team Leader
opfor_sentry = "tft_ta_rifleman_light";                                      // Rifleman (Lite)
opfor_rifleman = "tft_ta_rifleman";                                         // Rifleman
opfor_rpg = "tft_ta_rifleman_lightat";                                          // Rifleman (LAT)
opfor_grenadier = "tft_ta_grenadier";                                     // Grenadier
opfor_machinegunner = "tft_ta_autorifleman";                                 // Autorifleman
opfor_heavygunner = "tft_ta_machgun";                                  // Heavy Gunner
opfor_marksman = "tft_ta_marksman";                                       // Marksman
opfor_sharpshooter = "tft_ta_marksman_m107";                                // Sharpshooter
opfor_sniper = "tft_ta_sniper";                                            // Sniper
opfor_at = "tft_ta_rifleman_at";                                            // AT Specialist
opfor_aa = "tft_ta_rifleman_aa";                                            // AA Specialist
opfor_medic = "tft_ta_medic";                                              // Combat Life Saver
opfor_engineer = "tft_ta_engineer";                                        // Engineer
opfor_paratrooper = "tft_ta_paratrooper";                                   // Paratrooper

// Enemy vehicles used by secondary objectives.
opfor_mrap = "tft_ta_fennek";                                           // Fennek
opfor_mrap_armed = "tft_ta_fennek_hmg";                                 // Fennek (HMG)
opfor_transport_helo = "tft_ta_mi8";                               		// Mi-8
opfor_transport_truck = "tft_ta_tatra";                         		// Tatra
opfor_ammobox_transport = "tft_ta_tatra";                    			// Tatra -> Has to be able to transport resource crates!
opfor_fuel_truck = "tft_ta_tatra_fuel";                                 // Tatra (Fuel)
opfor_ammo_truck = "tft_ta_tatra_ammo";                                 // Tatra (Ammo)
opfor_fuel_container = "Land_Pod_Heli_Transport_04_fuel_F";             // Taru Fuel Pod
opfor_ammo_container = "Land_Pod_Heli_Transport_04_ammo_F";             // Taru Ammo Pod
opfor_flag = "threepercenters_Flag";                                    // Flag

/* Adding a value to these arrays below will add them to a one out of however many in the array, random pick chance.
Therefore, adding the same value twice or three times means they are more likely to be chosen more often. */

/* Militia infantry. Lightweight soldier classnames the game will pick from randomly as sector defenders.
Think of them like garrison or military police forces, which are more meant to control the local population instead of fighting enemy armies. */
militia_squad = [
    "tft_ta_rifleman_light",                                            // Rifleman (Lite)
    "tft_ta_rifleman_light",                                            // Rifleman (Lite)
    "tft_ta_rifleman_light",                                            // Rifleman (Lite)
    "tft_ta_rifleman",                                                  // Rifleman
    "tft_ta_rifleman_lightat",                                          // Rifleman (Light AT)
    "tft_ta_autorifleman",                                              // Autorifleman
    "tft_ta_marksman",                                                  // Marksman
    "tft_ta_medic",                                                     // Medic
    "tft_ta_engineer"                                                   // Engineer
];

// Militia vehicles. Lightweight vehicle classnames the game will pick from randomly as sector defenders. Can also be empty for only infantry milita.
militia_vehicles = [
    "tft_ta_mb4wd_mg",                                                 // Jeep (MG)
	"tft_ta_mb4wd_at",												   // Jeep (AT)
	"tft_ta_hmmwv_m2"												   // HMMWV (M2)
];

// All enemy vehicles that can spawn as sector defenders and patrols at high enemy combat readiness (aggression levels).
opfor_vehicles = [
    "tft_ta_hmmwv_m2",                                                  // HMMWV (M2)
    "tft_ta_hmmwv_m2",                                                  // HMMWV (M2)
    "tft_ta_hmmwv_mk19",                                                // HMMWV (Mk 19)
    "tft_ta_hmmwv_tow",                                                 // HMMWV (TOW)
    "tft_ta_stryker_mgs",                                        		// Styker (MGS)
    "tft_ta_brdm2",                                          			// BRDM-2
    "tft_ta_brdm2",                                           			// BRDM-2
    "tft_ta_ural_zu23",                                                 // Ural (ZU-23)
    "tft_ta_btr80a",                                              		// BTR-80A
    "tft_ta_bmp2",                                              		// BMP-2
    "tft_ta_m60a3"                                               		// M60A3
];

// All enemy vehicles that can spawn as sector defenders and patrols but at a lower enemy combat readiness (aggression levels).
opfor_vehicles_low_intensity = [
    "tft_ta_mb4wd_mg",                                                  // Jeep (M2)
    "tft_ta_mb4wd_mg",                                                  // Jeep (M2)
    "tft_ta_mb4wd_at",                                                  // Jeep (AT)
	"tft_ta_fennek_hmg"													// Fennek (HMG)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at high enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles = [
    "tft_ta_fennek_hmg",										// Fennek (HMG)
	"tft_ta_fennek_hmg",										// Fennek (HMG)
	"tft_ta_fennek_hmg",										// Fennek (HMG)
	"tft_ta_fennek_gmg",										// Fennek (GMG)
	"tft_ta_btr80a",											// BTR-80A
	"tft_ta_btr80a",											// BTR-80A
	"tft_ta_btr80",												// BTR-80
	"tft_ta_btr80",												// BTR-80
	"tft_ta_stryker_m2",										// Styker (M2)
	"tft_ta_stryker_m2",										// Styker (M2)
	"tft_ta_stryker_mk19",										// Styker (Mk 19)
	"tft_ta_stryker_mk19",										// Styker (Mk 19)
	"tft_ta_stryker_atgmv",										// Styker (ATGMV)
	"tft_ta_stryker_atgmv",										// Styker (ATGMV)
	"tft_ta_stryker_mgs",                                       // Styker (MGS)
	"tft_ta_stryker_mgs",                                       // Styker (MGS)
	"tft_ta_hmmwv_aa",											// HMMWV (AA)
	"tft_ta_hmmwv_aa",											// HMMWV (AA)
	"tft_ta_bmp2",												// BMP-2
	"tft_ta_t72",												// T-72
	"tft_ta_m60a3",												// M-60A3
	"tft_ta_superhind_mkiv",									// Superhind
	"tft_ta_mh60l",												// Daphawk
	"tft_ta_mi8tv3",											// Mi-8 ("DAP")
	"tft_ta_ah6j",												// Littlebird (CAS)
	"tft_ta_ah6j"												// Littlebird (CAS)
];

// All enemy vehicles that can spawn as battlegroups, either assaulting or as reinforcements, at lower enemy combat readiness (aggression levels).
opfor_battlegroup_vehicles_low_intensity = [
    "tft_ta_hmmwv_m2",											// HMMWV (M2)
	"tft_ta_hmmwv_m2",											// HMMWV (M2)
	"tft_ta_hmmwv_mk19",										// HMMWV (Mk 19)
	"tft_ta_tatra",												// Tatra (Transport)
	"tft_ta_tatra",												// Tatra (Transport)
	"tft_ta_btr80",												// BTR-80
	"tft_ta_ural_zu23"											// Ural (ZU-23)
];

/* All vehicles that spawn within battlegroups (see the above 2 arrays) and also hold 8 soldiers as passengers.
If something in this array can't hold all 8 soldiers then buggy behaviours may occur.    */
opfor_troup_transports = [
    "tft_ta_stryker_mk19",										// Styker (Mk 19)
	"tft_ta_stryker_mk19",										// Styker (Mk 19)
	"tft_ta_btr80a",											// BTR-80A
	"tft_ta_btr80",												// BTR-80
	"tft_ta_bmp2",												// BMP-2
	"tft_ta_superhind_mkiv",									// Superhind
	"tft_ta_mh60l",												// Daphawk
	"tft_ta_mi8tv3",											// Mi-8 ("DAP")
	"tft_ta_tatra"												// Tatra (Transport)
];

// Enemy rotary-wings that will need to spawn in flight.
opfor_choppers = [
    "tft_ta_ah6j",												// Littlebird (CAS)
    "tft_ta_mh6m",												// Littlebird (Transport)
    "tft_ta_mh60l",												// Daphawk
    "tft_ta_uh60m",												// Blackhawk (Transport)
    "tft_ta_superhind_mkiv",									// Superhind
    "tft_ta_mi8tv3",											// Mi-8 ("DAP")
    "tft_ta_mi8"												// Mi-8 (Transport)
];

// Enemy fixed-wings that will need to spawn in the air.
opfor_air = [
    "tft_ta_su25",												// Frogfoot
    "tft_ta_l39za",												// L-39ZA
    "tft_ta_l159",												// L-159
    "tft_ta_jas39"                                              // Griphen C
];
