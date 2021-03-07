params ["_item"];

_item lockInventory true;
_item addAction ["Collect", {
    params ["_target", "_caller", "_actionId"];
    private _itemName = getText (configOf _target >> "displayName");
    [
        true, // owner
        [netId _target, "task_intel"], // [taskID, parent taskID]
        [format ["%1 collected by %2 in %3", _itemName, name _caller, mapGridPosition _target], _itemName, ""], // Task description in the format ["description", "title", "marker"] 
        getPos _target, // destination
        "SUCCEEDED", // state
        -1, // priority
        false, // showNotification
        "", // type
        false // visibleIn3D
    ] call BIS_fnc_taskCreate;
    deleteVehicle _target;
}];