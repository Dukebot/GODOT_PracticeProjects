extends Area2D

export var next_level = "res://src/Levels/LevelTemplate.tscn"

func _on_EndLevel_body_entered(body):
	get_tree().current_scene.change_level(next_level)
