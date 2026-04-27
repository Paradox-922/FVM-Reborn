// 先定义不同形态对应的子弹对象
var bullet_obj;
if (shape == 0) {
    bullet_obj = obj_sh_b;       // 形态0用原子弹
}
else if (shape == 1) {
    bullet_obj = obj_sh_b_1;     // 形态1换这个子弹
}
else if (shape == 2) {
    bullet_obj = obj_sh_b_2;     // 形态2换这个子弹
}
else if (shape == 3) {
    bullet_obj = obj_sh_b_3;     // 形态2换这个子弹
}

// 生成对应子弹（其他参数完全不变）
var inst = instance_create_depth(x+50,y-153,depth-500,bullet_obj);
audio_play_sound(snd_shot,0,0);
inst.damage = atk;
inst.move_speed = 0;
inst.shape = shape;
inst.row = grid_row;
inst.start_col = grid_col;
