if menu_type == 2{
	if not instance_exists(obj_config_menu){
		instance_create_depth(room_width/2,room_height/2,-5,obj_config_menu)
	}
}
if menu_type == 1{
	if not instance_exists(obj_edit_menu){
		instance_create_depth(room_width/2,room_height/2,-5,obj_edit_menu)
	}
}