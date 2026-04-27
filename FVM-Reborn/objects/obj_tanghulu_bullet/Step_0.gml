if global.is_paused { 
	image_speed = 0
	exit
}

image_speed = 1

if bullet_shape == 1{
	sprite_index = spr_tanghulu_bullet_1
}
else if bullet_shape == 2{
	sprite_index = spr_tanghulu_bullet_2
}
else {
	sprite_index = spr_tanghulu_bullet
}

image_alpha = 1

timer++;

// 子弹追踪逻辑
if (instance_exists(target_enemy) && target_enemy.hp > 0) {
    // 目标存在且存活，继续追踪
    var target_x = target_enemy.x;
    var target_y = target_enemy.y - 75;
    
    var dir = point_direction(x, y, target_x, target_y);
    x += lengthdir_x(move_speed, dir);
    y += lengthdir_y(move_speed, dir);
    
    // 检查是否有更靠近的空中敌人，优先切换
    var new_air_target = noone;
    with (obj_enemy_parent) {
        if (hp > 0 && can_hit(other.target_type, target_type)) {
            if (new_air_target == noone || x < new_air_target.x) {
                new_air_target = id;
            }
        }
    }
    
    if (new_air_target != noone) {
        target_enemy = new_air_target;
    }
    
} else {
    // 当前目标不存在或死亡，寻找空中敌人
    var air_enemy = noone;
    with (obj_enemy_parent) {
        if (hp > 0 && can_hit(other.target_type, target_type)) {
            if (air_enemy == noone || x < air_enemy.x) {
                air_enemy = id;
            }
        }
    }
    
    if (air_enemy != noone) {
        target_enemy = air_enemy;
    } else {
        // 没有空中敌人，原方向继续飞行
        var dir = point_direction(xstart, ystart, x, y);
        x += lengthdir_x(move_speed, dir);
        y += lengthdir_y(move_speed, dir);
    }
}

// 子弹销毁逻辑
if (x > 2200 || y > 1200 || x < -200 || y < -200) {
    instance_destroy();
}