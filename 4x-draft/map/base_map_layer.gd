extends TileMapLayer
class_name BaseMapLayer

const OUT_OF_MAP: Vector2i = Vector2i.MAX

var size: Vector2i


func calculate_tile_coord():
	var tile_coord: Vector2i = local_to_map(get_local_mouse_position())
	if tile_coord < Vector2i.ZERO or tile_coord > size:
		return OUT_OF_MAP
	return tile_coord
