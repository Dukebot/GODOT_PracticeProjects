extends Area2D

export var FALLING_SPEED = 400
export var life_time = 3

var falling = false

onready var initial_position = position


func _on_PlayerDetector_body_entered(body):
	falling = true
	$LifeTime.start(life_time)

func _on_GroundDetectror_body_entered(body):
	disable()

func _on_LifeTime_timeout():
	enable()


func _process(delta):
	if falling:
		position.y += FALLING_SPEED * delta


func disable():
	set_visible(false)

func enable():
	falling = false
	position = initial_position
	set_visible(true)


func set_position(value):
	position = value
	initial_position = position