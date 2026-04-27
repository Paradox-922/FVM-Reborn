varying vec2 v_vTexcoord;
varying vec4 v_vColour;

uniform vec2 u_center;
uniform float u_radius;

void main() {
    // 计算当前片段到圆心的距离
    float distance = length(v_vTexcoord - u_center);
    
    // 如果距离大于半径，丢弃该片段
    if (distance > u_radius) {
        discard;
    }
    
    // 否则正常绘制
    gl_FragColor = v_vColour * texture2D(gm_BaseTexture, v_vTexcoord);
}
