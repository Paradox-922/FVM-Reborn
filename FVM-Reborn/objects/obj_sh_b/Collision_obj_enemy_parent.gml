if ds_list_find_index(hitted_enemy,other.id) == -1{

    // 原来：row == other.grid_row
    // 改成：自身行、上行、下行 都能命中
    if other.hp > 0 
    && (row == other.grid_row - 1 || row == other.grid_row || row == other.grid_row + 1)
    && can_hit(target_type,other.target_type)
    {
        with(other){
            audio_play_sound(hit_sound,0,0)
            damage_amount = other.damage
            damage_type = other.damage_type
            event_user(0)
        }
        ds_list_add(hitted_enemy,other.id)
     
 
    }
}
