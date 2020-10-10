extends Control


onready var level_value = $LevelValue
onready var time_value = $TimeValue
onready var best_time_value = $BestTimeValue



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
	print(level_name)
	level_value.text = level_name.split(" ")[1]

func set_time(time):
	time = stepify(time, 0.01)
	time_value.text = str(time)

func set_best_time(time):
	time = stepify(time, 0.01)
	best_time_value.text = str(time)


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
