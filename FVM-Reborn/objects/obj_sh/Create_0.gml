// obj_small_furnace 的 Create 事件
//plant_id = "small_fire";  // 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "sheng_huo"; 
// 设置对象类型和精灵
obj_type = object_index;
current_level = 1
event_user(0)
if shape == 0{
	sprite_index = spr_sh
}
else if shape == 1{
	sprite_index = spr_sh_1
}
else if shape == 2{
	sprite_index = spr_sh_2
}
else if shape == 3{
	sprite_index = spr_sh_3
}

// ========== 特定属性默认值 ==========

attack_anim = 9;
idle_anim = 10
flash_speed = 5
plant_type = "normal"
target_type = "pierce"
is_slowdown = false

awake_anim = 0
anim_timer = 0
base_atk=atk
if shape == 2{
   target_type = "all";
} else if shape == 3{
   target_type = "all";
}else {
   target_type = "pierce";
}