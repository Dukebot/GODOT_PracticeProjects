extends KinematicBody2D


func _ready():
	pass


func _physics_process(delta):
	var direction = get_movement_direction()
	move(direction, delta)


func get_movement_direction():
	var direction = 0
	if Input.is_action_pressed("move_right") and not Input.is_action_pressed("move_left"):
		direction = 1
	elif Input.is_action_pressed("move_left") and not Input.is_action_pressed("move_right"):
		direction = -1
	return direction


func _on_EnemyDetector_body_entered(body):
	if body.name == "Enemy":
		print("Enemy Detected! " + body.name)
		#take_damage(10)


func move(direction, delta): $MovementComponent.move(direction, delta)
func take_damage(amount): $HealthComponent.take_damage(amount)
