class_name MapCamera extends Camera2D

const WIDTH = 1600.0
const HEIGHT = 900.0

signal zoom_level_changed(value: float)
signal tile_selected(tile_coord: Vector2i)

var scroll_speed = 500
var dragging = false
var scroll_map = {
	"ui_left" = Vector2.LEFT,
	"ui_right" = Vector2.RIGHT,
	"ui_up" = Vector2.UP,
	"ui_down" = Vector2.DOWN,
}
var zoom_level = 1:
	set(value):
		zoom_level = value
		update_zoom()
var target = 1
var zoom_step = 0.1
var zoom_speed = 2
var MIN_ZOOM
const MAX_ZOOM = 5

func setup(map_pixel_size: Rect2i):
	var w_ratio: float = map_pixel_size.end.x / WIDTH
	var h_ratio: float = map_pixel_size.end.y / HEIGHT
	var ratio: float = max(w_ratio, h_ratio)
	var zoom_ratio = 1.0 / float(ratio)
	MIN_ZOOM = zoom_ratio
	target = MIN_ZOOM
	focus_at(Vector2i(map_pixel_size.get_center()), 2.0)
	set_position_smoothing_enabled(true)
	set_position_smoothing_speed(10.0)

func focus_at(coord: Vector2i, z: float):
	focus(coord)
	zoom = z * Vector2.ONE
	zoom_level = z

# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta):
	for action: String in scroll_map.keys():
		if Input.is_action_pressed(action):
			position += scroll_speed * delta * scroll_map[action]
	zoom_level += snappedf((target - zoom_level) * delta * zoom_speed, 0.0001)
	_handle_input(delta)
			
	
func _input(event):
	match event.get_class():
		"InputEventMouseButton":
			match event.button_index:
				MOUSE_BUTTON_LEFT:
					if event.pressed:
						var world_pos: Vector2 = get_global_mouse_position()
						var tile_coord: Vector2i = Vector2i(floor(world_pos.x / 32), floor(world_pos.y / 32))
						emit_signal("tile_selected", tile_coord)
				MOUSE_BUTTON_MIDDLE, MOUSE_BUTTON_RIGHT:
					dragging = event.pressed
				MOUSE_BUTTON_WHEEL_UP:
					target = min(MAX_ZOOM, target + zoom_step)
				MOUSE_BUTTON_WHEEL_DOWN:
					target = max(MIN_ZOOM, target - zoom_step)
		"InputEventMouseMotion":
			if dragging:
				position -= event.relative / zoom
				
func _handle_input(delta: float) -> void:
	# Pan camera with arrow keys or WASD (frame-rate independent)
	var pan_speed = 400.0 * delta
	if Input.is_action_pressed("ui_up"):
		global_position.y -= pan_speed
	if Input.is_action_pressed("ui_down"):
		global_position.y += pan_speed
	if Input.is_action_pressed("ui_left"):
		global_position.x -= pan_speed
	if Input.is_action_pressed("ui_right"):
		global_position.x += pan_speed
				
				
func update_zoom():
	zoom_level_changed.emit(zoom_level)
	zoom = zoom_level * Vector2.ONE
	zoom_step = zoom_level * 0.05
	zoom_speed = 5.0 / zoom_level

func focus(pos: Vector2i):
	position = pos
