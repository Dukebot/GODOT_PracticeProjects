extends Area2D

func _on_MapVerticalLimitArea_body_entered(body):
	if body.has_method("bounce_y"):
		body.bounce_y()
