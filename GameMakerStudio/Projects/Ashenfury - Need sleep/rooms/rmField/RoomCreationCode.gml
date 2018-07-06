for(i=0;i<instance_number(objSpawnPoint);i++)
{
var _inst = instance_find(objSpawnPoint,i);
var _x = _inst.x;
var _y = _inst.y;
var _value = irandom(5); // rolls a 6 sided die
switch (_value)
	{
	case 0:
		exit;
		break;
	case 1:
		instance_create_depth(_x,_y,0,objSlime);
		break;
	case 2:
		instance_create_depth(_x,_y,0,objDemon);
		break;
	case 3:
		instance_create_depth(_x,_y,0,objSlime);
		break;
	case 4:
		instance_create_depth(_x,_y,0,objDemon);
		break;
	case 5:
		instance_create_depth(_x,_y,0,objSlime);
		break;
	}

}