extends Control

func _on_PlayButton_pressed():
	print("Play Button pressed")
	get_tree().change_scene("res://Levels/LevelTemplate.tscn")
