extends Node2D


const WorldParallaxBackgrounds = [
	preload("res://src/Backgrounds/World1ParallaxBackground.tscn"),
	preload("res://src/Backgrounds/World2ParallaxBackground.tscn"),
	preload("res://src/Backgrounds/DefaultParallaxBackground.tscn"),
	preload("res://src/Backgrounds/DefaultParallaxBackground.tscn"),
	preload("res://src/Backgrounds/DefaultParallaxBackground.tscn"),
	preload("res://src/Backgrounds/DefaultParallaxBackground.tscn"),
]

const WorldMusic = [
	preload("res://src/Sound/BackgroundMusic/AstralJourney.tscn"),
	preload("res://src/Sound/BackgroundMusic/AGoodDayToStop.tscn"),
	preload("res://src/Sound/BackgroundMusic/ChristmasGroove.tscn"),
	preload("res://src/Sound/BackgroundMusic/CyberParty.tscn"),
	preload("res://src/Sound/BackgroundMusic/BlackMagic.tscn"),
	preload("res://src/Sound/BackgroundMusic/ChristmasShooping.tscn"),
]


var next_level_path

var world_number = 0
var level_number = 0

var time = 0.0
var best_time = 0.0


onready var camera = $CameraComponent
onready var player = $Player
onready var enemies = $Enemies
onready var effects = $Effects
onready var world = $World

onready var GUI = $CanvasLayer/GUI
onready var victory = $CanvasLayer/Victory
onready var pause = $CanvasLayer/Pause

onready var background_music = $BackgroundMusic


#Initialize and set up the tree
func _ready():
	best_time = GameSave.get_score(name)
	
	GUI.set_level_name(name)
	GUI.set_time(time)
	GUI.set_best_time(best_time)
	
	GUI.set_visible(true)
	victory.set_visible(false)
	pause.set_visible(false)
	
	world_number = get_world_number()
	level_number = get_level_number()
	next_level_path = Game.get_next_level_path(world_number, level_number)
	
	var bg_music = WorldMusic[world_number-1].instance()
	add_child(bg_music)
	bg_music.play()
	
	var Background = load("res://src/Backgrounds/SpaceParallaxBackground.tscn")
	var parallax_background = Background.instance()
	#var parallax_background = WorldParallaxBackgrounds[world_number-1].instance()
	camera.add_child(parallax_background)


func get_world_number():
	var world_level = name.split(" ")[1]
	var world = int(world_level.split("-")[0])
	return world

func get_level_number():
	var world_level = name.split(" ")[1]
	var level = int(world_level.split("-")[1])
	return level


#We increase the timer and update the GUI to show the time to player
func _process(delta):
	time += delta
	GUI.set_time(time)
	
	if Input.is_action_just_pressed("restart_level"):
		restart_level()


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
