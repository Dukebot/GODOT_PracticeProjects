extends Node2D

var next_level_path

var time = 0.0
var best_time = 0.0

onready var player = $Player
onready var enemies = $Enemies
onready var effects = $Effects
onready var world = $World

onready var GUI = $CanvasLayer/GUI
onready var victory = $CanvasLayer/Victory
onready var pause = $CanvasLayer/Pause


#Initialize and set up the tree
func _ready():
	next_level_path = get_next_level_path()
	best_time = GameSave.get_score(name)
	GUI.set_level_name(name)
	GUI.set_time(time)
	GUI.set_best_time(best_time)
	victory.set_visible(false)
	pause.set_visible(false)


#We increase the timer and update the GUI to show the time to player
func _process(delta):
	time += delta
	GUI.set_time(time)
	if Input.is_action_just_pressed("restart_level"):
		restart_level()


#This function return the path where the next level scene is located
func get_next_level_path():
	var world_level = name.split(" ")[1]
	var world = int(world_level.split("-")[0])
	var level = int(world_level.split("-")[1])
	
	level += 1
	if level > 6:
		level = 1
		world += 1
		if world > 2:
			return "res://src/Interface/ThanksForPlaying.tscn"
	
	return "res://src/Levels/World" + str(world) + "/Level" + str(level) + ".tscn"


func restart_level():
	unpause()
	get_tree().reload_current_scene()

func load_next_level():
	unpause()
	get_tree().change_scene(next_level_path)

func end_level():
	pause()
	save_score()
	pause.set_visible(false)
	GUI.set_visible(false)
	victory.set_visible(true)
	victory.set_time(time)
	victory.set_best_time(best_time)


func pause():
	pause.set_visible(true)
	get_tree().paused = true

func unpause():
	pause.set_visible(false)
	get_tree().paused = false


func save_score():
	if time < best_time or best_time == 0:
		GameSave.set_score(name, time)
		GameSave.save()


func set_time(_time): time = _time
func get_time(): return time


func get_player_direction(): return GUI.get_player_direction()


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
