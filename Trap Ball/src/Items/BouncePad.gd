extends StaticBody2D

func _on_PlayerDetector_body_entered(body):
	body.boost_jump()
	$BoostSound.play()

func _on_PlayerDetector_body_exited(body):
	body.unboost_jump()
