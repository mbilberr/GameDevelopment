Speed = 0.5;
ObjectType = CollisionType.Enemy
Health = 4;

event_inherited();

View[DOWN, IDLE] = Placeholder;
View[DOWN, MOVE] = Placeholder;
View[DOWN, MELEEATTACK] = Placeholder;
View[DOWN, HURT] = Placeholder;
View[DOWN, DEATH] = Placeholder;

View[UP, IDLE] = Placeholder;
View[UP, MOVE] = Placeholder;
View[UP, MELEEATTACK] = Placeholder;
View[UP, HURT] = Placeholder;
View[UP, DEATH] = Placeholder;

View[HORIZONTAL, IDLE] = Placeholder;
View[HORIZONTAL, MOVE] = Placeholder;
View[HORIZONTAL, MELEEATTACK] = Placeholder;
View[HORIZONTAL, HURT] = Placeholder;
View[HORIZONTAL, DEATH] = Placeholder;