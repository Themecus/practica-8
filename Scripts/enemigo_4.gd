extends CharacterBody2D
@onready var espacio = get_node("/root/Espacio")
@onready var animacion = $AnimatedSprite2D
var buffCargado=load("res://Scene/buff_1.tscn")
const SPEED = 100.0
var vida=7


func _process(delta):
	moverse(delta)

func moverse(delta):
	position.x += delta * SPEED
	animacion.play("mover")

func _on_area_2d_area_entered(area):
	if vida <= 0:
		var buff=buffCargado.instantiate()
		espacio.puntuaje.emit(1)
		buff()
		queue_free()
	else:
		vida-=1

func buff():
	var buffeo = buffCargado.instantiate()
	# le damos una poscion igual a la del enemigo
	buffeo.global_position = self.global_position
	# si no tuviera el curret scena no funcionaria, se usa para especificar donde se genera
	get_tree().current_scene.add_child(buffeo)

func _on_visible_on_screen_notifier_2d_screen_exited():
	queue_free()
