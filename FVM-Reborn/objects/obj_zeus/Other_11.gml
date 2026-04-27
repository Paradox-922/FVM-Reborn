var target_enemy = noone;
var min_x = 9999;
var _range = 120
var _r = 1
if shape==3{
	_range = 240
	_r = 2
}

with (obj_enemy_parent) {
    if (hp > 0&&x < min_x) {
            min_x = x;           // 更新最小 X 记录
            target_enemy = id;   // 锁定这个僵尸为当前的最优目标
       }
}

if (target_enemy != noone) {
	var enemy_speed = 0;
	if (variable_instance_exists(target_enemy, "move_speed")) {
            enemy_speed = target_enemy.move_speed;
        }
    var predicted_x = target_enemy.x - (enemy_speed *30);
    var target_y = target_enemy.y-50;
    var target_row = target_enemy.grid_row;
    var target_col = target_enemy.grid_col;
    var bullet = instance_create_depth(predicted_x+100, target_y, depth - 1, obj_zeus_bullet);
    bullet.atk = atk;                // 传递本体的攻击力
    bullet.target_x = predicted_x;      // 告诉子弹它的最终落点 X
    bullet.target_y = target_y;      // 告诉子弹它的最终落点 Y
    bullet.grid_row = target_row;    // 传递目标所在的行 (如果子弹需要判定同行的范围伤害)
    bullet.grid_col = target_col;
    bullet._range = _range;
	bullet._r = _r;

}