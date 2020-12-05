extends Node

export var ACCELERATION = 2000
export var FRICTION = 2000
export var MAX_SPEED = 300

var motion = Vector2()

onready var parent = get_parent()


#Public

func move(direction: Vector2, delta: float):
	if direction != Vector2.ZERO:
		motion = motion.move_toward(direction * MAX_SPEED, ACCELERATION * delta)
	else:
		motion = motion.move_toward(Vector2.ZERO, FRICTION * delta)
	motion = parent.move_and_slide(motion)


func stop():
	motion = Vector2()
