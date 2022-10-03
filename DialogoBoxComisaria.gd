extends Control

var dialog = [
	"Claro que podemos tomar tu reporte de robo.",
	"Tu sabias que los policias encaminados a preservar el orden público, la seguridad, la tranquilidad, la salubridad en un Estado, es una pena que te haya sucedido esto.",
	"Es decir mantenemos el orden",
	"Eso me recuerdo una vez tuvimos que pelear contra unos ladrones que se metieron a la casa de una señorita",
	"Esto sucedio.....",
	"....."
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
			get_tree().change_scene("res://Scenes/Nivel1.tscn")

func _on_Tween_tween_completed(object, key):
	finished = true
