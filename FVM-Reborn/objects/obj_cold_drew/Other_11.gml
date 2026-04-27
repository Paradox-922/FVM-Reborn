var total_bullets = (shape == 2) ? 6 : array_length(target_list);

// 复制目标列表到 temp_targets
var temp_targets = [];
for (var i = 0; i < array_length(target_list); i++) {
    array_push(temp_targets, target_list[i]);
}

// 如果 shape==2 且敌人数量不足6
if (shape == 2 && array_length(temp_targets) < total_bullets) {

    // 找到 maxhp 最大的敌人
    var max_hp = -1;

    for (var i = 0; i < array_length(temp_targets); i++) {
        var t = temp_targets[i];
        if (t != noone && instance_exists(t)) {
            if (t.maxhp > max_hp) {
                max_hp = t.maxhp;
                main_target = t;
            }
        }
    }

    // 补足剩余子弹到 main_target
    var bullets_to_add = total_bullets - array_length(temp_targets);
    for (var i = 0; i < bullets_to_add; i++) {
        array_push(temp_targets, main_target);
    }
}

// 发射子弹
var repeat_index = 0; // 统计重复子弹序号
for (var i = 0; i < total_bullets; i++) {
    var t = temp_targets[i];
    if (t != noone && instance_exists(t)) {

        var inst = instance_create_depth(t.x, t.y-20, t.depth-1, obj_cold_drew_bullet);
        inst.target_id = t.id;
        inst.damage = atk;
        inst.row = t.grid_row;
        inst.shape_bullet = shape;

        if (t == main_target) {
            inst.delay = repeat_index * 10; // 每颗延迟10帧
            repeat_index++;
        } else {
            inst.delay = 0;
        }
    }
}