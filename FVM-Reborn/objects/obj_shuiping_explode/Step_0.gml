if global.is_paused {
    exit;
}

timer++;

// 控制动画播放与销毁
if timer < 7 * 5 {
    image_index = floor(timer / 5);
} else {
    instance_destroy();
}
if (timer == 2 && generation < 2) {
    
    // 【横向蔓延】
    if (type == 0) {
        if (is_parent) {
            // 中心点：同时向左和向右蔓延
            if (col > 0) {
                var inst1 = instance_create_depth(x - global.grid_cell_size_x, y, depth, object_index);
                inst1.col = col - 1;
                inst1.dir = 0;
                inst1.generation = generation + 1; // 代数 +1
            }
            if (col < global.grid_cols - 1) {
                var inst2 = instance_create_depth(x + global.grid_cell_size_x, y, depth, object_index);
                inst2.col = col + 1;
                inst2.dir = 1;
                inst2.generation = generation + 1; // 代数 +1
            }
        } else {
            // 子节点：继续顺着原来的方向蔓延
            if (col > 0 && dir == 0) {
                var inst1 = instance_create_depth(x - global.grid_cell_size_x, y, depth, object_index);
                inst1.col = col - 1;
                inst1.dir = 0;
                inst1.generation = generation + 1; 
            }
            if (col < global.grid_cols - 1 && dir == 1) {
                var inst2 = instance_create_depth(x + global.grid_cell_size_x, y, depth, object_index);
                inst2.col = col + 1;
                inst2.dir = 1;
                inst2.generation = generation + 1;
            }
        }
    }
    
    // 【纵向蔓延】
    if (type == 1) {
        if (is_parent) {
            // 中心点：同时向上和向下蔓延
            if (row > 0) {
                var inst1 = instance_create_depth(x, y - global.grid_cell_size_y, depth, object_index);
                inst1.row = row - 1;
                inst1.dir = 0;
                inst1.type = 1;
                inst1.generation = generation + 1; // 代数 +1
            }
            if (row < global.grid_rows - 1) {
                var inst2 = instance_create_depth(x, y + global.grid_cell_size_y, depth, object_index);
                inst2.row = row + 1;
                inst2.dir = 1;
                inst2.type = 1;
                inst2.generation = generation + 1; // 代数 +1
            }
        } else {
            // 子节点：继续顺着原来的方向蔓延
            if (row > 0 && dir == 0) {
                var inst1 = instance_create_depth(x, y - global.grid_cell_size_y, depth, object_index);
                inst1.row = row - 1;
                inst1.dir = 0;
                inst1.type = 1;
                inst1.generation = generation + 1;
            }
            if (row < global.grid_rows - 1 && dir == 1) {
                var inst2 = instance_create_depth(x, y + global.grid_cell_size_y, depth, object_index);
                inst2.row = row + 1;
                inst2.dir = 1;
                inst2.type = 1;
                inst2.generation = generation + 1;
            }
        }
    }
}