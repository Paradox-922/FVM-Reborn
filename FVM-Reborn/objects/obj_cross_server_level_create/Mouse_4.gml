if not is_disabled {
	audio_play_sound(snd_button,0,0)
	var level_list = global.maps_map[? "cross_server"].levels_data
	global.level_data = level_list[level_index]

	global.level_id = global.level_data.id
	var _file_path = "level_data/" + global.level_data.level_file
	if global.difficulty >= 2{
		_file_path = "level_data/" + global.level_data.hard_level_file
	}
	
	//使用 load_buffer 和 buffer_read 加载文件内容
	var _buffer = buffer_load(_file_path);
	if (!buffer_exists(_buffer)) {
		show_debug_message("错误：无法加载关卡文件到缓冲区: " + _file_path);
	} else {
		var _json_string = buffer_read(_buffer, buffer_string);
		buffer_delete(_buffer); // 释放缓冲区内存

		// 解析JSON字符串
		global.level_file = json_parse(_json_string);
    
		// 检查解析是否成功
		if (global.level_file == -1) {
		    show_debug_message("错误：JSON 解析失败！");
		} else {
		    show_debug_message("关卡文件加载并解析成功！");
		    show_debug_message(global.level_file);
		}
	}
	global.map_id = "tower_cake"
	global.map_name = "跨服远征"
	room_goto(room_ready);
}