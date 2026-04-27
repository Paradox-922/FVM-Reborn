// 三路射手发射子弹（带散射偏移）
var middle_y = y - 75; // 中间行的y坐标
var row_height = 100;   // 行高，根据你的游戏调整
var spread = 20;        // 散射偏移量，可调整

// 定义三路发射标志和行偏移
var fire_flags = [fire_up, fire_mid, fire_down];
var row_offsets = [-1, 0, 1]; // 上、中、下相对行偏移
var y_offsets = [-spread, 0, spread]; // 上、中、下的垂直偏移

for (var i = 0; i < 3; i++) {
    if (fire_flags[i]) {
        var target_row = grid_row + row_offsets[i];
        var start_x = x + 40;
        var start_y = middle_y + y_offsets[i]; // 应用散射偏移

        // 边界处理
        if (target_row < 0 || target_row >= global.grid_rows) {
            target_row = grid_row;
            start_x -= 20; // 超出边界则稍微往后
        }

        var inst = instance_create_depth(start_x, start_y, depth - 500, obj_love_god_bullet);
        inst.damage = atk;
        inst.move_speed = 8;
        inst.row = grid_row;
        inst.target_row = target_row;
        inst.start_y = middle_y;

        // 根据 shape 设置 sprite
        switch (shape) {
            case 0: inst.sprite_index = spr_love_god_bullet_0; break
            case 1: inst.sprite_index = spr_love_god_bullet_1; break;
            case 2: inst.sprite_index = spr_love_god_bullet_2; break;
            case 3: inst.sprite_index = spr_love_god_bullet_3; break;
        }
    }
}

// 播放音效，只要任意一路开火就播放一次
if (fire_up || fire_mid || fire_down) {
    audio_play_sound(snd_shot, 0, 0);
}