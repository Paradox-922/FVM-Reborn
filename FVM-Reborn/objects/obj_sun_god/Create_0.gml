// obj_small_furnace 的 Create 事件
//plant_id = "small_fire";  // 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "sun_god"; 
// 设置对象类型和精灵
obj_type = object_index;
sprite_index = spr_sun_god;
flame_produce = 25;
event_user(0)

// ========== 特定属性默认值 ==========

attack_anim = 20;
idle_anim = 11
if shape ==3{
	idle_anim = 12
}
flash_speed = 5
first_produce_delay = 60;
plant_type = "normal"
