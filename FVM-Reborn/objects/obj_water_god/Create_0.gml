// obj_small_furnace 的 Create 事件
//plant_id = "small_fire";  // 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "water_god"; 
// 设置对象类型和精灵

event_user(0)
sprite_index = spr_water_god;
if shape == 1{
	sprite_index = spr_water_god_1
}
else if shape == 2{
	sprite_index = spr_water_god_2
}
else if shape == 3{
	sprite_index = spr_water_god_3
}
// ========== 特定属性默认值 ==========
attack_anim = 26;
idle_anim = 9
flash_speed = 6
plant_type = "normal"
is_slowdown = false

