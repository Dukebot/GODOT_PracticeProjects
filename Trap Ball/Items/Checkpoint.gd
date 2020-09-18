extends Area2D

func _on_Checkpoint_body_entered(body):
	get_tree().current_scene.set_player_respawn_position(self.position)
	queue_free()


func disable():
	set_visible(false)
	$CollisionShape2D.disabled = true
