Speed = 1;
ObjectType = CollisionType.Enemy
Health = 12;

event_inherited();

View[DOWN, IDLE] = npc_demon_down_idle;
View[DOWN, MOVE] = npc_demon_down;
View[DOWN, MELEEATTACK] = npc_demon_down;
View[DOWN, HURT] = npc_demon_down;
View[DOWN, DEATH] = npc_demon_down;

View[UP, IDLE] = npc_demon_up_idle;
View[UP, MOVE] = npc_demon_up;
View[UP, MELEEATTACK] = npc_demon_up;
View[UP, HURT] = npc_demon_up;
View[UP, DEATH] = npc_demon_up;

View[HORIZONTAL, IDLE] = npc_demon_right_idle;
View[HORIZONTAL, MOVE] = npc_demon_right;
View[HORIZONTAL, MELEEATTACK] = npc_demon_right;
View[HORIZONTAL, HURT] = npc_demon_right;
View[HORIZONTAL, DEATH] = npc_demon_right;