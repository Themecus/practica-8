extends Node2D

@onready var puntulabel = $Label
signal puntuaje(puntos)
var puntuacion = 0


func _on_puntuaje(puntos):
	puntuacion+=puntos
	print(puntuacion)
	puntulabel.text="Puntuacion: "+ str(puntuacion)
