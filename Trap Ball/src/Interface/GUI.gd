extends CanvasLayer

var time = 0.0
var pause = false

func _ready():
	$Control/VBoxContainer/Level.text = get_tree().current_scene.name

func _process(delta):
	if not pause:
		time += delta
		$Control/VBoxContainer/Time.text = "TIME " + str(time)

func set_time(_time): time = _time
func get_time(): return time

func pause(): pause = true
func unpause(): pause = false


func _on_MainMenuButton_pressed():
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")


func _on_RestartLevelButton_pressed():
	get_tree().reload_current_scene()
