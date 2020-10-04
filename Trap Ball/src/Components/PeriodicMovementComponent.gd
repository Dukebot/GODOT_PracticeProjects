extends Node

export var speed = 0
export var direction = Vector2()
export var change_dir_distance = 100

onready var parent = get_parent()
onready var initial_position = parent.position


func move(delta):
	parent.position += speed * direction.normalized() * delta
	
	if parent.position.distance_to(initial_position) > change_dir_distance:
		direction *= -1
		
		var end_position_direction = (parent.position - initial_position).normalized()
		var end_position_vector = end_position_direction * change_dir_distance
		parent.position = initial_position + end_position_vector

