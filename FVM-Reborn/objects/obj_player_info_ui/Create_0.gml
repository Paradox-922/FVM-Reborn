image_xscale = 1.8
image_yscale = 1.8
menu_type = 0
instance_create_depth(x + 385,y + 73,depth-1,obj_fullscreen_btn)
instance_create_depth(x + 362,y + 113,depth-1,obj_edit_btn)
instance_create_depth(x + 339,y + 153,depth-1,obj_config_btn)
// 创建事件中初始化变量
avatar_surface = -1;
avatar_texture = spr_player_character_icon;
mask_size = 115; // 圆形头像的直径
// 创建事件
avatar_shader = shader_circle_mask
u_center = shader_get_uniform(avatar_shader, "u_center");
u_radius = shader_get_uniform(avatar_shader, "u_radius");
