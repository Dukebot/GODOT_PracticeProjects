extends Node

#Paths
const MAIN_MENU_PATH = "res://Src/Interface/Menus/MainMenu.tscn"
const LEVEL_PATH = "res://Src/Levels"

func _ready():
	print("Initializing the game...")
	GameSave.init_save_data()

func load_main_menu():
	get_tree().change_scene(MAIN_MENU_PATH)

func restart_level():
	get_tree().reload_current_scene()
