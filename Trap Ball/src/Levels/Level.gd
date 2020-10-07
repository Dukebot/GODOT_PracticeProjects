extends Node2D

export var next_level_path = "res://src/Interface/ThanksForPlaying.tscn"
export var Victory = preload("res://src/Interface/Victory.tscn")

var time = 0.0
var best_time = 0.0
var pause = false

onready var effects = $Effects
onready var gui = $GUI
onready var victory = $Victory
onready var player = $Player

func _ready():
	best_time = GameSave.get_score(name)
	gui.set_level_name(name)
	gui.set_time(time)
	gui.set_best_time(best_time)
	victory.set_visible(false)

func _process(delta):
	if not pause:
		time += delta
		gui.set_time(time)
	
	if Input.is_action_just_pressed("restart_level"):
		restart_level()
	
	#Set the direction of the player based on the inpud readed from the GUI
	#REFACTOR: Make a getter and make player read from this getter each frame
	var player_direction = gui.get_player_direction()
	player.set_direction(player_direction)


func restart_level():
	get_tree().reload_current_scene()

func load_next_level():
	get_tree().change_scene(next_level_path)

func change_level(level_path):
	get_tree().change_scene(level_path)

func load_main_menu():
	get_tree().change_scene("res://src/Interface/LevelSelector.tscn")

func end_level(_next_level_path):
	pause = true
	save_score()
	next_level_path = _next_level_path
	gui.set_visible(false)
	victory.set_time(time)
	victory.set_best_time(best_time)
	victory.set_visible(true)



func save_score():
	if time < best_time or best_time == 0:
		GameSave.set_score(name, time)
		GameSave.save()


func set_time(_time): time = _time
func get_time(): return time


func set_player_direction(direction):
	player.set_direction(direction)


func add_child_scene(Scene, _position):
	var scene = Scene.instance()
	scene.position = _position
	add_child(scene)

func add_child_scenes(Scene, _position, num_childs):
	for _i in range(num_childs):
		add_child_scene(Scene, _position)


func add_effect_scene(EffectScene, _position):
	var effect = EffectScene.instance()
	effect.position = _position
	effects.add_child(effect)

func add_effect_scenes(EffectScene, _position, num_scenes):
	for _i in range(num_scenes):
		add_effect_scene(EffectScene, _position)
