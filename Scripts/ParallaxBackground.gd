extends ParallaxBackground

var velocidad = 100  # Ajusta la velocidad

func _process(delta):
	scroll_offset.y += velocidad * delta  # Movimiento vertical
	# scroll_offset.y para movimiento vertical
