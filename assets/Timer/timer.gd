extends Node2D

func  _process(delta: float) -> void:
	$TimerRemaining.text = "%s" % roundf($FlashTimer.time_left) #para que la cuenta aparezca en la pantalla

func _on_flash_timer_timeout() -> void:
	if $Ghost.visible:
		$Ghost.hide()
	else:
		$Ghost.show()

#Incluir barra y cabeza moya
#Animacion de la cabeza moya
