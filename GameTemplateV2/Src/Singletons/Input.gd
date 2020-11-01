extends Node

func get_horizontal_direction():
	var direction = 0
	if Input.is_action_pressed("left") and not Input.is_action_pressed("right"):
		direction = -1
	elif Input.is_action_pressed("right") and not Input.is_action_pressed("left"):
		direction = 1
	return direction

func is_jumping():
	return Input.is_action_pressed("jump")

func is_attacking():
	return Input.is_action_just_pressed("attack")
