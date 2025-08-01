extends CharacterBody2D

@onready var espacio = get_node("/root/Espacio")
@onready var animacion = $AnimatedSprite2D
var balaEnemiga = load("res://Scene/bala_enemigo.tscn")
var vida = 4
var SPEED = 100.0
var bajar = true
var puede_disparar = true  # Reemplaza a "tempo"

func _physics_process(delta):  # Usar physics_process para movimientos
	moverse(delta)

func moverse(delta):
	if bajar:
		position.y += delta * SPEED
		animacion.play("mover")
	elif puede_disparar:
		disparar()

func disparar():
	var bala = balaEnemiga.instantiate()
	bala.position = Vector2(-0.104, 24.493)  # Ajusta según necesidad
	add_child(bala)
	puede_disparar = false
	$enfriamiento.start()  # Timer para el próximo disparo

func _on_area_2d_area_entered(area):
	vida -= 1
	if vida <= 0:
		espacio.puntuaje.emit(5)
		queue_free()

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_movimiento_timeout():
	bajar = false

func _on_enfriamiento_timeout():
	puede_disparar = true  # Permite disparar nuevamente
