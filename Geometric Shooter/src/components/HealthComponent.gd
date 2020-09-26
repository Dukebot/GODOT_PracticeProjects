extends Node

export var health = 1
export var invincible_time = 1.0

var invincible = false

onready var invincibility_timer = $InvincibilityTimer


func take_damage(damage_amount):
	if not invincible:
		invincible = true
		invincibility_timer.start(invincible_time)

		health -= damage_amount
		if health <= 0:
			get_parent().destroy()

func set_invincibility(time):
	invincible = true
	invincibility_timer.start(time)


func _on_InvincibilityTimer_timeout():
	invincible = false
