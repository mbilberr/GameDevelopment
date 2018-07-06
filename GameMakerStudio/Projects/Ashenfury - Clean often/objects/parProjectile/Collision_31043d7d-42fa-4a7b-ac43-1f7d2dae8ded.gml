var _power = Power; // Local variable for power
var _origin = Creator; // Store the creator ID
if (other.ObjectType > 0 && other.ObjectType != Creator) {
    with(other) {
        Health -= _power; // Take health away
        KnockBackForce = _power; // Knock the object back
        HitBy = _origin; // Who done it?
        State = StateHURT;
    }
}
instance_destroy();