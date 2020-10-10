extends TextureButton

signal next_level

func _ready():
	connect("next_level", get_tree().current_scene, "load_next_level")

func _on_MainMenuTextureButton_pressed():
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")

func _on_NextLevelTextureButton_pressed():
	emit_signal("next_level")

func _on_RestartLevelTextureButton_pressed():
	get_tree().reload_current_scene()
