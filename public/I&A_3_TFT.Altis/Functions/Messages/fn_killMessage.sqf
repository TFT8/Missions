params ["_killed","_killer"];

_targetStartText = format
[
	"%1 KILLED BY %2",
	_killed,_killer
];

Quartermaster sideChat str _targetStartText;