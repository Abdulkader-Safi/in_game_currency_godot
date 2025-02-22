extends Sprite2D

@export var min_positions: Vector2 = Vector2(0, 0)
@export var max_positions: Vector2 = Vector2(0, 0)

func _input(event):
	if Input.is_mouse_button_pressed(MOUSE_BUTTON_LEFT):
		position = event.position
		position.x = clamp(position.x, min_positions.x, max_positions.x)
		position.y = clamp(position.y, min_positions.y, max_positions.y)