extends CharacterBody2D

@onready var espacio = get_node("/root/Espacio")
@onready var animacion = $AnimatedSprite2D
var balaEnemiga=load("res://Scene/bala_enemigo.tscn")
var vida=4
var SPEED = 100.0
var bajar=true
var tempo=300

func _process(delta):
	moverse(delta)

func moverse(delta):
	if bajar==false:
		var bala=balaEnemiga.instantiate()
		bala.position=Vector2(-0.104, 24.493)
		position.y += delta * 0
		tempo=tempo-1
		if tempo==0:
			tempo=300
			print("disparo")
			add_child(bala)
	if bajar==true:
		position.y += delta * SPEED
		animacion.play("mover")

func _on_area_2d_area_entered(area):
	if vida==0:
		espacio.puntuaje.emit(5)
		queue_free()
	else:
		vida-=1

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()

func _on_movimiento_timeout():
	bajar=false
