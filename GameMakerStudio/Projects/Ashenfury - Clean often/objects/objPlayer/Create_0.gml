/// @desc Initialize

XAxis =		0;	// left and right
YAxis =		0;	// Up and down
Speed =		4;	// Movement speed
Sprint =	0;	// Added in step
SpeedBoost= 0;	// Used for adding speed 

CanAttack = true; 
XOffset = 0; 
YOffset = 0; 

State = StateIDLE; // Default state
ObjectType = CollisionType.Friendly;

KnockBackForce = 0;
HitBy = noone; // who done it

Direction = DOWN; // Default facing direction
Action = IDLE; // Default action

Health = 4; // Full health
AttackPower = 2; // Base attack power

View[HORIZONTAL, IDLE] = char_grunt_right_idle;
View[HORIZONTAL, MOVE] = char_grunt_right;
View[HORIZONTAL, RANGEDATTACK] = char_grunt_right;
View[HORIZONTAL, MELEEATTACK] = char_grunt_right;
View[HORIZONTAL, HURT] = char_grunt_right;
View[HORIZONTAL, DEATH] = char_grunt_right;

View[UP, IDLE] = char_grunt_up_idle;
View[UP, MOVE] = char_grunt_up;
View[UP, RANGEDATTACK] = char_grunt_up;
View[UP, MELEEATTACK] = char_grunt_up;
View[UP, HURT] = char_grunt_up;
View[UP, DEATH] = char_grunt_up;

View[DOWN, IDLE] = char_grunt_down_idle;
View[DOWN, MOVE] = char_grunt_down;
View[DOWN, RANGEDATTACK] = char_grunt_down;
View[DOWN, MELEEATTACK] = char_grunt_down;
View[DOWN, HURT] = char_grunt_down;
View[DOWN, DEATH] = char_grunt_down;