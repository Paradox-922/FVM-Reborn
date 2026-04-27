event_inherited();  // 继承父对象属性
plant_id = "berry_dessert"; 
event_user(0)
sprite_index = spr_berry_dessert;
if shape == 1{
	sprite_index = spr_berry_dessert_1
}
else if shape == 2{
	sprite_index = spr_berry_dessert_2
}

// ========== 特定属性默认值 ==========

attack_anim = 0;
idle_anim = 12
flash_speed = 5
plant_type = "normal"
is_slowdown = false

// ========== 初始化增伤数据 ==========

buffer_type = "tracker"
buff_value = atk/100
buff_shape = (shape >=1)?"5x5":"3x3";
buff_cells = build_buff_cells(grid_col, grid_row, buff_shape, buff_value);
buff_cells_refreshed = false;

ds_list_add(global.buff_sources, id);// 进入增伤源名单
global.buff_dirty = true;// 驱动增伤系统更新

