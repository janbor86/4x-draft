shader_type canvas_item;

uniform float border_width : hint_range(0.0, 0.5) = 0.1;
uniform float pulse_speed : hint_range(0.1, 5.0) = 4.0;

void fragment() {
	vec4 texture_color = texture(TEXTURE, UV);
	// Calculate distance from edges
	float dist_from_edge = min(
		min(UV.x, 1.0 - UV.x),
		min(UV.y, 1.0 - UV.y)
	);
	
	// Create border by checking if we're close to the edge
	float is_border = step(dist_from_edge, border_width);
	
	// Pulsating effect using sine wave
	float pulse = sin(TIME * pulse_speed) * 0.4 + 0.6;
	
	// White border with transparent center
	if (texture_color.a > 0.0) {
		COLOR = vec4(1.0, 1.0, 1.0, is_border * pulse);
	}
}
