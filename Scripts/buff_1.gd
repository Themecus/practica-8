extends Area2D

@export var speed: float = 100.0

func _process(delta):
	bajar(delta)

func bajar(delta: float):
	position.y += speed * delta  



func _on_area_entered(area):
	queue_free()
	
