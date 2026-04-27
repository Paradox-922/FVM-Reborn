// 三线射手发射子弹的代码
var middle_y = y - 75; // 中间行的y坐标
var row_height = 100; // 行高，根据你的游戏调整

// 【中路发射】
if (fire_mid == true) {
    var inst_middle = instance_create_depth(x + 40, middle_y, depth - 500, obj_sheshou_bullet);
    inst_middle.damage = atk;
    inst_middle.move_speed = 8;
    inst_middle.row = grid_row;
    inst_middle.target_row = grid_row; 
}

// 【上路发射】
if (fire_up == true) {
    var inst_up = instance_create_depth(x + 40, middle_y, depth - 500, obj_sheshou_bullet);
    inst_up.damage = atk;
    inst_up.move_speed = 8;
    inst_up.row = grid_row;
    if grid_row - 1 >= 0 {
        inst_up.target_row = grid_row - 1; 
    } else {
        inst_up.target_row = grid_row;
        inst_up.x -= 20;
    }
    inst_up.start_y = middle_y; 
}

// 【下路发射】
if (fire_down == true) {
    var inst_down = instance_create_depth(x + 40, middle_y, depth - 500, obj_sheshou_bullet);
    inst_down.damage = atk;
    inst_down.move_speed = 8;
    inst_down.row = grid_row;
    if grid_row + 1 < global.grid_rows {
        inst_down.target_row = grid_row + 1; 
    } else {
        inst_down.target_row = grid_row;
        inst_down.x -= 20;
    }
    inst_down.start_y = middle_y; 
}

// 只要有任意一路开火，就播放一次音效
audio_play_sound(snd_shot, 0, 0);
