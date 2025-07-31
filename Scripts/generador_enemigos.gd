extends Area2D

var enemigoCargado
var tiempo=true
var randomEnemigo=RandomNumberGenerator.new()
@onready var espacio = $".."
signal aumentarEnemigos

func _process(delta):
	spawner()

func spawner():
	randomEnemigo=randi_range(1,7)
	if  tiempo==true:
		tiempo=false
		$cooldown.start()
		match randomEnemigo:
			1:
				enemigoCargado=load("res://Scene/enemigo_1.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(randf_range(-560,560),randf_range(-50,50))
				#$cooldown.wait_time=$cooldown.wait_time-0.5
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
			4:
				enemigoCargado=load("res://Scene/enemigo_1.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(randf_range(-560,560),randf_range(-50,50))
				add_child(enemigo)
			5:
				enemigoCargado=load("res://Scene/enemigo_2.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(randf_range(-360,360),randf_range(-50,50))
				add_child(enemigo)
			6:
				enemigoCargado=load("res://Scene/enemigo_3.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(randf_range(-360,360),randf_range(-50,50))
				add_child(enemigo)
			7:
				enemigoCargado=load("res://Scene/enemigo_4.tscn")
				var enemigo=enemigoCargado.instantiate()
				enemigo.position= Vector2(-668,180)
				add_child(enemigo)

func _on_cooldown_timeout():
	tiempo=true


func _on_aumentar_enemigos():
	$cooldown.wait_time=$cooldown.wait_time-0.5
