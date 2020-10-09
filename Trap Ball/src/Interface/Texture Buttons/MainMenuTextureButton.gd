extends TextureButton


func _on_MainMenuTextureButton_pressed():
	get_tree().paused = false
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")
