extends Trap

func _process(delta):
	move(delta)
	if direction > 0:
		$Sprite.flip_h = true
	else:
		$Sprite.flip_h = false
