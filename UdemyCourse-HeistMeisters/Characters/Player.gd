extends "res://Characters/TemplateCharacter.gd"

var motion = Vector2()


func _physics_process(delta):
	update_movement()
	move_and_slide(motion)


func update_movement():
	look_at(get_global_mouse_position())
	
	#Refactor this: Use the ifs for input to determinate a movement direction
	#Use that movement direction to move, creating a function that accepts that dir as an argument
	if Input.is_action_pressed("move_down") and not Input.is_action_pressed("move_up"):
		motion.y = clamp(motion.y + SPEED, 0, MAX_SPEED)
	elif Input.is_action_pressed("move_up") and not Input.is_action_pressed("move_down"):
		motion.y = clamp(motion.y - SPEED, -MAX_SPEED, 0)
	else:
		motion.y = lerp(motion.y, 0, FRICTION)

	if Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		motion.x = clamp(motion.x - SPEED, -MAX_SPEED, 0)
	elif Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		motion.x = clamp(motion.x + SPEED, 0, MAX_SPEED)
	else:
		motion.x = lerp(motion.x, 0, FRICTION)
