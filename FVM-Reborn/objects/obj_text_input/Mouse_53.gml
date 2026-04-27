// obj_text_input 全局鼠标按下事件
// 检查是否点击了输入框
if (point_in_rectangle(mouse_x, mouse_y, x, y, x + width, y + height)) {
    active = true;
} else {
    active = false;
}