if global.is_paused{
	exit
}
event_inherited(); 
if is_frozen || state == CARD_STATE.SLEEP{
	exit
}
var current_flash_speed = flash_speed
if is_slowdown{
	current_flash_speed *= 2
}

//冷却计时器，没冷却完啥都不要干
if cooldown > 0{
	state = CARD_STATE.IDLE
	cooldown --;
	return;
}

if !attacking {
//检测屏幕上是否有敌人
	with (obj_enemy_parent){
		if (can_target_on(other.target_type,target_type) && hp > 0){
			other.attacking = true;
			break;
		}
	}
}

if attacking {
	state = CARD_STATE.ATTACK;
	attack_timer ++
	if attack_timer == attack_anim * flash_speed - 30 {
		event_user(1);// 发射子弹
	}
	if attack_timer == attack_anim * flash_speed - 20 {
		event_user(1);// 发射子弹
	}
	if attack_timer >= attack_anim * flash_speed {
		attacking = false;
		cooldown = cycle - attack_timer;
		attack_timer = 0;
		state = CARD_STATE.IDLE
	}
}



