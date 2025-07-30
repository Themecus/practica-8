extends Area2D

var speed=500.0
func _process(delta):
	disparo(delta)

func disparo(delta):
	position.y-=speed*delta

func _on_area_2d_area_entered(area):
	queue_free()
