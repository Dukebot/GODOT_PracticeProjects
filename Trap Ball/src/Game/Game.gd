extends Node

const LEVEL_SELECTOR_PATH = "res://src/Interface/LevelSelector.tscn"
const THANKS_FOR_PLAYING_PATH = "res://src/Interface/ThanksForPlaying.tscn"
const LEVEL_PATH = "res://src/Levels"

const NUM_WORLDS = 4
const LEVELS_PER_WORLD = 6


func load_level(world, level):
	var level_scene_path = LEVEL_PATH + "/World" + str(world) + "/Level" + str(level) + ".tscn"
	get_tree().change_scene(level_scene_path)


func load_main_menu():
	get_tree().change_scene(LEVEL_SELECTOR_PATH)


func get_next_level_path(world, level):
	var next_world = world
	var next_level = level
	next_level += 1
	if next_level > LEVELS_PER_WORLD:
		next_level = 1
		next_world += 1
		if next_world > NUM_WORLDS:
			return THANKS_FOR_PLAYING_PATH
	return LEVEL_PATH + "/World" + str(next_world) + "/Level" + str(next_level) + ".tscn"
