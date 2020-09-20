extends Node

var speed_x = 0
var speed_y = 0
var change_dir_time = 0.0

var direction = 1


func _ready():
	print("Movement component ready")
	set_process(false)

func init(_speed_x, _speed_y, _change_dir_time):
	print("Calling init")
	speed_x = _speed_x
	speed_y = _speed_y
	change_dir_time = _change_dir_time
	$Timer.start(change_dir_time/2)
	set_process(true)

func _process(delta):
	get_parent().position.x += speed_x * delta * direction
	get_parent().position.y += speed_y * delta * direction
	print("process is going")

func _on_Timer_timeout():
	direction *= -1
	$Timer.start(change_dir_time)
