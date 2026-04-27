if on_click and !obj_readyroom_manager.is_submenu_open{
	if ds_list_size(global.selected_deck) > 0{
		button_pushed = true
		audio_play_sound(snd_button,0,0)
	}
	else{
		show_notice("至少需要选择一张防御卡",60)
	}
}