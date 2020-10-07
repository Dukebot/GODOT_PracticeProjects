extends MarginContainer

const LEVEL_PATH = "res://src/Levels/"
const NUM_WORLDS = 2

var world_path = "World1/"
var level_scene_name = ""

var world_selected = 1
#var level_selected = 1

onready var world_selected_label = $VBoxContainer/VBoxContainer/HBoxContainer3/WorldSelectedLabel


#Level Selection

func _on_Button1_pressed():
	level_scene_name = "Level1.tscn"
	load_level()

func _on_Button2_pressed():
	level_scene_name = "Level2.tscn"
	load_level()

func _on_Button3_pressed():
	level_scene_name = "Level3.tscn"
	load_level()

func _on_Button4_pressed():
	level_scene_name = "Level4.tscn"
	load_level()

func _on_Button5_pressed():
	level_scene_name = "Level5.tscn"
	load_level()

func _on_Button6_pressed():
	level_scene_name = "Level6.tscn"
	load_level()


func load_level():
	var level_scene_path = LEVEL_PATH + world_path + level_scene_name
	print("Loading Level --> " + level_scene_path)
	get_tree().change_scene(level_scene_path)


#World Selection

func _on_PrevWorldButton_pressed():
	world_selected -= 1
	if world_selected < 1: world_selected = 1
	update_world_selected()

func _on_NextWorldButton_pressed():
	world_selected += 1
	if world_selected > NUM_WORLDS: world_selected = NUM_WORLDS
	update_world_selected()

func update_world_selected():
	world_selected_label.text = "World " + str(world_selected)
	world_path = "World" + str(world_selected) + "/"
	



