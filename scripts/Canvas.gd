extends Sprite

var image = Image.new()


func _ready():
	texture = ImageTexture.new()
	image.create(32, 32, false, Image.FORMAT_RGB8)
	image.fill(Color.blue)
	texture.create_from_image(image, 0)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			var mouse_pos = get_local_mouse_position()
			if (mouse_pos.x < image.get_width() and 
			   mouse_pos.y < image.get_height()):
				set_pixel_and_display(mouse_pos, Color.red)


func set_pixel_and_display(pixel_position : Vector2, color : Color):
	image.lock()
	image.set_pixelv(pixel_position, color)
	image.unlock()
	texture.create_from_image(image, 0)
