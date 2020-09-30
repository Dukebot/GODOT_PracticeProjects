extends MarginContainer


func _on_NewGameButton_pressed():
	get_tree().change_scene("res://src/Levels/LevelTemplate.tscn")


func _on_ExitGameButton_pressed():
	get_tree().quit()
