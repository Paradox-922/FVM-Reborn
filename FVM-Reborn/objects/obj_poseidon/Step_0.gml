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
if is_frozen || state == CARD_STATE.SLEEP{
	exit
}
var current_flash_speed = flash_speed
if is_slowdown{
	current_flash_speed *= 2
}


//检测自身右方是否有敌人
var has_enemy = false
	
	var _x = x;
	var _y = y;
	var _range = 2;
	if(shape==3){
		_range = 3;
	}

	with (obj_enemy_parent) {
		
			if (health > 0 &&hp > 0 && hp > 0&& abs(grid_row - other.grid_row) <= 2&&abs(grid_col - other.grid_col) <= _range) {
		        has_enemy = true
		    }
		
	}

//攻击逻辑
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
		if (attack_timer == cycle - 2 * current_flash_speed) && state == CARD_STATE.ATTACK{
        
			event_user(1);
	    }
		if (attack_timer == cycle - 4 * current_flash_speed) && state == CARD_STATE.ATTACK{
            event_user(1);
			audio_play_sound(snd_coffee_pot_attack,0,0)
	    }
		if shape >= 2{
		if  (attack_timer == cycle - 6 * current_flash_speed) && state == CARD_STATE.ATTACK{
			event_user(1);
		}
	}
	} else {
	    // 没有符合条件的敌人，重置状态
	    attack_timer = 0;
	    state = CARD_STATE.IDLE;
	}



