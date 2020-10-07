extends Node

signal bounce

const UP = Vector2(0, -1)

export var ACCELERATION = 2000
export var FRICTION = 2000
export var GRAVITY = 2000

export var MAX_SPEED = 300
export var JUMP_SPEED = 700

var motion = Vector2()
var direction = 0

func _ready():
	connect("bounce", get_parent(), "bounce")

func set_direction(value): direction = value
func get_direction(): return direction


func move(delta):
	horizontal_movement(delta)
	vertical_movement(delta)
	motion = get_parent().move_and_slide(motion, UP)


func horizontal_movement(delta):
	if direction > 0:
		motion.x += ACCELERATION * delta
		if  motion.x > MAX_SPEED: motion.x = MAX_SPEED
	elif direction < 0:
		motion.x -= ACCELERATION * delta
		if motion.x < -MAX_SPEED: motion.x = -MAX_SPEED
	else:
		if motion.x < 0:
			motion.x += FRICTION * delta
			if motion.x > 0: motion.x = 0
		elif motion.x > 0:
			motion.x -= FRICTION * delta
			if motion.x < 0: motion.x = 0


func vertical_movement(delta):
	if not get_parent().is_on_floor():
		motion.y += GRAVITY * delta
	else:
		jump()
		emit_signal("bounce")

func jump():
	get_parent().position.y -= 2
	motion.y = -JUMP_SPEED

func stop():
	motion = Vector2()



