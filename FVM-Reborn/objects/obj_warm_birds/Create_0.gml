// obj_small_furnace 的 Create 事件
//plant_id = "small_fire";  // 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "warm_birds"; 
// 设置对象类型和精灵
obj_type = object_index;
sprite_index = spr_warm_birds;
flame_produce = 25;
event_user(0)

// ========== 特定属性默认值 ==========

attack_anim = 13;
idle_anim = 11
first_produce_delay = 60;
plant_type = "normal"

