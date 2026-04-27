image_xscale = 1.8;
image_yscale = 1.8;
image_speed = 0;

is_submenu_opened = false;
level_unlocked = 0;
level_passed = 0;

instance_create_depth(x+797,y-490,depth-1,obj_cross_server_closer);

var level_list = global.maps_map[? "cross_server"].levels_data

for(var j = 0; j < 2; j++){
	for(var i = 0 ; i< 4; i++){
		var level_index = i + j*4;
		var c_level_data = level_list[level_index]
		var button = instance_create_depth(416+405*i, 485+400*j, depth-1, obj_cross_server_level_create);
		button.level_index = level_index;
		if (array_get_index(global.save_data.completed_levels,c_level_data.pre_level) != -1) || c_level_data.pre_level == "none"{
		button.is_disabled = false;
		level_unlocked++;
		}
		if (array_get_index(global.save_data.completed_levels,c_level_data.id) != -1){
		level_passed++;
		}
	}
}