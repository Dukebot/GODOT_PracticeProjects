extends Node2D

export var health = 100
export var invincible_time = 1

var invincible = false


func take_damage(amount):
	if not invincible:
		invincible = true
		$Timer.start(invincible_time)
		print("Ouch")
		health -= amount
		if health <= 0:
			get_parent().queue_free()


func _on_HurtBox_area_entered(area):
	take_damage(area.damage)


func _on_Timer_timeout():
	invincible = false
