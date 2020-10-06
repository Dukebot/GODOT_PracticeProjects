extends Node2D

var time = 0.0
var best_time = 0.0

var pause = false

onready var effects = $Effects
onready var gui = $GUI
onready var player = $Player

func _ready():
	best_time = GameSave.get_score(name)
	gui.set_level_name(name)
	gui.set_time(time)
	gui.set_best_time(best_time)

func _process(delta):
	if not pause:
		time += delta
		gui.set_time(time)
	
	if Input.is_action_just_pressed("restart_level"):
		restart_level()


func restart_level():
	get_tree().reload_current_scene()

func change_level(level_path):
	get_tree().change_scene(level_path)

func end_level():
	pause = true
	save_score()

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
	for i in range(num_childs):
		add_child_scene(Scene, _position)


func add_effect_scene(EffectScene, _position):
	var effect = EffectScene.instance()
	effect.position = _position
	effects.add_child(effect)

func add_effect_scenes(EffectScene, _position, num_scenes):
	for i in range(num_scenes):
		add_effect_scene(EffectScene, _position)
