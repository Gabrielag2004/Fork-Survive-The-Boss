extends Node2D
# mecánica de arrastrar y soltar objetos entre mesas de crafteo
# se crea area 2D llamada mov_objeto para para detectar cuándo otros objetos entran o salen de una región de espacio 2D

# Called when the node enters the scene tree for the first time.
var objeto = false # var contruccion

func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if objeto == true:
		self.set_global_position(get_global_mouse_position())

func _on_mov_objeto_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		objeto = false

func _on_construct_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		objeto = true
		print ("click")
	if event.is_action_released("click"):
		objeto = false
