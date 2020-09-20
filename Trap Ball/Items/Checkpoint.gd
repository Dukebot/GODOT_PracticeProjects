extends Area2D

signal update_player_spawn_position

func _ready():
	self.connect("update_player_spawn_position", get_tree().current_scene, "set_player_respawn_position")

#Should only detect body in the player layer
func _on_Checkpoint_body_entered(body):
	emit_signal("update_player_spawn_position", self.position)
	queue_free()
