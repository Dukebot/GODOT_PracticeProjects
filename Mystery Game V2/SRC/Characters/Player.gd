extends Character

onready var animated_sprite = $AnimatedSprite
onready var footsteps = $Footsteps

func _process(delta):
	#do stuff here...
	pass

func _physics_process(delta):
	var direction = InputManager.get_movement_direction()
	movement.move(direction, delta)
	animate(direction)
	footsteps(not direction == Vector2.ZERO)

func animate(direction: Vector2):
	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("move")
		

func footsteps(is_moving):
	if is_moving:
		if not footsteps.playing:
			footsteps.play()
	else:
		if footsteps.playing:
			footsteps.stop()

func _on_InteractionDetector_area_entered(area):
	print("Interaction Detected")


func _on_InteractionDetector_area_exited(area):
	print("Interaction Undetected")
