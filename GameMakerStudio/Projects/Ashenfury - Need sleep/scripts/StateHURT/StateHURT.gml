Action = HURT;

var _direction = point_direction(HitBy.x, HitBy.y, x, y);
//var _direction = point_direction(x,y,HitBy.x,HitBy.y);
var _xForce = lengthdir_x(KnockBackForce, _direction);
var _yForce = lengthdir_y(KnockBackForce, _direction);

MoveCollide(_xForce, _yForce, objCollision, false);

KnockBackForce -= 0.1 * global.DeltaTime;

if (KnockBackForce <= 0)
    KnockBackForce = 0;