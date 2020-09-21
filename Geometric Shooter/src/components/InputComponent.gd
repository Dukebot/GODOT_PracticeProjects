extends Node

func get_input_vector() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()

func is_primary_fire_shooting():
	return Input.is_action_pressed("primary_fire")

func is_secondary_fire_shooting():
	return Input.is_action_pressed("secondary_fire")

func is_special_attack_shooting():
	return Input.is_action_pressed("special_attack")
