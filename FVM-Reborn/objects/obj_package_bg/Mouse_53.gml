if package_button_select == 1{
	if not is_submenu_opened{
		if hover_card_index != -1{
			audio_play_sound(snd_button,0,0)
			var inst = instance_create_depth(room_width/2,room_height/2,depth-5,obj_card_edit_menu)
			inst.target_card_index = hover_card_index
			var deck_entry = global.player_deck[| hover_card_index*2+1];
			var card_data_shapes = deck_entry[? "shapes"]
			view_max_shapes = ds_list_size(card_data_shapes)-1
			//show_debug_message(view_max_shapes)
			inst.view_max_shape = view_max_shapes
			is_submenu_opened = true
		}
	}
}
// 鼠标按下事件
if (package_button_select == 2) {
	if not is_submenu_opened{
	    // 武器背包标签页
	    if (hover_weapon_index != -1) {
			audio_play_sound(snd_button,0,0)
	        var weapon_id = global.save_data.unlocked_weapons[hover_weapon_index].id;
			var weapon_info = get_weapon_info(weapon_id)
	        var is_equipped = is_weapon_equipped(weapon_id);
        
	        if (is_equipped) {
	            // 如果已装备，则卸下
	            var slot = get_weapon_slot(weapon_id);
				remove_all_gems_from_slot(weapon_info.slot);//【新增】
	            remove_weapon(slot);
				show_notice("武器和宝石会一同卸下 ", 60);//【新增】
	        } else {
	            // 如果未装备，则装备到对应武器槽
				remove_all_gems_from_slot(weapon_info.slot);//【新增】
	            equip_weapon(weapon_id, weapon_info.slot);
				show_notice("已装备" + weapon_info.name, 60);//【新增】
	        }
	    }
		//if (hover_gem_index != -1) {
		//	audio_play_sound(snd_button,0,0)
	    //    var weapon_id = global.save_data.unlocked_gems[hover_gem_index].id;
		//	var weapon_info = get_gem_info(weapon_id)
	    //    var is_equipped = (get_gem_index(weapon_id) != -1);
        
	    //    if (is_equipped) {
	    //        //如果已装备，则卸下
	    //        remove_gem(weapon_id)
	    //    } else {
	    //        // 如果未装备，则装备到对应武器槽
	    //        equip_gem(weapon_id);
	    //    }
	    //}

		if (hover_gem_index != -1) {
			audio_play_sound(snd_button,0,0)
			var gem_id = global.save_data.unlocked_gems[hover_gem_index].id;
			var gem_info = get_gem_info(gem_id)
			var is_equipped = (get_gem_index(gem_id) != -1);
			
			// 检查对应slot的武器是否已装备
			var weapon_slot = gem_info.slot;
			var weapon_equipped = false;
			var current_weapon_id = "";
			
			if weapon_slot == "main_weapon"{
				weapon_equipped = (global.save_data.equipped_items.main_weapon.id != "");
				current_weapon_id = global.save_data.equipped_items.main_weapon.id;
			}
			else if weapon_slot == "secondary_weapon"{
				weapon_equipped = (global.save_data.equipped_items.secondary_weapon.id != "");
				current_weapon_id = global.save_data.equipped_items.secondary_weapon.id;
			}
			else if weapon_slot == "super_weapon"{
				weapon_equipped = (global.save_data.equipped_items.super_weapon.id != "");
				current_weapon_id = global.save_data.equipped_items.super_weapon.id;
			}
			
			if (!weapon_equipped) {
				// 武器未装备，无法装备宝石
				show_notice("请先装备对应槽位的武器", 60);
			} else {
				var current_weapon_info = get_weapon_info(current_weapon_id);
				
				// 检查宝石是否有allowed_weapons属性
				var gem_allowed = true;
				var has_gem_allowed_weapons = variable_instance_exists(gem_info, "allowed_weapons");
				
				if (has_gem_allowed_weapons) {
					// 检查当前武器是否在宝石的allowed_weapons列表中
					gem_allowed = (array_get_index(gem_info.allowed_weapons, current_weapon_id) != -1);
				}
				
				// 检查武器是否有allowed_gems属性
				var weapon_allowed = true;
				var has_weapon_allowed_gems = variable_instance_exists(current_weapon_info, "allowed_gems");
				
				if (has_weapon_allowed_gems) {
					// 检查当前宝石是否在武器的allowed_gems列表中
					weapon_allowed = (array_get_index(current_weapon_info.allowed_gems, gem_id) != -1);
				}
				
				if (!gem_allowed) {
					// 宝石与武器不兼容
					show_notice(gem_info.name + "与" + current_weapon_info.name + "不兼容", 60);
				} else if (!weapon_allowed) {
					// 武器限制了该宝石
					show_notice(current_weapon_info.name + "不支持" + gem_info.name, 60);
				} else {
					if (is_equipped) {
						//如果已装备，则卸下
						remove_gem(gem_id)
						show_notice("已卸下" + gem_info.name, 60);
					} else {
						// 如果未装备，则装备到对应武器槽
						equip_gem(gem_id);
						show_notice("已装备" + gem_info.name, 60);
					}
				}
			}
		}
	}
}