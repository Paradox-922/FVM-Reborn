if !obj_readyroom_manager.is_submenu_open{
	audio_play_sound(snd_button,0,0)
	ds_list_clear(global.selected_deck)
}