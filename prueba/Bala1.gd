extends Area2D

var speed := 600.0
var direction := Vector2.RIGHT

func _physics_process(delta):
		position += direction * speed * delta

func _on_visible_on_screen_notifier_2d_screen_exited():
		queue_free()

func _on_body_entered(body):
		if body.is_in_group("enemigos"):
			body.queue_free()  # Elimina al enemigo
		queue_free()  # Elimina la bala
