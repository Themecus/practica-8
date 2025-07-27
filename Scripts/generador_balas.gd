extends Area2D

var enemigoCargado=load("res://Scene/enemigo_1.tscn")
var tiempo=true
var random=RandomNumberGenerator.new()
@onready var espacio = $".."

func _process(delta):
	spawner()

func spawner():
	var enemigo=enemigoCargado.instantiate()
	if  tiempo==true:
		tiempo=false
		$cooldown.start()
		print("disparo")
		enemigo.position= Vector2(randf_range(-560,560),randf_range(-50,50))
		add_child(enemigo)

func _on_cooldown_timeout():
	tiempo=true
