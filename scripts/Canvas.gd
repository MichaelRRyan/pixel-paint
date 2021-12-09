extends Sprite

var image = Image.new()
var color : Color = Color.black


func _ready():
	texture = ImageTexture.new()
	image.create(32, 32, false, Image.FORMAT_RGBA8)
	image.fill(Color.white)
	texture.create_from_image(image, 0)


func _input(event):
	if event is InputEventMouseButton:
		if event.button_index == BUTTON_LEFT and event.pressed:
			var mouse_pos = get_local_mouse_position()
			if (mouse_pos.x < image.get_width() and 
			   mouse_pos.y < image.get_height()):
				set_pixel_and_display(mouse_pos, color)


func set_pixel_and_display(pixel_position : Vector2, color : Color):
	image.lock()
	image.set_pixelv(pixel_position, color)
	image.unlock()
	texture.create_from_image(image, 0)


func _on_ColorPickerButton_color_changed(_color):
	color = _color
