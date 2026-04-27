// obj_plant_parent 的 Step 事件
if global.is_paused{
	exit
}

grid_row = parent_player.grid_row
grid_col = parent_player.grid_col
depth = parent_player.depth-1

timer++

if parent_player.state == CARD_STATE.IDLE{
	anim_timer++
	// 每6帧才更新一次运动
	if (anim_timer >= 6) {
		anim_timer = 0

	    t += t_speed * t_dir;

	    // 到终点反向
	    if (t >= 1) {
	        t = 1;
	        t_dir = -1;
	    }

	    // 回到起点再反向
	    if (t <= -1) {
	        t = -1;
	        t_dir = 1;
	    }
	
		var x_param = t;
		var y_param = 0.5 * t * t - 1;

		x = origin_x + x_param;
		y = origin_y + y_param;
	}
}else if parent_player.state == CARD_STATE.ATTACK {
	anim_timer = 0
	x = origin_x;
	y = origin_y;
	t = 0;
	t_dir = 1;
}

if divine_blessing_gem{
	if not first_produce{
		if timer mod first_produce_delay == 0{
			
			var base = 25;
		    var count = flame_produce div base;   // 能分出多少个25
		    var remain = flame_produce mod base;  // 剩余

		    // 生成每个25的火苗
		    for (var i = 0; i < count; i++) {
		        var f_inst = instance_create_depth(x, y - 50, -1300, obj_flame);
		        f_inst.value = base;
		    }

		    // 如果有余数，再生成一个
		    if (remain > 0) {
		        var f_inst = instance_create_depth(x, y - 50, -1300, obj_flame);
		        f_inst.value = remain;
		    }
			
			first_produce = true
		}
	}
	else{
		if timer mod cycle == 0 {

		    var base = 25;
		    var count = flame_produce div base;   // 能分出多少个25
		    var remain = flame_produce mod base;  // 剩余

		    // 生成每个25的火苗
		    for (var i = 0; i < count; i++) {
		        var f_inst = instance_create_depth(x, y - 50, -1300, obj_flame);
		        f_inst.value = base;
		    }

		    // 如果有余数，再生成一个
		    if (remain > 0) {
		        var f_inst = instance_create_depth(x, y - 50, -1300, obj_flame);
		        f_inst.value = remain;
		    }
		}
	}
}

if (divine_protect_gem && !buff_cells_refreshed) { 
	add_shield_area(buff_cells, grid_col, grid_row, buff_value);
	apply_shield_buff(id);
	buff_cells_refreshed = true;
}

if (divine_holy_gem) {
	if (timer mod 150 == 0) {
		 with (obj_enemy_parent) {
			var row_diff = self.grid_row - other.grid_row;
			var col_diff = self.grid_col - other.grid_col;
			
			if (!variable_instance_exists(id, "divine_holy_gem_debuffed")) {
	            self.divine_holy_gem_debuffed = false;
	        }
			
			if (row_diff >= -2 && row_diff <= 2 && col_diff >= -2 && col_diff <= 2 && !self.divine_holy_gem_debuffed) {
				self.hp -= other.reflect_damage;
                self.ice_timer += other.ice_timer;
                self.divine_holy_gem_debuffed = true;
            }
		 }
	}
}

