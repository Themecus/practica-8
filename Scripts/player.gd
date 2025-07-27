extends CharacterBody2D

var speed= 310.0  # Usando @export para ajustar desde el Inspector
var balaJugador=load("res://Scene/bala.tscn")
@onready var animated_sprite = $AnimatedSprite2D  # Nombre más descriptivo
var tiempo=true
var speedy=500


func _process(delta):  # Usar _physics_process para movimiento
	var input_direction = Vector2(
	Input.get_axis("left", "right"),
	Input.get_axis("up", "down")  # -1 = up, 1 = down
	).normalized()  # Normalizamos directamente aquí
	
	if input_direction.length()>0:#para la velcoidad en horizontal
		input_direction=input_direction.normalized()
	
	velocity = input_direction * speed
	update_animations(input_direction.x)  # Pasamos solo el eje Y para animaciones
	shoot()
	move_and_slide()

func update_animations(x_input):
	if x_input > 0:  # Margen para evitar falsos positivos
		animated_sprite.flip_h=false
		animated_sprite.play("lado")
	elif x_input < 0:
		animated_sprite.flip_h=true
		animated_sprite.play("lado")
	else:
		animated_sprite.play("normal")

func shoot():
	if Input.is_action_pressed("shoot") and tiempo==true:
		tiempo=false
		$cooldown.start()
		var bala=balaJugador.instantiate()
		bala.position=$Tiro.global_position
		bala.speed=speedy
		get_parent().add_child(bala)

func _on_cooldown_timeout():
	tiempo=true


func _on_area_2d_area_entered(area):
	queue_free()

func velo():
	speed+=400
	print("biff")


func _on_espacio_enemigo_eliminado(puntos):
	pass # Replace with function body.
