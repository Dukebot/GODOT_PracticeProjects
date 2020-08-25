extends Node

var health = 100

func take_damage(amount):
	health -= amount
	if health <= 0:
		get_parent().queue_free()
