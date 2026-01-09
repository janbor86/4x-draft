extends BaseMapLayer
class_name HighlightLayer


const HIGHLIGHT = 1
const SELECTION = 2


var highlighted_tile: Vector2i = OUT_OF_MAP
var selected_tile: Vector2i = OUT_OF_MAP:
	set(value):
		selected_tile = value
		if selected_tile != OUT_OF_MAP:
			UserInteractions._tile_selected.emit(value)
		else:
			UserInteractions._no_tile_selected.emit()


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var tile_coord: Vector2i = calculate_tile_coord()
		if tile_coord != highlighted_tile:
			highlight_tile(tile_coord)
	if event is InputEventMouseButton:
		if event.button_index == MOUSE_BUTTON_LEFT and event.pressed:
			var tile_coord: Vector2i = calculate_tile_coord()
			select_tile(tile_coord)

func highlight_tile(tile_coord: Vector2i) -> void:
	# Clear previous highlight
	if highlighted_tile != OUT_OF_MAP and highlighted_tile != selected_tile:
		set_cell_tile(highlighted_tile, EMPTY) # Remove highlight from previous tile
	
	if tile_coord != OUT_OF_MAP and tile_coord != selected_tile:
		set_cell_tile(tile_coord, HIGHLIGHT) # Apply highlight to new tile

	highlighted_tile = tile_coord

func select_tile(tile_coord: Vector2i) -> void:
	# Clear previous selection
	if selected_tile != OUT_OF_MAP:
		set_cell_tile(selected_tile, EMPTY) # Remove selection from previous tile
	
	if tile_coord != OUT_OF_MAP:
		set_cell_tile(tile_coord, SELECTION) # Apply selection to new tile
		highlighted_tile = OUT_OF_MAP # Clear highlight when selecting

	selected_tile = tile_coord
