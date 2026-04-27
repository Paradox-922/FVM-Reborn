function mod_register_plant_lite(plant_id, shapes_array){
	if (ds_map_exists(global.plant_registry, plant_id)) {
        show_debug_message("mod植物已注册: " + plant_id);
        return false;
    }
    
    // 创建植物类型数据结构
    var plant_data = ds_map_create();
    plant_data[? "shapes"] = ds_map_create(); // 存储所有形态的数据
    
    // 遍历形态数组，为每个形态创建基础数据和升级数据存储
    for (var i = 0; i < array_length(shapes_array); i++) {
        var shape_info = shapes_array[i];
        var shape = shape_info.shape;
        
        // 创建形态数据
        var shape_data = ds_map_create();
        shape_data[? "name"] = shape_info.name;
        shape_data[? "description"] = shape_info.description;
        shape_data[? "base_hp"] = shape_info.hp[0];
        shape_data[? "base_cost"] = shape_info.cost[0];
        shape_data[? "base_atk"] = shape_info.atk[0];
        shape_data[? "base_range"] = shape_info.range[0];
        shape_data[? "base_cooldown"] = shape_info.cooldown[0];
        shape_data[? "base_cycle"] = shape_info.cycle[0];
        
        // 创建升级数据存储
        var upgrades = ds_map_create();
        shape_data[? "upgrades"] = upgrades;
        
        // 添加基础等级数据
        var base_upgrade = ds_map_create();
        ds_map_add(base_upgrade, "level", 0);
        ds_map_add(base_upgrade, "hp", shape_info.hp[0]);
        ds_map_add(base_upgrade, "cost", shape_info.cost[0]);
        ds_map_add(base_upgrade, "atk", shape_info.atk[0]);
        ds_map_add(base_upgrade, "range", shape_info.range[0]);
        ds_map_add(base_upgrade, "cooldown", shape_info.cooldown[0]);
        ds_map_add(base_upgrade, "cycle", shape_info.cycle[0]);
		if struct_exists(shape_info,"flame_produce"){
			ds_map_add(base_upgrade,"flame_produce",shape_info.flame_produce[0])}
		if struct_exists(shape_info,"first_produce_delay"){
			ds_map_add(base_upgrade,"first_produce_delay",shape_info.first_produce_delay[0])}
        
        ds_map_add(upgrades, "0", base_upgrade);
        
        // 将形态数据添加到植物数据中
        ds_map_add(plant_data[? "shapes"], string(shape), shape_data);
    }
    
    // 添加到注册表
    ds_map_add(global.plant_registry, plant_id, plant_data);
	
	//遍历添加等级信息
	for(var i = 1 ; i <= 18;i++){
		add_plant_upgrade_lite(plant_id,i,shapes_array)
	}
    
    return true;
}