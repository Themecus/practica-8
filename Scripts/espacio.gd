extends Node2D

@onready var generador=get_node("GeneradorEnemigos")
@onready var puntulabel = $Label
signal puntuaje(puntos)
var puntuacion = 0
var difil1=true
var difil2=true
var difil3=true
var difil4=true

func _on_puntuaje(puntos):
	puntuacion+=puntos
	puntulabel.text="Puntuacion: "+ str(puntuacion)

	if puntuacion>=60 and difil1==true:
		generador.aumentarEnemigos.emit()
		print("dificulta 1 alcanzada")
		difil1=false
	
	if puntuacion>=160 and difil2==true:
		generador.aumentarEnemigos.emit()
		print("dificulta 2 alcanzada")
		difil2=false
	
	if puntuacion>=260 and difil3==true:
		generador.aumentarEnemigos.emit()
		print("dificulta 3 alcanzada")
		difil3=false
	
	if puntuacion>=360 and difil4==true:
		generador.aumentarEnemigos.emit()
		print("dificulta 4 alcanzada")
		difil4=false


