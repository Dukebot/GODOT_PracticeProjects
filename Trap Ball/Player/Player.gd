extends KinematicBody2D

const UP = Vector2(0, -1)

export var ACCELERATION = 2000
export var FRICTION = 2000
export var GRAVITY = 2500

export var MAX_SPEED = 300
export var JUMP_SPEED = 1000

var motion = Vector2()


func _physics_process(delta):
	var direction = get_horizontal_direction()
	horizontal_movement(direction, delta)
	vertical_movement(delta)
	motion = move_and_slide(motion, UP)


func get_horizontal_direction():
	var direction = 0
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		direction = -1
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		direction = 1
	return direction


func horizontal_movement(direction, delta):
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
	if not is_on_floor():
		motion.y += GRAVITY * delta
	else:
		motion.y = -JUMP_SPEED


func _on_Hitbox_area_entered(area):
	queue_free()
