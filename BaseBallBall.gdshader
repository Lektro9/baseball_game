shader_type canvas_item;

uniform float rot_speed : hint_range(-20.0, 20.0) = 2.0;
// Pivot inside the atlas *region* (0..1). Center by default.
uniform vec2 pivot_uv = vec2(0.5, 0.5);

void fragment() {
    float ang = TIME * rot_speed;

    // Rotation matrix (mat2 takes two vec2 columns in Godot)
    mat2 R = mat2(vec2(cos(ang), -sin(ang)),
                  vec2(sin(ang),  cos(ang)));

    // Rotate UVs around the region-local pivot
    vec2 uv = UV - pivot_uv;
    uv = R * uv + pivot_uv;

    // For atlases: don't wrap—clip outside 0..1 to avoid bleeding
    bool outside = any(lessThan(uv, vec2(0.0))) || any(greaterThan(uv, vec2(1.0)));

    // Option A: make outside fully transparent (no early return)
    vec4 col = outside ? vec4(0.0) : texture(TEXTURE, uv);
    COLOR = col;

    // Option B (alternative): actually drop the fragment
    // if (outside) { discard; } else { COLOR = texture(TEXTURE, uv); }
}
