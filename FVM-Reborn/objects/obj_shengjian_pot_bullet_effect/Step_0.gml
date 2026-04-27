if global.is_paused{
    image_speed = 0;
    exit;
} else {
    image_speed = 0.5; // 与 Create 事件中的动画速度保持一致
}

timer++;

var eff_col = grid_col;
var eff_row = grid_row;

if (damage_timer == 0 || damage_timer >= 5) {
    damage_timer = 1;
    
    with (obj_enemy_parent) {
        if (hp > 0 && can_hit(other.target_type, target_type)) {
            var in_range = false;
            
            if (other.shape < 2) {
                // 二转前：十字范围
                if ((grid_col == eff_col && abs(grid_row - eff_row) <= 1) || 
                    (grid_row == eff_row && abs(grid_col - eff_col) <= 1)) {
                    in_range = true;
                }
            } else {
                // 二转后：3x3 范围
                if (abs(grid_col - eff_col) <= 1 && abs(grid_row - eff_row) <= 1) {
                    in_range = true;
                }
            }
            
            if (in_range) {
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
                    damage_amount = other.damage;
                    damage_type = "pierce";
                    event_user(0);
                }
            }
        }
    }
} else {
    damage_timer++;
}