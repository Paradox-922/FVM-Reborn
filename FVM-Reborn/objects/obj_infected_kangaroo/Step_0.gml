if !arm_dropped && (hp/(maxhp - helmet_hp) <= hurt_rate) {
	var inst = instance_create_depth(x-25, y-95, depth-1, obj_infected_arms_drop);
	arm_dropped = true;
}

event_inherited();

if global.is_paused or is_frozen or is_stun{
	exit
}

if !dropped {
	
	attack_anim = 0;
	move_anim = 8;
	death_anim = 16;
	
	if state == ENEMY_STATE.ATTACK{
		timer = 0
		state = ENEMY_STATE.ACTING
	}

	if state == ENEMY_STATE.ACTING{
		if hp > maxhp * hurt_rate{
			image_index = floor(timer/flash_speed) mod 8
		}
		else{
			image_index = floor(timer/flash_speed) mod 8 + 8
		}
		if timer >= 6 * 9 && timer <= 6 * 16{
			if instance_exists(target_plant){
				if array_get_index(block_list, target_plant.plant_id) == -1{
					x -= 5
				}
				else{
					x -= 0
					dropped = true;
				}
			}
			else{
				x -= 5
			}
		}
		if timer >= flash_speed * 16 or hp <= 0{
			state = ENEMY_STATE.NORMAL
		}
	}
}

if dropped && !anim_played {
	state = ENEMY_STATE.ACTING
	sprite_index = spr_infected_kangaroo_drop
	if anim_timer < 65 {
		image_index = floor(anim_timer/flash_speed);
		anim_timer++
	} else {
		state = ENEMY_STATE.NORMAL;
		anim_played = true;
		sprite_index = spr_infected_kangaroo_dropped
	}
}

if dropped && anim_played {
	attack_anim = 6
	move_anim = 16
	death_anim = 12
	move_speed = 0.30
}