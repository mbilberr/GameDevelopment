LocatePlayer();
Action = MOVE;
MoveCollide(sign(TargetX - x) * Speed, sign(TargetY - y) * Speed, objCollision, false);