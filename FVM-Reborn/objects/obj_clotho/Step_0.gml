if global.is_paused{
	exit
}

event_inherited(); 

var current_flash_speed = flash_speed
if is_slowdown{
	current_flash_speed *= 2
}

// 倒计时
if (transform_timer > 4){
    transform_timer--;
} else {
	instance_destroy();
}

if transform_timer == idle_anim * flash_speed - 12 *flash_speed {
	event_user(1);
}
