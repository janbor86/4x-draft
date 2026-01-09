extends SubViewport


func _ready():
	# Shares the main game's 2D world (physics and visuals)
	world_2d = get_tree().root.get_viewport().world_2d
