class_name HealthPickup
extends Pickup

export (int) var heal_amount = 25

func pick(player: Player):
	print("TODO healing logic")
	var healed: bool = player.health_component.heal(heal_amount)
	if healed:
		queue_free()
