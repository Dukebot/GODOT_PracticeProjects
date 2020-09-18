extends StaticBody2D

func _on_PlayerDetector_body_entered(body):
	body.set_jump_speed(body.get_jump_speed() * 2)

func _on_PlayerDetector_body_exited(body):
	body.set_jump_speed(body.get_jump_speed() / 2)
