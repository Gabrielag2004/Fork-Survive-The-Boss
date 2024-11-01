extends Node2D

# declaracion de variables
var tiempo_total = 100.0 #tiempo total que durará la animación.
var tiempo_restante = tiempo_total
var direction = Vector2.ZERO #Inicializa un vector que se utilizará para almacenar la dirección del movimiento. (0, 0)
var tween # Declara una variable para almacenar el nodo Tween que se creará.
var colores = ["verde", "amarillo", "naranja", "rojo"]  # Lista de colores para iterar
var indice_actual = 0  # Índice del color actual
var timer = null  # Crear un nuevo timer
var text_counter = null # contador de texto
@onready var personaje = $Personaje

func _ready():
	add_child(Timer.new())
	timer = get_node("FlashTimer")
	#timer.timeout.connect(_on_flash_timer_timeout)
	timer.wait_time = 1.0  # El timer se activará cada segundo
	timer.start()  # Iniciar el timer
	text_counter = get_node("Contador") # contador de texto
	text_counter.text = str(tiempo_total) # contador de texto
	# Obtener las cabezas y barras por nombre

func _on_flash_timer_timeout():
	# Reducir el tiempo restante
	# Obtener las cabezas y barras por nombre
	var cabezaVerde = get_node("CabezaVerde")
	#var cabezaAmarilla = get_node("CabezaAmarilla" + colores[1])
	#var cabezaNaranja = get_node("CabezaNaranja" + colores[2])
	#var cabezaRoja = get_node("CabezaRoja" + colores[3])

	var barraVerde = get_node("BarraVerde")
	#var barraAmarilla = get_node("BarraAmarilla" + colores[1])
	#var barraNaranja = get_node("BarraNaranja" + colores[2])
	#var barraRoja = get_node("BarraRoja" + colores[3])
	if tiempo_restante == tiempo_total:
		var nueva_posicion = Vector2(cabezaVerde.position.x, barraVerde.position.y - cabezaVerde.texture.get_height() + (barraVerde.texture.get_height() * 0.9))
		tween = create_tween()
		tween.tween_property(cabezaVerde, "global_position", nueva_posicion, tiempo_total - 1)  # Duración de 1 segundo
		tween.play()
	# Calcular la nueva posición de la cabeza
	tiempo_restante -= 1.0
	# Incrementar el índice para el próximo color
	indice_actual += 1
	if indice_actual >= colores.size():
		indice_actual = colores.size() - 1  # Mantener en el último color

	# Cambiar la barra al siguiente color
	if indice_actual < colores.size():
		barraVerde.visible = true  # Asegurarse de que la barra esté visible
	# Aquí podrías ocultar o cambiar la barra anterior si lo deseas
	text_counter.text = str(tiempo_restante) # contador de texto
	print(snapped(tiempo_total * 0.25, 1))
	if tiempo_restante == snapped(tiempo_total * 0.75, 1):
		cabezaVerde.set_texture(preload("res://assets/Timer/animacion/coloresCabezas/cabeza_amarilla.webp"))
		barraVerde.set_texture(preload("res://assets/Timer/animacion/coloresBarras/barra_amarilla.webp"))
	if tiempo_restante == snapped(tiempo_total * 0.5, 1):
		cabezaVerde.set_texture(preload("res://assets/Timer/animacion/coloresCabezas/cabeza_naranja.webp"))
		barraVerde.set_texture(preload("res://assets/Timer/animacion/coloresBarras/barra_naranja.webp"))
	if tiempo_restante == snapped(tiempo_total * 0.25, 1):
		cabezaVerde.set_texture(preload("res://assets/Timer/animacion/coloresCabezas/cabeza_roja.webp"))
		barraVerde.set_texture(preload("res://assets/Timer/animacion/coloresBarras/barra_roja.webp"))
	# Comprobar si el tiempo se ha agotado
	if tiempo_restante <= 0:
		timer.stop()  # Detener el timer
		# tween.stop() esto para detener si ganas
		print("¡Tiempo agotado!")
		personaje.queue_free()
		get_tree().change_scene_to_file("res://escenas/menu/muerte.tscn")
		# Aquí puedes agregar lógica adicional para cuando el tiempo se acabe
