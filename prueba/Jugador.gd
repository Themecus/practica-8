extends CharacterBody2D

@export var speed := 300.0
@export var bullet_speed := 600.0
@export var fire_rate := 0.2  # Segundos entre disparos
var can_shoot := true

func _physics_process(delta):
	# Movimiento del jugador (WASD o flechas)
	var input_dir = Input.get_vector("left", "right", "up", "down")
	velocity = input_dir * speed
	move_and_slide()
	# Disparar con SPACE
	if Input.is_action_pressed("shoot") and can_shoot:
		shoot()
		can_shoot = false
		$CadenciaDisparo.start(fire_rate)

func shoot():
	var bullet = preload("res://prueba/bala_1.tscn").instantiate()
	bullet.position = $Muzzle.global_position
	bullet.direction = (get_global_mouse_position() - global_position).normalized()
	bullet.speed = bullet_speed
	get_parent().add_child(bullet)

func _on_cadencia_disparo_timeout():
	can_shoot = true
