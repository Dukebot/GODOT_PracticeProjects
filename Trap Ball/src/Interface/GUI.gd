extends CanvasLayer

onready var level_label = $Control/VBoxContainer/Level
onready var time_label = $Control/VBoxContainer/Time
onready var best_time_label = $Control/VBoxContainer/BestTime


func set_level_name(level_name):
	level_label.text = level_name

func set_time(time):
	time_label.text = "TIME " + str(time)

func set_best_time(time):
	best_time_label.text = "BEST TIME " + str(time)


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")


func _on_RestartLevelButton_pressed():
	get_tree().reload_current_scene()
