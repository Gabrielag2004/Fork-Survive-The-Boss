extends Control


# Called when the node enters the scene tree for the first time.
func _ready() -> void:
	pass # Replace with function body.


# Called every frame. 'delta' is the elapsed time since the previous frame.
func _process(delta: float) -> void:
	pass


func _on_jugar_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/principal/Prueba1.tscn") # Replace with function body.


func _on_instrucciones_pressed() -> void:
	pass # Replace with function body.


func _on_configuración_pressed() -> void:
	get_tree().change_scene_to_file("res://escenas/menu/configuracion.tscn")


func _on_salir_pressed() -> void:
	get_tree().quit()
