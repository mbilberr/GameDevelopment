XDir = sign(TargetX - x);
YDir = sign(TargetY - y);

if (instance_exists(objPlayer)) {
    var _distance = point_distance(x, y, objPlayer.x, objPlayer.y);
    if (_distance < CareDistance) {
        TargetX = objPlayer.x;
        TargetY = objPlayer.y;
        State = EnemyCHASE;
        if (_distance < AttackDistance) {
            State = EnemyATTACK;
        }
    } else
        EnemyInput();
} else
    EnemyInput();

if (XDir != 0) {
    if (XDir == 1)
        image_xscale = 1;
    else if (XDir == -1)
        image_xscale = -1;
}

if (YDir != 0 && abs(TargetY - y) > abs(TargetX - x)) {
    image_xscale = 1;
    if (YDir == 1)
        Direction = DOWN;
    else if (YDir == -1)
        Direction = UP;
}