function mod_get_buff_type(plant_id){
	if (ds_map_exists(global.plant_buff_map, plant_id)) {
        return global.plant_buff_map[? plant_id];
    }
	return "normal";
}