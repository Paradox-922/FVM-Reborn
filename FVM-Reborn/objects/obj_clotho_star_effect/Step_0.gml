if global.is_paused{
	exit
}

timer++;

image_index = floor(timer / 5) + 18 * state;

if (timer >=  18 * 5 - 1) {
    instance_destroy();
}