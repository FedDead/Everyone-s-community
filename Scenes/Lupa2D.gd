extends Area2D

# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.



func _on_Lupa2D_body_entered(body):
	if	(body.get_name() == "PoliciaJose2" or body.get_name() == "PoliciaAmigo2"):
			Lupas.Pistas +=1 
			queue_free()
	if(Lupas.Pistas == 7):
		print("completado")
		get_tree().change_scene("res://Scenes/MenuNivelCompetado.tscn")
