if global.is_paused {
    exit;
}

event_inherited(); 

if is_frozen || state == CARD_STATE.SLEEP {
    exit;
}

var current_flash_speed = flash_speed;
if is_slowdown {
    current_flash_speed *= 2;
}

//冷却计时器，没冷却完啥都不要干
if cooldown > 0{
	cooldown --;
	state = CARD_STATE.IDLE;
	return;
}

// 目标选择
target_list = [];
var max_t = max_targets;

// 存“最优目标”
var best = array_create(max_t, noone);
var best_x = array_create(max_t, 999999);

// 是否有敌人
var has_enemy = false;

with (obj_enemy_parent) {

    // 可攻击类型
    if (can_target_on(other.target_type, target_type)) {

        has_enemy = true;

        var ex = x;

        // 插入排序（只维护前 max_targets 个）
        for (var i = 0; i < max_t; i++) { // 使用 max_t，不要 other.max_targets
            if (ex < best_x[i]) {

                for (var j = max_t - 1; j > i; j--) {
                    best_x[j] = best_x[j - 1];
                    best[j] = best[j - 1];
                }

                best_x[i] = ex;
                best[i] = id;
                break;
            }
        }
    }
}

// 转成 target_list
for (var i = 0; i < max_t; i++) {
    if (best[i] != noone) {
        array_push(target_list, best[i]);
    }
}

// 攻击逻辑
if has_enemy {
	state = CARD_STATE.ATTACK;
	attack_timer ++
	if attack_timer >= attack_anim * flash_speed {
		event_user(1);// 发射子弹
		cooldown = cycle - attack_timer;
		attack_timer = 0;
	}
}


