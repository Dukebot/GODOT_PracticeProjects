extends Node2D

onready var player_respawner = $PlayerRespawner
onready var player = $Player


func _ready():
	set_player_respawn_position(player.position)

func _process(delta):
	if Input.is_action_just_pressed("restart_level"):
		restart()


func restart():
	get_tree().reload_current_scene()

func change_level(level):
	get_tree().change_scene(level)


func respawn_player():
	player_respawner.respawn_player()

func set_player_respawn_position(value):
	player_respawner.set_player_respawn_position(value)
