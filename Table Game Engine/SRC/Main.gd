extends Node2D

onready var grid = $Grid

func _process(delta):
	var mouse_pos = get_global_mouse_position()
	
	if Input.is_action_just_pressed("restart"):
		get_tree().reload_current_scene()
	
	if Input.is_action_just_pressed("left_click"):
		grid.click(mouse_pos)
