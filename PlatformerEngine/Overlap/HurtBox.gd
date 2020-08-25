extends Area2D

signal take_damage

func take_damage(amount):
	emit_signal("take_damage", amount)
