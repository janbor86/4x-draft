extends Object
class_name TileTextures

func generate_grass_texture() -> ImageTexture:
	var img = Image.create(32, 32, false, Image.FORMAT_RGBA8)

	# Grass green base
	var grass_color = Color(0.2, 0.7, 0.2, 1.0)
	for x in range(32):
		for y in range(32):
			if randf() > 0.85:
				img.set_pixel(x, y, Color(0.18, 0.65, 0.18, 1.0))
			else:
				img.set_pixel(x, y, grass_color)

	# Dark border for grid visibility
	var border_color = Color(0, 0, 0, 0.5)
	for x in range(32):
		img.set_pixel(x, 0, border_color)
		img.set_pixel(x, 31, border_color)
		img.set_pixel(0, x, border_color)
		img.set_pixel(31, x, border_color)

	return ImageTexture.create_from_image(img)
