extends Control


onready var level_label = $VBoxContainer/Level
onready var time_label = $VBoxContainer/Time
onready var best_time_label = $VBoxContainer/BestTime

onready var touch_screen_button_left = $TouchScreenButtonLeft
onready var touch_screen_button_right = $TouchScreenButtonRight


var player_direction = 0


func _ready():
	#OS.get_name() gives you the name of the operating system, it can be one of these:
	#"Android", "BlackBerry 10", "Flash", "Haiku", "iOS", "HTML5", "OSX", "Server", "Windows", "WinRT", "X11"
	if OS.get_name() != "Android":
		touch_screen_button_left.visible = false
		touch_screen_button_right.visible = false


func set_level_name(level_name):
	level_label.text = level_name

func set_time(time):
	time_label.text = "TIME " + str(time)

func set_best_time(time):
	best_time_label.text = "BEST TIME " + str(time)


func _on_TouchScreenButtonLeft_pressed():
	player_direction = -1

func _on_TouchScreenButtonLeft_released():
	if player_direction == -1:
		player_direction = 0


func _on_TouchScreenButtonRight_pressed():
	player_direction = 1

func _on_TouchScreenButtonRight_released():
	if player_direction == 1:
		player_direction = 0


func get_player_direction():
	return player_direction
