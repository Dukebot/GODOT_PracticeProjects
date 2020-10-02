extends Area2D

signal stop_level_time_count
signal change_level

export var next_level = "res://src/Levels/LevelTemplate.tscn"

func _ready():
	connect("stop_level_time_count", get_tree().current_scene, "stop_level_time_count")
	connect("change_level", get_tree().current_scene, "change_level")

func _on_EndLevel_body_entered(body):
	body.set_physics_process(false)
	$VictorySound.play()
	emit_signal("stop_level_time_count")

func _on_VictorySound_finished():
	print("victory sound finished")
	emit_signal("change_level", next_level)
