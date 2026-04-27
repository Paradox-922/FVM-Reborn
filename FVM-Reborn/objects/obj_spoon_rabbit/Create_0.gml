event_inherited();  // 继承父对象属性

plant_id = "spoon_rabbit"; 
obj_type = object_index;
current_level = 1

event_user(0)

if shape == 0{
	sprite_index = spr_spoon_rabbit
}
else if shape == 1{
	sprite_index = spr_spoon_rabbit_1
}
else if shape == 2{
	sprite_index = spr_spoon_rabbit_2
}

// ========== 特定属性默认值 ==========

attack_anim = 11;
idle_anim = 11
flash_speed = 5
plant_type = "normal"
is_slowdown = false
target_type = "throw"

target_instance = noone
cooldown_timer = cycle
attacking = false