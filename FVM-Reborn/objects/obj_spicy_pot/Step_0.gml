if global.is_paused{
	exit
}
event_inherited(); 
if is_frozen{
	exit
}
var current_flash_speed = flash_speed
if is_slowdown{
	current_flash_speed *= 2
}
//检测自身右方是否有敌人
var has_enemy = false
if shape < 2{
	with(obj_enemy_parent){
		if (grid_row >= other.grid_row - 1 && grid_row <= other.grid_row + 1 && grid_col >= other.grid_col && grid_col <= (other.grid_col + 4) && can_target_on(other.target_type,target_type)){
			has_enemy = true
			break
		}
	}
}
else{
	with(obj_enemy_parent){
		if (grid_row >= other.grid_row - 1 && grid_row <= other.grid_row + 1 && grid_col >= other.grid_col && grid_col <= (other.grid_col + 5) && can_target_on(other.target_type,target_type)){
			has_enemy = true
			break
		}
	}
}

// 攻击逻辑
var wait_time = cycle - attack_anim * current_flash_speed;
if (wait_time < 0) wait_time = 0;

var is_executing_attack = (attack_timer > wait_time && attack_timer < wait_time + attack_anim * current_flash_speed);

if (has_enemy || is_executing_attack) {
	if (attack_timer < wait_time) {
		attack_timer++;
		state = CARD_STATE.IDLE;
	} else if (attack_timer < wait_time + attack_anim * current_flash_speed) {
		if (attack_timer == wait_time + 16 * current_flash_speed) {
			event_user(1); 
		}
		attack_timer++;
		state = CARD_STATE.ATTACK;
	} else {
		attack_timer = 0;
		state = CARD_STATE.IDLE;
	}
} else {
	if (attack_timer >= wait_time + attack_anim * current_flash_speed) {
		attack_timer = 0;
	} else if (attack_timer < wait_time) {
		attack_timer++;
	}

	state = CARD_STATE.IDLE;
}
