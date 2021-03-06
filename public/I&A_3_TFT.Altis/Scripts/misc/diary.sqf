/*
| Author:
|
|	Quiksilver.
|_____
|
| Description:
|
|	Created: 26/11/2013.
|	Last modified:29/10/2014.
|	Coded for I&A and hosted on allfps.com.au servers.
|	You may use and edit the code.
|	You may not remove any entries from Credits without first removing the relevant author's contributions,
|	or asking permission from the mission authors/contributors.
|	You may not remove the Credits tab, without consent of Ahoy World or allFPS.
| 	Feel free to re-format or make it look better.
|_____
|
| Usage:
|
|	Search below for the diary entries you would like to edit.
|	DiarySubjects appear in descending order when player map is open.
|	DiaryRecords appear in ascending order when selected.
|_____
|
| Credit:
|
|	Invade & Annex 2.00 was developed by Rarek [ahoyworld.co.uk] with hundreds of hours of work
|	The current version was developed by Quiksilver with hundreds more hours of work.
|
|	Contributors: Razgriz33 [AW], Jester [AW], Kamaradski [AW], David [AW], chucky [allFPS].
|
|	Please be respectful and do not remove credit.
|______________________________________________________________*/

if (!hasInterface) exitWith {};

waitUntil {!isNull player};

player createDiarySubject ["rules", "Rules"];
player createDiarySubject ["mods", "Mods"];
player createDiarySubject ["teamspeak", "Teamspeak"];
player createDiarySubject ["faq", "FAQ"];
player createDiarySubject ["changelog", "Change Log"];
player createDiarySubject ["credits", "Credits"];

//-------------------------------------------------- Rules

