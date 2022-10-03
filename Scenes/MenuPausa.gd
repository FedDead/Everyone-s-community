extends Control

var path = "res://escena.cfg"
var config = ConfigFile.new()	
var escena = ""
var NameScenePrueba = ""
var pathScene = "res://Scenes/"

# Called when the node enters the scene tree for the first time.
func _ready():
	config.load(path)
	NameScenePrueba = config.get_value("Values", "NameScenePrueba")

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass


func _on_Button2_pressed():
	config.load(path)
	escena = config.get_value("Values", "NameScenePrueba")
	config.set_value("Values", "NameScene", escena)
	print("Escena guardada")
	print(escena)
	


func _on_Button_pressed():
	print(pathScene + NameScenePrueba + ".tscn")
	get_tree().change_scene(pathScene + NameScenePrueba + ".tscn")


func _on_Button3_pressed():
	get_tree().quit()


func _on_Button4_pressed():
	config.load(escena)
	escena = config.get_value("Values", "NameScene",escena)
	print(pathScene + escena + ".tscn")
	get_tree().change_scene(pathScene + escena + ".tscn")
