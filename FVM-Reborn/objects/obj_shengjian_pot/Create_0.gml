event_inherited();  // 继承父对象属性
plant_id = "shengjian_pot"; 
// 设置对象类型和精灵
obj_type = object_index;
current_level = 1
event_user(0)
if shape == 0{
	sprite_index = spr_shengjian_pot
}
else if shape == 1{
	sprite_index = spr_shengjian_pot_1
}
else if shape == 2{
	sprite_index = spr_shengjian_pot_2
}

// ========== 特定属性默认值 ==========

attack_anim = 15
idle_anim = 12
flash_speed = 5
plant_type = "normal"
is_slowdown = false
target_instance = noone
target_type = "throw"
