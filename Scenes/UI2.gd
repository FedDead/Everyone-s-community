extends CanvasLayer

func _process(delta):
	$VidasAmigos.text = str(get_node("/root/Nivel1/PoliciaAmigoNode").vida2)
