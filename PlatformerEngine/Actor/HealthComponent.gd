extends Node

export var health = 100


func take_damage(amount):
	health -= amount
	if health <= 0:
		get_parent().queue_free()


func _on_HurtBox_body_entered(body):
	print("On hurtbox body entered!")
	take_damage(100)
