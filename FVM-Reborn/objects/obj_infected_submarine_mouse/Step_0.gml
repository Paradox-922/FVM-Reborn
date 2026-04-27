if hp <= 0 && state != ENEMY_STATE.DEAD{
	timer = 0
	state = ENEMY_STATE.DEAD
	if (grid_col < 0 || grid_col >= global.grid_cols || grid_row < 0 || grid_row >= global.grid_rows){
		sprite_index = spr_infected_submarine_mouse_land
		attack_anim = 8
	}
	else{
		if global.grid_terrains[grid_row][grid_col].type == "water"{
			sprite_index = spr_infected_submarine_mouse
			attack_anim = 4
		}
		else{
			sprite_index = spr_infected_submarine_mouse_land
			attack_anim = 8
		}
	}
		
}

if (grid_col < 0 || grid_col >= global.grid_cols || grid_row < 0 || grid_row >= global.grid_rows) {
	sprite_index = spr_infected_submarine_mouse_land
	attack_anim = 8
}
else{
	if state != ENEMY_STATE.DEAD{
		if global.grid_terrains[grid_row][grid_col].type == "water"{
			if sprite_index == spr_infected_submarine_mouse_land{
				state = ENEMY_STATE.ACTING
				sprite_index = spr_infected_submarine_mouse_enter
				timer = 0
				audio_play_sound(snd_enter_water,0,0)
				reversed = false
			}
		}
		else{
			if sprite_index == spr_infected_submarine_mouse{
				state = ENEMY_STATE.ACTING
				sprite_index = spr_infected_submarine_mouse_enter
				timer = 0
				audio_play_sound(snd_enter_water,0,0)
				reversed = true
			}
		}
	}
}

event_inherited();

if global.is_paused or is_frozen{
	exit
}
if state == ENEMY_STATE.ACTING{
	x -= move_speed
	if hp > maxhp * hurt_rate{
		if reversed{
			image_index = 8 - (floor(timer/flash_speed) mod 8)
		}
		else{
			image_index = floor(timer/flash_speed) mod 8
		}
	}
	else{
		if reversed{
			image_index = 8 - (floor(timer/flash_speed) mod 8) + 8
		}
		else{
			image_index = (floor(timer/flash_speed) mod 8) + 8
		}
	}
	if timer >= flash_speed * 8 - 1 or hp <= 0{
		state = ENEMY_STATE.NORMAL
		if reversed{
			sprite_index = spr_infected_submarine_mouse_land
			attack_anim = 8
		}
		else{
			sprite_index = spr_infected_submarine_mouse
			attack_anim = 4
		}
	}
}

if sprite_index == spr_infected_submarine_mouse && hp/maxhp >= hurt_rate &&state != ENEMY_STATE.ATTACK{
	target_type = "diver"
}
else{
	target_type = "normal"
}