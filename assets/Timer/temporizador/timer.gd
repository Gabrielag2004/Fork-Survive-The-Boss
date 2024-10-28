extends Node2D

# declaracion de variables
var tiempo_total = 10.0 #tiempo total que durará la animación.
var direction = Vector2.ZERO #Inicializa un vector que se utilizará para almacenar la dirección del movimiento.
var tween # Declara una variable para almacenar el nodo Tween que se creará.

func _ready():
	direction = $BarraVerde.global_position - $CabezaVerde.global_position
	direction = direction.normalized()

	# Calcular la mitad de la altura de la cabeza
	var mitad_altura_cabeza = $CabezaVerde.global_position.y - $CabezaVerde.texture.get_height() / 2

	# Calcular la longitud de la barra
	var longitud_barra = ($BarraVerde.global_position - $CabezaVerde.global_position).length()

	# Calcular la nueva posición objetivo (punto medio de la cabeza al final de la barra)
	var nueva_posicion = $BarraVerde.global_position + direction * longitud_barra - Vector2(0, mitad_altura_cabeza)

	# Usamos un Tween para un movimiento más suave
	tween = create_tween()
	tween.tween_property($CabezaVerde, "global_position", nueva_posicion, tiempo_total)
	tween.play()
