extends Area2D

signal respawn_spike

export var FALLING_SPEED = 400
export var respawn_time = 5
export var life_time = 10

var falling = false

onready var initial_position = position


func _on_PlayerDetector_body_entered(body):
	falling = true
	$LifeTime.start(life_time)

func _on_GroundDetectror_body_entered(body):
	destroy()

func _on_LifeTime_timeout():
	destroy()

func _process(delta):
	if falling:
		position.y += FALLING_SPEED * delta

func destroy():
	emit_signal("respawn_spike", initial_position, respawn_time)
	queue_free()


func set_position(value):
	position = value
	initial_position = position
