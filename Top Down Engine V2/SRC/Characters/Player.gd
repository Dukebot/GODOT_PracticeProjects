extends Character

func _process(delta):
	#do stuff here...
	pass

func _physics_process(delta):
	var direction = InputManager.get_movement_direction()
	movement.move(direction, delta)


func _on_InteractionDetector_area_entered(area):
	print("Interaction Detected")


func _on_InteractionDetector_area_exited(area):
	print("Interaction Undetected")
