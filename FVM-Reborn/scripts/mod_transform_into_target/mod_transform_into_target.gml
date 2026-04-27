function find_valid_position(_col, _row, _card_data) {
	var offsets = [
	    [0, 0],

		[0, -1],
	    [0, 1],
	    [1, 0],
	    [-1, 0],
	    
	    [-1, -1],
	    [-1, 1],
	    [1, -1],
	    [1, 1]
	];
	
	var is_replace_mode = false;
	if global.replace_placement{
		global.replace_placement = false;
		is_replace_mode = true;
	}
	
    for (var i = 0; i < array_length(offsets); i++) {

	    var c = _col + offsets[i][0];
	    var r = _row + offsets[i][1];

	    var world = get_world_position_from_grid(c, r);

	    if (can_place_at_position(
	        world.x,
	        world.y,
	        _card_data[? "plant_type"],
	        _card_data[? "feature_type"],
	        _card_data[? "target_card"]
	    )) {
			if is_replace_mode global.replace_placement = true;
	        return { col: c, row: r };
	    }
	}

	if is_replace_mode global.replace_placement = true;
    return undefined;
}

function transform_into_target() {
	//show_debug_message("TRANSFORM TRIGGERED");
    // 没有可复制目标，直接消失（防bug）
    if (target_card_id == "") {
        instance_destroy();
        exit;
    }

    // 记录当前位置
    var _x = x;
    var _y = y;
    var _row = grid_row;
    var _col = grid_col;

	var card_data = deck_get_card_data(target_card_id, target_shape);
	var obj_type = card_data[? "obj"];
	var pos = find_valid_position(_col, _row, card_data);

	if (is_undefined(pos)) {
	    instance_destroy();
	    exit;
	}
	var world = get_world_position_from_grid(pos.col, pos.row);

    // === 创建真正的卡 ===

	var new_plant = instance_create_depth(world.x, world.y, 0, obj_type);

    // 关键：用目标卡初始化
    new_plant.card_id = target_card_id;
    new_plant.card_shape = target_shape;
	new_plant.transform_recorded = true;

	card_created(new_plant, pos.col, pos.row);

    // 深度修正
    new_plant.depth = calculate_plant_depth(pos.col, pos.row, new_plant.plant_type);
}