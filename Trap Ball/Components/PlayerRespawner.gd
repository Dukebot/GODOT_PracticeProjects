extends Node


export var respawn_time = 1

var Player = preload("res://Player/Player.tscn")
var respawn_position = Vector2()


func set_player_respawn_position(value):
	respawn_position = value

func respawn_player():
	$Timer.start(respawn_time)

func _on_Timer_timeout():
	_respawn_player()

func _respawn_player():
	var player = Player.instance()
	get_tree().current_scene.add_child(player)
	player.position = respawn_position
