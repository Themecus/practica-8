extends CharacterBody2D

var speed=300.0
var direction=Vector2.RIGHT
func _process(delta):
	disparo(delta)

func disparo(delta):
	position.y+=speed*delta

func _on_area_2d_area_entered(area):
	queue_free()
