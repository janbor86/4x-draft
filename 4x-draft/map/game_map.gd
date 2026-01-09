extends Node2D
class_name GameMap

const MAP_WIDTH = 16
const MAP_HEIGHT = 16
const TILE_SIZE = 32

@onready var terrain_layer: TerrainLayer = $TerrainLayer
@onready var highlight_layer: HighlightLayer = $HighlightLayer

var grass_texture: ImageTexture
var selected_tile: Vector2i = Vector2i(-1, -1)
var selection_sprite: Sprite2D


func _ready() -> void:
	_generate_map()

func _generate_map() -> void:
	highlight_layer.size = Vector2i(MAP_WIDTH -1, MAP_HEIGHT -1)
	for x in range(MAP_WIDTH):
		for y in range(MAP_HEIGHT):
			# Add grass tile at (x, y) using source 0, atlas coords (0, 0)
			terrain_layer.set_grass(Vector2i(x, y))


func get_map_center() -> Vector2:
	return global_position + Vector2(MAP_WIDTH * TILE_SIZE / 2.0, MAP_HEIGHT * TILE_SIZE / 2.0)


func get_texture_for(coord: Vector2i) -> Texture2D:
	var cell_source_id = terrain_layer.get_cell_source_id(coord)
	if cell_source_id < 0: return
	
	var scene_source = terrain_layer.tile_set.get_source(cell_source_id) as TileSetScenesCollectionSource
	var alt_id = terrain_layer.get_cell_alternative_tile(coord)
	var scene = scene_source.get_scene_tile_scene(alt_id)
	var insta = scene.instantiate()
	return insta.texture
	
		
