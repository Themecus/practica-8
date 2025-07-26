extends Area2D

var balaJugador=load("res://img/bala.png")
var disparo=true

func _process(delta):
	spawner()

func spawner():
	var bala=balaJugador.instantiate()
	if Input.is_action_pressed("shoot") and disparo==true:
		disparo=false
		$cooldown.start()
		print("disparo")
		add_child(bala)

func _on_cooldown_timeout():
	disparo=true
