extends CharacterBody2D


const velocidad = 300.0

@onready var jugador = $".."
@onready var animacion = $AnimatedSprite2D
var canPick = true

func _physics_process(_delta):
	if Input.is_action_pressed("izquierda"):
		jugador.position.x -= velocidad * _delta
		animacion.play("Izquierda")
	elif Input.is_action_pressed("derecha"):
		jugador.position.x += velocidad * _delta
		animacion.play("Derecha")
	elif Input.is_action_pressed("arriba"):
		jugador.position.y -= velocidad * _delta
		animacion.play("Arriba")
	elif Input.is_action_pressed("abajo"):
		jugador.position.y += velocidad * _delta
		animacion.play("Abajo")
	else:
		animacion.stop()
	
	move_and_slide()
