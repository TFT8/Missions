0 = [] spawn {
    waitUntil {time > 1};
    player setPos (box getPos [random 20, random 360]);
    player setDir (player getDir box);
};
