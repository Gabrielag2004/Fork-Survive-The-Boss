extends Node2D

var hand_cursor = preload("res://assets/mesa_crafteo/interfaz/popup/mano.webp")
var detail_selected = false

func change_cursor_hand():
	if !detail_selected:
		Input.set_custom_mouse_cursor(hand_cursor)
	
func change_cursor_back():
	if !detail_selected:
		Input.set_custom_mouse_cursor(null)
	
func change_cursor_hand_detail():
	Input.set_custom_mouse_cursor(hand_cursor)
	
func change_cursor_back_detail():
	Input.set_custom_mouse_cursor(null)

func _on_area_2d_input_event(viewport, event, shape_idxt):
	if event is InputEventMouseButton and event.button_index == MOUSE_BUTTON_LEFT:
		$InterfazDeCrafteoDerecho.visible = false
		detail_selected = false
