// 如果 surface 不存在，则创建
if (!surface_exists(package_surface)) {
    package_surface = surface_create(
    cols * col_width + extra_w ,
    visible_rows * row_height + extra_h - 60)
}