extends CharacterBody2D

var speed= 310.0  # Usando @export para ajustar desde el Inspector
@onready var animated_sprite = $AnimatedSprite2D  # Nombre más descriptivo


func _process(delta):  # Usar _physics_process para movimiento
	var input_direction = Vector2(
	Input.get_axis("left", "right"),
	Input.get_axis("up", "down")  # -1 = up, 1 = down
	).normalized()  # Normalizamos directamente aquí
	
	if input_direction.length()>0:#para la velcoidad en horizontal
		input_direction=input_direction.normalized()
	
	velocity = input_direction * speed
	update_animations(input_direction.y)  # Pasamos solo el eje Y para animaciones
	move_and_slide()

func update_animations(vertical_input):
	if vertical_input > 0:  # Margen para evitar falsos positivos
		animated_sprite.play("caer")
	elif vertical_input < 0:
		animated_sprite.play("subir")
	else:
		animated_sprite.play("normal")
