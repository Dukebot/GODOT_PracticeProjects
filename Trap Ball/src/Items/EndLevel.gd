extends Area2D

signal end_level

export var next_level = "res://src/Levels/LevelTemplate.tscn"

func _ready():
	connect("end_level", get_tree().current_scene, "end_level")

func _on_EndLevel_body_entered(body):
	$VictorySound.play()
	emit_signal("end_level", next_level)
