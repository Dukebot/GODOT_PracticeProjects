extends Node

const UP = Vector2(0, -1)

export var ACCELERATION = 1000
export var FRICTION = 4000
export var GRAVITY = 2000

export var MAX_SPEED = 300
export var JUMP_SPEED = 800

var motion = Vector2()

onready var kinematic_body = get_parent()

func _ready():
	if get_parent().get_class() != "KinematicBody2D":
		printerr("Movement component must be a child of KinematicBody")


#Call this on the physics process of a kinematic body 2D
func move(direction, jump, delta):
	horizontal_movement(direction, delta)
	apply_gravity(delta)
	if (jump): jump()
	motion = kinematic_body.move_and_slide(motion, UP)


func horizontal_movement(direction, delta):
	if direction > 0:
		motion.x += ACCELERATION * delta
		if motion.x > MAX_SPEED: motion.x = MAX_SPEED
	elif direction < 0:
		motion.x -= ACCELERATION * delta
		if motion.x < -MAX_SPEED: motion.x = -MAX_SPEED
	elif kinematic_body.is_on_floor():
		if motion.x > 0:
			motion.x -= FRICTION * delta
			if motion.x < 0: motion.x = 0
		elif motion.x < 0:
			motion.x += FRICTION * delta
			if motion.x > 0: motion.x = 0


func apply_gravity(delta):
	if not kinematic_body.is_on_floor():
		motion.y += GRAVITY * delta
	else:
		motion.y = 0


func jump():
	if kinematic_body.is_on_floor():
		motion.y = -JUMP_SPEED