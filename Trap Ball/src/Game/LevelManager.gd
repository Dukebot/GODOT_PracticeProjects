extends Node

const LEVEL_PATH = "res://src/Levels/"
const NUM_WORLDS = 2

func load_level(world, level):
	var level_scene_path = LEVEL_PATH + "world" + str(world) + "/Level" + str(level) + ".tscn"
	get_tree().change_scene(level_scene_path)

func load_main_menu():
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")
