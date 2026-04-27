if (global.is_paused) exit;

// 1. 动画与移动 —— 第九列纵向冲撞：向下移动，不往右飞
timer++;
image_index = floor(timer / flash_speed) mod anim_frames;
y += move_speed;  // 改为向下 Y 轴移动

// 超出屏幕下边界就销毁
if (y > 1200) {   // 按你游戏高度自行微调，一般 1000~1200 都行
    instance_destroy();
}

// 2. 撞击逻辑
with (obj_enemy_parent) {
    if (hp > 0 && grid_row == other.grid_row && abs(y - other.y) <= 100) {        
        if (array_get_index(other.ignore_list, mouse_id) != -1) {
            if (array_get_index(other.hit_array, id) == -1) {
                hp -= other.atk; 
                event_user(0);  
                array_push(other.hit_array, id); 
            }
        } 
        else {
            var inst = instance_create_depth(x, y, depth, obj_knock_back_effect);
            inst.sprite_index = sprite_index;
            inst.image_index = image_index;
            instance_destroy(); 
        }
    }
}
