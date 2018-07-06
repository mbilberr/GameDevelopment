/// @desc
switch (Action) {
    case IDLE:
    case MOVE:
        break;
    case RANGEDATTACK:
        State = StateIDLE;
        CanAttack = true;
        break;
    case MELEEATTACK:
        instance_destroy(parProjectile);
        State = StateIDLE;
        CanAttack = true;
        break;
    case HURT:
        Health--;
        State = StateIDLE;
        break;
    case DEATH:
        instance_destroy();
        break;
    default:
        show_error("Error in player animation state machine", true) break;
}