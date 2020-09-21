extends Node2D

onready var effects = $Effects

func _process(delta):
	if Input.is_action_just_pressed("restart_level"):
		restart()

func restart():
	get_tree().reload_current_scene()

func change_level(level):
	get_tree().change_scene(level)

func add_effect_child(effect):
	effects.add_child(effect)
