extends Actor

func _physics_process(delta):
	direction = get_input_vector()
	move(delta)
	shoot()

func get_input_vector() -> Vector2:
	return Vector2(
		Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
		Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
	).normalized()

func shoot():
	if Input.is_action_just_pressed("primary_fire"):
		shoot_primary_fire(get_global_mouse_position())
	if Input.is_action_just_pressed("secondary_fire"):
		shoot_secondary_fire(get_global_mouse_position())
	if Input.is_action_just_pressed("special_attack"):
		shoot_secondary_fire(get_global_mouse_position())
