extends Actor

export var stomp_impulse := 1000.0 #pixels per second


#Callbacks
func _on_EnemyDetector_area_entered(area):
	velocity = calculate_stomp_velocity(velocity, stomp_impulse)
	
func _on_EnemyDetector_body_entered(body):
	queue_free()

#Called every frame
func _physics_process(delta: float) -> void:
	var direction := get_direction()
	var is_jump_interrupted := Input.is_action_just_released("jump") and velocity.y < 0
	
	velocity = calculate_move_velocity(velocity, direction, speed, is_jump_interrupted)
	velocity = move_and_slide(velocity, FLOOR_NORMAL)


# Helper Functions
func get_direction() -> Vector2:
	var directionX := Input.get_action_strength("move_right") - Input.get_action_strength("move_left")
	var directionY := 1.0
	if Input.get_action_strength("jump") and is_on_floor(): directionY = -1.0
	
	return Vector2(directionX, directionY)

func calculate_move_velocity(
	liner_velocity: Vector2, 
	direction: Vector2, 
	speed: Vector2, 
	is_jump_interrupted: bool
) -> Vector2:
	var out := liner_velocity
	out.x = speed.x * direction.x
	out.y += gravity * get_physics_process_delta_time()
	
	if direction.y < 0: out.y = speed.y * direction.y
	if is_jump_interrupted: out.y = 0.0
	
	return out

func calculate_stomp_velocity(linear_velocity: Vector2, impulse: float) -> Vector2:
	var out := linear_velocity
	out.y = -impulse
	return out



