function mod_on_card_placed(card_id, card_shape){
	// 过滤复制类卡
    if (card_id != "brahma" && card_id != "ice_cream") {
		show_debug_message("已记录"+string(card_id)+string(card_shape))
        global.last_placed_card_id = card_id;
        global.last_placed_card_shape = card_shape;
    }
}