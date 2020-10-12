extends Node


const LEVEL_PATH = "res://src/Levels/"
const NUM_WORLDS = 4


func load_level(world, level):
	var level_scene_path = LEVEL_PATH + "World" + str(world) + "/Level" + str(level) + ".tscn"
	get_tree().change_scene(level_scene_path)


func load_main_menu():
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")


func get_next_level_path(world, level):
	var next_world = world
	var next_level = level
	next_level += 1
	if next_level > 6:
		next_level = 1
		next_world += 1
		if next_world > NUM_WORLDS:
			return "res://src/Interface/ThanksForPlaying.tscn"
	return "res://src/Levels/World" + str(next_world) + "/Level" + str(next_level) + ".tscn"
