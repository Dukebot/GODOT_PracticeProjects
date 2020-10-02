extends MarginContainer

const LEVEL_PATH = "res://src/Levels/"
const NUM_WORLDS = 1

var world_selected = 1
#var level_selected = 1

onready var world_selected_label = $VBoxContainer/VBoxContainer/HBoxContainer3/WorldSelectedLabel


#Level Selection

func _on_Button1_pressed():
	get_tree().change_scene(LEVEL_PATH + "Level1.tscn")

func _on_Button2_pressed():
	get_tree().change_scene(LEVEL_PATH + "Level2.tscn")

func _on_Button3_pressed():
	get_tree().change_scene(LEVEL_PATH + "Level3.tscn")

func _on_Button4_pressed():
	get_tree().change_scene(LEVEL_PATH + "Level4.tscn")

func _on_Button5_pressed():
	get_tree().change_scene(LEVEL_PATH + "Level5.tscn")

func _on_Button6_pressed():
	get_tree().change_scene(LEVEL_PATH + "Level6.tscn")


#World Selection

func _on_PrevWorldButton_pressed():
	world_selected -= 1
	if world_selected < 1: world_selected = 1
	update_world_selected_text()

func _on_NextWorldButton_pressed():
	world_selected += 1
	if world_selected > NUM_WORLDS: world_selected = NUM_WORLDS
	update_world_selected_text()

func update_world_selected_text():
	world_selected_label.text = "World " + str(world_selected)
	



