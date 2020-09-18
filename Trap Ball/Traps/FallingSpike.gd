extends Area2D

export var FALLING_SPEED = 400

var falling = false

func _on_PlayerDetector_body_entered(body):
	falling = true
	$LifeTime.start(10)

func _on_GroundDetectror_body_entered(body):
	destroy()

func _on_LifeTime_timeout():
	destroy()

func _process(delta):
	if falling:
		position.y += FALLING_SPEED * delta

func destroy():
	queue_free()
