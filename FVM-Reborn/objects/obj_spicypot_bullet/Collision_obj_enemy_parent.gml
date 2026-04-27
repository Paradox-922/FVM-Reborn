if ds_list_find_index(hitted_enemy,other.id) == -1{

	if other.hp > 0 && abs(row - other.grid_row) <= 1 && other.grid_col >= start_col && other.grid_col <= (start_col + max_cols) && can_hit(target_type,other.target_type){
		with(other){
			audio_play_sound(hit_sound,0,0)
			if (hp <= other.damage && !immune_to_ash) {
				if (special_ash) {
					var inst = instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
					inst.special_ash = true;
					inst.sprite_index = sprite_index;
					inst.image_index = image_index;
				} else {
					instance_create_depth(x, y - 20, depth, obj_mouse_ash_death);
				}
				instance_destroy();
			} else {
				damage_amount = other.damage
				damage_type = other.damage_type
				event_user(0)
			}
		}
		ds_list_add(hitted_enemy,other.id)
	}
}