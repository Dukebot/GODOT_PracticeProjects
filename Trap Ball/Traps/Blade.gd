extends Area2D

func _process(delta):
	if $SimpleMovement.direction > 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
