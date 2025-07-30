extends Area2D

var enemigoCargado=load("res://Scene/enemigo_4.tscn")
var tiempo=true
var randomEnemigo=RandomNumberGenerator.new()
@onready var espacio = $".."

func _process(delta):
	spawner()

func spawner():
	randomEnemigo=randi_range(1,2)
	if  tiempo==true:
		tiempo=false
		var enemigo=enemigoCargado.instantiate()
		
		add_child(enemigo)

func _on_cooldown_timeout():
	tiempo=true
