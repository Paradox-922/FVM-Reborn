// obj_small_furnace 的 Create 事件
// 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "sheshou"; 
// 设置对象类型和精灵
event_user(0)
if shape == 0{
	sprite_index = spr_sheshou
}
else if shape == 1{
	sprite_index = spr_sheshou_1
}
else if shape == 2{
	sprite_index = spr_sheshou_2
}
fire_mid = false;
fire_up = false;
fire_down = false;
// ========== 特定属性默认值 ==========

attack_anim = 13;
idle_anim = 15
flash_speed = 5
plant_type = "normal"
is_slowdown = false

