switch (Action) {
    case IDLE:
    case MOVE:
        break;
    case MELEEATTACK:
        State = EnemyIDLE;
        break;
    case HURT:
        Health--;
        State = EnemyIDLE;
        break;
    case DEATH:
        instance_destroy();
        break;
}