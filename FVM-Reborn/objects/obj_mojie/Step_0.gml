if (global.is_paused || is_frozen) {
    exit;
}

event_inherited(); 

life_timer--;

if (life_timer < 3 * 60) {
    // 最后 3 秒闪烁
    if (life_timer mod 10 < 5) image_alpha = 0.5;
    else image_alpha = 1.0;
}

if (life_timer <= 0) {
    instance_destroy();
    exit;
}
attack_timer++;


if (attack_timer <= idle_duration) {
    state = CARD_STATE.IDLE;
} 
else if (attack_timer <= attack_interval) {
    state = CARD_STATE.ATTACK;
} 

else {
    attack_timer = 0;
    state = CARD_STATE.IDLE;
}

var trigger_time = idle_duration + (6 * flash_speed);
    var range_cells = 1;
    if (shape == 2) {
        range_cells = 2;
    }
if (attack_timer == trigger_time) && state == CARD_STATE.ATTACK {
    with (obj_enemy_parent) {
                if (hp > 0&& abs(grid_row - other.grid_row) <= range_cells&&abs(grid_col - other.grid_col) <= range_cells) {
                    hp -= other.atk;
                    event_user(0); 
		            audio_play_sound(snd_hit1,0,0)
					if ice_timer < 600{
				       ice_timer = 600
			       }
                }
        }
        var _gap1 = 105; 
        var _gap2 = 115;
        for (var i = -range_cells; i <= range_cells; i++) {
            for (var j = -range_cells; j <= range_cells; j++) {
                var spawn_x = x + (j * _gap1);
                var spawn_y = y + (i * _gap2);
                var spike = instance_create_depth(spawn_x, spawn_y, depth - 5, obj_mojie_bullet);
            }
        }
    }

