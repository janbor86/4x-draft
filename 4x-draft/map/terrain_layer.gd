extends BaseMapLayer
class_name TerrainLayer


signal tile_selected(coord: Vector2i)


func _input(event: InputEvent) -> void:
	if event is InputEventMouseButton:
		if event.is_pressed() and event.button_index == MouseButton.MOUSE_BUTTON_LEFT:
			tile_selected.emit(calculate_tile_coord())
