extends Node

signal hit
signal no_health

export var max_health := 100
export var take_damage_cooldown := 1.0

var health = max_health
var take_damage_invincibility := false

onready var root = get_tree().current_scene
onready var take_damage_timer = $TakeDamageTimer

func take_damage(amount: int):
	if not take_damage_invincibility:
		take_damage_invincibility = true
		emit_signal("hit")
		health -= amount
		if health <= 0:
			emit_signal("no_health")
		take_damage_timer.start(take_damage_cooldown)

func _on_TakeDamageTimer_timeout():
	take_damage_invincibility = false