player createDiaryRecord ["rules",
[
"Player Report",
"
<br />If you see any player breaking the rules and you can`t find an admin ingame or on Teamspeak, please use the following procedure:
<br />1. Go to forums.ahoyworld.net
<br />2. In navigation menu look for Player Tools button, it opens a drop-down menu
<br />3. Select Player report option
<br />4. Fill in a player report, be honest and provide enough evidence
"
]];

player createDiaryRecord ["rules",
[
"Enforcement",
"
<br />The purpose of the above rules are to ensure a fun and relaxing environment for public players.
<br />
<br />Server rules are in place merely as a means to that end.
<br />
<br />Guideline for enforcement:
<br />
<br />-	Innocent rule violation and disruptive behavior:
<br />
<br />		= Verbal / Written request to cease, or warning.
<br />
<br />-	Minor or first-time rule violation:
<br />
<br />		= Kick, or 0 - 3 day ban.
<br />
<br />-	Serious or repetitive rule violation:
<br />
<br />		= 3 - 7 day ban.
<br />
<br />-	Administrative ban (hack/exploit/verbal abuse/serious offense):
<br />
<br />		= permanent or 30 day.
<br />
<br />
<br />The above is subject to discretion.
"
]];

player createDiaryRecord ["rules",
[
"General",
"
<br />1. Hacking and mission exploitation will not be tolerated.
<br />2. Intentional team-killing will not be tolerated.
<br />3. Excessive, unintentional team-killing may result in a Kick/Temp ban.
<br />4. Unnecessary destruction of BLUFOR vehicles will not be tolerated.
<br />5. Verbal abuse and bullying will not be tolerated.
<br />6. Firing a weapon on base--unless at an enemy--may result in a Kick/Temp ban.
<br />7. Griefing and obstructive play will not be tolerated.
<br />8. Excessive mic spamming, especially of Side and Global channels, will not be tolerated.
<br />9. A server moderator or admin's word is final.
<br />10. Landing inside of the main spawn may result in a warning or kick.
<br />
<br />If you see a player in violation of the above, contact an admin on Teamspeak or fill in a player report on our website.
"
]];

//-------------------------------------------------- Mods

player createDiaryRecord ["mods",
[
"Serverside",
"
<br /> Mods currently running on server (subject to change without notice):<br /><br />

<br />- None at this time.
"
]];

player createDiaryRecord ["mods",
[
"Mods Allowed",
"
<br /> Mods currently allowed (subject to change without notice):<br /><br />

<br />- Visit our website @ ahoyworld.net for more info!
		<br /><br />
"
]];

//-------------------------------------------------- Teamspeak

player createDiaryRecord ["teamspeak",
[
"TS3",
"
<br /> Teamspeak:<br /><br />
<br /> http://www.teamspeak.com/?page=downloads
"
]];

player createDiaryRecord ["teamspeak",
[
"AHOY WORLD",
"
<br /> Address: ts.ahoyworld.net
<br />
<br /> Visitors and guests welcome!
"
]];

//-------------------------------------------------- FAQ

player createDiaryRecord ["faq",
[
"UAVs",
"
<br /> In the Control Tower at base, a UAV Operator can now recycle the UAV crew on one of the computer terminals.
<br /><br />
<br /><font size='16'>Q:</font> Can I use the UAVs?<br />
<br /><font size='16'>A:</font> Yes, however you must be in the UAV Operator role and you must have a UAV Terminal.
<br />
<br />
<br /><font size='16'>Q:</font> Why do the UAVs keep exploding?<br />
<br /><font size='16'>A:</font> When the bomb-equipped UAVs are first connected to, the Gunner AI fires its weapons. Until it's fixed, here is a guide for you.<br />
<br /> To safely connect to the MQ4A Greyhawk UAV:<br />
<br />	1. Enter action menu (mouse scroll), click 'Open UAV Terminal'.
<br />	2. Right-click on the UAV you wish to control, on the terminal map.
<br />	3. Click 'Connect Terminal to UAV'.
<br /><br /> [IMPORTANT] Do NOT click 'Take Control' button in UAV Terminal.<br />
<br />	4. Esc out of the UAV terminal.
<br />	5. Enter action menu (mouse scroll) again.
<br />	6. [IMPORTANT] Select 'Take UAV TURRET controls'.<br />
<br />
<br />	It is now safe to 'Take Control' of the UAV.
<br />
<br />
<br /><font size='16'>Q:</font> Why can't I connect to the UAV?<br />
<br /><font size='16'>A:</font> Sometimes the UAVs are still connected to the prior Operators Terminal. If he disconnects or dies, sometimes the Terminal does not delete properly. The only solution at this time is to destroy the UAV, and you yourself must respawn.
"
]];

player createDiaryRecord ["faq",
[
"Squads",
"
<br /><font size='16'>Q:</font> How do I join or create a squad?<br />
<br /><font size='16'>A:</font>
<br /> 1. Press 'U' to open BI Squad Management.
<br /> 2. If you receive a squad invite from another player, hold 'U' to accept it.
<br />
<br /> * Xeno's Squad Management tool had to be removed at request of the script author. Engine-based BI Squad Management is being used now.
"
]];

player createDiaryRecord ["faq",
[
"Bipod",
"
<br /><font size='16'>Q:</font> How do I deploy bipod or rest my weapon?<br />
<br /><font size='16'>A:</font> Press C (default) to rest your weapon or deploy the bipod.
"
]];

player createDiaryRecord ["faq",
[
"Medics",
"
<br /><font size='16'>Q:</font> Why can't I heal him?<br />
<br /><font size='16'>A:</font> There are three conditions you must pass in order to revive a fallen comrade.
<br /> 1. You must be in a Medic / Paramedic role.
<br /> 2. You must have a Medkit.
<br /> 3. You must have at least one First Aid Kit.
"
]];

player createDiaryRecord ["faq",
[
"Mortars",
"
<br /><font size='16'>Q:</font> Can I use the Mortars?
<br /><font size='16'>A:</font> Yes, However if you are not in the mortar gunner role you will not have acess to the Artillery Computer.<br />
<br /><font size='16'>Q:</font> How do I use the Mortar without the computer?
<br /><font size='16'>A:</font> You have to manually find the target with the sight. Here are some steps to use the mortar.
<br /> 1. Press the F key to select the firing distance.
<br /> 2. If you are in line-of-sight just put the cursor on the target and use the page up and page down keys to change the elevation.
<br /> 3. Fire!<br />
<br /><font size='16'>Here is a youtube video that can explain in more detail.<br />
<br /> https://www.youtube.com/watch?v=SCCvXfwzeAU
"
]];

//-------------------------------------------------- Change Log

player createDiaryRecord ["changelog",
[
"3.00",
"
<br />- Initial Release
"
]];
player createDiaryRecord ["changelog",
[
"3.00.06",
"
<br />- Includes Changelog for versions 3.00.00 to 3.00.06
<br />- [Added] Spotters Should now be able to get Ghillies.
<br />- [Added] Some checks in Main AO for which faction is mainFaction.
<br />- [Added][Altis] Expanded Safezone to include hill north of Main Spawn.
<br />- [Updated] Revive
<br />- [Updated] Mission will end after X amount of AO's
<br />- [Fixed] FOB's not having arsenal and not spawning their Vehicles
<br />- [Fixed] FOB AO's not completing
<br />- [Fixed] Turret Control
<br />- [Fixed] script error with earplugs and now add ability to get earplugs from start.
<br />- [Fixed] enemy heli reinforcements for main AO
<br />- [Fixed] Priority Arty not spawning enemies.
<br />- [Fixed] AI at main AO would trap themselves in their formation and not move.
<br />- [Fixed] Friendly Fire Messages.
<br />- [Fixed][Altis] Hunter Spawn was spawning Prowlers
<br />- [Fixed][Tanoa] enemy Cas spawn on Tanoa
<br />- [Replaced] TAW VD with CHVD
<br />- [Tweaked] Teleport AddActions should now only appear when FOB has been captured.
"
]];
player createDiaryRecord ["changelog",
[
"3.00.07",
"
<br />- [Added] Added radio sounds to supports.
<br />- [Fixed] Underwater Mission not deleting enemies once done.
<br />- [Fixed] View distance now on only arsenal men.
<br />- [Fixed] Addaction to spawn in hunter/prowler back to Arsenal man.
<br />- [Tweaked] Friendly Fire messages now come from Crossroads.
<br />- [Removed][Tanoa] Removed Yanukka AO.
"
]];
player createDiaryRecord ["changelog",
[
"3.00.08",
"
<br />- [Fixed] Player spamming radio callouts.
<br />- [Tweaked] UAV respawn is now 5 minutes.
<br />- [Tweaked] Arty should now take longer between firing.
<br />- [Tweaked] Rewrote pilot restriction.
"
]];
player createDiaryRecord ["changelog",
[
"3.00.09",
"
<br />- [Fixed] Huge error in the priority arti causing massive rpt spam.
<br />- [Tweaked] Chopper Down message delay reduced.
"
]];
player createDiaryRecord ["changelog",
[
"3.00.10",
"
<br />- [Fixed][Tanoa] AO's not working properly.
<br />- [Fixed][Tanoa] FOB Comms Bravo.
"
]];
player createDiaryRecord ["changelog",
[
"3.1.1",
"
<br />- [Added] Safezone to main base
<br />- [Added] Added Prowlers to the respawn Vehicles
<br />- [Added] TK protection
<br />- [Fixed][Altis] AO's not working properly.
<br />- [Tweaked] Rewrote pilot restriction.
<br />- [Tweaked] UAV and plane repair pad's
"
]];
player createDiaryRecord ["changelog",
[
"3.1.2",
"
<br />- [Added] Prio AA mission
<br />- [Added] Runway light's
<br />- [Added] Refueling option's for smaller helo's
<br />- [Fixed][Altis] AO's not working properly.
<br />- [Tweaked] Derp_revive
<br />- [Tweaked] Moved Vehicle pickup and Blackfish spawn added arsenal to vheicle lift

"
]];
player createDiaryRecord ["changelog",
[
"3.1.3",
"
<br />- [added] clear vehicle inventory option
<br />- [added] new side mission
<br />- [fixed] AOs will no longer enter deadlock
<br />- [fixed] AA side mission cleanup
<br />- [Fixed] Certain units spawning damaged
<br />- [Fixed][altis] Frini woods bugging out
<br />- [tweaked] zeus related stuff
<br />- [tweaked] Under the hood stuff for AO and side missions
"
]];
player createDiaryRecord ["changelog",
[
"3.1.4",
"
<br />- [added] USS Freedom
<br />- [added] Blackwasp and UCAV to the Freedom
<br />- [added] Blackwasp (both versions) and UCAV to side mission rewards
<br />- [tweaked] Rescue the pilot side mission bleedout timer is now 15 minutes
"
]];
player createDiaryRecord ["changelog",
[
"3.1.5",
"
<br />- [added] squad URL hint
<br />- [added] Side mission reward: hemtt mounted praetorian and spartan
<br />- [added] Side mission reward: Unarmed inf transport xi'an
<br />- [added] Side mission reward: LAT hellcat
<br />- [added] Side mission reward: AT, AA and .50 cal offroad
<br />- [added] Side mission reward: Armed qilin
<br />- [Fixed] UAV rearm pad not working for certain UAVs
<br />- [Fixed] Rewards spawning damaged
<br />- [Fixed] Pawnee camos not displaying correctly
<br />- [tweaked] Side mission reward spawn rate
"
]];

//-------------------------------------------------- Credits

player createDiaryRecord ["credits",
[
"I&A 3",
"
<br />Mission authors:<br /><br />

		- <font size='16'>BACONOP</font><br /><br />

<br />Contributors:<br /><br />
		- alganthe - Ahoy World (ahoyworld.net)<br />
		- Quicksilver<br />
		- PERO - Ahoy World (ahoyworld.net)<br />
		- Zissou - Ahoy World (ahoyworld.net)<br />

<br />With the help of:<br /><br />
		Pfc. Christiansen - Ahoy World (ahoyworld.net)

<br />Other:<br /><br />
		Ordinance Script<br />
		- Wolfenswarm<br /><br />
		CHVD<br />
		- Champ-1<br /><br />

<br />Intro Music:<br /><br />
		""Run""<br />
		- Ethan Meixsell<br /> <br />
"
]];
