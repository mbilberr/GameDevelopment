DecisionTime -= 0.05 * global.DeltaTime;
if (DecisionTime <= 0) {
    DecisionTime = irandom_range(2, 5);
    var _do = irandom(5);
    switch (_do) {
        case 0:
        case 1:
            State = EnemyIDLE;
            break;
        case 2:
        case 3:
        case 4:
        case 5:
            TargetX = irandom_range(CELL, room_width - CELL);
            TargetY = irandom_range(CELL, room_height - CELL);
            State = EnemyWANDER;
            break;
    }
}