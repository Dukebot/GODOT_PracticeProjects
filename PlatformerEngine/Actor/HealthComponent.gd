extends Node

export var health = 100

func take_damage(amount):
	health -= amount
	if health <= 0:
		get_parent().queue_free()


func _on_HurtBox_take_damage(amount):
	take_damage(amount)
