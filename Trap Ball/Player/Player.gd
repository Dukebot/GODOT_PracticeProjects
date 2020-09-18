extends KinematicBody2D

func _physics_process(delta):
	var direction = $PlayerInput.get_horizontal_direction()
	$PlayerMovement.move(direction, delta)

func _on_Hitbox_area_entered(area):
	destroy()

func destroy():
	get_tree().current_scene.respawn_player()
	queue_free()

func set_jump_speed(value):
	$PlayerMovement.JUMP_SPEED = value

func get_jump_speed():
	return $PlayerMovement.JUMP_SPEED
