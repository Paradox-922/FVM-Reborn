if global.is_paused{
	image_speed = 0
}
else{
	image_speed = 1
}

if !global.is_paused {
	x += move_speed
}

// 超过指定列数后销毁
if (x - start_x > max_cols * global.grid_cell_size_x) {
	instance_destroy()
}

if x > 2200 or y > 1200 or x < 0 or y < 0 {
	instance_destroy()
}