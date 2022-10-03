extends Control

var dialog = [
	"One tienes que ir a la comisaria.",
	"Debes reportar que no han robado.",
	"Habla con las personas en la comisaria, ellos sabran que hacer.",
	"Yo te esperare aqui.",
	"Porfavor ten cuidado."
]

var dialog_index = 0
var finished = false

func _ready():
	load_dialog()

func _process(delta):
	$Continue.visible = finished
	$Continue/AnimationPlayer.play("idle")
	
	if Input.is_action_just_pressed("ui_accept"):
		load_dialog()

func load_dialog():
	if dialog_index < dialog.size():
		finished = false
		$RichTextLabel.bbcode_text = dialog[dialog_index]
		$RichTextLabel.percent_visible = 0
		$Tween.interpolate_property(
			$RichTextLabel, "percent_visible", 0, 1, 1,
			Tween.TRANS_LINEAR, Tween.EASE_IN_OUT
		)		
		$Tween.start()
		dialog_index += 1
	if dialog_index >= dialog.size():
			get_tree().change_scene("res://Scenes/Vecindario.tscn")

func _on_Tween_tween_completed(object, key):
	finished = true
	

