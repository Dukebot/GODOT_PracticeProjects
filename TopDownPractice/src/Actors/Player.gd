extends Actor


func _input(event):
	print_mouse_data(event)
	print_viewport_size()


func _physics_process(delta: float) -> void:
	var direction = get_movement_direction()
	velocity = calculate_movement_velocity(direction, max_speed)
	velocity = move_and_slide(velocity)


#Movement Functions

func get_movement_direction(): return Vector2(
	Input.get_action_strength("move_right") - Input.get_action_strength("move_left"),
	Input.get_action_strength("move_down") - Input.get_action_strength("move_up")
)

func calculate_movement_velocity(direction: Vector2, max_speed: Vector2): return Vector2(
	max_speed.x * direction.x, 
	max_speed.y * direction.y
)


#Print Functions

func print_mouse_data(event):
   # Mouse in viewport coordinates
   if   event is InputEventMouseButton: print("Mouse Click/Unclick at: ", event.position)
   elif event is InputEventMouseMotion: print("Mouse Motion at: ", event.position)

func print_viewport_size(): print("Viewport Resolution is: ", get_viewport_rect().size)
