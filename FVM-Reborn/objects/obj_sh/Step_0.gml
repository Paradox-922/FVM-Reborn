if global.is_paused{
    exit
}
event_inherited(); 
if is_frozen{
    exit
}
var current_flash_speed = flash_speed
if is_slowdown{
    current_flash_speed *= 2
}

// 检测：自身行 + 上行 + 下行 三行右侧所有敌人
var has_enemy = false
with(obj_enemy_parent){
    if(
        // 匹配上/中/下三行
        (grid_row == other.grid_row - 1 || grid_row == other.grid_row || grid_row == other.grid_row + 1)
        && grid_col >= other.grid_col
        && grid_col <= (global.grid_cols + 1)
        && can_target_on(other.target_type,target_type)
    ){
        has_enemy = true
        break
    }
}

//攻击逻辑
if state != CARD_STATE.SLEEP && state != CARD_STATE.AWAKE{
    if (has_enemy) {
        if (attack_timer <= cycle - attack_anim * current_flash_speed) {
            attack_timer++;
        }else if (attack_timer == cycle - (attack_anim-3) * current_flash_speed) && state == CARD_STATE.ATTACK{
            attack_timer++;
        
            event_user(1)
        } else if (attack_timer <= cycle) {
            attack_timer++;
            state = CARD_STATE.ATTACK;
        } else {
            attack_timer = 0;
            state = CARD_STATE.IDLE;
        }
    } else {
        // 没有符合条件的敌人，重置状态
        attack_timer = 0;
        state = CARD_STATE.IDLE;
    }
}
var count = instance_number(obj_sh) - 1;
// 计算倍率
var multiplier = 1 + 0.08 * count;
// 锁定最大不超过 1.5
multiplier = min(multiplier, 1.5);
if shape = 3{
    atk = base_atk * multiplier;
} else {
    atk = base_atk;
}






