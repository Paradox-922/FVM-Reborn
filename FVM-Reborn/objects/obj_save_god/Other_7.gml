if (global.is_paused) exit;
event_inherited();

if (!spawned) {
    spawned = true;

    var total_rows = global.grid_rows;
    var center_row = grid_row;
    var hit_rows[];

    //=========================================
    // shape 0/1：4行
    //=========================================
    if (shape == 0 || shape == 1) {
        if (center_row == 0) {
            hit_rows = [0, 1, 2, 3];
        }
        else if (center_row == total_rows - 1) {
            hit_rows = [center_row-3, center_row-2, center_row-1, center_row];
        }
        else if (center_row == 1) {
            hit_rows = [center_row-1, center_row, center_row+1, center_row+2];
        }
        else if (center_row == total_rows - 2) {
            hit_rows = [center_row-2, center_row-1, center_row, center_row+1];
        }
        else {
            var type = irandom(1);
            if (type == 0) {
                hit_rows = [center_row-1, center_row, center_row+1, center_row+2];
            } else {
                hit_rows = [center_row-2, center_row-1, center_row, center_row+1];
            }
        }
    }

    //=========================================
    // shape 2：5行
    //=========================================
    else if (shape == 2) {
        if (center_row == 0) {
            hit_rows = [0, 1, 2, 3, 4];
        }
        else if (center_row == total_rows - 1) {
            hit_rows = [center_row-4, center_row-3, center_row-2, center_row-1, center_row];
        }
        else if (center_row == 1) {
            hit_rows = [center_row-1, center_row, center_row+1, center_row+2, center_row+3];
        }
        else if (center_row == total_rows - 2) {
            hit_rows = [center_row-3, center_row-2, center_row-1, center_row, center_row+1];
        }
        else {
            hit_rows = [center_row-2, center_row-1, center_row, center_row+1, center_row+2];
        }
    }

    //=========================================
    // shape 3：全屏，数组写法，风格统一
    //=========================================
    else if (shape == 3) {
        if (total_rows == 6) {
            hit_rows = [0, 1, 2, 3, 4, 5];
        } else {
            hit_rows = [0, 1, 2, 3, 4, 5, 6];
        }
    }

    //=========================================
    // 生成横向冲撞
    //=========================================
    for (var i = 0; i < array_length(hit_rows); i++) {
        var r = hit_rows[i];
        var row_diff = r - center_row;
        var target_y = y - global.grid_cell_size_y + row_diff * global.grid_cell_size_y;

        var eff = instance_create_depth(x-400, target_y, depth - 500, obj_save_god01_e);
        eff.atk = atk;
        eff.grid_row = r;

        if (shape == 0 || shape == 1) {
            eff.sprite_index = spr_save_god_01_e;
        } else {
            eff.sprite_index = spr_save_god_23_e1;
        }
    }

    //=========================================
    // 第九列纵向（完全不动）
    //=========================================
   if (shape == 2 || shape == 3) {
        var col9_x =  14 * global.grid_cell_size_x;

        for (var r = 0; r < total_rows; r++) {
            var row_diff = r - center_row;
            var col9_y = y - global.grid_cell_size_y + row_diff * global.grid_cell_size_y;

            var v_eff = instance_create_depth(col9_x, col9_y, depth - 500, obj_save_god23_e2);
            v_eff.atk = atk;
            v_eff.grid_row = r;
        }
    }


    // 生成完毕立刻自杀，绝对不抽搐
    instance_destroy();
}
