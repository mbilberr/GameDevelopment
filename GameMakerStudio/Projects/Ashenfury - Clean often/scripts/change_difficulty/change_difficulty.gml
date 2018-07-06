// health, damage, 


var type = menu_option[page];

if(type == 0){ //enemies
	switch(argument0){
		case 0:
		//easy
		//global.enemy_health / 2;
		break;
		case 1:
		//medium
		//global.enemy_health = global.enemy_health;
		break;
		case 2:
		//hard
		//global.enemy_health * 2;
		break;
	}
}
else { //allies
	switch(argument0){
		case 0:
		//easy
		//global.player_health * 2;
		break;
		case 1:
		//medium
		//global.player_health = global.player_health;
		break;
		case 2:
		//hard
		//global.player_health / 2;
		break;
	}
}