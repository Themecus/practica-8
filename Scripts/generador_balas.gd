extends Area2D

var enemigoCargado=load("res://Scene/enemigo_1.tscn")
var tiempo=true
var randomEnemigo=RandomNumberGenerator.new()
@onready var espacio = $".."

func _process(delta):
	spawner()

func spawner():
	randomEnemigo=randi_range(1,3)
	if  tiempo==true:
		tiempo=false
		$cooldown.start()
		match randomEnemigo:
			1:
				enemigoCargado=load("res://Scene/enemigo_1.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(randf_range(-560,560),randf_range(-50,50))
				add_child(enemigo)
			2:
				enemigoCargado=load("res://Scene/enemigo_2.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(randf_range(-360,360),randf_range(-50,50))
				add_child(enemigo)
			3:
				enemigoCargado=load("res://Scene/enemigo_3.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(randf_range(-360,360),randf_range(-50,50))
				add_child(enemigo)

func _on_cooldown_timeout():
	tiempo=true
