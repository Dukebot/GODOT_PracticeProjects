extends Area2D

export var FALLING_SPEED = 400

var falling = false

func _on_PlayerDetector_body_entered(body):
	falling = true

func _on_GroundDetectror_body_entered(body):
	queue_free()

func _process(delta):
	if falling:
		position.y += FALLING_SPEED * delta
