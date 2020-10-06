extends Area2D

signal end_level
signal change_level

export var next_level = "res://src/Levels/LevelTemplate.tscn"

func _ready():
	connect("end_level", get_tree().current_scene, "end_level")
	connect("change_level", get_tree().current_scene, "change_level")

func _on_EndLevel_body_entered(body):
	body.set_physics_process(false)
	$VictorySound.play()
	emit_signal("end_level")
	

func _on_VictorySound_finished():
	print("victory sound finished")
	emit_signal("change_level", next_level)
