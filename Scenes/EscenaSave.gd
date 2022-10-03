extends Node

var save_path = "res://save-file.cfg"
var config = ConfigFile.new()
var load_response = config.load(save_path)


# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.

func save_value(section, key, points):
	config.set_value(section, key, points)
	config.save(save_path)

func load_value(section, key, points):
	points = config.get_value(section, key, points)

# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass
