extends Button

signal next_level

func _ready():
	connect("next_level", get_tree().current_scene, "load_next_level")


func _on_MainMenuSimpleButton_pressed():
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")

func _on_RestartLevelSimpleButton_pressed():
	get_tree().reload_current_scene()

func _on_NextLevelSimpleButton_pressed():
	emit_signal("next_level")
