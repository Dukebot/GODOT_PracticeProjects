extends Node

signal no_health

export var health := 100
export var take_damage_cooldown := 1.0

var take_damage_invincibility := false

onready var take_damage_timer = $TakeDamageTimer

func take_damage(amount: int):
	if not take_damage_invincibility:
		take_damage_invincibility = true
		health -= amount
		if health <= 0:
			emit_signal("no_health")
		take_damage_timer.start(take_damage_cooldown)

func _on_TakeDamageTimer_timeout():
	take_damage_invincibility = false
