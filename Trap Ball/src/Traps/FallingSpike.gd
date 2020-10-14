extends Area2D

export var FALLING_SPEED = 400
export var life_time = 1.0
export var activation_time = 1.0

var falling = false

onready var initial_position = position
onready var initial_scale = scale

func _on_PlayerDetector_body_entered(_body):
	if not falling: 
		falling = true
		$FallSound.play()
		$LifeTime.start(life_time)


func _on_GroundDetectror_body_entered(_body):
	disable()


func _on_LifeTime_timeout():
	enable()


func _on_ActivationTime_timeout():
	enable_player_detector()


func _process(delta):
	if falling:
		position.y += FALLING_SPEED * delta
	
	if scale < initial_scale:
		scale.x += 2 * delta
		scale.y += 2 * delta


func set_position(value):
	position = value
	initial_position = position


func disable():
	set_process(false)
	set_visible(false)
	$CollisionShape2D.set_deferred("disabled", true)


func enable():
	falling = false
	position = initial_position
	set_process(true)
	set_visible(true)
	$CollisionShape2D.disabled = false
	scale = Vector2(0, 0)
	disable_player_detector()
	$ActivationTime.start(activation_time)


func disable_player_detector():
	$PlayerDetector/CollisionShape2D.set_deferred("disabled", true)


func enable_player_detector():
	$PlayerDetector/CollisionShape2D.disabled =  false



