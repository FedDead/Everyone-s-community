extends KinematicBody2D

const MaxSpeed : float = 100.0
const Gravtity : float = 25.0

var motion := Vector2()


# Called when the node enters the scene tree for the first time.
func _ready():
	$AnimatedSprite.scale.x = -1
	motion.x = MaxSpeed
	pass
	
func _next_to_left_wall()-> bool:
	return $LeftRay.is_colliding()

func _next_to_right_wall()-> bool:
	return $RightRay.is_colliding()

func _floor_detection()-> bool:
	return $AnimatedSprite/FloorDetection.is_colliding()

func _flip():
	if _next_to_left_wall() or _next_to_right_wall() or !_floor_detection():
		motion.x *= -1
		$AnimatedSprite.scale.x *= -1

func _process(_delta):
	motion.y += Gravtity
	_flip()
	motion = move_and_slide(motion)
	pass




func _on_AreaLadron_area_entered(area):
	if(area.get_name() == "AreaMacana"):
		queue_free()


