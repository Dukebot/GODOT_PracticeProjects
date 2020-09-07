extends Area2D

export var CHANGE_DIR_TIME = 1
export var SPEED = 150

var direction = -1


func _ready():
	$Timer.start(CHANGE_DIR_TIME)

func _on_Timer_timeout():
	direction *= -1
	if direction > 0: $Sprite.flip_h = true
	else: $Sprite.flip_h = false
	$Timer.start(CHANGE_DIR_TIME)

func _process(delta):
	position.x += (SPEED * delta) * direction
