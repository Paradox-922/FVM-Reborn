if !hit_enemy {
    if other.hp > 0 and row == other.grid_row and can_hit(target_type, other.target_type) {
        hit_enemy = true;
        
        // 特效直接在预测的投掷位置那一格生成
        var cell_col = target_col;
        var cell_row = row; // 保持发射者行位置

        var cell_x = global.grid_offset_x + cell_col * global.grid_cell_size_x + global.grid_cell_size_x / 2 + 20;
        var cell_y = global.grid_offset_y + cell_row * global.grid_cell_size_y + global.grid_cell_size_y / 2 - 20;
        
        // 在老鼠所在的格子生成生煎特效
        var inst = instance_create_depth(cell_x, cell_y, depth, obj_shengjian_pot_bullet_effect);
        inst.damage = damage;
        inst.shape = shape;
        if (shape >= 2) {
            inst.sprite_index = spr_shengjian_pot_effect_2;
        } else {
            inst.sprite_index = spr_shengjian_pot_effect;
        }
        inst.grid_col = cell_col;
        inst.grid_row = cell_row;

        audio_play_sound(snd_egg_bullet, 0, 0);
        instance_destroy();
    }
}