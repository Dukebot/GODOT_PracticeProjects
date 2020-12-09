extends Actor

var interaction_area = null

onready var animated_sprite = $AnimatedSprite
onready var footsteps = $Footsteps


func _process(delta):
	if interaction_area != null:
		if Input.is_action_just_pressed("interact"):
			interaction_area.examinate()
		if Input.is_action_just_pressed("secondary_interact"):
			interaction_area.interact()

func _physics_process(delta):
	var direction = get_movement_direction()
	movement.move(direction, delta)
	animate(direction)
	
	if direction != Vector2.ZERO:
		if not footsteps.playing:
			footsteps.play()
	else:
		footsteps.stop()

func get_movement_direction(): 
	return Vector2(
		Input.get_action_strength("right") - Input.get_action_strength("left"),
		Input.get_action_strength("down") - Input.get_action_strength("up")
	).normalized()

func animate(direction: Vector2):
	if direction == Vector2.ZERO:
		animated_sprite.play("idle")
	else:
		animated_sprite.play("run")
	set_sprite_orientation(direction)

func set_sprite_orientation(direction: Vector2):
	if direction.x > 0:
		animated_sprite.flip_h = false
	elif direction.x < 0:
		animated_sprite.flip_h = true


func _on_InteractionDetector_area_entered(area):
	interaction_area = area

func _on_InteractionDetector_area_exited(area):
	interaction_area = null
