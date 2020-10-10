extends StaticBody2D

func _on_PlayerDetector_body_entered(body):
	body.boost_jump()
	$BoostSound.play()
	$Sprite.set_visible(false)
	$SpriteUp.set_visible(true)
	$ResetSprite.start()

func _on_PlayerDetector_body_exited(body):
	body.unboost_jump()

func _on_ResetSprite_timeout():
	$Sprite.set_visible(true)
	$SpriteUp.set_visible(false)
