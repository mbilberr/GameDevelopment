for (i=0; i < maxItems; i += 1){
	if (global.inventory[i] == -1) // If slot "i" is empty
{
global.inventory[i] = argument0;
return(1); // Terminates script
}
}

return(0);

/*
//addpotion = InventoryPICKUP(2);
//if (addpotion ==0)
//{
	//show message inv is full
//}
//test = InventoryPICKUP(2);
*/