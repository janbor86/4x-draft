extends Node2D
class_name Main

@onready var game_map = $GameMap
@onready var map_camera: Camera2D = %MapCamera


func _ready() -> void:
	map_camera.setup((Rect2i(Vector2i.ZERO, Vector2i(game_map.MAP_WIDTH * game_map.TILE_SIZE, game_map.MAP_HEIGHT * game_map.TILE_SIZE))))
	print("Main scene is ready!")
