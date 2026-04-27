if global.is_paused{
	exit
}
if state == CARD_STATE.IDLE{
	flash_speed = 5
}
else if state == CARD_STATE.ATTACK{
	flash_speed = 4
}
event_inherited(); 

var current_flash_speed = flash_speed
if is_slowdown{
	current_flash_speed *= 2
}


//检测自身右方是否有敌人
var has_enemy = false
	
	var _x = x;
	var _y = y;

	with (obj_enemy_parent) {
		
			if (health > 0  && abs(grid_row - other.grid_row) <= 2&&abs(grid_col - other.grid_col) <= 2) {
		        has_enemy = true
		    }
		
	}

//攻击逻辑
if state != CARD_STATE.SLEEP && state != CARD_STATE.AWAKE{
	if (has_enemy) {
	    if (attack_timer <= cycle - attack_anim * current_flash_speed) {
	        attack_timer++;
	    } else if (attack_timer < cycle) {
	        attack_timer++;
	        state = CARD_STATE.ATTACK;
	    } else {
	        attack_timer = 0;
	        state = CARD_STATE.IDLE;
	    }
		if (attack_timer == cycle - 8 * current_flash_speed) && state == CARD_STATE.ATTACK{
        
			event_user(1)
	    }
		if (attack_timer == cycle - 12 * current_flash_speed) && state == CARD_STATE.ATTACK{
			if shape==2{
				event_user(1)
			}
        
			audio_play_sound(snd_coffee_pot_attack,0,0)
	    }
	} else {
	    // 没有符合条件的敌人，重置状态
	    attack_timer = 0;
	    state = CARD_STATE.IDLE;
	}
}


