function build_shield_grid(){

    global.shield_grid = array_create(global.grid_cols);

    for (var c = 0; c < global.grid_cols; c++) {
        global.shield_grid[c] = array_create(global.grid_rows, 0);
    }
}

function rebuild_shield_grid(){

    for (var c = 0; c < global.grid_cols; c++) {
        for (var r = 0; r < global.grid_rows; r++) {
            global.shield_grid[c][r] = 0;
        }
    }
}

function apply_shield_buff(_inst) {

    var cells = _inst.buff_cells;

    for (var i = 0; i < array_length(cells); i++) {

        var c = cells[i][0];
        var r = cells[i][1];
        var v = cells[i][2];

        global.shield_grid[c][r] = v;
    }
}

function add_shield_area(_cells, _col, _row, _value) {

    // 5x5范围
    for (var dx = -2; dx <= 2; dx++) {
        for (var dy = -2; dy <= 2; dy++) {

            var c = _col + dx;
            var r = _row + dy;

            if (c >= 0 && c < global.grid_cols &&
                r >= 0 && r < global.grid_rows) {

                var dist = max(abs(dx), abs(dy));

                var v;

                if (dist <= 1) {
                    v = _value;          // 3x3
                } else {
                    v = _value * 0.5;    // 外圈
                }

                array_push(_cells, [c, r, v]);
            }
        }
    }
}