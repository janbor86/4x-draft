extends BaseMapLayer
class_name HighlightLayer


var highlighted_tile: Vector2i = OUT_OF_MAP


func _input(event: InputEvent) -> void:
	if event is InputEventMouseMotion:
		var tile_coord: Vector2i = calculate_tile_coord()
		if tile_coord != highlighted_tile:
			highlight_tile(tile_coord)

func highlight_tile(tile_coord: Vector2i) -> void:
	# Clear previous highlight
	if highlighted_tile != OUT_OF_MAP:
		set_cell(highlighted_tile, 0, Vector2i.ZERO, 0) # Remove highlight from previous tile
	
	if tile_coord != OUT_OF_MAP:
		set_cell(tile_coord, 0, Vector2i.ZERO, 2) # Apply highlight to new tile

	highlighted_tile = tile_coord
