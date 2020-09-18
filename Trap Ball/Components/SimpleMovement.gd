extends Node

export var change_dir_time = 1.0
export var speed_x = 0
export var speed_y = 0

var direction = 1

func _ready():
	$Timer.start(change_dir_time/2)

func _process(delta):
	get_parent().position.x += speed_x * delta * direction
	get_parent().position.y += speed_y * delta * direction

func _on_Timer_timeout():
	direction *= -1
	$Timer.start(change_dir_time)
