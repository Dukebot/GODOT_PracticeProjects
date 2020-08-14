extends Node2D


const SPEED = 300

onready var area = $Area2D


func _ready():
	#don't inherit position information from your parent
	set_as_toplevel(true)
	global_position = get_parent().global_position


func _process(delta):
	position.y += SPEED * delta
	manage_collision()


func manage_collision():
	var collider = area.get_overlapping_bodies()
	for object in collider:
		if object.name == "Player":
			get_tree().call_group("GameState", "hurt")
		queue_free()


func _on_VisibilityNotifier2D_screen_exited():
	queue_free()
