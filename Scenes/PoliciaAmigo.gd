extends KinematicBody2D

const moveSpeed = 12
const maxSpeed = 20

const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 15

var path = "res://escena.cfg"
var config = ConfigFile.new()
var escena = ""

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var timer = $Timer
var State = false

var motion = Vector2()

func _physics_process(delta):
	motion.y += gravity
	var friction = false
	
	if Input.is_action_pressed("ui_right"):
		sprite.flip_h = false
		animationPlayer.play("Walk")
		State = false
		motion.x = max(motion.x + moveSpeed, maxSpeed)
	
	elif Input.is_action_pressed("ui_left"):
		sprite.flip_h = true
		animationPlayer.play("Walk")
		State = false
		motion.x = min(motion.x - moveSpeed, maxSpeed)
	
	elif Input.is_action_pressed("Pausa"):
		config.load(path)
		escena = get_tree().get_current_scene().get_name()
		config.set_value("Values", "NameScenePrueba", escena)
		config.set_value("Values", "Pistas", Lupas.Pistas)
		config.set_value("Values", "Vida", Jose.vida)
		config.save(path)
		get_tree().change_scene("res://Scenes/MenuPausa.tscn")
		
	else:
		if(State == false):
			animationPlayer.play("Idle")
			timer.set_wait_time(3)
			timer.start()
			State = true
			
		friction = true
		
	if is_on_floor():
		if Input.is_action_pressed("ui_accept"):
			motion.y = jumpHeight
			State = false
		if friction == true:
			motion.x = lerp(motion.x ,0,0.5)
	
	else:
		if friction == true:
			motion.x = lerp(motion.x, 0,0.01)
	
	motion = move_and_slide(motion,up)


	
# Called when the node enters the scene tree for the first time.
func _ready():
	pass # Replace with function body.





func _on_Area2D_body_entered(body):
	if	(body.get_name() == "Ladron"):
		if(get_node("/root/Nivel1/PoliciaAmigoNode").vida2 > 0):
			get_node("/root/Nivel1/PoliciaAmigoNode").vida2 -=1
			$AudioStreamPlayer2D.play()
			position.x = 0
		else:
			queue_free()
			get_tree().change_scene("res://Scenes/MenuGameOver.tscn")


func _on_Area2D_area_entered(area):
	if(area.get_name() == "ZonaCaida"):
		if(get_node("/root/Nivel1/PoliciaAmigoNode").vida2 > 0):
			get_node("/root/Nivel1/PoliciaAmigoNode").vida2 -=1
			$AudioStreamPlayer2D.play()
			position.x = 0
			position.y = 0
		if(get_node("/root/Nivel1/PoliciaAmigoNode").vida2 == 0):
			queue_free()
			get_tree().change_scene("res://Scenes/MenuGameOver.tscn")
	if Input.is_action_pressed("ui_up"):
		if(area.get_name() == "Puerta1"):
				get_tree().change_scene("res://Scenes/Nivel1_1.tscn")
	if Input.is_action_pressed("ui_up"):
		if(area.get_name() == "puerta1"):	
			get_tree().change_scene("res://Scenes/Nivel1.tscn")
	if Input.is_action_pressed("ui_up"):
		if(area.get_name() == "Puerta2"):
			get_tree().change_scene("res://Scenes/Nivel1_2.tscn")
	if Input.is_action_pressed("ui_up"):	
		if(area.get_name() == "puerta2"):
			get_tree().change_scene("res://Scenes/Nivel1.tscn")

func _on_Timer_timeout():
	timer.stop()
	animationPlayer.play("Nomove")
	State = true	

