extends Node2D


func _ready():
	set_player_respawn_position($Player.position)

func _process(delta):
	if Input.is_action_just_pressed("restart_level"):
		$Player.destroy()


func restart():
	get_tree().reload_current_scene()

func change_level(level):
	get_tree().change_scene(level)


func set_player_respawn_position(value):
	$PlayerRespawner.set_player_respawn_position(value)

func respawn_player():
	$PlayerRespawner.respawn_player()
