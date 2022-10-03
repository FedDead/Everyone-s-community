extends Control


func _on_JugarNivel_pressed():
	get_tree().change_scene("res://Scenes/Nivel1.tscn")


func _on_SalirNivel_pressed():
	get_tree().quit()
