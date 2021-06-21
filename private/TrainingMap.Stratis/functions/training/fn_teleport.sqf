/*
 * Author: yourstruly
 * Teleport object to the a soecific location.
 *
 * Arguments:
 * 0: Object to teleport <OBJECT>
 * 1: Teleport destination <ARRAY>
 *
 * Return Value:
 * -
 *
 * Example:
 * [player, getPos flag] call TFT_fnc_teleport
 */

params ["_teleportee", "_position", ["_direction", -1, [0]]];

if(isNil "_teleportee" || {isNull _teleportee}) exitWith {};

"tft_tp" cutText ["","BLACK OUT"];
sleep 2;

_teleportee setPos (_position vectorAdd [(random 10) - 5, (random 10) - 5, 0]);
if !(_direction == -1) then {
	_teleportee setDir _direction;
};

"tft_tp" cutText ["","BLACK IN"];
