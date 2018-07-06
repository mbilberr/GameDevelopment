/// @desc Movement
script_execute(State);
sprite_index = View[Direction, Action];

switch (Direction) {
    case HORIZONTAL:
        if (XAxis > 0) {
            XOffset = CELL;
            //XOffset = CELL/2;
            YOffset = 0;
        } else if (XAxis < 0) {
            XOffset = -CELL;
            //XOffset = -CELL/2;
            YOffset = 0;
        }
    break;
    case UP:
        XOffset = 0;
        YOffset = -CELL;
    break;
    case DOWN:
        XOffset = 0;
        YOffset = CELL;
    break;
}