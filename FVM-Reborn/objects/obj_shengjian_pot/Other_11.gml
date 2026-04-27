// 用户事件1 - 发射子弹
var inst = instance_create_depth(x, y-60, depth-500, obj_shengjianpot_bullet)
if shape == 1{
	inst.sprite_index = spr_shengjianpot_bullet_1
} else if shape == 2{
    inst.sprite_index = spr_shengjianpot_bullet_2
}
audio_play_sound(snd_throw, 0, 0)

// 基本属性
inst.damage = atk
inst.row = grid_row
inst.thrower_y = y // 记录投手的Y坐标用于地面破裂判断

// 如果有目标敌人，计算预测落点
if (target_instance != noone && instance_exists(target_instance)) {
    // 获取敌人当前位置和速度
    var enemy_x = target_instance.x
    var enemy_speed = target_instance.move_speed
    
    // 计算子弹飞行时间
    var distance_x = enemy_x - inst.x;
    var flight_time = clamp(20 + (distance_x/1000) * 35, 20, 60);
    
    // 预测敌人未来X位置
    var raw_predicted_x = enemy_x - enemy_speed * flight_time;
    
    // 获取预测位置所在的准确列数，推算相对于植物的列偏移
    var target_col = floor((raw_predicted_x - global.grid_offset_x) / global.grid_cell_size_x);
    var col_offset = target_col - grid_col;
    
    // 不管跨行还是同行，子弹最远只能投向向前第四列
    var max_offset = 4;
    
    if (col_offset > max_offset) {
        col_offset = max_offset;
    }
    if (col_offset < 1) {
        col_offset = 1;
    }
    
    inst.target_col = grid_col + col_offset;
    
    // 最终落点精确锁定在对应格子的X坐标
    var predicted_x = global.grid_offset_x + inst.target_col * global.grid_cell_size_x + global.grid_cell_size_x / 2;
    
    // 计算子弹所需的速度向量
    var total_distance_x = predicted_x - inst.x
    var total_distance_y = 350//enemy_y - inst.y
    
    // 抛物线运动参数计算:cite[6]
    inst.move_speed = total_distance_x / flight_time
	inst.cgravity = (2 * total_distance_y) / (flight_time * flight_time)
    inst.cvspeed = (total_distance_y - 0 * inst.cgravity * flight_time * flight_time) / flight_time
    
    
    // 存储目标信息
    inst.target_enemy = target_instance
    inst.has_target = true
} else {
    // 没有目标，使用默认抛物线
    inst.move_speed = 8
    inst.cvspeed = 6
    inst.cgravity = 0.2
    inst.has_target = false
    inst.target_enemy = noone
    inst.target_col = grid_col + 4
}

// 子弹状态初始化
inst.hit_enemy = false
inst.splashed = false
inst.shape = shape