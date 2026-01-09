extends PanelContainer
class_name SelectionInfo


const TILE_SIZE = Vector2i(32, 32)

@onready var game_map: GameMap = %GameMap
@onready var selection_text: Label = %SelectionText
@onready var selection_camera: Camera2D = %SelectionCamera


func _ready() -> void:
	UserInteractions._tile_selected.connect(_on_tile_selected)
	UserInteractions._no_tile_selected.connect(_on_no_tile_selected)
	_on_no_tile_selected()

func _on_tile_selected(coord: Vector2i) -> void:
	selection_text.text = "Selected tile: " + str(coord)
	selection_camera.position = TILE_SIZE * coord + TILE_SIZE/2

func _on_no_tile_selected() -> void:
	selection_text.text = "No tile selected"
	selection_camera.position = -TILE_SIZE
