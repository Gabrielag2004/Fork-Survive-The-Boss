extends Sprite2D

var click = false

func _process(delta):
	if click:
		position = get_global_mouse_position()
func _on_area_2d_input_event(viewport: Node, event: InputEvent, shape_idx: int) -> void:
	if Input.is_action_pressed("left_click"):
		click = true
	if Input.is_action_just_released("left_click"):
		click = false
