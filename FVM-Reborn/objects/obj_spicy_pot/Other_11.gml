var inst = instance_create_depth(x + 60, y-30, depth - 500, obj_spicypot_bullet)
inst.damage = atk
inst.shape = shape
inst.row = grid_row
inst.start_col = grid_col
inst.start_x = x + 60
inst.max_cols = shape >= 2 ? 5 : 4
inst.move_speed = (inst.max_cols * global.grid_cell_size_x) / 34