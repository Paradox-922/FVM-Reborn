image_xscale = 0.9
image_yscale = 0.9

is_submenu_opened = false
button_select = 0

instance_create_depth(x+785,y-466,depth-1,obj_closecraft_btn)
instance_create_depth(x-305,y+220,depth-1,obj_craft_confirm_btn)

var btn1 = instance_create_depth(x-661,y-50,depth-1,obj_craft_select_btn)
btn1.button_index = 0
btn1.text_spr = spr_craft_card_text
var btn2 = instance_create_depth(x-661,y+100,depth-1,obj_craft_select_btn)
btn2.button_index = 1
btn2.text_spr = spr_craft_gem_text

card_material_id_list = ["natural_spices","secret_spices","royal_spices","clover_1","clover_2","clover_3"]
gem_material_id_list = ["less_crystal","middle_crystal","advanced_crystal"]

hover_card_index = -1
hover_gem_index = -1
close_timer = -1

current_uprade_target_id = ""

spices_use_order = ["natural_spices","secret_spices","royal_spices"]
clover_use_order = ["clover_1","clover_2","clover_3"]
crystal_use_order = ["less_crystal","middle_crystal","advanced_crystal"]

// 背包参数
cols = 7;                  // 列数固定
row_height = 96;           // 每行高度
col_width = 84;            // 每列宽度
visible_rows = 8;          // 可见行数

// 滚动偏移
y_offset = 0;

// surface 初始化
package_surface = -1;       // Draw Preprocessing 会创建

// 总卡片和总行数
total_cards = array_length(global.save_data.unlocked_cards);
total_rows = ceil(total_cards / cols);

// 最大滚动偏移
max_y_offset = max(0, (total_rows - visible_rows) * row_height);

extra_w = 90;  // 左右扩展
extra_h = 100;  // 上下扩展
