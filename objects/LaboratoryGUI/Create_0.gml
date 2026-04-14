/// 

self.state = {
    bg_scale: 0,
    offset_x: 0,
    offset_y: 0,
}

function init_bg_size_and_offset() {
    var _bg_sprite_width = sprite_get_width(spr_laboratory_bg)
    var _width_scale = room_width / _bg_sprite_width
    var _bg_sprite_height = sprite_get_height(spr_laboratory_bg)
    var _height_scale = room_height / _bg_sprite_height

    self.state.bg_scale = min(_width_scale, _height_scale)

    self.state.offset_x = (room_width - _bg_sprite_width * self.state.bg_scale) / 2
    self.state.offset_y = (room_height - _bg_sprite_height * self.state.bg_scale) / 2

}

function create_ui_elements() {
    
    /// @type {Asset.GMObject.CloseButton} 
    var _close_button = instance_create_layer(0, 0, "Assets", CloseButton)
    _close_button.set_position(room_width - 200, 30)
        .set_on_click(function() {
            global.menu_screen = true
            room_goto(room_menu)
        })
    instance_create_layer(room_width / 2, room_height / 2, "Assets", StageItem)
}

function on_create() {
    global.menu_screen = false
    window_set_cursor(cr_default)

    init_bg_size_and_offset()

    create_ui_elements()
}

function on_draw() {
    draw_sprite_ext(
        spr_laboratory_bg, 0, 
        self.state.offset_x, self.state.offset_y, 
        self.state.bg_scale, self.state.bg_scale, 
        0, c_white, 1)
}

on_create()