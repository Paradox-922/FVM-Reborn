// obj_small_furnace 的 Create 事件
//plant_id = "small_fire";  // 唯一标识符
event_inherited();  // 继承父对象属性
plant_id = "mojie"; 
// 设置对象类型和精灵
obj_type = object_index;
current_level = 1
event_user(0)
if shape == 0{
	sprite_index = spr_mojie
}
else if shape == 1{
	sprite_index = spr_mojie_1
}
else if shape == 2{
	sprite_index = spr_mojie_2
}
max_life_timer = 24 * 60; 
life_timer = max_life_timer; 


if(shape>=1){
	attack_interval = 3 * 60; 
}else{
	attack_interval = 4 * 60; 
}
flash_speed = 5;       
idle_anim = 13;        
attack_anim = 13;      
attack_duration = attack_anim * flash_speed;
idle_duration = attack_interval - attack_duration; 

attack_timer = 180;
state = CARD_STATE.IDLE;
plant_type = "normal"
is_slowdown = false
