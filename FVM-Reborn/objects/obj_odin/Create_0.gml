// obj_small_furnace 的 Create 事件
//plant_id = "small_fire";  // 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "odin"; 
// 设置对象类型和精灵
obj_type = object_index;
sprite_index = spr_odin;

current_level = 1
event_user(0)
if shape == 1{
	sprite_index = spr_odin_1
}
else if shape == 2{
	sprite_index = spr_odin_2
}
else if shape == 3{
	sprite_index = spr_odin_3
}
// ========== 特定属性默认值 ==========

attack_anim = 11;
idle_anim = 9
flash_speed = 4
plant_type = "normal"
is_slowdown = false

