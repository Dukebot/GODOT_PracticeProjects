extends Node2D

onready var effects = $Effects

func _process(delta):
	if Input.is_action_just_pressed("restart_level"):
		restart()

func restart():
	get_tree().reload_current_scene()

func change_level(level):
	get_tree().change_scene(level)


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
