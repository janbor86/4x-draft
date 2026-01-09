extends BaseMapLayer
class_name TerrainLayer


const GRASS_VARIANT_IDS = [1, 2]


func set_grass(coord: Vector2i):
	set_cell_tile(coord, GRASS_VARIANT_IDS.pick_random())
