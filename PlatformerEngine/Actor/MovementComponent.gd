extends Node

const UP = Vector2(0, -1)

const ACCELERATION = 1000
const FRICTION = 4000
const GRAVITY = 2000

const MAX_SPEED = 300
const JUMP_SPEED = 800

var motion = Vector2()


func _ready():
	if get_parent().get_class() != "KinematicBody2D":
		printerr("Movement component must be a child of KinematicBody")


#Call this on the physics process of a kinematic body 2D
func move(direction, delta):
	horizontal_movement(direction, delta)
	apply_gravity(delta)
	jump()
	motion = get_parent().move_and_slide(motion, UP)


func horizontal_movement(direction, delta):
	if direction > 0:
		motion.x += ACCELERATION * delta
		if motion.x > MAX_SPEED: motion.x = MAX_SPEED
	elif direction < 0:
		motion.x -= ACCELERATION * delta
		if motion.x < -MAX_SPEED: motion.x = -MAX_SPEED
	elif get_parent().is_on_floor():
		if motion.x > 0:
			motion.x -= FRICTION * delta
			if motion.x < 0: motion.x = 0
		elif motion.x < 0:
			motion.x += FRICTION * delta
			if motion.x > 0: motion.x = 0


func apply_gravity(delta):
	if not get_parent().is_on_floor():
		motion.y += GRAVITY * delta
	else:
		motion.y = 0


func jump():
	if Input.is_action_pressed("jump") and get_parent().is_on_floor():
		motion.y = -JUMP_SPEED
