extends Node

static func generate_grass_texture() -> Image:
	var img = Image.create(32, 32, false, Image.FORMAT_RGBA8)

	# Grass green base
	var grass_color = Color(0.2, 0.7, 0.2, 1.0)
	for x in range(32):
		for y in range(32):
			img.set_pixel(x, y, grass_color)

	# Add some texture variation
	for x in range(32):
		for y in range(32):
			if randf() > 0.85:
				img.set_pixel(x, y, Color(0.18, 0.65, 0.18, 1.0))

	# Dark border for grid visibility
	for x in range(32):
		img.set_pixel(x, 0, Color(0, 0, 0, 1.0))
		img.set_pixel(x, 31, Color(0, 0, 0, 1.0))
		img.set_pixel(0, x, Color(0, 0, 0, 1.0))
		img.set_pixel(31, x, Color(0, 0, 0, 1.0))

	return img
