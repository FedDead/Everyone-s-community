extends KinematicBody2D

const moveSpeed = 10
const maxSpeed = 20

const jumpHeight = -300
const up = Vector2(0,-1)
const gravity = 15

onready var sprite = $Sprite
onready var animationPlayer = $AnimationPlayer
onready var timer = $Timer
var State = false
var motion = Vector2()

func _physics_process(_delta):
	
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


# Called every frame. 'delta' is the elapsed time since the previous frame.
#func _process(delta):
#	pass



func _on_AreaOne_body_entered(body):
	pass


func _on_AreaOne_area_entered(area):
	if Input.is_action_pressed("ui_up"):
		if(area.get_name() == "AreaCasaOne"):
				get_tree().change_scene("res://Scenes/DialogoOneMama.tscn")
	if Input.is_action_pressed("ui_up"):
		if(area.get_name() == "AreaComisaria"):	
			get_tree().change_scene("res://Scenes/DialogoComisaria.tscn")
	
	
func _on_Timer_timeout():
	timer.stop()
	animationPlayer.play("NoMove")
	State = true	

