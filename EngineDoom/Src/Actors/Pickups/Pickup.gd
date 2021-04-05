class_name Pickup
extends Area


func _on_Pickup_body_entered(body):
	if not body is Player:
		printerr("Pickups should only detect the player") 
	pick(body)


#Override on Children
func pick(player: Player):
	pass
