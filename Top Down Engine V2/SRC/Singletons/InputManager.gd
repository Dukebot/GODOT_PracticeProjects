extends Node

func get_movement_direction(): 
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	)

func interact_just_pressed():
	return Input.is_action_just_pressed("interact")
