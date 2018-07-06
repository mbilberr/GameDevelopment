GetInput();

if (Attack) {
    image_index = 0; //reset animation
    State = StateRANGEDATTACK;
}
if (Melee) {
    image_index = 0;
    State = StateMELEEATTACK;
}

if (XAxis != 0 || YAxis != 0)
    Action = MOVE;
else
    Action = IDLE;

if (XAxis != 0) {
    Direction = HORIZONTAL;
    if (XAxis < 0)
        image_xscale = -1;
    else if (XAxis > 0)
        image_xscale = 1;
}

if (YAxis != 0) {
    image_xscale = 1;
    if (YAxis > 0)
        Direction = DOWN;
    else if (YAxis < 0)
        Direction = UP;
}

if (Sprint != 0) {
	SpeedBoost=8;
} else SpeedBoost=0;	

var _direction = point_direction(0, 0, XAxis, YAxis);			// Direction
var _length = (Speed + SpeedBoost) * (XAxis != 0 || YAxis != 0);	// Run speed

XAxis = lengthdir_x(_length, _direction);
YAxis = lengthdir_y(_length, _direction);

MoveCollide(XAxis, YAxis, objCollision, false);
