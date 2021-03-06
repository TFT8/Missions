class CfgORBAT
{
	class JTFSahara
	{
		id = 1;		// Unit ID
		idType = 0;	// Unit ID type
		side = "West"; // Unit side from CfgChainOfCommand >> Sides
		size = "Size1"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
		type = "HQ"; // Unit type from CfgChainOfCommand >> Types
		//insignia = "tft_faction\logo_tft8_512.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
		//colorInsignia[] = {1,1,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
		//commander = "Vires"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
		//commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
		//tags[] = {BIS,TFT8}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
		text = "JTF Operation Sahara"; // Custom text and short text, can still use some arguments when defined:
		// %1 - ID (e.g. "7th")
		// %2 - Type (e.g. "Infantry")
		// %3 - Size (e.g. "Division")
		textShort = "JTF Sahara";
		//texture = "tft_faction\logo_tft8_512.paa"; // Custom texture, will replace icon set by 'type' param.
        class TFT8
        {
            id = 8;		// Unit ID
            idType = 0;	// Unit ID type
            side = "West"; // Unit side from CfgChainOfCommand >> Sides
            size = "Size1"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
            type = "HQ"; // Unit type from CfgChainOfCommand >> Types
            insignia = "tft_faction\logo_tft8_512.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
            //colorInsignia[] = {1,1,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
            commander = "Vires"; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
            commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
            tags[] = {BIS,TFT8}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
            text = "Task Force Tempor 8"; // Custom text and short text, can still use some arguments when defined:
            // %1 - ID (e.g. "7th")
            // %2 - Type (e.g. "Infantry")
            // %3 - Size (e.g. "Division")
            textShort = "TFT8";
            //texture = "tft_faction\logo_tft8_512.paa"; // Custom texture, will replace icon set by 'type' param.
            //color[] = {1,1,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors (e.g. color = "ColorWEST";)
            //description = "Joint Task Force composed of a Ranger platoon, Spartan, and an aviation detachment, Razor."; // A brief description of the group or unit.
            //assets[] = {{B_Heli_Transport_03_F,5},{B_Heli_Light_01_F,3},{B_Heli_Light_01_armed_F,4},B_Heli_Transport_01_camo_F}; // Will display pictures of all available assets to the unit commander:
            // Can be an array with format {classname, [int active icons], [int greyed out icons]}, or simply a classname
            //subordinates[] = {2ndBCT}; // Subordinates, searched on the same level as this class.
            
            // When 'subordinates' are missing, child classes will be used. They can have their own subs - number of tiers is not limited.
            class Spartan_1 {
                id = 1;
                type = "Infantry";
                size = "Platoon";
                side = "West";
                text = "Spartan 1"; // Custom text and short text, can still use some rguments when defined:
                textShort = "Spartan";
                description = "1st Platoon, Bravo Company, 2nd Battalion, 75th Ranger Regiment"; // Custom text and short text, can still use some arguments when defined:
                commander = "Vires";
                commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
                tags[] = {"BLUFOR", "TFT8","Spartan"};
                class Spartan_1_1 {
                    id = 1;
                    type = "Infantry";
                    size = "Squad";
                    side = "West";
                    text = "Spartan 1-1"; // Custom text and short text, can still use some rguments when defined:
                    textShort = "Spartan 1-1";
                    commander = "McCormack";
                    commanderRank = "Sergeant"; // Rank of unit commander (by default selected based on unit size)
                    tags[] = {"BLUFOR", "TFT8","Spartan"};
                };
                /*
                class Spartan_1_2 {
                    id = 2;
                    type = "Infantry";
                    size = "Squad";
                    side = "West";
                    text = "Spartan 1-2"; // Custom text and short text, can still use some rguments when defined:
                    textShort = "Spartan 1-2";
                    commander = "Bloyd";
                    commanderRank = "Sergeant"; // Rank of unit commander (by default selected based on unit size)
                    tags[] = {"BLUFOR", "TFT8","Spartan"};
                };
                */
            };
            /*
            class Scorpion {
                id = 1;
                type = "Infantry";
                size = "Platoon";
                side = "West";
                text = "Scorpion 1"; // Custom text and short text, can still use some rguments when defined:
                textShort = "Scorpion";
                description = "1st Platoon, Alpha Company, 1st Battalion, 503rd Infantry Regiment, 173rd Infantry Brigade Combat Team (Airborne)";
                commander = "Manus";
                commanderRank = "Sergeant"; // Rank of unit commander (by default selected based on unit size)
                tags[] = {"BLUFOR", "TFT8","Scorpion"};
            };
            */
            class Razor	{
                id = 1;
                type = "Helicopter";
                size = "Squadron";
                side = "West";
                text = "Razor Detachment"; // Custom text and short text, can still use some rguments when defined:
                textShort = "Razor";
                description = "Mixed Helicopter Company/160th SOAR, 40th Combat Aviation Brigade (Razor)";
                commander = "Collins";
                commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
                tags[] = {"BLUFOR", "TFT8","Razor"};
                assets[] = {
                    {vtx_MH60M,1,0},
                    {tft8_chinook,1,0},
                    {tft8_littlebird_transport,1,0}
                };
            };
        };
        class TFV99
        {
            id = 99;		// Unit ID
            idType = 0;	// Unit ID type
            side = "West"; // Unit side from CfgChainOfCommand >> Sides
            size = "Size1"; // Unit size from CfgChainOfCommand >> Sizes. Displays relevant icon above the Type icon
            type = "HQ"; // Unit type from CfgChainOfCommand >> Types
            insignia = "TFV99.paa"; // Unit insignia, displayed in ORBAT background and in tooltip
            //colorInsignia[] = {1,1,1,1}; // Insignia image color (white default), can be either RGBA array, or class from CfgMarkerColors
            commander = "Joep S."; // Name of unit commander. Can be either direct name, or class from CfgWorlds >> GenericNames (random name from the list is then selected)
            commanderRank = "Major"; // Rank of unit commander (by default selected based on unit size)
            tags[] = {BIS,TFV99}; // Group tags. When opening ORBAT viewer, user can define what tags will be accepted.
            text = "Task Force Viper 99"; // Custom text and short text, can still use some arguments when defined:
            // %1 - ID (e.g. "7th")
            // %2 - Type (e.g. "Infantry")
            // %3 - Size (e.g. "Division")
            textShort = "TFV99";
            //texture = "TFV99_w.paa"; // Custom texture, will replace icon set by 'type' param.
            //color[] = {1,1,1,1}; // Custom color, will replace color set by 'side' param. Can be either RGBA array, or class from CfgMarkerColors (e.g. color = "ColorWEST";)
            //description = "Joint Task Force composed of a Ranger platoon, Spartan, and an aviation detachment, Razor."; // A brief description of the group or unit.
            //assets[] = {{B_Heli_Transport_03_F,5},{B_Heli_Light_01_F,3},{B_Heli_Light_01_armed_F,4},B_Heli_Transport_01_camo_F}; // Will display pictures of all available assets to the unit commander:
            // Can be an array with format {classname, [int active icons], [int greyed out icons]}, or simply a classname
            //subordinates[] = {2ndBCT}; // Subordinates, searched on the same level as this class.
            
            // When 'subordinates' are missing, child classes will be used. They can have their own subs - number of tiers is not limited.
            class Taipan {
                id = 1;
                type = "Infantry";
                size = "FireTeam";
                side = "West";
                text = "Taipan"; // Custom text and short text, can still use some rguments when defined:
                textShort = "Taipan";
                description = "SF Team"; // Custom text and short text, can still use some arguments when defined:
                commander = "Rick W.";
                commanderRank = "Captain"; // Rank of unit commander (by default selected based on unit size)
            };
            class Mamba {
                id = 1;
                type = "Infantry";
                size = "FireTeam";
                side = "West";
                text = "Mamba"; // Custom text and short text, can still use some rguments when defined:
                textShort = "Mamba";
                description = "SF Team"; // Custom text and short text, can still use some arguments when defined:
                commander = "Christiaan v L.";
                commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
            };
            class Cobra {
                id = 1;
                type = "MotorizedInfantry";
                size = "Platoon";
                side = "West";
                text = "Cobra"; // Custom text and short text, can still use some rguments when defined:
                textShort = "Cobra";
                description = "Motorized Infantry Platoon";
                commander = "Lucas K.";
                commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
            };
            class Luchtmacht	{
                id = 1;
                type = "Helicopter";
                size = "Squadron";
                side = "West";
                text = "Luchtmacht"; // Custom text and short text, can still use some rguments when defined:
                textShort = "Luchtmacht";
                description = "Luchtmacht";
                commander = "Kick B.";
                commanderRank = "Lieutenant"; // Rank of unit commander (by default selected based on unit size)
                //assets[] = {};
            };
        };
    };
};