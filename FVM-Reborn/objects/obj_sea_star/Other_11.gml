var inst = instance_create_depth(x-40,y-75,depth-500,obj_sea_star_bullet)
inst.damage = atk
inst.move_speed = -8
inst.row = grid_row

var inst2 = instance_create_depth(x+15,y-55,depth-500,obj_star_bullet_vertical)
inst2.damage = atk
inst2.move_speed = 8
inst2.col = grid_col
inst2.image_angle = 0

var inst3 = instance_create_depth(x+15,y-95,depth-500,obj_star_bullet_vertical)
inst3.damage = atk
inst3.move_speed = -8
inst3.col = grid_col
inst3.image_angle = 0

var inst4 = instance_create_depth(x+60,y-65,depth-500,obj_star_bullet_oblique)
inst4.damage = atk
inst4.move_speed = 8
inst4.col = grid_col
inst4.image_angle = 0

var inst5 = instance_create_depth(x+60,y-85,depth-500,obj_star_bullet_oblique)
inst5.damage = atk
inst5.move_speed = -8
inst5.col = grid_col
inst5.image_angle = 0

var bullet_spr = spr_star_bullet;
var bounced = true;
if (shape == 1) bullet_spr = spr_star_bullet_1;
else if (shape == 2) {bullet_spr = spr_star_bullet_2; bounced = false}

inst.sprite_index = bullet_spr;inst.bounced = bounced;
inst2.sprite_index = bullet_spr;inst2.bounced = bounced;
inst3.sprite_index = bullet_spr;inst3.bounced = bounced;
inst4.sprite_index = bullet_spr;inst4.bounced = bounced;
inst5.sprite_index = bullet_spr;inst5.bounced = bounced;