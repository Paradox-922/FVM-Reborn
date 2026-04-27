// obj_small_furnace 的 Create 事件
//plant_id = "small_fire";  // 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "shizi"; 
// 设置对象类型和精灵
obj_type = object_index;
current_level = 1
event_user(0)
if shape == 0{
	sprite_index = spr_shizi
}
else if shape == 1{
	sprite_index = spr_shizi_1
}
else if shape == 2{
	sprite_index = spr_shizi_2
}

// ========== 特定属性默认值 ==========

attack_anim = 13;
idle_anim = 10
flash_speed = 5
plant_type = "normal"
is_slowdown = false

anim_timer = 0
awake_anim = 6
wake_timer = 0