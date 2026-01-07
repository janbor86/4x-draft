extends Node2D
class_name Main

@onready var game_map = $GameMap
@onready var camera: MapCamera = $Camera2D

var zoom_level: float = 2.0
const DRAG_THRESHOLD: float = 4.0

func _ready() -> void:
	camera.setup((Rect2i(Vector2i.ZERO, Vector2i(game_map.MAP_WIDTH * game_map.TILE_SIZE, game_map.MAP_HEIGHT * game_map.TILE_SIZE))))
	print("Main scene is ready!")

func _process(_delta: float) -> void:
	_handle_input(_delta)

func _handle_input(delta: float) -> void:
	# Pan camera with arrow keys or WASD (frame-rate independent)
	var pan_speed = 400.0 * delta
	if Input.is_action_pressed("ui_up"):
		camera.global_position.y -= pan_speed
	if Input.is_action_pressed("ui_down"):
		camera.global_position.y += pan_speed
	if Input.is_action_pressed("ui_left"):
		camera.global_position.x -= pan_speed
	if Input.is_action_pressed("ui_right"):
		camera.global_position.x += pan_speed
