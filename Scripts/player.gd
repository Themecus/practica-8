extends CharacterBody2D

var speed= 310.0  # Usando @export para ajustar desde el Inspector
var balaJugador=load("res://Scene/bala.tscn")
var balaJugador2=load("res://Scene/bala_2.tscn")
@onready var animated_sprite = $AnimatedSprite2D  # Nombre más descriptivo
var tiempo=true
var tiempo2=true
var speedy=500
var poder=0
var poder2=0


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
	shoot1()
	shoot2()
	shoot3()

func shoot3():
	if Input.is_action_pressed("shoot") and tiempo2==true and poder2>0:
		tiempo2=false
		poder2-=1
		$cooldown2.start()
		var bala=balaJugador2.instantiate()
		bala.speed=speedy
		bala.position=$Tiro.global_position
		get_parent().add_child(bala)

func shoot2():
	if Input.is_action_pressed("shoot") and poder>0:
		poder-=1
		var bala=balaJugador.instantiate()
		bala.speed=speedy
		bala.position=$Tiro.global_position
		get_parent().add_child(bala)

func shoot1():
	if Input.is_action_pressed("shoot") and tiempo==true and poder==0 and poder2==0:
		tiempo=false
		$cooldown.start()
		var bala=balaJugador.instantiate()
		bala.position=$Tiro.global_position
		bala.speed=speedy
		get_parent().add_child(bala)

func _on_cooldown_timeout():
	tiempo=true

func _on_cooldown_2_timeout():
	tiempo2=true

func _on_area_2d_area_entered(area):
	#con esto podemos diferenciar las colisiones que entran, solo debes meterlas en grupos
	if area.is_in_group("buffos"):
		poder=400
	elif area.is_in_group("buffos1"):
		poder2=20
	else:
		queue_free()




