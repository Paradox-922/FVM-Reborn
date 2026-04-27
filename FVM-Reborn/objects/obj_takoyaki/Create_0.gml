// obj_small_furnace 的 Create 事件
// 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "takoyaki"; 
// 设置对象类型和精灵
obj_type = object_index;
sprite_index = spr_takoyaki;
current_level = 1
event_user(0)
if shape == 1{
	sprite_index = spr_takoyaki_1
}
else if shape == 2{
	sprite_index = spr_takoyaki_2
}
// ========== 特定属性默认值 ==========

attack_anim = 14;
idle_anim = 7
flash_speed = 5
plant_type = "normal"
is_slowdown = false
target_type = "track"
