extends Area2D
# mecánica de arrastrar y soltar objetos entre mesas de crafteo
# se crea area 2D llamada mov_objeto para para detectar cuándo otros objetos entran o salen de una región de espacio 2D

var tuerca
var arrastrando = false

#var tuerca

# Called when the node enters the scene tree for the first time.

func _ready():
	tuerca = $CollisionShape2D/Tuerca
	if tuerca: 
		tuerca.visible = true
		$CollisionShape2D.connect("input_event", self, "_on_input_event")



# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(_delta):
	if arrastrando:
		tuerca.position = get_local_mouse_position()
#	if tuerca == true:
#		self.set_global_position(get_global_mouse_position())

func _on_input_event(viewport, event, shape_idx):
	if event.is_action_pressed("click"):
		arrastrando = true
		print("click - inicio de arrastre")
		
	if event.is_action_released("click"):
		arrastrando = false
		print("click - fin de arrastre")
