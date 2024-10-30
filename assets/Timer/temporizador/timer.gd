extends Node2D

# declaracion de variables
var tiempo_total = 10.0 #tiempo total que durará la animación.
var tiempo_restante = tiempo_total
var direction = Vector2.ZERO #Inicializa un vector que se utilizará para almacenar la dirección del movimiento.
var tween # Declara una variable para almacenar el nodo Tween que se creará.
var colores = ["verde", "amarillo", "naranja", "rojo"]  # Lista de colores para iterar
var indice_actual = 0  # Índice del color actual
var timer = Timer.new()  # Crear un nuevo timer

func _ready():
	add_child(timer)
	var timer = get_node("FlashTimer")
	timer.timeout.connect(_on_flash_timer_timeout)
	timer.wait_time = 1.0  # El timer se activará cada segundo
	timer.start()  # Iniciar el timer

func _on_flash_timer_timeout():
	# Reducir el tiempo restante
	tiempo_restante -= 1.0
	# Obtener las cabezas y barras por nombre
	var cabezaVerde = get_node("CabezaVerde" + colores[0])
	#var cabezaAmarilla = get_node("CabezaAmarilla" + colores[1])
	#var cabezaNaranja = get_node("CabezaNaranja" + colores[2])
	#var cabezaRoja = get_node("CabezaRoja" + colores[3])

	var barraVerde = get_node("BarraVerde" + colores[0])
	#var barraAmarilla = get_node("BarraAmarilla" + colores[1])
	#var barraNaranja = get_node("BarraNaranja" + colores[2])
	#var barraRoja = get_node("BarraRoja" + colores[3])

	# Calcular la nueva posición de la cabeza
	var nueva_posicion = Vector2(0, barraVerde.position.y + (barraVerde.rect_size.y * (1 - (tiempo_restante / tiempo_total))))

	# Crear un nuevo Tween y mover la cabezaz
	tween = create_tween()
	tween.tween_property(cabezaVerde, "global_position", nueva_posicion, 1.0)  # Duración de 1 segundo
	tween.play()
	# Incrementar el índice para el próximo color
	indice_actual += 1
	if indice_actual >= colores.size():
		indice_actual = colores.size() - 1  # Mantener en el último color

	# Cambiar la barra al siguiente color
	if indice_actual < colores.size():
		barraVerde.visible = true  # Asegurarse de que la barra esté visible
	# Aquí podrías ocultar o cambiar la barra anterior si lo deseas

	# Comprobar si el tiempo se ha agotado
	if tiempo_restante <= 0:
		timer.stop()  # Detener el timer
		print("¡Tiempo agotado!")
		# Aquí puedes agregar lógica adicional para cuando el tiempo se acabe
