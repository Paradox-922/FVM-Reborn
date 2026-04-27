if global.is_paused{
	image_speed = 0
	exit
	
}
image_speed = 1
x += abs(move_speed * 0.7660)* xd;
y += move_speed * 0.6428;
if x > 2200 or y > 1200 or x < 0 or y < -200{
	instance_destroy()
}