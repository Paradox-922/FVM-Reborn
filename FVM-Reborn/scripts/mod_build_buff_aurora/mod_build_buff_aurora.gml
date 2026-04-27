function build_buff_aurora() {

    global.aurora_main = array_create(global.grid_cols);
    global.aurora_side = array_create(global.grid_cols);

    for (var c = 0; c < global.grid_cols; c++) {

        global.aurora_main[c] = array_create(global.grid_rows, 1);
        global.aurora_side[c] = array_create(global.grid_rows, 0);
    }
}

function reset_aurora_grid() {

    for (var c = 0; c < global.grid_cols; c++) {
        for (var r = 0; r < global.grid_rows; r++) {

            global.aurora_main[c][r] = 1;
            global.aurora_side[c][r] = 0;
        }
    }
}

function apply_aurora(_inst) {

    if (_inst.plant_id != "aurora") exit;
    if (_inst.shape < 3) exit;

    var row = _inst.grid_row;
    var main = _inst.buff_value;        // 例如 2.0
    var side = (_inst.buff_value - 1) * 0.2;  // 20%

    // === 主行（max）===
    for (var c = 0; c < global.grid_cols; c++) {

        if (main > global.aurora_main[c][row]) {
            global.aurora_main[c][row] = main;
        }
    }

    // === 邻行（sum）===
    for (var c = 0; c < global.grid_cols; c++) {

        if (row - 1 >= 0) {
            global.aurora_side[c][row - 1] = min(global.aurora_side[c][row - 1] + side, side *2);
        }

        if (row + 1 < global.grid_rows) {
            global.aurora_side[c][row + 1] = min(global.aurora_side[c][row + 1] + side, side *2);
        }
    }
}

function get_aurora_buff(_col, _row) {

    var main = global.aurora_main[_col][_row];
    var side = global.aurora_side[_col][_row];
	
    if (main > 1) {
		
        return main + side;

    } else {
		
        return 1 + side;
    }
}