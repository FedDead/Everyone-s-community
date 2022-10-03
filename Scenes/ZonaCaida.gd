extends Area2D

signal CaidaJugador1
signal CaidaJugador2

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.


func _on_ZonaCaida_body_entered(body):
	if	(body.get_name() == "PoliciaAmigo2"):
		emit_signal("CaidaJugador1")
	if (body.get_name() == "PoliciaJose2"):
		emit_signal("CaidaJugador2")
		
		


