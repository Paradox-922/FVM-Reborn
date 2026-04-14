/// 

self.state = {
    left: 0,
    top: 0,
    initialized: false,
}



/// @param {Real} _left 
/// @param {Real} _top 
function set_position(_left, _top) {
    self.state.left = _left
    self.state.top = _top
    self.x = _left
    self.y = _top
    return self
}

function init() {

    return self
}


function on_create() {
    
}

function on_step() {
    if (!self.state.initialized) return

}

function on_draw() {
    if (!self.state.initialized) return
    
    draw_self()
}

function on_draw_gui() {
    if (!self.state.initialized) return

}