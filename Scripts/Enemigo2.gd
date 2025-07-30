extends CharacterBody2D

@onready var animacion = $AnimatedSprite2D
@onready var espacio = get_node("/root/Espacio")
const SPEED = 150.0
var lados: int = 1
var llave=true
var vida=1

func _process(delta):
	movimientoNormal(delta)
	animacion.play()

func movimientoNormal(delta):
	position.y += delta * SPEED
	position.x += delta * 100 *lados
	if llave:
		animacion.flip_h=!animacion.flip_h
		llave=false
		movimientoErratico(delta)
		$movimiento.start()

func movimientoErratico(delta):
	lados=-lados

func _on_area_2d_area_entered(area):
	if vida <= 0:
		espacio.puntuaje.emit(3)
		queue_free()
	else:
		vida-=1

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_movimiento_timeout():
	llave=true
