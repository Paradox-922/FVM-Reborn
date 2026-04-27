if global.is_paused{
	image_speed = 0;
	exit
}
image_speed = 1;
x += move_speed
y -= cvspeed
cvspeed -= cgravity
image_angle -= 5
if x > 2200 or y > 1200 or x < -200 or y < -200{
	instance_destroy()
}

// 目标敌人在飞行过程中死亡，或没命中，检查是否落地
if !hit_enemy && y >= thrower_y && cvspeed < 0 {
    hit_enemy = true;
    
    // 获取投掷最初预测的网格列数 (格子的中心点)
    var cur_col = target_col;
    // 限定范围
    if (cur_col < 0) cur_col = 0;
    if (cur_col > global.grid_cols) cur_col = global.grid_cols;

    var cur_row = row; // 保持发射者所在的行不变
    
    var cell_x = global.grid_offset_x + cur_col * global.grid_cell_size_x + global.grid_cell_size_x / 2 + 20;
    var cell_y = global.grid_offset_y + cur_row * global.grid_cell_size_y + global.grid_cell_size_y / 2 - 20;
    var inst = instance_create_depth(cell_x, cell_y, depth, obj_shengjian_pot_bullet_effect);
    inst.damage = damage;
    inst.shape = shape;
    if (shape >= 2) {
        inst.sprite_index = spr_shengjian_pot_effect_2;
    } else {
        inst.sprite_index = spr_shengjian_pot_effect;
    }
    inst.grid_col = cur_col;
    inst.grid_row = cur_row;
    
    instance_destroy();
}