extends Character

onready var footsteps_sound = $Footsteps

func _process(delta):
	#do stuff here...
	pass

func _physics_process(delta):
	var direction = InputManager.get_movement_direction()
	movement.move(direction, delta)
	footsteps_sound(movement.motion)


func footsteps_sound(motion: Vector2):
	if motion != Vector2.ZERO:
		if not footsteps_sound.playing:
			footsteps_sound.play()
	else:
		if footsteps_sound.playing:
			footsteps_sound.stop()

func _on_InteractionDetector_area_entered(area):
	print("Interaction Detected")


func _on_InteractionDetector_area_exited(area):
	print("Interaction Undetected")
