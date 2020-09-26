extends Area2D

export var damage = 1

func _on_HitboxComponent_body_entered(body):
	if body.has_method("take_damage"):
		body.take_damage(damage)
