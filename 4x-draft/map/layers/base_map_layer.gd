extends TileMapLayer
class_name BaseMapLayer

const OUT_OF_MAP: Vector2i = Vector2i.MAX
const EMPTY = 0

var size: Vector2i


func set_cell_tile(coord:Vector2i, tile_id: int):
	set_cell(coord, 0, Vector2i.ZERO, tile_id)

func calculate_tile_coord():
	var tile_coord: Vector2i = local_to_map(get_local_mouse_position())
	if tile_coord < Vector2i.ZERO or tile_coord > size:
		return OUT_OF_MAP
	return tile_coord
