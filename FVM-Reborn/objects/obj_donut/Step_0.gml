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
	cooldown --;
	return;
}

if !attacking {
	// 检测自身右方是否有敌人，并获取最近的敌人
	with (obj_enemy_parent) {
	    if (target_type == "air"
		&& grid_row == other.grid_row
		&& hp > 0) {
			other.target_t = "air_only";
			other.attacking = true;
	        break;
	    } 
		if (can_target_on(other.target_type, target_type) 
		&& grid_row == other.grid_row
		&& hp > 0 ) {
			other.attacking = true;
	        break;
		}
	}
}

if attacking {
	state = CARD_STATE.ATTACK;
	attack_timer ++
	if attack_timer == attack_anim * flash_speed -20 {
		event_user(1);// 发射子弹
	}
	if attack_timer == attack_anim * flash_speed -15 {
		event_user(1);// 发射子弹
	}
	if attack_timer == attack_anim * flash_speed -10 && shape == 2 {
		event_user(1);// 发射子弹
	}
	if attack_timer >= attack_anim * flash_speed || attack_timer >= cycle{
		attacking = false;
		cooldown = cycle - attack_timer;
		attack_timer = 0;
		state = CARD_STATE.IDLE;
		target_t = "normal";
	}
}


