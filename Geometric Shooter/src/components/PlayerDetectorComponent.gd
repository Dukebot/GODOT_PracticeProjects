extends Area2D

var player = null

func get_player():
	return player

func _on_PlayerDetectorComponent_body_entered(body):
	player = body

func _on_PlayerDetectorComponent_body_exited(body):
	player = null
