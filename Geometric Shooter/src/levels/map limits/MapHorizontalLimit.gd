extends Area2D


func _on_MapVerticalLimitArea_body_entered(body):
	if body.has_method("bounce_x"):
		body.bounce_x()
