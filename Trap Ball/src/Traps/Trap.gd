extends Area2D

class_name Trap

export var speed = 0
export var direction = Vector2()
export var change_dir_distance = 100

onready var initial_position = position

func _ready():
	if speed == 0 or direction == Vector2.ZERO:
		set_process(false)

func _process(delta):
	move(delta)

func move(delta):
	position += speed * direction.normalized() * delta
	if position.distance_to(initial_position) > change_dir_distance:
		direction *= -1
		position = initial_position + (position - initial_position).normalized() * change_dir_distance
