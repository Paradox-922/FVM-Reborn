event_inherited();
// 注销增伤源
var idx = ds_list_find_index(global.buff_sources, id);
if (idx != -1) {
    ds_list_delete(global.buff_sources, idx);
}
global.buff_dirty = true; // 驱动增伤系统更新