extends CharacterBody2D

@onready var animacion = $AnimatedSprite2D
const SPEED = 200.0
#@onready var espacio = $".." esta forma usala si la escena x esta en la escena y
@onready var espacio = get_node("/root/Espacio")

func _process(delta):
	position.y += delta * SPEED
	animacion.play()

func _on_area_2d_area_entered(area):
	espacio.puntuaje.emit(1)
	queue_free()


func _on_visible_on_screen_notifier_2d_screen_exited():
	print("se fue")
	queue_free()


