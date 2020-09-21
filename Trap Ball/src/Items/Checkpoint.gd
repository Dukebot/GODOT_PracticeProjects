extends Area2D

#Should only detect body in the player layer
func _on_Checkpoint_body_entered(body):
	body.set_respawn_position(self.position)
	queue_free()
