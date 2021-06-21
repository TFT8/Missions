////////////////////////////////////////////////////////
// Call for fire cheat sheet

class FR_callForFire {
    idd = 9997;
    movingenable = true;
    enableSimulation = true;

    class Controls {
        class FR_cffFrame: RscFrame {
            idc = 1800;
            x = 0.5 * safezoneW + safezoneX;
            y = 0.177947 * safezoneH + safezoneY;
            w = 0.252217 * safezoneW;
            h = 0.644105 * safezoneH;
        };
        class FR_cffExit: RscButton {
            idc = 1600;
            text = "Exit"; //--- ToDo: Localize;
            x = 0.699119 * safezoneW + safezoneX;
            y = 0.752041 * safezoneH + safezoneY;
            w = 0.0530983 * safezoneW;
            h = 0.0700114 * safezoneH;
            tooltip = "Exit"; //--- ToDo: Localize;
            action = "closeDialog 0";
        };
        class FR_cffPic: RscPicture {
            idc = 1200;
            text = "images\status\fireCheatSheet.jpg";
            x = 0.5 * safezoneW + safezoneX;
            y = 0.177947 * safezoneH + safezoneY;
            w = 0.252217 * safezoneW;
            h = 0.644105 * safezoneH;
        };
    };
};

////////////////////////////////////////////////////////
// APC cheat sheet

class FR_apcCheatSheet {
    idd = 9996;
    movingenable = true;
    enableSimulation = true;

    class Controls {
        class FR_apcFrame: RscFrame {
            idc = 1800;
            x = 0.241146 * safezoneW + safezoneX;
            y = 0.205952 * safezoneH + safezoneY;
            w = 0.517708 * safezoneW;
            h = 0.546089 * safezoneH;
        };
        class FR_apcPic: RscPicture {
            idc = 1200;
            text = "images\status\APC.jpg";
            x = 0.241146 * safezoneW + safezoneX;
            y = 0.205952 * safezoneH + safezoneY;
            w = 0.517708 * safezoneW;
            h = 0.546089 * safezoneH;
            style = 2096;
        };
        class FR_apcExit: RscButton {
            idc = 1600;
            text = "Exit"; //--- ToDo: Localize;
            x = 0.626108 * safezoneW + safezoneX;
            y = 0.696032 * safezoneH + safezoneY;
            w = 0.046461 * safezoneW;
            h = 0.0420069 * safezoneH;
            tooltip = "Exit"; //--- ToDo: Localize;
            action = "closeDialog 0";
        };
    };
};
