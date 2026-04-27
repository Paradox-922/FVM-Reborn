var inst = instance_create_depth(x+35,y-125,depth-1,obj_infected_little_panda_mouse)
inst.target_col = 3
inst.target_row = grid_row
inst.grid_row = grid_row
		
// 获取敌人当前位置和速度
var bullet_pos = get_world_position_from_grid(inst.target_col, grid_row)
var enemy_x = bullet_pos.x
var enemy_y = bullet_pos.y+38
    
// 计算子弹飞行时间（基于水平距离和预设速度）
var distance_x = enemy_x - inst.x
var flight_time = clamp(75 + (distance_x/1000) * 45, 75, 120)

// 计算子弹所需的速度向量
var total_distance_x = distance_x
var total_distance_y = 600
    
// 抛物线运动参数计算:cite[6]
inst.chspeed = total_distance_x / flight_time
inst.cgravity = (2 * total_distance_y) / (flight_time * flight_time)
inst.cvspeed = (total_distance_y - 0.05 * inst.cgravity * flight_time * flight_time) / flight_time