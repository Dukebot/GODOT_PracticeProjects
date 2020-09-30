extends Area2D

class_name Trap

export var can_move = false
export var speed_x = 0
export var speed_y = 0
export var change_dir_time = 1.0

var direction = 1

onready var timer = $ChangeDirTimer

func _ready():
	set_process(false)
	if can_move:
		set_process(true)
		timer.start(change_dir_time/2)

func _process(delta):
	move(delta)

func move(delta):
	position.x += speed_x * direction * delta
	position.y += speed_y * direction * delta

func _on_ChangeDirTimer_timeout():
	direction *= -1
	timer.start(change_dir_time)
