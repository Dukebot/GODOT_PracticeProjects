extends StaticBody2D

export var falling_speed = 200
export var falling_time = 2.0

var initial_position
var falling = false

func _ready():
	initial_position = position

func _process(delta):
	if falling:
		position.y += falling_speed * delta


func _on_PlayerDetector_body_entered(body):
	falling = true
	$FallTimer.start(falling_time)


func _on_FallTimer_timeout():
	falling = false
	position = initial_position
